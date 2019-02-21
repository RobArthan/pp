=IGN
********************************************************************************
dtd088.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd088.doc  ℤ $Date: 2004/01/19 12:44:00 $ $Revision: 1.17 $ $RCSfile: dtd088.doc,v $
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

\def\Title{Detailed Design of the Z Library Bags}

\def\AbstractText{This document contains the detailed design of the Z Library Bags and their proof support. It also contains the ``marker'' theory $z\_library$, and its proof contexts.}

\def\Reference{DS/FMU/IED/DTD088}

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
%% LaTeX2e port: \TPPtitle{Detailed Design of the Z Library Bags}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD088}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.17 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2004/01/19 12:44:00 $%
%% LaTeX2e port: }}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: %\TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthors{D.J.~King & WIN01\\K.~Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design of
%% LaTeX2e port: the Z Library Bags and their proof support.
%% LaTeX2e port: It also contains the ``marker'' theory $z\_library$,
%% LaTeX2e port: and its proof contexts.}
%% LaTeX2e port: %\TPPabstractB{}
%% LaTeX2e port: %\TPPabstractC{}
%% LaTeX2e port: %\TPPabstractD{}
%% LaTeX2e port: %\TPPabstractE{}
%% LaTeX2e port: %\TPPabstractF{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port:       Library}}
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

\newpage
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}  % to get section number `0.3'
\begin{description}
\item [Issue 1.1 (1992/10/28) (22nd October 1992)]
First version, derived from 078 and 083.
\item [Issue 1.2 (1992/10/30) (30th October 1992)]
Tidying.
\item [Issue 1.3 (1992/11/12), 12th November 1992]
Changes as a consequence of changes in dependences.
\item [Issue 1.4 (1992/11/17), 15th November 1992]
Added definition of the bag brackets.
\item[Issue 1.5 (1992/12/11) (11th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.6 (1992/12/17) (11th December 1992)]
Removed spurious ML bindings.
\item[Issue 1.7 (1993/02/10)-1.9 (1993/02/12) (10th February 1993)]
Rearranging proof contexts.
\item[Issue 1.10 (1993/02/15) (15th February 1993)]
Summary of proof contexts results given.
\item[Issue 1.11 (1993/02/23) (23rd February 1993)]
Added theory $z\_library$.
\item[Issue 1.12 (1994/12/21) (21st December 1994)]
Added parent $z\_arithmetic\_tools$ to $z\_library$.
\item [Issue 1.13 (1996/03/07)]
Added $z\_library1$ and $z\_library1\_ext$ proof contexts.
\item [Issue 1.14 (1997/08/12)]
Typo.
\item[Issue 1.15 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.16 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.17 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.18 (2005/02/26)] Precedences and associativity of toolkit operators now follow \cite{ISO02}.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
Proof contexts ``z$\_$library'' and ``z$\_$library$\_$ext'' are
likely to change or be superceded.
\pagebreak
\section{GENERAL}
\subsection{Scope}
This document contains the detailed design
of the Bags Material of the Z Library.
The high level design for this material is given in \cite{DS/FMU/IED/HLD017}.
\subsection{Introduction}

\subsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD017}.
\subsection{Dependencies}

\subsection{Possible Enhancements}
2nd Edition Spivey changes the name of bag membership, and
gives new operators for bag scaling, bag subsets, and bag difference.
This may need to be tracked as the Z Standard, to date, does not have these changes.
\subsection{Deficiencies}
None known.
\section{PROLOG}

=SML
open_theory"z_sequences";
push_pc "z_sets_alg";
force_delete_theory"z_bags" handle Fail _ => ();
val _ = set_flag ("z_type_check_only", false);
val _ = set_flag ("z_use_axioms", true);
new_theory"z_bags";
=TEX
\section {DEFINITION OF FIXITY}

The following fixity information is based on \cite{Spivey89} (the first edition, not the second).

ⓈZ
function 30 leftassoc _ ⊎ _
■
ⓈZ
relation _ in _
■
ⓈZ
generic 70 bag _
■
In the language of Spivey, bag display is a language construct; the \ProductZ{} language allows (and requires) us to define the bag display here:

ⓈZ
	fun	⟦ ... ⟧
■

\section{BAGS}

\subsection{Bags, Multiplicity and Membership}

ⓈZ
⦏bag⦎ X ≜ X ⇸ ℕ⋎1
■

╒[X]════════════════
│ ⦏count⦎ : bag X ⤖ (X → ℕ)
├──────────────────
│∀ x : X; B : bag X ⦁
│	count B = (λx:X ⦁ 0) ⊕ B
└────────────────────

╒[X]════════════════
│ _ ⦏in⦎ _ : X ↔ bag X
├──────────────────
│ ∀ x : X;B : bag X ⦁
│	x in B ⇔ x ∈ dom B
└────────────────────
N.B. this is as in the 1st edition of Spivey, and in the standard version 0.5,
but its name changes to a ``squared'' $∈$ in 2nd edition Spivey.

\subsection{Bag Union}
╒[X]════════════════
│ _ ⦏⊎⦎ _ : (bag X) × bag X → bag X
├──────────────────
│ ∀ B, C : bag X; x : X ⦁
│	count (B ⊎ C) x = count B x + count C x
└────────────────────

\subsection{Bag of Elements of a Sequence}

╒[X]════════════════
│ ⦏items⦎ : seq X → bag X
├──────────────────
│ ∀ s : seq X; x : X ⦁
│	count (items s) x = # {i : dom s | s (i) = x}
└────────────────────
\subsection{Bag Display}
╒[X]════════════════
	⟦ ... ⟧ : seq X → bag X
├─────────
	⟦ ⟧ = {};
	∀x : X; s : seq X⦁ (⟦ ... ⟧) (⟨x⟩ ⁀ s) = (⟦ ... ⟧) s ⊕ {x ↦ (⟦ ... ⟧) s x + 1}
└───────────────────
\subsection{Start of Structure}
=DOC
signature ⦏ZBags⦎ = sig
=DESCRIBE
This provides the basic proof support for the Z library bags.
It creates the theory $z\_bags$.
=ENDDOC
=THDOC
req_name ⦏"z_bags"⦎ (Value "z_sequences");
req_language "Z";
set_flag("tc_thms_only",true);
=DESCRIBE
The theory $z\_bags$ contains various definitions of relation operators, and ``defining theorems'' of Z library constants derived from these definitions.
It is created in structure $ZBags$.
=ENDDOC

=DOC
val ⦏z_bag_def⦎ : THM;	val ⦏z_count_def⦎ : THM;
val ⦏z_in_def⦎ : THM;	val ⦏z_⊎_def⦎ : THM;
val ⦏z_items_def⦎ : THM;
=DESCRIBE
These are the definitions of the Z bag theory.
=ENDDOC
\subsection{Proof Contexts}
No appropriate material to use.
\subsection{End of Signature}
Red tape to end theory design:
=THSML
summarize_td_results ();
val z_bags_success = theory_check_success ();
initialise_td_results ();
=TEX
=SML
end; (* of signature ZBags *)
=TEX
\section{THE Z LIBRARY}
=SML
open_theory "z_bags";
new_theory "z_library";
new_parent "z_arithmetic_tools";
=TEX
\subsection{Start of Structure}
=DOC
signature ⦏ZLibrary⦎ = sig
=DESCRIBE
This provides a ``marker'' theory, indicating the ``top'' of the
Z library theories.
It creates the theory $z\_library$.

As a side effect, loading this structure will set the current
theory to $z\_library$, the current proof context to
``z$\_$library'', and tidies the subgoal package and proof context stacks.
=ENDDOC
=THDOC
req_name ⦏"z_library"⦎ (Value "z_bags");
req_parent "z_arithmetic_tools";
req_language "Z";
set_flag("tc_thms_only",true);
=DESCRIBE
The theory $z\_bags$ contains various definitions of relation operators, and ``defining theorems'' of Z library constants derived from these definitions.
It is created in structure $ZLibrary$.
=ENDDOC

=DOC
(* Proof Context: ⦏z_library⦎ *)
=DESCRIBE
A mild complete proof context for handling the manipulation of Z language and library expressions and predicates.
Its contents are chosen to be ``uncontroversial''.
That is, any effect is considered to be ``almost always the correct thing''.

It consists of the merge of the proof contexts:
=GFT
"z_sets_alg", - simplification of set contructs, and Z language
"'z_rel_alg", - simplification of relational contructs
"'z_fun_alg", - simplification of function contructs
"'z_numbers" - simplification of numeric contructs
=TEX
\paragraph{Usage Notes}
It requires theory $z\-\_bags$.

It is not intended to be mixed with HOL proof contexts
or ``z$\_$library$\_$ext'', which offers an aggressive
approach.
=ENDDOC
=DOC
(* Proof Context: ⦏z_library_ext⦎ *)
=DESCRIBE
A agressive complete proof context for handling the manipulation of Z language and library expressions and predicates.
Its purpose is to strip or rewrite its input into the
Z predicate calculus.

It consists of the merge of the proof contexts:
=GFT
"z_fun_ext", - extensional reasoning about functions (and
	realtions and sets)
"'z_numbers" - simplification of numeric contructs
=TEX
\paragraph{Usage Notes}
It requires theory $z\-\_bags$.

It is not intended to be mixed with HOL proof contexts
or ``z$\_$library$\_$ext'', which offers an aggressive
approach.
=ENDDOC
Including the algebraic material in the above may not be
particularly helpful, though it seems unlikely to cause any harm.

What do the above proof contexts do?

The following function can be executed a Z system, to
derived the text that follows. It is intended as a summary of effects.
=DUMP z_library_summary.sml
open_theory "z_library";
local
	val cnv1 = pc_rule1 "z_library" rewrite_conv [];
	val cnv2 = pc_rule1 "z_library_ext" rewrite_conv [];
	val cnv3 = pc_rule "z_library" strip_asm_conv;
	val cnv4 = pc_rule "z_library_ext" strip_asm_conv;
	fun cnv_result label isbool cnv tm = (
		if isbool andalso (not (type_of tm =: BOOL))
		then ("    " ^ label ^ ":   N/A")
		else  let val res = (snd(dest_eq(concl(cnv tm))))
			handle (Fail _) => tm;
		in
		if res =$ tm
		then ("   " ^ label ^ ":   N/C")
		else
		("    " ^ label ^ ": " ^ string_of_term res)
		end
	);
	
in
fun ⦏library_pc_summary⦎ ((title, term) :: rest) = (
	diag_line (title ^ ": " ^ string_of_term term);
	diag_line (cnv_result "z_library rewrite" false cnv1 term);
	diag_line (cnv_result "z_library_ext rewrite" false cnv2 term);
	diag_line (cnv_result "z_library strip" true cnv3 term);
	diag_line (cnv_result "z_library_ext strip" true cnv4 term);
 	library_pc_summary rest
) | library_pc_summary [] = (
	diag_line ("*** Z System Version " ^ z_system_version ^ " *** ")
);
end;
=TEX
The input data is:
=DUMPMORE z_library_summary.sml
val library_pc_summary_data1 = fn () => [
("Tuple Display Eqn", ⓩ(1,2,3) = (a,b,c)⌝),
("Tuple Display Eqn 2", ⓩ(1,2,3) = tuple⌝),
("Tuple Eqn", ⓩ(tuple1⦂ (X × Y)) = tuple2⌝),
("Tuple Maplet Eqn 1", ⓩ(x ↦ y) = tuple2⌝),
("Tuple Maplet Eqn 2", ⓩ(x ↦ y) = (1,2)⌝),
("Tuple of Selections",ⓩ((tuple1⦂ ( X × Y)).1, tuple1.2)⌝),
("Binding Display Eqn", ⓩ(x ≜ 1, y ≜ 2) = (x ≜ a, y ≜ b)⌝),
("Binding Display Eqn 2", ⓩbinding = (x ≜ 2, y ≜ 3)⌝),
("Binding Eqn", ⓩ(binding1 ⦂ [x,y:X]) = binding2⌝),
("Binding θ Eqn 1", ⓩ(θ [x,y:X]) = binding2⌝),
("Binding θ Eqn 2", ⓩ(θ [x,y:X]) = θ ([x,y:X])'⌝),
("Binding of Selections",ⓩ(x ≜ (binding1 ⦂ [x,y:X]).x, y ≜ binding1.y)⌝),
("Set Display Eqn",ⓩ{1,2} = {a,b}⌝),
("Set Abstraction Eqn",ⓩ{x:X | x = 1} = {y:X | y > 0}⌝),
("Set Eqn",ⓩ(a⦂ ℙ X) = b⌝),
("Set Display",ⓩ{1,2,3}⌝),
("∈ Set Display",ⓩ p ∈ {1,2,3}⌝),
("Set Abstraction",ⓩ{x :X | p x ⦁ (x,x)}⌝),
("Simp Set Abstraction",ⓩ{x:X | false ⦁ x = 1}⌝),
("∈ Set Abstraction",ⓩf x ∈ {x:X | p x ⦁ x = 1}⌝),
("Empty Set",ⓩ{}⌝),
("∈ Empty Set",ⓩr ∈ {}⌝),
("𝕌",ⓩ𝕌⌝),
("∈ 𝕌",ⓩx ∈ 𝕌⌝),
("𝕌 set",ⓩ{x:𝕌; y,z:𝕌 | true}⌝),
("⌜∈ 𝕌 set",ⓩx ∈ {x:𝕌; y,z:𝕌 | true}⌝),
("𝕌 schema",ⓩ[x:𝕌; y,z:𝕌 | true]⌝),
("∈ 𝕌 schema",ⓩx ∈ [x:𝕌; y,z:𝕌 | true]⌝),
("Paragraph marker",⌜Z'AbbDef (∀ X ⦁ ⓩsomething = false⌝)⌝),
("∈ ℙ ",ⓩx ∈ ℙ y⌝),
("Set Display ∈ ℙ ",ⓩ{1,2} ∈ ℙ y⌝),
("Set Display of variables ∈ ℙ ",ⓩ{a,b} ∈ ℙ y⌝),
("ℙ 𝕌",ⓩℙ 𝕌⌝),
("∈ ℙ 𝕌",ⓩx ∈ ℙ 𝕌⌝)
];
=TEX
=DUMPMORE z_library_summary.sml
val library_pc_summary_data2 =fn () =>  [
("Tuple Display ∈ Product",ⓩ(1,2) ∈ X × Y⌝),
("Tuple ∈ Product",ⓩx ∈ X × Y⌝),
("𝕌 × 𝕌",ⓩ𝕌 × 𝕌 × 𝕌⌝),
("∈ 𝕌 × 𝕌",ⓩx ∈ 𝕌 × 𝕌 × 𝕌⌝),
("β reduction - no asms 1",ⓩ(λ x :𝕌⦁ f x) y⌝),
("β reduction - no asms 2",ⓩ(λ x:𝕌 ⦁ (x = y)) y⌝),
("β reduction 1",ⓩ(λ x :X⦁ f x) y⌝),
("β reduction 2",ⓩ(λ x :X ⦁ (y = x)) y⌝),
("∈ λ",ⓩx ∈ (λ x :X⦁ f x)⌝),
("μ", ⓩ(μ x:X | p x ⦁ q x)⌝),
("∈ μ", ⓩv ∈ (μ x:X | p x ⦁ q x)⌝),
("Application",ⓩf x⌝),
("∈ Application",ⓩp ∈ f x⌝),
("Selection from Tuple Display 1",ⓩ(1,2,3).2⌝),
("Selection from Tuple Display 2",ⓩ(1,true,3).2⌝),
("Selection from Tuple Display 3",ⓩx ∈ (1,f 2,3).2⌝),
("Selection from Binding Display 1",ⓩ(x ≜ 1, y ≜ 2).y⌝),
("Selection from Tuple Display 2",ⓩ(x ≜ 1, y ≜ true).y⌝),
("Selection from Tuple Display 3",ⓩx ∈ (x ≜ 1, y ≜ f y).y⌝),
("Selection from θ 1",ⓩ(θ [a,b:X]).a⌝),
("Selection from θ 2",ⓩ(θ [a,b:X| ¬ a]).a⌝),
("Selection from θ 3",ⓩx ∈ (θ [a,b:X]).a⌝),
("Ill-formed Schema as predicate",⌜$"Z'SchemaPred" ⓩ(x≜x',y≜y) ⌝ⓩ[x:X;y:Y]⌝⌝),
("Ill-formed θ",⌜$"Z'θ" ⓩ(x≜x',y≜y) ⌝ⓩ[x:X;y:Y]⌝⌝),
("∈",ⓩx ∈ f⌝),
("Variable",ⓩf⌝),
("Sequence Display",ⓩ⟨1,2⟩⌝),
("∈ Sequence Display",ⓩx ∈ ⟨1,2⟩⌝),
("Bag Display",ⓩ⟦ 1,2,1 ⟧⌝),
("∈ Bag Display",ⓩx ∈ ⟦ 1,2,1 ⟧⌝),
("Function Eqn",ⓩ(λ x:X ⦁ x +1) = y⌝),
("Variable Eqn",ⓩx = y⌝)
];
=TEX
=DUMPMORE z_library_summary.sml
val library_pc_summary_data3 = fn () => [
("¬",ⓩ¬ f x⌝),
("Simp ¬",ⓩ¬ false⌝),
("∧",ⓩa ∧ b⌝),
("Simp ∧",ⓩtrue ∧ b⌝),
("∨",ⓩa ∨ b⌝),
("Simp ∨",ⓩtrue ∨ b⌝),
("⇒",ⓩa ⇒ b⌝),
("Simp ⇒",ⓩtrue ⇒ b⌝),
("⇔",ⓩa ⇔ b⌝),
("Simp ⇔",ⓩtrue ⇔ b⌝),
("∀",ⓩ∀ x:X | p x ⦁ q x⌝),
("Simp ∀",ⓩ∀ x:X | false ⦁ q x⌝),
("∃",ⓩ∃ x:X | p x ⦁ q x⌝),
("Simp ∃",ⓩ∃ x:X | false ⦁ q x⌝),
("∃⋎1",ⓩ∃⋎1 x:X | p x ⦁ q x⌝),
("Simp ∃⋎1",ⓩ∃⋎1 x:X | false ⦁ q x⌝),
("Binding ∈ Schema 1",ⓩ(x ≜ x,y ≜ y) ∈ (S ⦂ ℙ [x:X;y:Y| f x y])⌝),
("Binding ∈ Schema 2",ⓩ(x ≜ x',y ≜ y) ∈ (S ⦂ ℙ [x:X;y:Y| f x y])⌝),
("Schema",ⓩ([x:X;y:Y| f x y] ⦂ 𝕌)⌝),
("Schema as predicate",ⓩΠ [x:X;y:Y| f x y]⌝),
("¬⋎s", ⓩ((¬ [x:X;y:Y| f x y]) ⦂ 𝕌)⌝),
("∈ ¬⋎s", ⓩp ∈ (¬ [x:X;y:Y| f x y])⌝),
("¬⋎s as predicate", ⓩΠ(¬ [x:X;y:Y| f x y])⌝),
("∧⋎s", ⓩ(([y:Y; z:Z| g y z] ∧ [x:X;y:Y| f x y]) ⦂ 𝕌)⌝),
("∈ ∧⋎s", ⓩp ∈ (([y:Y; z:Z| g y z] ∧ [x:X;y:Y| f x y]) ⦂ 𝕌)⌝),
("∧⋎s as predicate", ⓩΠ (([y:Y; z:Z| g y z] ∧ [x:X;y:Y| f x y]) ⦂ 𝕌)⌝),
("∨⋎s", ⓩ(([y:Y; z:Z| g y z] ∨ [x:X;y:Y| f x y]) ⦂ 𝕌)⌝),
("∈ ∨⋎s", ⓩp ∈ (([y:Y; z:Z| g y z] ∨ [x:X;y:Y| f x y]) ⦂ 𝕌)⌝),
("∨⋎s as predicate", ⓩΠ (([y:Y; z:Z| g y z] ∨ [x:X;y:Y| f x y]) ⦂ 𝕌)⌝)
];
=TEX
=DUMPMORE z_library_summary.sml
val library_pc_summary_data4 = fn () => [
("⇒⋎s", ⓩ(([y:Y; z:Z| g y z] ⇒ [x:X;y:Y| f x y]) ⦂ 𝕌)⌝),
("∈ ⇒⋎s", ⓩp ∈ (([y:Y; z:Z| g y z] ⇒ [x:X;y:Y| f x y]) ⦂ 𝕌)⌝),
("⇒⋎s as predicate", ⓩΠ (([y:Y; z:Z| g y z] ⇒ [x:X;y:Y| f x y]) ⦂ 𝕌)⌝),
("⇔⋎s", ⓩ(([y:Y; z:Z| g y z] ⇔ [x:X;y:Y| f x y]) ⦂ 𝕌)⌝),
("∈ ⇔⋎s", ⓩp ∈ (([y:Y; z:Z| g y z] ⇔ [x:X;y:Y| f x y]) ⦂ 𝕌)⌝),
("⇔⋎s as predicate", ⓩΠ (([y:Y; z:Z| g y z] ⇔ [x:X;y:Y| f x y]) ⦂ 𝕌)⌝),
("↾⋎s", ⓩ([y:Y; z:Z| g y z] ↾⋎s [x:X;y:Y| f x y] ⦂ 𝕌)⌝),
("∈ ↾⋎s", ⓩp ∈ ([y:Y; z:Z| g y z] ↾⋎s [x:X;y:Y| f x y] ⦂ 𝕌)⌝),
("↾⋎s as predicate", ⓩΠ ([y:Y; z:Z| g y z] ↾⋎s [x:X;y:Y| f x y] ⦂ 𝕌)⌝),
("∀⋎s",ⓩ((∀ x:X | p x ⦁ [x,y,z:X | f x y z])⦂𝕌)⌝),
("∈ ∀⋎s",ⓩq ∈ ((∀ x:X | p x ⦁ [x,y,z:X | f x y z])⦂𝕌)⌝),
("∀⋎s as predicate",ⓩΠ ((∀ x:X | p x ⦁ [x,y,z:X | f x y z])⦂𝕌)⌝),
("∃⋎s",ⓩ((∃ x:X | p x ⦁ [x,y,z:X | f x y z])⦂𝕌)⌝),
("∈ ∃⋎s",ⓩq ∈ ((∃ x:X | p x ⦁ [x,y,z:X | f x y z])⦂𝕌)⌝),
("∃⋎s as predicate",ⓩΠ ((∃ x:X | p x ⦁ [x,y,z:X | f x y z])⦂𝕌)⌝),
("∃⋎1⋎s",ⓩ((∃⋎1 x:X | p x ⦁ [x,y,z:X | f x y z])⦂𝕌)⌝),
("∈ ∃⋎1⋎s",ⓩq ∈ ((∃⋎1 x:X | p x ⦁ [x,y,z:X | f x y z])⦂𝕌)⌝),
("∃⋎1⋎s as predicate",ⓩΠ ((∃⋎1 x:X | p x ⦁ [x,y,z:X | f x y z])⦂𝕌)⌝),
("pre⋎s",ⓩpre [x,x',y,z:X | f x y z]⌝),
("∈ pre⋎s",ⓩp ∈ (pre [x,x',y,z:X | f x y z])⌝),
("pre⋎s as predicate",ⓩΠ( pre [x,x',y,z:X | f x y z])⌝),
("Δ⋎s",ⓩΔ [x,y,z:X | f x y z]⌝),
("∈ Δ⋎s",ⓩp ∈ (Δ [x,y,z:X | f x y z])⌝),
("Δ⋎s as predicate",ⓩΠ( Δ [x,y,z:X | f x y z])⌝),
("Ξ⋎s",ⓩΞ [x,y,z:X | f x y z]⌝),
("∈ Ξ⋎s",ⓩp ∈ (Ξ [x,y,z:X | f x y z])⌝),
("Ξ⋎s as predicate",ⓩΠ( Ξ [x,y,z:X | f x y z])⌝)
];
=TEX
=DUMPMORE z_library_summary.sml
val library_pc_summary_data5 = fn () => [
("\\⋎s",ⓩ[x,y,z :X | f x y z] \⋎s (y)⌝),
("∈ \\⋎s",ⓩp ∈ ([x,y,z :X| f x y z] \⋎s (y))⌝),
("\\⋎s as predicate",ⓩΠ ([x,y,z :X | f x y z] \⋎s (y))⌝),
("⨾⋎s",ⓩ[x,x',y:X | f x x' y] ⨾⋎s [x,y,z:X | g x y z]⌝),
("∈ ⨾⋎s",ⓩp ∈ ([x,x',y:X | f x x' y] ⨾⋎s [x,y,z:X | g x y z])⌝),
("⨾⋎s as predicate",ⓩΠ( [x,x',y:X | f x x' y] ⨾⋎s [x,y,z:X | g x y z])⌝),
("≠",ⓩs ≠ t⌝),
("∉",ⓩx ∉ y⌝),
("∅",ⓩ∅⌝),
("∈ ∅",ⓩp ∈ ∅⌝),
("⊆", ⓩs ⊆ t⌝),
("Simp ⊆", ⓩ{} ⊆ t⌝),
("Set Display ⊆", ⓩ{1,2} ⊆ t⌝),
("⊂", ⓩs ⊂ t⌝),
("Simp ⊂", ⓩt ⊂ {}⌝),
("Set Display ⊂", ⓩ{1,2} ⊂ t⌝),
("ℙ⋎1",ⓩℙ⋎1 s⌝),
("Simp ℙ⋎1",ⓩℙ⋎1 {}⌝),
("∈ ℙ⋎1",ⓩt ∈ ℙ⋎1 s⌝),
("∩", ⓩs ∩ t⌝),
("Simp ∩", ⓩ{} ∩ t⌝),
("∈ ∩", ⓩx ∈ s ∩ t⌝),
("∪", ⓩs ∪ t⌝),
("Simp ∪", ⓩ{} ∪ t⌝),
("∈ ∪", ⓩx ∈ s ∪ t⌝),
("\\", ⓩs \ t⌝),
("Simp \\", ⓩ{} \ t⌝),
("∈ \\", ⓩx ∈ s \ t⌝),
("⋂",ⓩ⋂ s⌝),
("Simp ⋂",ⓩ⋂ {}⌝),
("∈ ⋂",ⓩx ∈ ⋂ s⌝),
("⋃",ⓩ⋃ s⌝),
("Simp ⋃",ⓩ⋃ {}⌝),
("∈ ⋃",ⓩx ∈ ⋃ s⌝)
];
=TEX
=DUMPMORE z_library_summary.sml
val library_pc_summary_data6 = fn () => [
("first",ⓩfirst x⌝),
("∈ first",ⓩp ∈ first x⌝),
("second",ⓩsecond x⌝),
("∈ second",ⓩp ∈ second x⌝),
("↦",ⓩ(a ↦ b).1⌝),
("↔", ⓩX ↔ Y⌝),
("Simp ↔", ⓩ{} ↔ Y⌝),
("∈ ↔", ⓩx ∈ X ↔ Y⌝),
("Simp ∈ ↔", ⓩx ∈ {} ↔ Y⌝),
("Domain", ⓩdom x⌝),
("Simp Domain", ⓩdom {}⌝),
("∈ Domain", ⓩp ∈ dom x⌝),
("Simp ∈ Domain", ⓩp ∈ dom {}⌝),
("Range", ⓩran x⌝),
("Simp Range", ⓩran {}⌝),
("∈ Range", ⓩp ∈ ran x⌝),
("Simp ∈ Range", ⓩp ∈ ran {}⌝),
("Identity",ⓩid x⌝),
("Simp Identity",ⓩid {}⌝),
("∈ Identity",ⓩp ∈ id x⌝),
("Simp ∈ Identity",ⓩp ∈ id {}⌝),
("Sequential Composition",ⓩf ⨾ g⌝),
("∈ Sequential Composition",ⓩ x ∈ (f ⨾ g)⌝),
("Sequential Composition 1",ⓩf o g⌝),
("∈ Sequential Composition 1 ",ⓩ x ∈ (f o g)⌝),
("Domain restriction",ⓩx ◁ y⌝),
("Simp Domain restriction",ⓩ{} ◁ y⌝),
("∈ Domain restriction",ⓩp ∈ x ◁ y⌝),
("Simp ∈ Domain restriction",ⓩp ∈ {} ◁ y⌝),
("Range restriction",ⓩx ▷ y⌝),
("Simp Range restriction",ⓩ{} ▷ y⌝),
("∈ Range restriction",ⓩp ∈ x ▷ y⌝),
("Simp ∈ Range restriction",ⓩp ∈ {} ▷ y⌝),
("Domain antirestriction",ⓩx ⩤ y⌝),
("Simp Domain antirestriction",ⓩ{} ⩤ y⌝),
("∈ Domain antirestriction",ⓩp ∈ x ⩤ y⌝),
("Simp ∈ Domain antirestriction",ⓩp ∈ {} ⩤ y⌝),
("Range antirestriction",ⓩx ⩥ y⌝),
("Simp Range antirestriction",ⓩ{} ⩥ y⌝),
("∈ Range antirestriction",ⓩp ∈ x ⩥ y⌝),
("Simp ∈ Range antirestriction",ⓩp ∈ {} ⩥ y⌝)
];
=TEX
=DUMPMORE z_library_summary.sml
val library_pc_summary_data7 = fn () => [
("Relational Image", ⓩs ⦇t⦈⌝),
("Simp Relational Image", ⓩ{} ⦇t⦈⌝),
("∈ Relational Image", ⓩx ∈ s ⦇t⦈⌝),
("Simp ∈ Relational Image", ⓩx ∈ {} ⦇t⦈⌝),
("Transitive Closure",ⓩx ↗+↕⌝),
("Simp Transitive Closure",ⓩ{} ↗+↕⌝),
("∈ Transitive Closure",ⓩp ∈ x ↗+↕⌝),
("Simp ∈ Transitive Closure",ⓩp ∈ {} ↗+↕⌝),
("Transitive-Reflexive Closure",ⓩx ↗*↕⌝),
("Simp Transitive-Reflexive Closure",ⓩ{} ↗*↕⌝),
("∈ Transitive-Reflexive Closure",ⓩp ∈ x ↗*↕⌝),
("Simp ∈ Transitive-Reflexive Closure",ⓩp ∈ {} ↗*↕⌝),
("Override",ⓩf ⊕ g⌝),
("∈ Override",ⓩx ∈ f ⊕ g⌝),
("Partial Functions",ⓩx ⇸ y⌝),
("Simp Partial Functions",ⓩ{} ⇸ y⌝),
("∈ Partial Functions",ⓩp ∈ x ⇸ y⌝),
("∈ Simp Partial Functions",ⓩp ∈ {} ⇸ y⌝),
("Injections",ⓩx ⤔ y⌝),
("Simp Injections",ⓩ{} ⤔ y⌝),
("∈ Injections",ⓩp ∈ x ⤔ y⌝),
("∈ Simp Injections",ⓩp ∈ {} ⤔ y⌝),
("Surjections",ⓩx ⤀ y⌝),
("Simp Surjections",ⓩ{} ⤀ y⌝),
("∈ Surjections",ⓩp ∈ x ⤀ y⌝),
("∈ Simp Surjections",ⓩp ∈ {} ⤀ y⌝),
("Total Injections",ⓩx ↣ y⌝),
("Simp Total Injections",ⓩ{} ↣ y⌝),
("∈ Total Injections",ⓩp ∈ x ↣ y⌝),
("∈ Simp Total Injections",ⓩp ∈ {} ↣ y⌝),
("Total Surjections",ⓩx ↠ y⌝),
("Simp Total Surjections",ⓩ{} ↠ y⌝),
("∈ Total Surjections",ⓩp ∈ x ↠ y⌝),
("∈ Total Simp Surjections",ⓩp ∈ {} ↠ y⌝),
("Bijections",ⓩx ⤖ y⌝),
("Simp Bijections",ⓩ{} ⤖ y⌝),
("∈ Bijections",ⓩp ∈ x ⤖ y⌝),
("∈ Simp Bijections",ⓩp ∈ {} ⤖ y⌝),
("Total Functions",ⓩx → y⌝),
("Simp Total Functions",ⓩ{} → y⌝),
("∈ Total Functions",ⓩp ∈ x → y⌝),
("∈ Simp Total Functions",ⓩp ∈ {} → y⌝)
];
=TEX
=DUMPMORE z_library_summary.sml
val library_pc_summary_data8 = fn () => [
("ℕ",ⓩℕ⌝),
("∈ ℕ",ⓩp ∈ ℕ⌝),
("∈ ℕ 1",ⓩ1 ∈ ℕ⌝),
("ℤ",ⓩℤ⌝),
("ℤ struct",ⓩℤ × ℤ⌝),
("∈ ℤ",ⓩp ∈ ℤ⌝),
("∈ ℤ 1",ⓩ1 ∈ ℤ⌝),
("Addition",ⓩ a + b⌝),
("Simp Addition",ⓩ a + 0⌝),
("Literal Addition",ⓩ 2 + 3⌝),
("Negation",ⓩ a - b⌝),
("Simp Negation",ⓩ a - 0⌝),
("Literal Negation",ⓩ 2 - 3⌝),
("Multiplication",ⓩ a * b⌝),
("Simp Multiplication",ⓩ a * 0⌝),
("Literal Multiplication",ⓩ 2 * 3⌝),
("Integer divide",ⓩ a div b⌝),
("Simp Integer divide",ⓩ a div 1⌝),
("Literal Integer divide",ⓩ 5 div 3⌝),
("Modulus",ⓩ a mod b⌝),
("Simp Modulus",ⓩ a mod 1⌝),
("Literal Modulus",ⓩ 2 mod 3⌝),
("Unit negation",ⓩ~ a⌝),
("Simp Unit negation",ⓩ~ 0⌝),
("Literal Unit negation",ⓩ~ 3⌝),
("Less",ⓩ a < b⌝),
("Simp Less",ⓩ a < a⌝),
("Literal Less",ⓩ 2 < 3⌝),
("Less or equal",ⓩ a ≤ b⌝),
("Simp Less or equal",ⓩ a ≤ a⌝),
("Literal Less or equal",ⓩ 2 ≤ 3⌝),
("Greater",ⓩ a > b⌝),
("Simp Greater",ⓩ a > a⌝),
("Literal Greater",ⓩ 2 > 3⌝),
("Greater or equal",ⓩ a ≥ b⌝),
("Simp Greater or equal",ⓩ a ≥ a⌝),
("Literal Greater or equal",ⓩ 2 ≥ 3⌝),
("Non-empty ℕ",ⓩℕ⋎1⌝),
("∈ Non-empty ℕ",ⓩx ∈ ℕ⋎1⌝),
("succ",ⓩsucc 3⌝),
("Iterate",ⓩx ↗ 2 ↕⌝),
("Interval",ⓩa .. b⌝),
("Simp Interval",ⓩ1 .. 1⌝),
("∈ Interval",ⓩx ∈ a .. b⌝),
("∈ Simp Interval",ⓩx ∈ 1 .. 1⌝)
];
=TEX
Note that we do nothing for finiteness, sequence operators or bag operators.
=DUMPMORE z_library_summary.sml
library_pc_summary (library_pc_summary_data1 () @
	library_pc_summary_data2 () @
	library_pc_summary_data3 () @
	library_pc_summary_data4 () @
	library_pc_summary_data5 () @
	library_pc_summary_data6 () @
	library_pc_summary_data7 () @
	library_pc_summary_data8 ());
=TEX
The results of this are:
=GFT
Tuple Display Eqn: ⓩ(1, 2, 3) = (a, b, c)⌝
    z_library rewrite: ⓩ1 = a ∧ 2 = b ∧ 3 = c⌝
    z_library_ext rewrite: ⓩ1 = a ∧ 2 = b ∧ 3 = c⌝
    z_library strip: ⓩ1 = a ∧ 2 = b ∧ 3 = c⌝
    z_library_ext strip: ⓩ1 = a ∧ 2 = b ∧ 3 = c⌝
Tuple Display Eqn 2: ⓩ(1, 2, 3) = tuple⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ1 = tuple.1 ∧ 2 = tuple.2 ∧ 3 = tuple.3⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩ1 = tuple.1 ∧ 2 = tuple.2 ∧ 3 = tuple.3⌝
Tuple Eqn: ⓩtuple1 = tuple2⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩtuple1.1 = tuple2.1 ∧ tuple1.2 = tuple2.2⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩtuple1.1 = tuple2.1 ∧ tuple1.2 = tuple2.2⌝
Tuple Maplet Eqn 1: ⓩx ↦ y = tuple2⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩx = tuple2.1 ∧ y = tuple2.2⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩx = tuple2.1 ∧ y = tuple2.2⌝
Tuple Maplet Eqn 2: ⓩx ↦ y = (1, 2)⌝
    z_library rewrite: ⓩx = 1 ∧ y = 2⌝
    z_library_ext rewrite: ⓩx = 1 ∧ y = 2⌝
    z_library strip: ⓩx = 1 ∧ y = 2⌝
    z_library_ext strip: ⓩx = 1 ∧ y = 2⌝
Tuple of Selections: ⓩ(tuple1.1, tuple1.2)⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Binding Display Eqn: ⓩ(x ≜ 1, y ≜ 2) = (x ≜ a, y ≜ b)⌝
    z_library rewrite: ⓩ1 = a ∧ 2 = b⌝
    z_library_ext rewrite: ⓩ1 = a ∧ 2 = b⌝
    z_library strip: ⓩ1 = a ∧ 2 = b⌝
    z_library_ext strip: ⓩ1 = a ∧ 2 = b⌝
Binding Display Eqn 2: ⓩbinding = (x ≜ 2, y ≜ 3)⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩbinding.x = 2 ∧ binding.y = 3⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩbinding.x = 2 ∧ binding.y = 3⌝
Binding Eqn: ⓩbinding1 = binding2⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩbinding1.x = binding2.x ∧ binding1.y = binding2.y⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩbinding1.x = binding2.x ∧ binding1.y = binding2.y⌝
Binding θ Eqn 1: ⓩθ[x, y : X] = binding2⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩx = binding2.x ∧ y = binding2.y⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩx = binding2.x ∧ y = binding2.y⌝
Binding θ Eqn 2: ⓩθ[x, y : X] = θ([x, y : X])'⌝
    z_library rewrite: ⓩx = x' ∧ y = y'⌝
    z_library_ext rewrite: ⓩx = x' ∧ y = y'⌝
    z_library strip: ⓩx = x' ∧ y = y'⌝
    z_library_ext strip: ⓩx = x' ∧ y = y'⌝
Binding of Selections: ⓩ(x ≜ binding1.x, y ≜ binding1.y)⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Set Display Eqn: ⓩ{1, 2} = {a, b}⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ∀ x1 : 𝕌 ⦁ x1 = 1 ∨ x1 = 2 ⇔ x1 = a ∨ x1 = b⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩ∀ x1 : 𝕌 ⦁ x1 ∈ {1, 2} ⇔ x1 ∈ {a, b}⌝
Set Abstraction Eqn: ⓩ{x : X | x = 1} = {y : X | y > 0}⌝
    z_library rewrite: ⓩ{x : X | x = 1} = {y : X | 0 < y}⌝
    z_library_ext rewrite: ⓩ∀ x1 : 𝕌 ⦁ 1 ∈ X ∧ 1 = x1 ⇔ x1 ∈ X ∧ 0 < x1⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩ∀ x1 : 𝕌 ⦁ x1 ∈ {x : X | x = 1} ⇔ x1 ∈ {y : X | y > 0}⌝
Set Eqn: ⓩa = b⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ∀ x1 : 𝕌 ⦁ x1 ∈ a ⇔ x1 ∈ b⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩ∀ x1 : 𝕌 ⦁ x1 ∈ a ⇔ x1 ∈ b⌝
Set Display: ⓩ{1, 2, 3}⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Set Display: ⓩp ∈ {1, 2, 3}⌝
    z_library rewrite: ⓩp = 1 ∨ p = 2 ∨ p = 3⌝
    z_library_ext rewrite: ⓩp = 1 ∨ p = 2 ∨ p = 3⌝
    z_library strip: ⓩp = 1 ∨ p = 2 ∨ p = 3⌝
    z_library_ext strip: ⓩp = 1 ∨ p = 2 ∨ p = 3⌝
Set Abstraction: ⓩ{x : X | p x ⦁ (x, x)}⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Set Abstraction: ⓩ{x : X | false ⦁ x = 1}⌝
    z_library rewrite: ⓩ{}⌝
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Set Abstraction: ⓩf x ∈ {x : X | p x ⦁ x = 1}⌝
    z_library rewrite: ⓩ∃ x : X | p x ⦁ x = 1 ⇔ f x⌝
    z_library_ext rewrite: ⓩ∃ x : X | p x ⦁ x = 1 ⇔ f x⌝
    z_library strip: ⓩ∃ x : X | p x ⦁ x = 1 ⇔ f x⌝
    z_library_ext strip: ⓩ∃ x : X | p x ⦁ x = 1 ⇔ f x⌝
Empty Set: ⓩ{}⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Empty Set: ⓩr ∈ {}⌝
    z_library rewrite: ⓩfalse⌝
    z_library_ext rewrite: ⓩfalse⌝
    z_library strip: ⓩfalse⌝
    z_library_ext strip: ⓩfalse⌝
𝕌: ⓩ𝕌⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ 𝕌: ⓩx ∈ 𝕌⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩtrue⌝
    z_library_ext strip: ⓩtrue⌝
𝕌 set: ⓩ{x : 𝕌; y, z : 𝕌}⌝
    z_library rewrite: ⓩ𝕌⌝
    z_library_ext rewrite: ⓩ𝕌⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
⌜∈ 𝕌 set: ⓩx ∈ {x : 𝕌; y, z : 𝕌}⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩtrue⌝
    z_library_ext strip: ⓩtrue⌝
𝕌 schema: ⓩ[x : 𝕌; y, z : 𝕌]⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ 𝕌 schema: ⓩx ∈ [x : 𝕌; y, z : 𝕌]⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩtrue⌝
    z_library_ext strip: ⓩtrue⌝
Paragraph marker: ⓩ⌜Z'AbbDef (∀ X⦁ something ⇔ F)⌝⌝
    z_library rewrite: ⓩ¬ something⌝
    z_library_ext rewrite: ⓩ¬ something⌝
    z_library strip: ⓩ⌜∀ X⦁ something ⇔ F⌝⌝
    z_library_ext strip: ⓩ⌜∀ X⦁ something ⇔ F⌝⌝
∈ ℙ : ⓩx ∈ ℙ y⌝
    z_library rewrite: ⓩx ⊆ y⌝
    z_library_ext rewrite: ⓩ∀ x1 : 𝕌 ⦁ x1 ∈ x ⇒ x1 ∈ y⌝
    z_library strip: ⓩx ⊆ y⌝
    z_library_ext strip: ⓩ∀ x1 : 𝕌 ⦁ x1 ∈ x ⇒ x1 ∈ y⌝
Set Display ∈ ℙ : ⓩ{1, 2} ∈ ℙ y⌝
    z_library rewrite: ⓩ{1, 2} ⊆ y⌝
    z_library_ext rewrite: ⓩ1 ∈ y ∧ 2 ∈ y⌝
    z_library strip: ⓩ{1, 2} ⊆ y⌝
    z_library_ext strip: ⓩ1 ∈ y ∧ 2 ∈ y⌝
Set Display of variables ∈ ℙ : ⓩ{a, b} ∈ ℙ y⌝
    z_library rewrite: ⓩ{a, b} ⊆ y⌝
    z_library_ext rewrite: ⓩa ∈ y ∧ b ∈ y⌝
    z_library strip: ⓩ{a, b} ⊆ y⌝
    z_library_ext strip: ⓩa ∈ y ∧ b ∈ y⌝
ℙ 𝕌: ⓩℙ 𝕌⌝
    z_library rewrite: ⓩ𝕌⌝
    z_library_ext rewrite: ⓩ𝕌⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ℙ 𝕌: ⓩx ∈ ℙ 𝕌⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩx ∈ 𝕌⌝
    z_library_ext strip: ⓩ∀ x1 : 𝕌 ⦁ x1 ∈ x ⇒ x1 ∈ 𝕌⌝
Tuple Display ∈ Product: ⓩ(1, 2) ∈ X × Y⌝
    z_library rewrite: ⓩ1 ∈ X ∧ 2 ∈ Y⌝
    z_library_ext rewrite: ⓩ1 ∈ X ∧ 2 ∈ Y⌝
    z_library strip: ⓩ1 ∈ X ∧ 2 ∈ Y⌝
    z_library_ext strip: ⓩ1 ∈ X ∧ 2 ∈ Y⌝
Tuple ∈ Product: ⓩx ∈ X × Y⌝
    z_library rewrite: ⓩx.1 ∈ X ∧ x.2 ∈ Y⌝
    z_library_ext rewrite: ⓩx.1 ∈ X ∧ x.2 ∈ Y⌝
    z_library strip: ⓩx.1 ∈ X ∧ x.2 ∈ Y⌝
    z_library_ext strip: ⓩx.1 ∈ X ∧ x.2 ∈ Y⌝
𝕌 × 𝕌: ⓩ𝕌 × 𝕌 × 𝕌⌝
    z_library rewrite: ⓩ𝕌⌝
    z_library_ext rewrite: ⓩ𝕌⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ 𝕌 × 𝕌: ⓩx ∈ 𝕌 × 𝕌 × 𝕌⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩx.1 ∈ 𝕌 ∧ x.2 ∈ 𝕌 ∧ x.3 ∈ 𝕌⌝
    z_library_ext strip: ⓩx.1 ∈ 𝕌 ∧ x.2 ∈ 𝕌 ∧ x.3 ∈ 𝕌⌝
β reduction - no asms 1: ⓩ(λ x : 𝕌 ⦁ f x) y⌝
    z_library rewrite: ⓩf y⌝
    z_library_ext rewrite: ⓩf y⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
β reduction - no asms 2: ⓩ(λ x : 𝕌 ⦁ x = y) y⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩy = y⌝
    z_library_ext strip: ⓩy = y⌝
β reduction 1: ⓩ(λ x : X ⦁ f x) y⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
β reduction 2: ⓩ(λ x : X ⦁ y = x) y⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
   z_library strip:   N/C
   z_library_ext strip:   N/C
∈ λ: ⓩx ∈ (λ x : X ⦁ f x)⌝
    z_library rewrite: ⓩx.1 ∈ X ∧ f x.1 = x.2⌝
    z_library_ext rewrite: ⓩx.1 ∈ X ∧ f x.1 = x.2⌝
    z_library strip: ⓩx ∈ {x : X ⦁ (x, f x)}⌝
    z_library_ext strip: ⓩx ∈ {x : X ⦁ (x, f x)}⌝
μ: ⓩμ x : X | p x ⦁ q x⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ μ: ⓩv ∈ (μ x : X | p x ⦁ q x)⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
   z_library strip:   N/C
   z_library_ext strip:   N/C
Application: ⓩf x⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Application: ⓩp ∈ f x⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
   z_library strip:   N/C
   z_library_ext strip:   N/C
Selection from Tuple Display 1: ⓩ(1, 2, 3).2⌝
    z_library rewrite: ⓩ2⌝
    z_library_ext rewrite: ⓩ2⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
Selection from Tuple Display 2: ⓩ(1, true, 3).2⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩtrue⌝
    z_library_ext strip: ⓩtrue⌝
Selection from Tuple Display 3: ⓩx ∈ (1, f 2, 3).2⌝
    z_library rewrite: ⓩx ∈ f 2⌝
    z_library_ext rewrite: ⓩx ∈ f 2⌝
    z_library strip: ⓩx ∈ f 2⌝
    z_library_ext strip: ⓩx ∈ f 2⌝
Selection from Binding Display 1: ⓩ(x ≜ 1, y ≜ 2).y⌝
    z_library rewrite: ⓩ2⌝
    z_library_ext rewrite: ⓩ2⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
Selection from Tuple Display 2: ⓩ(x ≜ 1, y ≜ true).y⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩtrue⌝
    z_library_ext strip: ⓩtrue⌝
Selection from Tuple Display 3: ⓩx ∈ (x ≜ 1, y ≜ f y).y⌝
    z_library rewrite: ⓩx ∈ f y⌝
    z_library_ext rewrite: ⓩx ∈ f y⌝
    z_library strip: ⓩx ∈ f y⌝
    z_library_ext strip: ⓩx ∈ f y⌝
Selection from θ 1: ⓩ(θ[a, b : X]).a⌝
    z_library rewrite: ⓩa⌝
    z_library_ext rewrite: ⓩa⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
Selection from θ 2: ⓩ(θ[a, b : X | ¬ a]).a⌝
    z_library rewrite: ⓩa⌝
    z_library_ext rewrite: ⓩa⌝
    z_library strip: ⓩa⌝
    z_library_ext strip: ⓩa⌝
Selection from θ 3: ⓩx ∈ (θ[a, b : X]).a⌝
    z_library rewrite: ⓩx ∈ a⌝
    z_library_ext rewrite: ⓩx ∈ a⌝
    z_library strip: ⓩx ∈ a⌝
    z_library_ext strip: ⓩx ∈ a⌝
Ill-formed Schema as predicate: ⓩ([x : X; y : Y]')⌝
    z_library rewrite: ⓩx' ∈ X ∧ y ∈ Y⌝
    z_library_ext rewrite: ⓩx' ∈ X ∧ y ∈ Y⌝
    z_library strip: ⓩ(x ≜ x', y ≜ y) ∈ [x : X; y : Y]⌝
    z_library_ext strip: ⓩ(x ≜ x', y ≜ y) ∈ [x : X; y : Y]⌝
Ill-formed θ: ⓩθ([x : X; y : Y])'⌝
    z_library rewrite: ⓩ(x ≜ x', y ≜ y)⌝
    z_library_ext rewrite: ⓩ(x ≜ x', y ≜ y)⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈: ⓩx ∈ f⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
   z_library strip:   N/C
   z_library_ext strip:   N/C
Variable: ⓩf⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Sequence Display: ⓩ⟨1, 2⟩⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Sequence Display: ⓩx ∈ ⟨1, 2⟩⌝
    z_library rewrite: ⓩx = (1, 1) ∨ x = (2, 2)⌝
    z_library_ext rewrite: ⓩx.1 = 1 ∧ x.2 = 1 ∨ x.1 = 2 ∧ x.2 = 2⌝
    z_library strip: ⓩx ∈ {(1, 1), (2, 2)}⌝
    z_library_ext strip: ⓩx ∈ {(1, 1), (2, 2)}⌝
Bag Display: ⓩ⟦ 1, 2, 1 ⟧⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Bag Display: ⓩx ∈ ⟦ 1, 2, 1 ⟧⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
   z_library strip:   N/C
   z_library_ext strip:   N/C
Function Eqn: ⓩ(λ x : X ⦁ x + 1) = y⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ∀ x1 : 𝕌; x2 : 𝕌 ⦁ x1 ∈ X ∧ x1 + 1 = x2 ⇔ (x1, x2) ∈ y⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩ∀ x1 : 𝕌; x2 : 𝕌 ⦁ (x1, x2) ∈ (λ x : X ⦁ x + 1) ⇔ (x1, x2) ∈ y⌝
Variable Eqn: ⓩx = y⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
   z_library strip:   N/C
   z_library_ext strip:   N/C
¬: ⓩ¬ f x⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
   z_library strip:   N/C
   z_library_ext strip:   N/C
Simp ¬: ⓩ¬ false⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩtrue⌝
    z_library_ext strip: ⓩtrue⌝
∧: ⓩa ∧ b⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
   z_library strip:   N/C
   z_library_ext strip:   N/C
Simp ∧: ⓩtrue ∧ b⌝
    z_library rewrite: ⓩb⌝
    z_library_ext rewrite: ⓩb⌝
   z_library strip:   N/C
   z_library_ext strip:   N/C
∨: ⓩa ∨ b⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
   z_library strip:   N/C
   z_library_ext strip:   N/C
Simp ∨: ⓩtrue ∨ b⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
   z_library strip:   N/C
   z_library_ext strip:   N/C
⇒: ⓩa ⇒ b⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip: ⓩ¬ a ∨ b⌝
    z_library_ext strip: ⓩ¬ a ∨ b⌝
Simp ⇒: ⓩtrue ⇒ b⌝
    z_library rewrite: ⓩb⌝
    z_library_ext rewrite: ⓩb⌝
    z_library strip: ⓩ¬ true ∨ b⌝
    z_library_ext strip: ⓩ¬ true ∨ b⌝
⇔: ⓩa ⇔ b⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip: ⓩ(a ⇒ b) ∧ (b ⇒ a)⌝
    z_library_ext strip: ⓩ(a ⇒ b) ∧ (b ⇒ a)⌝
Simp ⇔: ⓩtrue ⇔ b⌝
    z_library rewrite: ⓩb⌝
    z_library_ext rewrite: ⓩb⌝
    z_library strip: ⓩ(true ⇒ b) ∧ (b ⇒ true)⌝
    z_library_ext strip: ⓩ(true ⇒ b) ∧ (b ⇒ true)⌝
∀: ⓩ∀ x : X | p x ⦁ q x⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
   z_library strip:   N/C
   z_library_ext strip:   N/C
Simp ∀: ⓩ∀ x : X | false ⦁ q x⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩfalse ⇒ (∀ x : X ⦁ q x)⌝
    z_library_ext strip: ⓩfalse ⇒ (∀ x : X ⦁ q x)⌝
∃: ⓩ∃ x : X | p x ⦁ q x⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip: ⌜∃ x⦁ x ∈ X ∧ ⓩp x⌝ ∧ ⓩq x⌝⌝
    z_library_ext strip: ⌜∃ x⦁ x ∈ X ∧ ⓩp x⌝ ∧ ⓩq x⌝⌝
Simp ∃: ⓩ∃ x : X | false ⦁ q x⌝
    z_library rewrite: ⓩfalse⌝
    z_library_ext rewrite: ⓩfalse⌝
    z_library strip: ⌜∃ x⦁ x ∈ X ∧ F ∧ ⓩq x⌝⌝
    z_library_ext strip: ⌜∃ x⦁ x ∈ X ∧ F ∧ ⓩq x⌝⌝
∃⋎1: ⓩ∃⋎1 x : X | p x ⦁ q x⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip: ⓩ∃ x : X | p x ∧ q x ⦁ ∀ x' : X | p x' ∧ q x' ⦁ x' = x⌝
    z_library_ext strip: ⓩ∃ x : X | p x ∧ q x ⦁ ∀ x' : X | p x' ∧ q x' ⦁ x' = x⌝
Simp ∃⋎1: ⓩ∃⋎1 x : X | false ⦁ q x⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip: ⓩ∃ x : X | false ∧ q x ⦁ ∀ x' : X | false ∧ q x' ⦁ x' = x⌝
    z_library_ext strip: ⓩ∃ x : X | false ∧ q x ⦁ ∀ x' : X | false ∧ q x' ⦁ x' = x⌝
Binding ∈ Schema 1: ⓩ(x ≜ x, y ≜ y) ∈ S⌝
    z_library rewrite: ⓩS⌝
    z_library_ext rewrite: ⓩS⌝
    z_library strip: ⓩS⌝
    z_library_ext strip: ⓩS⌝
Binding ∈ Schema 2: ⓩ(x ≜ x', y ≜ y) ∈ S⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
   z_library strip:   N/C
   z_library_ext strip:   N/C
Schema: ⓩ[x : X; y : Y | f x y]⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Schema as predicate: ⓩ[x : X; y : Y | f x y]⌝
    z_library rewrite: ⓩ(x ∈ X ∧ y ∈ Y) ∧ f x y⌝
    z_library_ext rewrite: ⓩ(x ∈ X ∧ y ∈ Y) ∧ f x y⌝
    z_library strip: ⓩ(x ∈ X ∧ y ∈ Y) ∧ f x y⌝
    z_library_ext strip: ⓩ(x ∈ X ∧ y ∈ Y) ∧ f x y⌝
¬⋎s: ⓩ¬ [x : X; y : Y | f x y]⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ¬⋎s: ⓩp ∈ (¬ [x : X; y : Y | f x y])⌝
    z_library rewrite: ⓩ¬ ((p.x ∈ X ∧ p.y ∈ Y) ∧ f p.x p.y)⌝
    z_library_ext rewrite: ⓩ¬ ((p.x ∈ X ∧ p.y ∈ Y) ∧ f p.x p.y)⌝
    z_library strip: ⓩ¬ p ∈ [x : X; y : Y | f x y]⌝
    z_library_ext strip: ⓩ¬ p ∈ [x : X; y : Y | f x y]⌝
¬⋎s as predicate: ⓩ¬ [x : X; y : Y | f x y]⌝
    z_library rewrite: ⓩ¬ ((x ∈ X ∧ y ∈ Y) ∧ f x y)⌝
    z_library_ext rewrite: ⓩ¬ ((x ∈ X ∧ y ∈ Y) ∧ f x y)⌝
    z_library strip: ⓩ¬ ((x ∈ X ∧ y ∈ Y) ∧ f x y)⌝
    z_library_ext strip: ⓩ¬ ((x ∈ X ∧ y ∈ Y) ∧ f x y)⌝
∧⋎s: ⓩ[y : Y; z : Z | g y z] ∧ [x : X; y : Y | f x y]⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ∧⋎s: ⓩp ∈ ([y : Y; z : Z | g y z] ∧ [x : X; y : Y | f x y])⌝
    z_library rewrite: ⓩ((p.y ∈ Y ∧ p.z ∈ Z) ∧ g p.y p.z) ∧ (p.x ∈ X ∧ p.y ∈ Y) ∧ f p.x p.y⌝
    z_library_ext rewrite: ⓩ((p.y ∈ Y ∧ p.z ∈ Z) ∧ g p.y p.z) ∧
	(p.x ∈ X ∧ p.y ∈ Y) ∧ f p.x p.y⌝
    z_library strip: ⓩ(y ≜ p.y, z ≜ p.z) ∈ [y : Y; z : Z | g y z] ∧
	(x ≜ p.x, y ≜ p.y) ∈ [x : X; y : Y | f x y]⌝
    z_library_ext strip: ⓩ(y ≜ p.y, z ≜ p.z) ∈ [y : Y; z : Z | g y z] ∧
	(x ≜ p.x, y ≜ p.y) ∈ [x : X; y : Y | f x y]⌝
∧⋎s as predicate: ⓩ([y : Y; z : Z | g y z] ∧ [x : X; y : Y | f x y])⌝
    z_library rewrite: ⓩ((y ∈ Y ∧ z ∈ Z) ∧ g y z) ∧ (x ∈ X ∧ y ∈ Y) ∧ f x y⌝
    z_library_ext rewrite: ⓩ((y ∈ Y ∧ z ∈ Z) ∧ g y z) ∧ (x ∈ X ∧ y ∈ Y) ∧ f x y⌝
    z_library strip: ⓩ(y ≜ y, z ≜ z) ∈ [y : Y; z : Z | g y z] ∧
	(x ≜ x, y ≜ y) ∈ [x : X; y : Y | f x y]⌝
    z_library_ext strip: ⓩ(y ≜ y, z ≜ z) ∈ [y : Y; z : Z | g y z] ∧
	(x ≜ x, y ≜ y) ∈ [x : X; y : Y | f x y]⌝
∨⋎s: ⓩ[y : Y; z : Z | g y z] ∨ [x : X; y : Y | f x y]⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ∨⋎s: ⓩp ∈ ([y : Y; z : Z | g y z] ∨ [x : X; y : Y | f x y])⌝
    z_library rewrite: ⓩ(p.y ∈ Y ∧ p.z ∈ Z) ∧ g p.y p.z ∨ (p.x ∈ X ∧ p.y ∈ Y) ∧ f p.x p.y⌝
    z_library_ext rewrite: ⓩ(p.y ∈ Y ∧ p.z ∈ Z) ∧ g p.y p.z ∨ (p.x ∈ X ∧ p.y ∈ Y)
	∧ f p.x p.y⌝
    z_library strip: ⓩ(y ≜ p.y, z ≜ p.z) ∈ [y : Y; z : Z | g y z]
	∨ (x ≜ p.x, y ≜ p.y) ∈ [x : X; y : Y | f x y]⌝
    z_library_ext strip: ⓩ(y ≜ p.y, z ≜ p.z) ∈ [y : Y; z : Z | g y z]
	∨ (x ≜ p.x, y ≜ p.y) ∈ [x : X; y : Y | f x y]⌝
∨⋎s as predicate: ⓩ([y : Y; z : Z | g y z] ∨ [x : X; y : Y | f x y])⌝
    z_library rewrite: ⓩ(y ∈ Y ∧ z ∈ Z) ∧ g y z ∨ (x ∈ X ∧ y ∈ Y) ∧ f x y⌝
    z_library_ext rewrite: ⓩ(y ∈ Y ∧ z ∈ Z) ∧ g y z ∨ (x ∈ X ∧ y ∈ Y) ∧ f x y⌝
    z_library strip: ⓩ(y ≜ y, z ≜ z) ∈ [y : Y; z : Z | g y z] ∨
	(x ≜ x, y ≜ y) ∈ [x : X; y : Y | f x y]⌝
    z_library_ext strip: ⓩ(y ≜ y, z ≜ z) ∈ [y : Y; z : Z | g y z] ∨
	(x ≜ x, y ≜ y) ∈ [x : X; y : Y | f x y]⌝
⇒⋎s: ⓩ[y : Y; z : Z | g y z] ⇒ [x : X; y : Y | f x y]⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ⇒⋎s: ⓩp ∈ ([y : Y; z : Z | g y z] ⇒ [x : X; y : Y | f x y])⌝
    z_library rewrite: ⓩ(p.y ∈ Y ∧ p.z ∈ Z) ∧ g p.y p.z ⇒ (p.x ∈ X ∧ p.y ∈ Y) ∧
	f p.x p.y⌝
    z_library_ext rewrite: ⓩ(p.y ∈ Y ∧ p.z ∈ Z) ∧ g p.y p.z ⇒
	(p.x ∈ X ∧ p.y ∈ Y) ∧ f p.x p.y⌝
    z_library strip: ⓩ(y ≜ p.y, z ≜ p.z) ∈ [y : Y; z : Z | g y z] ⇒
	(x ≜ p.x, y ≜ p.y) ∈ [x : X; y : Y | f x y]⌝
    z_library_ext strip: ⓩ(y ≜ p.y, z ≜ p.z) ∈ [y : Y; z : Z | g y z] ⇒
	(x ≜ p.x, y ≜ p.y) ∈ [x : X; y : Y | f x y]⌝
⇒⋎s as predicate: ⓩ([y : Y; z : Z | g y z] ⇒ [x : X; y : Y | f x y])⌝
    z_library rewrite: ⓩ(y ∈ Y ∧ z ∈ Z) ∧ g y z ⇒ (x ∈ X ∧ y ∈ Y) ∧ f x y⌝
    z_library_ext rewrite: ⓩ(y ∈ Y ∧ z ∈ Z) ∧ g y z ⇒ (x ∈ X ∧ y ∈ Y) ∧ f x y⌝
    z_library strip: ⓩ(y ≜ y, z ≜ z) ∈ [y : Y; z : Z | g y z] ⇒
	 (x ≜ x, y ≜ y) ∈ [x : X; y : Y | f x y]⌝
    z_library_ext strip: ⓩ(y ≜ y, z ≜ z) ∈ [y : Y; z : Z | g y z] ⇒
	(x ≜ x, y ≜ y) ∈ [x : X; y : Y | f x y]⌝
⇔⋎s: ⓩ[y : Y; z : Z | g y z] ⇔ [x : X; y : Y | f x y]⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ⇔⋎s: ⓩp ∈ ([y : Y; z : Z | g y z] ⇔ [x : X; y : Y | f x y])⌝
    z_library rewrite: ⓩ(p.y ∈ Y ∧ p.z ∈ Z) ∧ g p.y p.z ⇔ (p.x ∈ X ∧ p.y ∈ Y) ∧ f p.x p.y⌝
    z_library_ext rewrite: ⓩ(p.y ∈ Y ∧ p.z ∈ Z) ∧ g p.y p.z ⇔ (p.x ∈ X ∧ p.y ∈ Y)
	∧ f p.x p.y⌝
    z_library strip: ⓩ(y ≜ p.y, z ≜ p.z) ∈ [y : Y; z : Z | g y z]
	⇔ (x ≜ p.x, y ≜ p.y) ∈ [x : X; y : Y | f x y]⌝
    z_library_ext strip: ⓩ(y ≜ p.y, z ≜ p.z) ∈ [y : Y; z : Z | g y z]
	⇔ (x ≜ p.x, y ≜ p.y) ∈ [x : X; y : Y | f x y]⌝
⇔⋎s as predicate: ⓩ([y : Y; z : Z | g y z] ⇔ [x : X; y : Y | f x y])⌝
    z_library rewrite: ⓩ(y ∈ Y ∧ z ∈ Z) ∧ g y z ⇔ (x ∈ X ∧ y ∈ Y) ∧ f x y⌝
    z_library_ext rewrite: ⓩ(y ∈ Y ∧ z ∈ Z) ∧ g y z ⇔ (x ∈ X ∧ y ∈ Y)
	∧ f x y⌝
    z_library strip: ⓩ(y ≜ y, z ≜ z) ∈ [y : Y; z : Z | g y z] ⇔ (x ≜ x, y ≜ y)
	∈ [x : X; y : Y | f x y]⌝
    z_library_ext strip: ⓩ(y ≜ y, z ≜ z) ∈ [y : Y; z : Z | g y z] ⇔ (x ≜ x, y ≜ y)
	∈ [x : X; y : Y | f x y]⌝
↾⋎s: ⓩ[y : Y; z : Z | g y z] ↾⋎s [x : X; y : Y | f x y]⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ↾⋎s: ⓩp ∈ ([y : Y; z : Z | g y z] ↾⋎s [x : X; y : Y | f x y])⌝
    z_library rewrite: ⓩ∃ z : 𝕌 ⦁ ((p.y ∈ Y ∧ z ∈ Z) ∧ g p.y z) ∧
	(p.x ∈ X ∧ p.y ∈ Y) ∧ f p.x p.y⌝
    z_library_ext rewrite: ⓩ∃ z : 𝕌 ⦁ ((p.y ∈ Y ∧ z ∈ Z) ∧ g p.y z) ∧
	(p.x ∈ X ∧ p.y ∈ Y) ∧ f p.x p.y⌝
    z_library strip: ⓩp ∈ (([y : Y; z : Z | g y z] ∧ [x : X; y : Y | f x y]) \⋎s (z))⌝
    z_library_ext strip: ⓩp ∈ (([y : Y; z : Z | g y z] ∧ [x : X; y : Y | f x y]) \⋎s (z))⌝
↾⋎s as predicate: ⓩ([y : Y; z : Z | g y z] ↾⋎s [x : X; y : Y | f x y])⌝
    z_library rewrite: ⓩ∃ z : 𝕌 ⦁ ((y ∈ Y ∧ z ∈ Z) ∧ g y z) ∧
	(x ∈ X ∧ y ∈ Y) ∧ f x y⌝
    z_library_ext rewrite: ⓩ∃ z : 𝕌 ⦁ ((y ∈ Y ∧ z ∈ Z) ∧ g y z) ∧
	(x ∈ X ∧ y ∈ Y) ∧ f x y⌝
    z_library strip: ⓩ(x ≜ x, y ≜ y) ∈ (([y : Y; z : Z | g y z] ∧
	[x : X; y : Y | f x y]) \⋎s (z))⌝
    z_library_ext strip: ⓩ(x ≜ x, y ≜ y) ∈ (([y : Y; z : Z | g y z] ∧
	 [x : X; y : Y | f x y]) \⋎s (z))⌝
∀⋎s: ⓩ∀ x : X | p x ⦁ [x, y, z : X | f x y z]⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ∀⋎s: ⓩq ∈ (∀ x : X | p x ⦁ [x, y, z : X | f x y z])⌝
    z_library rewrite: ⓩ∀ x1 : 𝕌 ⦁ x1.x ∈ X ∧ p x1.x ⇒ {x1.x, q.y, q.z} ⊆ X
	 ∧ f x1.x q.y q.z⌝
    z_library_ext rewrite: ⓩ∀ x1 : 𝕌 ⦁ x1.x ∈ X ∧ p x1.x ⇒ (x1.x ∈ X ∧ q.y ∈ X ∧ q.z ∈ X)
	∧ f x1.x q.y q.z⌝
    z_library strip: ⓩ∀ x1 : 𝕌 ⦁ x1.x ∈ X ∧ p x1.x ⇒ (x ≜ x1.x, y ≜ q.y, z ≜ q.z)
	∈ [x, y, z : X | f x y z]⌝
    z_library_ext strip: ⓩ∀ x1 : 𝕌 ⦁ x1.x ∈ X ∧ p x1.x ⇒ (x ≜ x1.x, y ≜ q.y, z ≜ q.z)
	∈ [x, y, z : X | f x y z]⌝
∀⋎s as predicate: ⓩ(∀ x : X | p x ⦁ [x, y, z : X | f x y z])⌝
    z_library rewrite: ⓩ∀ x1 : 𝕌 ⦁ x1.x ∈ X ∧ p x1.x ⇒ {x1.x, y, z} ⊆ X
	∧ f x1.x y z⌝
    z_library_ext rewrite: ⓩ∀ x1 : 𝕌 ⦁ x1.x ∈ X ∧ p x1.x ⇒ (x1.x ∈ X ∧ y ∈ X ∧ z ∈ X)
	∧ f x1.x y z⌝
    z_library strip: ⓩ∀ x1 : 𝕌 ⦁ x1.x ∈ X ∧ p x1.x ⇒ (x ≜ x1.x, y ≜ y, z ≜ z)
	∈ [x, y, z : X | f x y z]⌝
    z_library_ext strip: ⓩ∀ x1 : 𝕌 ⦁ x1.x ∈ X ∧ p x1.x ⇒ (x ≜ x1.x, y ≜ y, z ≜ z)
	∈ [x, y, z : X | f x y z]⌝
∃⋎s: ⓩ∃ x : X | p x ⦁ [x, y, z : X | f x y z]⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ∃⋎s: ⓩq ∈ (∃ x : X | p x ⦁ [x, y, z : X | f x y z])⌝
    z_library rewrite: ⓩ∃ x1 : 𝕌 ⦁ (x1.x ∈ X ∧ p x1.x) ∧ {x1.x, q.y, q.z} ⊆ X
	∧ f x1.x q.y q.z⌝
    z_library_ext rewrite: ⓩ∃ x1 : 𝕌 ⦁ (x1.x ∈ X ∧ p x1.x) ∧ (x1.x ∈ X ∧ q.y ∈ X
	∧ q.z ∈ X) ∧ f x1.x q.y q.z⌝
    z_library strip: ⓩ∃ x1 : 𝕌 ⦁ (x1.x ∈ X ∧ p x1.x) ∧ (x ≜ x1.x, y ≜ q.y, z ≜ q.z)
	∈ [x, y, z : X | f x y z]⌝
    z_library_ext strip: ⓩ∃ x1 : 𝕌 ⦁ (x1.x ∈ X ∧ p x1.x) ∧ (x ≜ x1.x, y ≜ q.y, z ≜ q.z)
	∈ [x, y, z : X | f x y z]⌝
∃⋎s as predicate: ⓩ(∃ x : X | p x ⦁ [x, y, z : X | f x y z])⌝
    z_library rewrite: ⓩ∃ x1 : 𝕌 ⦁ (x1.x ∈ X ∧ p x1.x) ∧ {x1.x, y, z} ⊆ X
	∧ f x1.x y z⌝
    z_library_ext rewrite: ⓩ∃ x1 : 𝕌 ⦁ (x1.x ∈ X ∧ p x1.x) ∧
	(x1.x ∈ X ∧ y ∈ X ∧ z ∈ X) ∧ f x1.x y z⌝
    z_library strip: ⓩ∃ x1 : 𝕌 ⦁ (x1.x ∈ X ∧ p x1.x) ∧ (x ≜ x1.x, y ≜ y, z ≜ z) ∈
	[x, y, z : X | f x y z]⌝
    z_library_ext strip: ⓩ∃ x1 : 𝕌 ⦁ (x1.x ∈ X ∧ p x1.x) ∧ (x ≜ x1.x, y ≜ y, z ≜ z) ∈
	[x, y, z : X | f x y z]⌝
∃⋎1⋎s: ⓩ∃⋎1 x : X | p x ⦁ [x, y, z : X | f x y z]⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ∃⋎1⋎s: ⓩq ∈ (∃⋎1 x : X | p x ⦁ [x, y, z : X | f x y z])⌝
    z_library rewrite: ⓩ∃⋎1 x1 : 𝕌 ⦁ (x1.x ∈ X ∧ p x1.x) ∧ {x1.x, q.y, q.z} ⊆
	X ∧ f x1.x q.y q.z⌝
    z_library_ext rewrite: ⓩ∃⋎1 x1 : 𝕌 ⦁ (x1.x ∈ X ∧ p x1.x) ∧
	(x1.x ∈ X ∧ q.y ∈ X ∧ q.z ∈ X) ∧ f x1.x q.y q.z⌝
    z_library strip: ⓩ∃⋎1 x1 : 𝕌 ⦁ (x1.x ∈ X ∧ p x1.x) ∧ (x ≜ x1.x, y ≜ q.y, z ≜ q.z)
	 ∈ [x, y, z : X | f x y z]⌝
    z_library_ext strip: ⓩ∃⋎1 x1 : 𝕌 ⦁ (x1.x ∈ X ∧ p x1.x) ∧
	(x ≜ x1.x, y ≜ q.y, z ≜ q.z) ∈ [x, y, z : X | f x y z]⌝
∃⋎1⋎s as predicate: ⓩ(∃⋎1 x : X | p x ⦁ [x, y, z : X | f x y z])⌝
    z_library rewrite: ⓩ∃⋎1 x1 : 𝕌 ⦁ (x1.x ∈ X ∧ p x1.x) ∧ {x1.x, y, z} ⊆ X ∧
	f x1.x y z⌝
    z_library_ext rewrite: ⓩ∃⋎1 x1 : 𝕌 ⦁ (x1.x ∈ X ∧ p x1.x) ∧
	(x1.x ∈ X ∧ y ∈ X ∧ z ∈ X) ∧ f x1.x y z⌝
    z_library strip: ⓩ∃⋎1 x1 : 𝕌 ⦁ (x1.x ∈ X ∧ p x1.x) ∧ (x ≜ x1.x, y ≜ y, z ≜ z) ∈
	[x, y, z : X | f x y z]⌝
    z_library_ext strip: ⓩ∃⋎1 x1 : 𝕌 ⦁ (x1.x ∈ X ∧ p x1.x) ∧
	(x ≜ x1.x, y ≜ y, z ≜ z) ∈ [x, y, z : X | f x y z]⌝
pre⋎s: ⓩpre [x, x', y, z : X | f x y z]⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ pre⋎s: ⓩp ∈ (pre [x, x', y, z : X | f x y z])⌝
    z_library rewrite: ⓩ∃ x' : 𝕌 ⦁ {p.x, x', p.y, p.z} ⊆ X ∧ f p.x p.y p.z⌝
    z_library_ext rewrite: ⓩ∃ x' : 𝕌 ⦁ (p.x ∈ X ∧ x' ∈ X ∧ p.y ∈ X ∧ p.z ∈ X)
	∧ f p.x p.y p.z⌝
    z_library strip: ⓩp ∈ [x : 𝕌; y : 𝕌; z : 𝕌 | ∃ x' : 𝕌 ⦁ [x, x', y, z : X
	| f x y z]]⌝
    z_library_ext strip: ⓩp ∈ [x : 𝕌; y : 𝕌; z : 𝕌 | ∃ x' : 𝕌 ⦁
	[x, x', y, z : X | f x y z]]⌝
pre⋎s as predicate: ⓩ(pre [x, x', y, z : X | f x y z])⌝
    z_library rewrite: ⓩ∃ x' : 𝕌 ⦁ {x, x', y, z} ⊆ X ∧ f x y z⌝
    z_library_ext rewrite: ⓩ∃ x' : 𝕌 ⦁ (x ∈ X ∧ x' ∈ X ∧ y ∈ X ∧ z ∈ X) ∧ f x y z⌝
    z_library strip: ⓩ(x ≜ x, y ≜ y, z ≜ z) ∈ [x : 𝕌; y : 𝕌; z : 𝕌 |
	∃ x' : 𝕌 ⦁ [x, x', y, z : X | f x y z]]⌝
    z_library_ext strip: ⓩ(x ≜ x, y ≜ y, z ≜ z) ∈ [x : 𝕌; y : 𝕌; z : 𝕌 |
	∃ x' : 𝕌 ⦁ [x, x', y, z : X | f x y z]]⌝
Δ⋎s: ⓩΔ [x, y, z : X | f x y z]⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Δ⋎s: ⓩp ∈ (Δ [x, y, z : X | f x y z])⌝
    z_library rewrite: ⓩ({p.x, p.y, p.z} ⊆ X ∧ f p.x p.y p.z) ∧
	{p.x', p.y', p.z'} ⊆ X ∧ f p.x' p.y' p.z'⌝
    z_library_ext rewrite: ⓩ((p.x ∈ X ∧ p.y ∈ X ∧ p.z ∈ X) ∧ f p.x p.y p.z) ∧
	(p.x' ∈ X ∧ p.y' ∈ X ∧ p.z' ∈ X) ∧ f p.x' p.y' p.z'⌝
    z_library strip: ⓩp ∈ [[x, y, z : X | f x y z]; ([x, y, z : X | f x y z])']⌝
    z_library_ext strip: ⓩp ∈ [[x, y, z : X | f x y z];
	 ([x, y, z : X | f x y z])']⌝
Δ⋎s as predicate: ⓩ(Δ [x, y, z : X | f x y z])⌝
    z_library rewrite: ⓩ({x, y, z} ⊆ X ∧ f x y z) ∧ {x', y', z'} ⊆ X ∧
	f x' y' z'⌝
    z_library_ext rewrite: ⓩ((x ∈ X ∧ y ∈ X ∧ z ∈ X) ∧ f x y z) ∧
	(x' ∈ X ∧ y' ∈ X ∧ z' ∈ X) ∧ f x' y' z'⌝
    z_library strip: ⓩ(x ≜ x, x' ≜ x', y ≜ y, y' ≜ y', z ≜ z, z' ≜ z') ∈
	[[x, y, z : X | f x y z]; ([x, y, z : X | f x y z])']⌝
    z_library_ext strip: ⓩ(x ≜ x, x' ≜ x', y ≜ y, y' ≜ y', z ≜ z, z' ≜ z') ∈
	[[x, y, z : X | f x y z]; ([x, y, z : X | f x y z])']⌝
Ξ⋎s: ⓩΞ [x, y, z : X | f x y z]⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Ξ⋎s: ⓩp ∈ (Ξ [x, y, z : X | f x y z])⌝
    z_library rewrite: ⓩ(({p.x, p.y, p.z} ⊆ X ∧ f p.x p.y p.z) ∧
	{p.x', p.y', p.z'} ⊆ X ∧ f p.x' p.y' p.z') ∧ p.x = p.x' ∧
	p.y = p.y' ∧ p.z = p.z'⌝
    z_library_ext rewrite: ⓩ(((p.x ∈ X ∧ p.y ∈ X ∧ p.z ∈ X) ∧ f p.x p.y p.z)
	∧ (p.x' ∈ X ∧ p.y' ∈ X ∧ p.z' ∈ X) ∧ f p.x' p.y' p.z') ∧
	p.x = p.x' ∧ p.y = p.y' ∧ p.z = p.z'⌝
    z_library strip: ⓩp ∈ [[x, y, z : X | f x y z]; ([x, y, z : X | f x y z])'
	| θ[x, y, z : X | f x y z] = θ([x, y, z : X | f x y z])']⌝
    z_library_ext strip: ⓩp ∈ [[x, y, z : X | f x y z]; ([x, y, z : X | f x y z])'
	| θ[x, y, z : X | f x y z] = θ([x, y, z : X | f x y z])']⌝
Ξ⋎s as predicate: ⓩ(Ξ [x, y, z : X | f x y z])⌝
    z_library rewrite: ⓩ(({x, y, z} ⊆ X ∧ f x y z) ∧ {x', y', z'} ⊆ X
	∧ f x' y' z') ∧ x = x' ∧ y = y' ∧ z = z'⌝
    z_library_ext rewrite: ⓩ(((x ∈ X ∧ y ∈ X ∧ z ∈ X) ∧ f x y z) ∧ (x' ∈ X ∧
	y' ∈ X ∧ z' ∈ X) ∧ f x' y' z') ∧ x = x' ∧ y = y' ∧ z = z'⌝
    z_library strip: ⓩ(x ≜ x, x' ≜ x', y ≜ y, y' ≜ y', z ≜ z, z' ≜ z') ∈
	 [[x, y, z : X | f x y z];
	([x, y, z : X | f x y z])' | θ[x, y, z : X | f x y z] =
	θ([x, y, z : X | f x y z])']⌝
    z_library_ext strip: ⓩ(x ≜ x, x' ≜ x', y ≜ y, y' ≜ y', z ≜ z, z' ≜ z') ∈
	[[x, y, z : X | f x y z]; ([x, y, z : X | f x y z])'
	| θ[x, y, z : X | f x y z] = θ([x, y, z : X | f x y z])']⌝
\⋎s: ⓩ[x, y, z : X | f x y z] \⋎s (y)⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ \⋎s: ⓩp ∈ ([x, y, z : X | f x y z] \⋎s (y))⌝
    z_library rewrite: ⓩ∃ y : 𝕌 ⦁ {p.x, y, p.z} ⊆ X ∧ f p.x y p.z⌝
    z_library_ext rewrite: ⓩ∃ y : 𝕌 ⦁ (p.x ∈ X ∧ y ∈ X ∧ p.z ∈ X) ∧ f p.x y p.z⌝
    z_library strip: ⓩp ∈ [x : 𝕌; z : 𝕌 | ∃ y : 𝕌 ⦁ [x, y, z : X | f x y z]]⌝
    z_library_ext strip: ⓩp ∈ [x : 𝕌; z : 𝕌 | ∃ y : 𝕌 ⦁ [x, y, z : X | f x y z]]⌝
\⋎s as predicate: ⓩ([x, y, z : X | f x y z] \⋎s (y))⌝
    z_library rewrite: ⓩ∃ y : 𝕌 ⦁ {x, y, z} ⊆ X ∧ f x y z⌝
    z_library_ext rewrite: ⓩ∃ y : 𝕌 ⦁ (x ∈ X ∧ y ∈ X ∧ z ∈ X) ∧ f x y z⌝
    z_library strip: ⓩ(x ≜ x, z ≜ z) ∈ [x : 𝕌; z : 𝕌 | ∃ y : 𝕌 ⦁ [x, y, z : X | f x y z]]⌝
    z_library_ext strip: ⓩ(x ≜ x, z ≜ z) ∈ [x : 𝕌; z : 𝕌 | ∃ y : 𝕌 ⦁ [x, y, z : X | f x y z]]⌝
⨾⋎s: ⓩ[x, x', y : X | f x x' y] ⨾⋎s [x, y, z : X | g x y z]⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ⨾⋎s: ⓩp ∈ ([x, x', y : X | f x x' y] ⨾⋎s [x, y, z : X | g x y z])⌝
    z_library rewrite: ⓩ∃ x1 : 𝕌 ⦁ ({p.x, x1, p.y} ⊆ X ∧ f p.x x1 p.y) ∧
	{x1, p.y, p.z} ⊆ X ∧ g x1 p.y p.z⌝
    z_library_ext rewrite: ⓩ∃ x1 : 𝕌 ⦁ ((p.x ∈ X ∧ x1 ∈ X ∧ p.y ∈ X) ∧ f p.x x1 p.y) ∧
	 (x1 ∈ X ∧ p.y ∈ X ∧ p.z ∈ X) ∧ g x1 p.y p.z⌝
    z_library strip: ⓩp ∈ [x : 𝕌; y : 𝕌; z : 𝕌 | ∃ x1 : 𝕌 ⦁ (x ≜ x, x' ≜ x1, y ≜ y)
	∈ [x, x', y : X | f x x' y] ∧ (x ≜ x1, y ≜ y, z ≜ z) ∈ [x, y, z : X | g x y z]]⌝
    z_library_ext strip: ⓩp ∈ [x : 𝕌; y : 𝕌; z : 𝕌 | ∃ x1 : 𝕌 ⦁
	(x ≜ x, x' ≜ x1, y ≜ y) ∈ [x, x', y : X | f x x' y]
	∧ (x ≜ x1, y ≜ y, z ≜ z) ∈ [x, y, z : X | g x y z]]⌝
⨾⋎s as predicate: ⓩ([x, x', y : X | f x x' y] ⨾⋎s [x, y, z : X | g x y z])⌝
    z_library rewrite: ⓩ∃ x1 : 𝕌 ⦁ ({x, x1, y} ⊆ X ∧ f x x1 y) ∧ {x1, y, z} ⊆ X ∧ g x1 y z⌝
    z_library_ext rewrite: ⓩ∃ x1 : 𝕌 ⦁ ((x ∈ X ∧ x1 ∈ X ∧ y ∈ X) ∧
	f x x1 y) ∧ (x1 ∈ X ∧ y ∈ X ∧ z ∈ X) ∧ g x1 y z⌝
    z_library strip: ⓩ(x ≜ x, y ≜ y, z ≜ z) ∈ [x : 𝕌; y : 𝕌; z : 𝕌 |
	 ∃ x1 : 𝕌 ⦁ (x ≜ x, x' ≜ x1, y ≜ y) ∈ [x, x', y : X | f x x' y] ∧
	(x ≜ x1, y ≜ y, z ≜ z) ∈ [x, y, z : X | g x y z]]⌝
    z_library_ext strip: ⓩ(x ≜ x, y ≜ y, z ≜ z) ∈ [x : 𝕌; y : 𝕌; z : 𝕌 | ∃ x1 : 𝕌 ⦁
	(x ≜ x, x' ≜ x1, y ≜ y) ∈ [x, x', y : X | f x x' y] ∧
	(x ≜ x1, y ≜ y, z ≜ z) ∈ [x, y, z : X | g x y z]]⌝
≠: ⓩs ≠ t⌝
    z_library rewrite: ⓩ¬ s = t⌝
    z_library_ext rewrite: ⓩ¬ s = t⌝
    z_library strip: ⓩ¬ s = t⌝
    z_library_ext strip: ⓩ¬ s = t⌝
∉: ⓩx ∉ y⌝
    z_library rewrite: ⓩ¬ x ∈ y⌝
    z_library_ext rewrite: ⓩ¬ x ∈ y⌝
    z_library strip: ⓩ¬ x ∈ y⌝
    z_library_ext strip: ⓩ¬ x ∈ y⌝
∅: ⓩ∅⌝
    z_library rewrite: ⓩ{}⌝
    z_library_ext rewrite: ⓩ{}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ∅: ⓩp ∈ ∅⌝
    z_library rewrite: ⓩfalse⌝
    z_library_ext rewrite: ⓩfalse⌝
    z_library strip: ⓩfalse⌝
    z_library_ext strip: ⓩfalse⌝
⊆: ⓩs ⊆ t⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ∀ x1 : 𝕌 ⦁ x1 ∈ s ⇒ x1 ∈ t⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩ∀ x1 : 𝕌 ⦁ x1 ∈ s ⇒ x1 ∈ t⌝
Simp ⊆: ⓩ{} ⊆ t⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩtrue⌝
    z_library_ext strip: ⓩtrue⌝
Set Display ⊆: ⓩ{1, 2} ⊆ t⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ1 ∈ t ∧ 2 ∈ t⌝
    z_library strip: ⓩ1 ∈ t ∧ 2 ∈ t⌝
    z_library_ext strip: ⓩ1 ∈ t ∧ 2 ∈ t⌝
⊂: ⓩs ⊂ t⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ(∀ x1 : 𝕌 ⦁ x1 ∈ s ⇒ x1 ∈ t) ∧
	¬ (∀ x1 : 𝕌 ⦁ x1 ∈ s ⇔ x1 ∈ t)⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩs ⊆ t ∧ s ≠ t⌝
Simp ⊂: ⓩt ⊂ {}⌝
    z_library rewrite: ⓩfalse⌝
    z_library_ext rewrite: ⓩ(∀ x1 : 𝕌 ⦁ ¬ x1 ∈ t) ∧ ¬ (∀ x1 : 𝕌 ⦁ ¬ x1 ∈ t)⌝
    z_library strip: ⓩfalse⌝
    z_library_ext strip: ⓩt ⊆ {} ∧ t ≠ {}⌝
Set Display ⊂: ⓩ{1, 2} ⊂ t⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ(1 ∈ t ∧ 2 ∈ t) ∧ ¬ (∀ x1 : 𝕌 ⦁ x1 = 1 ∨ x1 = 2 ⇔ x1 ∈ t)⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩ{1, 2} ⊆ t ∧ {1, 2} ≠ t⌝
ℙ⋎1: ⓩℙ⋎1 s⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp ℙ⋎1: ⓩℙ⋎1 {}⌝
    z_library rewrite: ⓩ{}⌝
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ℙ⋎1: ⓩt ∈ ℙ⋎1 s⌝
    z_library rewrite: ⓩt ⊆ s ∧ ¬ t = {}⌝
    z_library_ext rewrite: ⓩ(∀ x1 : 𝕌 ⦁ x1 ∈ t ⇒ x1 ∈ s) ∧ ¬
	(∀ x1 : 𝕌 ⦁ ¬ x1 ∈ t)⌝
    z_library strip: ⓩt ⊆ s ∧ t ≠ ∅⌝
    z_library_ext strip: ⓩt ⊆ s ∧ t ≠ ∅⌝
∩: ⓩs ∩ t⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp ∩: ⓩ{} ∩ t⌝
    z_library rewrite: ⓩ{}⌝
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ∩: ⓩx ∈ s ∩ t⌝
    z_library rewrite: ⓩx ∈ s ∧ x ∈ t⌝
    z_library_ext rewrite: ⓩx ∈ s ∧ x ∈ t⌝
    z_library strip: ⓩx ∈ s ∧ x ∈ t⌝
    z_library_ext strip: ⓩx ∈ s ∧ x ∈ t⌝
∪: ⓩs ∪ t⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp ∪: ⓩ{} ∪ t⌝
    z_library rewrite: ⓩt⌝
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ∪: ⓩx ∈ s ∪ t⌝
    z_library rewrite: ⓩx ∈ s ∨ x ∈ t⌝
    z_library_ext rewrite: ⓩx ∈ s ∨ x ∈ t⌝
    z_library strip: ⓩx ∈ s ∨ x ∈ t⌝
    z_library_ext strip: ⓩx ∈ s ∨ x ∈ t⌝
\: ⓩs \ t⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp \: ⓩ{} \ t⌝
    z_library rewrite: ⓩ{}⌝
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ \: ⓩx ∈ s \ t⌝
    z_library rewrite: ⓩx ∈ s ∧ ¬ x ∈ t⌝
    z_library_ext rewrite: ⓩx ∈ s ∧ ¬ x ∈ t⌝
    z_library strip: ⓩx ∈ s ∧ x ∉ t⌝
    z_library_ext strip: ⓩx ∈ s ∧ x ∉ t⌝
⋂: ⓩ⋂ s⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp ⋂: ⓩ⋂ {}⌝
    z_library rewrite: ⓩ𝕌⌝
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ⋂: ⓩx ∈ ⋂ s⌝
    z_library rewrite: ⓩ∀ S : 𝕌 ⦁ S ∈ s ⇒ x ∈ S⌝
    z_library_ext rewrite: ⓩ∀ S : 𝕌 ⦁ S ∈ s ⇒ x ∈ S⌝
    z_library strip: ⓩ∀ S : 𝕌 ⦁ S ∈ s ⇒ x ∈ S⌝
    z_library_ext strip: ⓩ∀ S : 𝕌 ⦁ S ∈ s ⇒ x ∈ S⌝
⋃: ⓩ⋃ s⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp ⋃: ⓩ⋃ {}⌝
    z_library rewrite: ⓩ{}⌝
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ⋃: ⓩx ∈ ⋃ s⌝
    z_library rewrite: ⓩ∃ S : 𝕌 ⦁ S ∈ s ∧ x ∈ S⌝
    z_library_ext rewrite: ⓩ∃ S : 𝕌 ⦁ S ∈ s ∧ x ∈ S⌝
    z_library strip: ⓩ∃ S : 𝕌 ⦁ S ∈ s ∧ x ∈ S⌝
    z_library_ext strip: ⓩ∃ S : 𝕌 ⦁ S ∈ s ∧ x ∈ S⌝
first: ⓩfirst x⌝
    z_library rewrite: ⓩx.1⌝
    z_library_ext rewrite: ⓩx.1⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ first: ⓩp ∈ first x⌝
    z_library rewrite: ⓩp ∈ x.1⌝
    z_library_ext rewrite: ⓩp ∈ x.1⌝
   z_library strip:   N/C
   z_library_ext strip:   N/C
second: ⓩsecond x⌝
    z_library rewrite: ⓩx.2⌝
    z_library_ext rewrite: ⓩx.2⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ second: ⓩp ∈ second x⌝
    z_library rewrite: ⓩp ∈ x.2⌝
    z_library_ext rewrite: ⓩp ∈ x.2⌝
   z_library strip:   N/C
   z_library_ext strip:   N/C
↦: ⓩ(a ↦ b).1⌝
    z_library rewrite: ⓩa⌝
    z_library_ext rewrite: ⓩa⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
↔: ⓩX ↔ Y⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp ↔: ⓩ{} ↔ Y⌝
    z_library rewrite: ⓩ{{}}⌝
    z_library_ext rewrite: ⓩ{{}}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ↔: ⓩx ∈ X ↔ Y⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ∀ x1 : 𝕌; x2 : 𝕌 ⦁ (x1, x2) ∈ x ⇒ x1 ∈ X ∧ x2 ∈ Y⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩx ∈ ℙ (X × Y)⌝
Simp ∈ ↔: ⓩx ∈ {} ↔ Y⌝
    z_library rewrite: ⓩx = {}⌝
    z_library_ext rewrite: ⓩ∀ x1 : 𝕌; x2 : 𝕌 ⦁ ¬ (x1, x2) ∈ x⌝
    z_library strip: ⓩx ∈ {{}}⌝
    z_library_ext strip: ⓩx ∈ {{}}⌝
Domain: ⓩdom x⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Domain: ⓩdom {}⌝
    z_library rewrite: ⓩ{}⌝
    z_library_ext rewrite: ⓩ{}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Domain: ⓩp ∈ dom x⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ∃ y : 𝕌 ⦁ (p, y) ∈ x⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩ∃ y : 𝕌 ⦁ (p, y) ∈ x⌝
Simp ∈ Domain: ⓩp ∈ dom {}⌝
    z_library rewrite: ⓩfalse⌝
    z_library_ext rewrite: ⓩfalse⌝
    z_library strip: ⓩp ∈ {}⌝
    z_library_ext strip: ⓩp ∈ {}⌝
Range: ⓩran x⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Range: ⓩran {}⌝
    z_library rewrite: ⓩ{}⌝
    z_library_ext rewrite: ⓩ{}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Range: ⓩp ∈ ran x⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ∃ x' : 𝕌 ⦁ (x', p) ∈ x⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩ∃ x' : 𝕌 ⦁ (x', p) ∈ x⌝
Simp ∈ Range: ⓩp ∈ ran {}⌝
    z_library rewrite: ⓩfalse⌝
    z_library_ext rewrite: ⓩfalse⌝
    z_library strip: ⓩp ∈ {}⌝
    z_library_ext strip: ⓩp ∈ {}⌝
Identity: ⓩid x⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Identity: ⓩid {}⌝
    z_library rewrite: ⓩ{}⌝
    z_library_ext rewrite: ⓩ{}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Identity: ⓩp ∈ id x⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩp.1 ∈ x ∧ p.1 = p.2⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩp ∈ {x' : 𝕌 | x' ∈ x ⦁ (x', x')}⌝
Simp ∈ Identity: ⓩp ∈ id {}⌝
    z_library rewrite: ⓩfalse⌝
    z_library_ext rewrite: ⓩfalse⌝
    z_library strip: ⓩp ∈ {}⌝
    z_library_ext strip: ⓩp ∈ {}⌝
Sequential Composition: ⓩf ⨾ g⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Sequential Composition: ⓩx ∈ f ⨾ g⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ∃ y : 𝕌 ⦁ (x.1, y) ∈ f ∧ (y, x.2) ∈ g⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩx ∈ g o f⌝
Sequential Composition 1: ⓩf o g⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Sequential Composition 1 : ⓩx ∈ f o g⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ∃ y : 𝕌 ⦁ (x.1, y) ∈ g ∧ (y, x.2) ∈ f⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩ∃ y : 𝕌 ⦁ (x.1, y) ∈ g ∧ (y, x.2) ∈ f⌝
Domain restriction: ⓩx ◁ y⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Domain restriction: ⓩ{} ◁ y⌝
    z_library rewrite: ⓩ{}⌝
    z_library_ext rewrite: ⓩ{}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Domain restriction: ⓩp ∈ x ◁ y⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩp.1 ∈ x ∧ p ∈ y⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩp.1 ∈ x ∧ p ∈ y⌝
Simp ∈ Domain restriction: ⓩp ∈ {} ◁ y⌝
    z_library rewrite: ⓩfalse⌝
    z_library_ext rewrite: ⓩfalse⌝
    z_library strip: ⓩp ∈ {}⌝
    z_library_ext strip: ⓩp ∈ {}⌝
Range restriction: ⓩx ▷ y⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Range restriction: ⓩ{} ▷ y⌝
    z_library rewrite: ⓩ{}⌝
    z_library_ext rewrite: ⓩ{}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Range restriction: ⓩp ∈ x ▷ y⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩp ∈ x ∧ p.2 ∈ y⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩp ∈ x ∧ p.2 ∈ y⌝
Simp ∈ Range restriction: ⓩp ∈ {} ▷ y⌝
    z_library rewrite: ⓩfalse⌝
    z_library_ext rewrite: ⓩfalse⌝
    z_library strip: ⓩp ∈ {}⌝
    z_library_ext strip: ⓩp ∈ {}⌝
Domain antirestriction: ⓩx ⩤ y⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Domain antirestriction: ⓩ{} ⩤ y⌝
    z_library rewrite: ⓩy⌝
    z_library_ext rewrite: ⓩy⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Domain antirestriction: ⓩp ∈ x ⩤ y⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ¬ p.1 ∈ x ∧ p ∈ y⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩ¬ p.1 ∈ x ∧ p ∈ y⌝
Simp ∈ Domain antirestriction: ⓩp ∈ {} ⩤ y⌝
    z_library rewrite: ⓩp ∈ y⌝
    z_library_ext rewrite: ⓩp ∈ y⌝
    z_library strip: ⓩp ∈ y⌝
    z_library_ext strip: ⓩp ∈ y⌝
Range antirestriction: ⓩx ⩥ y⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Range antirestriction: ⓩ{} ⩥ y⌝
    z_library rewrite: ⓩ{}⌝
    z_library_ext rewrite: ⓩ{}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Range antirestriction: ⓩp ∈ x ⩥ y⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩp ∈ x ∧ ¬ p.2 ∈ y⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩp ∈ x ∧ ¬ p.2 ∈ y⌝
Simp ∈ Range antirestriction: ⓩp ∈ {} ⩥ y⌝
    z_library rewrite: ⓩfalse⌝
    z_library_ext rewrite: ⓩfalse⌝
    z_library strip: ⓩp ∈ {}⌝
    z_library_ext strip: ⓩp ∈ {}⌝
Relational Image: ⓩs ⦇ t ⦈⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Relational Image: ⓩ{} ⦇ t ⦈⌝
    z_library rewrite: ⓩ{}⌝
    z_library_ext rewrite: ⓩ{}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Relational Image: ⓩx ∈ s ⦇ t ⦈⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ∃ x' : 𝕌 ⦁ x' ∈ t ∧ (x', x) ∈ s⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩ∃ x' : 𝕌 ⦁ x' ∈ t ∧ (x', x) ∈ s⌝
Simp ∈ Relational Image: ⓩx ∈ {} ⦇ t ⦈⌝
    z_library rewrite: ⓩfalse⌝
    z_library_ext rewrite: ⓩfalse⌝
    z_library strip: ⓩx ∈ {}⌝
    z_library_ext strip: ⓩx ∈ {}⌝
Transitive Closure: ⓩx ↗+↕⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Transitive Closure: ⓩ{} ↗+↕⌝
    z_library rewrite: ⓩ{}⌝
    z_library_ext rewrite: ⓩ{}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Transitive Closure: ⓩp ∈ x ↗+↕⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ∀ S : 𝕌 ⦁ (∀ x1 : 𝕌; x2 : 𝕌 ⦁ (x1, x2) ∈ x ⇒
	(x1, x2) ∈ S) ∧ (∀ x1 : 𝕌; x2 : 𝕌 ⦁ (∃ y : 𝕌 ⦁ (x1, y) ∈ S ∧
	(y, x2) ∈ S) ⇒ (x1, x2) ∈ S) ⇒ p ∈ S⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩp ∈ ⋂ {Q : 𝕌 | x ⊆ Q ∧ Q ⨾ Q ⊆ Q}⌝
Simp ∈ Transitive Closure: ⓩp ∈ {} ↗+↕⌝
    z_library rewrite: ⓩfalse⌝
    z_library_ext rewrite: ⓩfalse⌝
    z_library strip: ⓩp ∈ {}⌝
    z_library_ext strip: ⓩp ∈ {}⌝
Transitive-Reflexive Closure: ⓩx ↗*↕⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Transitive-Reflexive Closure: ⓩ{} ↗*↕⌝
    z_library rewrite: ⓩ(id _)⌝
    z_library_ext rewrite: ⓩ(id _)⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Transitive-Reflexive Closure: ⓩp ∈ x ↗*↕⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ∀ S : 𝕌 ⦁ (∀ x1 : 𝕌; x2 : 𝕌 ⦁ x1 = x2 ⇒
	(x1, x2) ∈ S) ∧ (∀ x1 : 𝕌; x2 : 𝕌 ⦁ (x1, x2) ∈ x ⇒ (x1, x2) ∈ S)
	∧ (∀ x1 : 𝕌; x2 : 𝕌 ⦁ (∃ y : 𝕌 ⦁ (x1, y) ∈ S ∧ (y, x2) ∈ S) ⇒
	(x1, x2) ∈ S) ⇒ p ∈ S⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩp ∈ ⋂ {Q : 𝕌 | (id _) ⊆ Q ∧ x ⊆ Q ∧ Q ⨾ Q ⊆ Q}⌝
Simp ∈ Transitive-Reflexive Closure: ⓩp ∈ {} ↗*↕⌝
    z_library rewrite: ⓩp ∈ (id _)⌝
    z_library_ext rewrite: ⓩp.1 = p.2⌝
    z_library strip: ⓩp ∈ (id _)⌝
    z_library_ext strip: ⓩp ∈ (id _)⌝
Override: ⓩf ⊕ g⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Override: ⓩx ∈ f ⊕ g⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ¬ (∃ y : 𝕌 ⦁ (x.1, y) ∈ g) ∧ x ∈ f ∨ x ∈ g⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩx ∈ dom g ⩤ f ∪ g⌝
Partial Functions: ⓩx ⇸ y⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Partial Functions: ⓩ{} ⇸ y⌝
    z_library rewrite: ⓩ{{}}⌝
    z_library_ext rewrite: ⓩ{{}}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Partial Functions: ⓩp ∈ x ⇸ y⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ(∀ x1 : 𝕌; x2 : 𝕌 ⦁ (x1, x2) ∈ p ⇒ x1 ∈ x ∧
	x2 ∈ y) ∧ (∀ x' : 𝕌; y1, y2 : 𝕌 | x' ∈ x ∧ y1 ∈ y ∧ y2 ∈ y ⦁
	(x', y1) ∈ p ∧ (x', y2) ∈ p ⇒ y1 = y2)⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩp ∈ x ↔ y ∧ (∀ x' : 𝕌; y1, y2 : 𝕌 | x' ∈ x ∧
	y1 ∈ y ∧ y2 ∈ y ⦁ (x', y1) ∈ p ∧ (x', y2) ∈ p ⇒ y1 = y2)⌝
∈ Simp Partial Functions: ⓩp ∈ {} ⇸ y⌝
    z_library rewrite: ⓩp = {}⌝
    z_library_ext rewrite: ⓩ∀ x1 : 𝕌; x2 : 𝕌 ⦁ ¬ (x1, x2) ∈ p⌝
    z_library strip: ⓩp ∈ {{}}⌝
    z_library_ext strip: ⓩp ∈ {{}}⌝
Injections: ⓩx ⤔ y⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Injections: ⓩ{} ⤔ y⌝
    z_library rewrite: ⓩ{{}}⌝
    z_library_ext rewrite: ⓩ{{}}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Injections: ⓩp ∈ x ⤔ y⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ((∀ x1 : 𝕌; x2 : 𝕌 ⦁ (x1, x2) ∈ p ⇒ x1 ∈ x
	∧ x2 ∈ y) ∧ (∀ x' : 𝕌; y1, y2 : 𝕌 | x' ∈ x ∧ y1 ∈ y ∧ y2 ∈ y
	⦁ (x', y1) ∈ p ∧ (x', y2) ∈ p ⇒ y1 = y2)) ∧ (∀ x1, x2 : 𝕌 |
	(∃ y : 𝕌 ⦁ (x1, y) ∈ p) ∧ (∃ y : 𝕌 ⦁ (x2, y) ∈ p) ⦁ p x1 = p x2 ⇒ x1 = x2)⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩp ∈ x ⇸ y ∧ (∀ x1, x2 : 𝕌 | x1 ∈ dom p ∧
	x2 ∈ dom p ⦁ p x1 = p x2 ⇒ x1 = x2)⌝
∈ Simp Injections: ⓩp ∈ {} ⤔ y⌝
    z_library rewrite: ⓩp = {}⌝
    z_library_ext rewrite: ⓩ∀ x1 : 𝕌; x2 : 𝕌 ⦁ ¬ (x1, x2) ∈ p⌝
    z_library strip: ⓩp ∈ {{}}⌝
    z_library_ext strip: ⓩp ∈ {{}}⌝
Surjections: ⓩx ⤀ y⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Surjections: ⓩ{} ⤀ y⌝
    z_library rewrite: ⓩ{x : 𝕌 | x = {} ∧ y = {}}⌝
    z_library_ext rewrite: ⓩ{x : 𝕌 | (∀ x1 : 𝕌; x2 : 𝕌 ⦁ ¬ (x1, x2) ∈ x) ∧
	(∀ x1 : 𝕌 ⦁ ¬ x1 ∈ y)}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Surjections: ⓩp ∈ x ⤀ y⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ((∀ x1 : 𝕌; x2 : 𝕌 ⦁ (x1, x2) ∈ p ⇒ x1 ∈ x
	∧ x2 ∈ y) ∧ (∀ x' : 𝕌; y1, y2 : 𝕌 | x' ∈ x ∧ y1 ∈ y ∧ y2 ∈ y
	⦁ (x', y1) ∈ p ∧ (x', y2) ∈ p ⇒ y1 = y2)) ∧ (∀ x1 : 𝕌 ⦁ (∃ x : 𝕌 ⦁
	(x, x1) ∈ p) ⇔ x1 ∈ y)⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩp ∈ x ⇸ y ∧ ran p = y⌝
∈ Simp Surjections: ⓩp ∈ {} ⤀ y⌝
    z_library rewrite: ⓩy = {} ∧ {} = p⌝
    z_library_ext rewrite: ⓩ(∀ x1 : 𝕌 ⦁ ¬ x1 ∈ y) ∧ (∀ x1 : 𝕌; x2 : 𝕌 ⦁ ¬ (x1, x2) ∈ p)⌝
    z_library strip: ⓩp ∈ {x : 𝕌 | x = {} ∧ y = {}}⌝
    z_library_ext strip: ⓩp ∈ {x : 𝕌 | x = {} ∧ y = {}}⌝
Total Injections: ⓩx ↣ y⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Total Injections: ⓩ{} ↣ y⌝
    z_library rewrite: ⓩ{{}}⌝
    z_library_ext rewrite: ⓩ{{}}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Total Injections: ⓩp ∈ x ↣ y⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ(((∀ x1 : 𝕌; x2 : 𝕌 ⦁ (x1, x2) ∈ p ⇒ x1 ∈ x
	∧ x2 ∈ y) ∧ (∀ x' : 𝕌; y1, y2 : 𝕌 | x' ∈ x ∧ y1 ∈ y ∧ y2 ∈ y ⦁
	(x', y1) ∈ p ∧ (x', y2) ∈ p ⇒ y1 = y2)) ∧ (∀ x1 : 𝕌 ⦁ (∃ y : 𝕌 ⦁
	(x1, y) ∈ p) ⇔ x1 ∈ x)) ∧ (∀ x1, x2 : 𝕌 | (∃ y : 𝕌 ⦁ (x1, y) ∈ p) ∧
	(∃ y : 𝕌 ⦁ (x2, y) ∈ p) ⦁ p x1 = p x2 ⇒ x1 = x2)⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩp ∈ x → y ∧ (∀ x1, x2 : 𝕌 | x1 ∈ dom p ∧
	x2 ∈ dom p ⦁ p x1 = p x2 ⇒ x1 = x2)⌝
∈ Simp Total Injections: ⓩp ∈ {} ↣ y⌝
    z_library rewrite: ⓩp = {}⌝
    z_library_ext rewrite: ⓩ∀ x1 : 𝕌; x2 : 𝕌 ⦁ ¬ (x1, x2) ∈ p⌝
    z_library strip: ⓩp ∈ {{}}⌝
    z_library_ext strip: ⓩp ∈ {{}}⌝
Total Surjections: ⓩx ↠ y⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Total Surjections: ⓩ{} ↠ y⌝
    z_library rewrite: ⓩ{x : 𝕌 | x = {} ∧ y = {}}⌝
    z_library_ext rewrite: ⓩ{x : 𝕌 | (∀ x1 : 𝕌; x2 : 𝕌 ⦁ ¬ (x1, x2) ∈ x) ∧
	(∀ x1 : 𝕌 ⦁ ¬ x1 ∈ y)}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Total Surjections: ⓩp ∈ x ↠ y⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ(((∀ x1 : 𝕌; x2 : 𝕌 ⦁ (x1, x2) ∈ p ⇒
	x1 ∈ x ∧ x2 ∈ y) ∧ (∀ x' : 𝕌; y1, y2 : 𝕌 | x' ∈ x ∧ y1 ∈ y ∧
	y2 ∈ y ⦁ (x', y1) ∈ p ∧ (x', y2) ∈ p ⇒ y1 = y2)) ∧ (∀ x1 : 𝕌 ⦁
	(∃ y : 𝕌 ⦁ (x1, y) ∈ p) ⇔ x1 ∈ x)) ∧ (∀ x1 : 𝕌 ⦁ (∃ x : 𝕌 ⦁ (x, x1) ∈ p)
	⇔ x1 ∈ y)⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩp ∈ x → y ∧ ran p = y⌝
∈ Total Simp Surjections: ⓩp ∈ {} ↠ y⌝
    z_library rewrite: ⓩy = {} ∧ {} = p⌝
    z_library_ext rewrite: ⓩ(∀ x1 : 𝕌 ⦁ ¬ x1 ∈ y) ∧ (∀ x1 : 𝕌; x2 : 𝕌 ⦁ ¬ (x1, x2) ∈ p)⌝
    z_library strip: ⓩp ∈ {x : 𝕌 | x = {} ∧ y = {}}⌝
    z_library_ext strip: ⓩp ∈ {x : 𝕌 | x = {} ∧ y = {}}⌝
Bijections: ⓩx ⤖ y⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Bijections: ⓩ{} ⤖ y⌝
    z_library rewrite: ⓩ{x : 𝕌 | x = {} ∧ y = {}}⌝
    z_library_ext rewrite: ⓩ{x : 𝕌 | (∀ x1 : 𝕌; x2 : 𝕌 ⦁ ¬ (x1, x2) ∈ x) ∧
	(∀ x1 : 𝕌 ⦁ ¬ x1 ∈ y)}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Bijections: ⓩp ∈ x ⤖ y⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ(((∀ x1 : 𝕌; x2 : 𝕌 ⦁ (x1, x2) ∈ p ⇒
	x1 ∈ x ∧ x2 ∈ y) ∧ (∀ x' : 𝕌; y1, y2 : 𝕌 | x' ∈ x ∧ y1 ∈ y ∧
	y2 ∈ y ⦁ (x', y1) ∈ p ∧ (x', y2) ∈ p ⇒ y1 = y2)) ∧ (∀ x1 : 𝕌 ⦁
	(∃ y : 𝕌 ⦁ (x1, y) ∈ p) ⇔ x1 ∈ x)) ∧ (∀ x1 : 𝕌 ⦁ (∃ x : 𝕌 ⦁
	(x, x1) ∈ p) ⇔ x1 ∈ y) ∧ (∀ x1, x2 : 𝕌 | (∃ y : 𝕌 ⦁ (x1, y) ∈ p) ∧
	(∃ y : 𝕌 ⦁ (x2, y) ∈ p) ⦁ p x1 = p x2 ⇒ x1 = x2)⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩp ∈ x → y ∧ ran p = y ∧ (∀ x1, x2 : 𝕌 | x1 ∈ dom p
	∧ x2 ∈ dom p ⦁ p x1 = p x2 ⇒ x1 = x2)⌝
∈ Simp Bijections: ⓩp ∈ {} ⤖ y⌝
    z_library rewrite: ⓩy = {} ∧ {} = p⌝
    z_library_ext rewrite: ⓩ(∀ x1 : 𝕌 ⦁ ¬ x1 ∈ y) ∧ (∀ x1 : 𝕌; x2 : 𝕌 ⦁ ¬ (x1, x2) ∈ p)⌝
    z_library strip: ⓩp ∈ {x : 𝕌 | x = {} ∧ y = {}}⌝
    z_library_ext strip: ⓩp ∈ {x : 𝕌 | x = {} ∧ y = {}}⌝
Total Functions: ⓩx → y⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Total Functions: ⓩ{} → y⌝
    z_library rewrite: ⓩ{{}}⌝
    z_library_ext rewrite: ⓩ{{}}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Total Functions: ⓩp ∈ x → y⌝
   z_library rewrite:   N/C
    z_library_ext rewrite: ⓩ((∀ x1 : 𝕌; x2 : 𝕌 ⦁ (x1, x2) ∈ p ⇒
	x1 ∈ x ∧ x2 ∈ y) ∧ (∀ x' : 𝕌; y1, y2 : 𝕌 | x' ∈ x ∧ y1 ∈ y ∧
	y2 ∈ y ⦁ (x', y1) ∈ p ∧ (x', y2) ∈ p ⇒ y1 = y2)) ∧ (∀ x1 : 𝕌 ⦁
	(∃ y : 𝕌 ⦁ (x1, y) ∈ p) ⇔ x1 ∈ x)⌝
   z_library strip:   N/C
    z_library_ext strip: ⓩp ∈ x ⇸ y ∧ dom p = x⌝
∈ Simp Total Functions: ⓩp ∈ {} → y⌝
    z_library rewrite: ⓩp = {}⌝
    z_library_ext rewrite: ⓩ∀ x1 : 𝕌; x2 : 𝕌 ⦁ ¬ (x1, x2) ∈ p⌝
    z_library strip: ⓩp ∈ {{}}⌝
    z_library_ext strip: ⓩp ∈ {{}}⌝
ℕ: ⓩℕ⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ℕ: ⓩp ∈ ℕ⌝
    z_library rewrite: ⓩ0 ≤ p⌝
    z_library_ext rewrite: ⓩ0 ≤ p⌝
    z_library strip: ⓩ0 ≤ p⌝
    z_library_ext strip: ⓩ0 ≤ p⌝
∈ ℕ 1: ⓩ1 ∈ ℕ⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩ0 ≤ 1⌝
    z_library_ext strip: ⓩ0 ≤ 1⌝
ℤ: ⓩℤ⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
ℤ struct: ⓩℤ × ℤ⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ ℤ: ⓩp ∈ ℤ⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩtrue⌝
    z_library_ext strip: ⓩtrue⌝
∈ ℤ 1: ⓩ1 ∈ ℤ⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩtrue⌝
    z_library_ext strip: ⓩtrue⌝
Addition: ⓩa + b⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Addition: ⓩa + 0⌝
    z_library rewrite: ⓩa⌝
    z_library_ext rewrite: ⓩa⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
Literal Addition: ⓩ2 + 3⌝
    z_library rewrite: ⓩ5⌝
    z_library_ext rewrite: ⓩ5⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
Negation: ⓩa - b⌝
    z_library rewrite: ⓩa + ~ b⌝
    z_library_ext rewrite: ⓩa + ~ b⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Negation: ⓩa - 0⌝
    z_library rewrite: ⓩa⌝
    z_library_ext rewrite: ⓩa⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
Literal Negation: ⓩ2 - 3⌝
    z_library rewrite: ⓩ~ 1⌝
    z_library_ext rewrite: ⓩ~ 1⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
Multiplication: ⓩa * b⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Multiplication: ⓩa * 0⌝
    z_library rewrite: ⓩ0⌝
    z_library_ext rewrite: ⓩ0⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
Literal Multiplication: ⓩ2 * 3⌝
    z_library rewrite: ⓩ6⌝
    z_library_ext rewrite: ⓩ6⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
Integer divide: ⓩa div b⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Integer divide: ⓩa div 1⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Literal Integer divide: ⓩ5 div 3⌝
    z_library rewrite: ⓩ1⌝
    z_library_ext rewrite: ⓩ1⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
Modulus: ⓩa mod b⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Modulus: ⓩa mod 1⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Literal Modulus: ⓩ2 mod 3⌝
    z_library rewrite: ⓩ2⌝
    z_library_ext rewrite: ⓩ2⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
Unit negation: ⓩ~ a⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Unit negation: ⓩ~ 0⌝
    z_library rewrite: ⓩ0⌝
    z_library_ext rewrite: ⓩ0⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
Literal Unit negation: ⓩ~ 3⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Less: ⓩa < b⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
   z_library strip:   N/C
   z_library_ext strip:   N/C
Simp Less: ⓩa < a⌝
    z_library rewrite: ⓩfalse⌝
    z_library_ext rewrite: ⓩfalse⌝
    z_library strip: ⓩfalse⌝
    z_library_ext strip: ⓩfalse⌝
Literal Less: ⓩ2 < 3⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩtrue⌝
    z_library_ext strip: ⓩtrue⌝
Less or equal: ⓩa ≤ b⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
   z_library strip:   N/C
   z_library_ext strip:   N/C
Simp Less or equal: ⓩa ≤ a⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩtrue⌝
    z_library_ext strip: ⓩtrue⌝
Literal Less or equal: ⓩ2 ≤ 3⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩtrue⌝
    z_library_ext strip: ⓩtrue⌝
Greater: ⓩa > b⌝
    z_library rewrite: ⓩb < a⌝
    z_library_ext rewrite: ⓩb < a⌝
    z_library strip: ⓩb < a⌝
    z_library_ext strip: ⓩb < a⌝
Simp Greater: ⓩa > a⌝
    z_library rewrite: ⓩfalse⌝
    z_library_ext rewrite: ⓩfalse⌝
    z_library strip: ⓩa < a⌝
    z_library_ext strip: ⓩa < a⌝
Literal Greater: ⓩ2 > 3⌝
    z_library rewrite: ⓩfalse⌝
    z_library_ext rewrite: ⓩfalse⌝
    z_library strip: ⓩ3 < 2⌝
    z_library_ext strip: ⓩ3 < 2⌝
Greater or equal: ⓩa ≥ b⌝
    z_library rewrite: ⓩb ≤ a⌝
    z_library_ext rewrite: ⓩb ≤ a⌝
    z_library strip: ⓩb ≤ a⌝
    z_library_ext strip: ⓩb ≤ a⌝
Simp Greater or equal: ⓩa ≥ a⌝
    z_library rewrite: ⓩtrue⌝
    z_library_ext rewrite: ⓩtrue⌝
    z_library strip: ⓩa ≤ a⌝
    z_library_ext strip: ⓩa ≤ a⌝
Literal Greater or equal: ⓩ2 ≥ 3⌝
    z_library rewrite: ⓩfalse⌝
    z_library_ext rewrite: ⓩfalse⌝
    z_library strip: ⓩ3 ≤ 2⌝
    z_library_ext strip: ⓩ3 ≤ 2⌝
Non-empty ℕ: ⓩℕ⋎1⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Non-empty ℕ: ⓩx ∈ ℕ⋎1⌝
    z_library rewrite: ⓩ0 < x⌝
    z_library_ext rewrite: ⓩ0 < x⌝
    z_library strip: ⓩ0 < x⌝
    z_library_ext strip: ⓩ0 < x⌝
succ: ⓩsucc 3⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Iterate: ⓩx ↗ 2 ↕⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Interval: ⓩa .. b⌝
   z_library rewrite:   N/C
   z_library_ext rewrite:   N/C
    z_library strip:   N/A
    z_library_ext strip:   N/A
Simp Interval: ⓩ1 .. 1⌝
    z_library rewrite: ⓩ{1}⌝
    z_library_ext rewrite: ⓩ{1}⌝
    z_library strip:   N/A
    z_library_ext strip:   N/A
∈ Interval: ⓩx ∈ a .. b⌝
    z_library rewrite: ⓩa ≤ x ∧ x ≤ b⌝
    z_library_ext rewrite: ⓩa ≤ x ∧ x ≤ b⌝
    z_library strip: ⓩa ≤ x ∧ x ≤ b⌝
    z_library_ext strip: ⓩa ≤ x ∧ x ≤ b⌝
∈ Simp Interval: ⓩx ∈ 1 .. 1⌝
    z_library rewrite: ⓩx = 1⌝
    z_library_ext rewrite: ⓩx = 1⌝
    z_library strip: ⓩx = 1⌝
    z_library_ext strip: ⓩx = 1⌝
*** Z System Version 1.61  ***
=TEX
=THSML
summarize_td_results ();
val z_library_success = theory_check_success ();
=TEX
=DOC
(* Proof Context: ⦏z_library1⦎ *)
=DESCRIBE
A mild complete proof context for handling the manipulation of Z language and library expressions and predicates.
Its contents are chosen to be ``uncontroversial''.
That is, any effect is considered to be ``almost always the correct thing''.

It differs from $z\_library$ only in using $z\_numbers1$.

It consists of the merge of the proof contexts:
=GFT
"z_sets_alg", - simplification of set contructs, and Z language
"'z_rel_alg", - simplification of relational contructs
"'z_fun_alg", - simplification of function contructs
"'z_numbers1" - simplification of numeric contructs
=TEX
\paragraph{Usage Notes}
It requires theory $z\-\_bags$.

It is not intended to be mixed with HOL proof contexts
or ``z$\_$library$\_$ext'', which offers an aggressive
approach.
=ENDDOC
=DOC
(* Proof Context: ⦏z_library1_ext⦎ *)
=DESCRIBE
A agressive complete proof context for handling the manipulation of Z language and library expressions and predicates.
Its purpose is to strip or rewrite its input into the
Z predicate calculus.

It differs from $z\_library$ only in using $z\_numbers1$.

It consists of the merge of the proof contexts:
=GFT
"z_fun_ext", - extensional reasoning about functions (and
	realtions and sets)
"'z_numbers1" - simplification of numeric contructs
=TEX
\paragraph{Usage Notes}
It requires theory $z\-\_bags$.

It is not intended to be mixed with HOL proof contexts
or ``z$\_$library$\_$ext'', which offers an aggressive
approach.
=ENDDOC

\subsection{End of Structure}
=SML
end (* end of Signature ZLibrary *);
=TEX

\section{EPILOGUE}
=SML
reset_flag ("z_type_check_only");
reset_flag ("z_use_axioms");
=TEX
\section{TEST POLICY}
The module tests for this module are to follow the guidelines
laid down in the quality plan~\cite{DS/FMU/IED/PLN008}.

\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}


=IGN
delete_const ⌜$"z'_ ∪ _"⌝;

 ╒[X]════════════════
 │ _ ⦏∪⦎ _ : ℙ X × ℙ X → ℙ X
 ├──────────────────
 │∀ x  : ℙ X ⦁ x ∪ x = X
 └────────────────────

dest_Zapp ⓩ x ∪ x ⌝;
dest_app ⓩ x ∪ x ⌝;


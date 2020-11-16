=IGN
********************************************************************************
usr022_slides.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% usr022_slides.doc   ℤ $Date: 2004/08/28 16:35:36 $ $Revision: 1.27 $ $RCSfile: usr022_slides.doc,v $
=TEX
% usr022_slides.doc   ℤ $Date: 2004/08/28 16:35:36 $ $Revision: 1.27 $ $RCSfile: usr022_slides.doc,v $
% COPYRIGHT (c) Lemma 1 Ltd.
\sloppy
\def\SCCSissue{$Revision: 1.27 $
}
\def\ignore#1{}
\ignore{
=SML
set_flag("ignore_warnings", true);
open_theory "hol";
set_pc"hol2";
=TEX
% This is a slitex document and can only be processed for printing
% when invoked from usr022.doc.
}

\newcounter{slidenum}
\setcounter{slidenum}{-1}
\def\Slide{%
\addtocounter{slidenum}{1}
\begin{slide}{\arabic{slidenum}}}

% =====================================================================

\Slide

\vfill

\begin{center}

\vfill
\label{intro}
{\bf An Introduction\\
to\\
{\huge ProofPower}\\}

\vfill

A Specification and Proof Tool\\
for Higher Order Logic

\vfill

{\tiny Copyright \copyright\ : Lemma 1 Ltd. 1992-\number\year}%
\end{center}

\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Course Objectives}

\end{center}
\vfill

\begin{itemize}
\item
to describe the basic principles and concepts underlying ProofPower
\item
to enable the student to write simple specifications and undertake elementary proofs in HOL using ProofPower
\item
to enable the student to make effective use of the reference documentation
\end{itemize}
\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Course Outline}

\end{center}
\vfill

\begin{itemize}
\item
Introduction

{\small
\begin{itemize}
\item
an overview of ProofPower
\item
propositional and predicate calculus proofs
\end{itemize}
}%\small

\item
Specification using ProofPower HOL

{\small
\begin{itemize}
\item
Primitive Syntax for TYPEs and TERMs
\item
Derived Syntax for TYPEs and TERMs
\item
Paragraphs (declarations) and Theories
\end{itemize}
}%\small

\item
Proof in HOL

{\small
\begin{itemize}
\item
Basics of Proof
\item
Rules, Conversions, Tactics...
\item
Stripping, Rewriting
\item
Induction
\end{itemize}
}%\small

\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Course Prerequisites}

\end{center}
\vfill

Some familiarity with:
\begin{itemize}
\item
first order predicate calculus
=GFT
⌜(∀x⦁ P x ⇒ R x) ⇒ ((∀ x⦁ P x) ⇒ (∀x⦁ R x))⌝;
=TEX
\item
elementary set theory
=GFT
⌜∀a b c⦁ a ∩ (b ∩ c) = (a ∩ b) ∩ c⌝;
=TEX
\item
functional programming
=SML
fun	fact 0 = 1
|	fact n = n * (fact (n - 1));
=TEX
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Using Motif Window Manager}
\end{center}
\vfill
{\small
\begin{itemize}
\item
After logging in type ``openwin''.
\item
Use right mouse button away from windows or icons to get the {\bf Root Menu}.
\item
Operate {\bf menus} other than the Root Menu using the left mouse button.
\item
To {\bf open} icon: single-click with left mouse button and use
``Restore'' menu item.
\item
To {\bf close} window: single-click on menu button in top left corner and
use ``Minimize'' menu item.
\item
To {\bf move} window: single-click on menu button in top left corner and
use ``Move'' menu item.
\item
To {\bf resize} window: single-click on menu button in top left corner and
use ``Size'' menu item.
\item
To {\bf select} text: press left button at left of selection, drag pointer to right  of selection and release button.
\item
To select {\bf single line}: triple click with left button.
\item
To select {\bf all text}: type Control-`/'.
\item
To {\bf copy and paste}: {\bf select} source, press {\bf copy} and, with pointer at destination, {\bf paste}.
\end{itemize}
\vfill
}%\small
\end{slide}

% =====================================================================
\Slide
\begin{center}

{\bf Using ProofPower}

\end{center}
{\small
\vfill
\begin{itemize}
\item
Select {\bf ``HOL Course''} from the Root Menu to start up ProofPower for the course work.
\item
To {\bf execute a command} enter it into the Script Window (upper text area),
select it, and then use the Command Menu to ``Execute Selection'' (or type
Control-X).
\item
Meta-language {\bf prompt} is: ``$:>$'' in the Journal Window (lower text area).
\item
ML commands (or top level expressions) are {\bf terminated by ``;''} (use
Control-; to add this if you forget).
\item
For  short commands that you don't want to save in the script, use the
{\bf Command Line Tool}.
\item
Select Command Line Tool etc. from the {\bf Tools Menu}
\item
In case of mismatching brackets or quotes you may get stuck with the {\bf continuation prompt}: ``$:\#$'.
In this case, use Command Menu to ``Abandon'' (or type Control-A).
\item
To enter {\bf mathematical symbols}, use the {\bf Palette Tool}.
Get characters either by pressing the buttons (characters
go in script window), or by drag-and-drop (character go to any text area).
\item
{\bf Drag-and-drop}  character by holding middle button over the character and
dragging the pointer to target position; release button to drop character.
\end{itemize}
\vfill
}%\small
\end{slide}
% =====================================================================

\Slide
\begin{center}

{\bf Exercises 0: Getting Started}

\end{center}
\begin{enumerate}
\item
Implement an ML function, $fact$, to compute factorials.
\item
Test your solution; e.g. execute:
=GFT
	fact 0;	
	fact 1;
	fact 6;
=TEX
\end{enumerate}

{\vfill
{\bf Hints:}

\small
\begin{itemize}
\item
Iconified tools on right of the screen include a previewer for you to browse
these slides and an xpp editor containing the source of the slides.
\item
Develop your solutions to the exercises in the xpp command session (tool on
the left).
\item
Copy-and-paste material from the xpp editor where helpful.
\end{itemize}
\vfill
}%\small
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Exercises 0: Solutions}

\end{center}
{\small
The solution on slide 5 is fine, although it loops on negative numbers.

A more robust solution is:

=SML
fun fact n = if n <= 0 then 1 else n * fact (n - 1);
=TEX
}%\small
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Features of ProofPower}

\end{center}
\vfill

\begin{itemize}
\item
Pedigree
\item
Power
\item
Assurance
\item
Openness
\item
Extensibility
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Pedigree}
\end{center}
\vfill

\begin{itemize}
\item
In tradition of Principia Mathematica.
\item
Based on Church's Simple Theory of Types.
\item
Milner style polymorphism
\item
Implementation builds on research at Universities of Edinburgh, Cambridge and Oxford.
\item
Follows ``LCF paradigm''.
\item
Metalanguage is Standard ML.
\end{itemize}
\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Power}

\end{center}
\vfill

ProofPower HOL is:

\begin{itemize}
\item
Logically as expressive as Z.
\item
Notationally almost as concise as Z.
\item
Much less complex than Z.
\end{itemize}
ProofPower HOL has:
\begin{itemize}
\item
\begin{tabular}{lc}
\hbox to 1in {\hfill}&80\% of the power of Z\\
\hbox to 1in {\hfill}&for\\
\hbox to 1in {\hfill}&20\% of the complexity.
\end{tabular}
\item
Modern functional language, Standard ML, as ``metalanguage'', for carrying out proofs and programming extensions to the system.
\end{itemize}
\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Assurance}

\end{center}
\vfill

\begin{itemize}
\item
Simple uncontroversial classical logical system.
\item
Mathematical and formal specifications of syntax and semantics of formal system.
\item
Good support for specification by conservative extension.
\item
Small ($<$10\% system code) logical kernel, implemented as abstract datatype, enforces logical soundness of proofs.
\item
Formal specifications of logical kernel.
\end{itemize}
\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Openness}

\end{center}
\vfill

\begin{itemize}
\item
support for standard well documented languages targetted:

Standard ML, HOL, Z, SPARK
\item
most of the functions used to build system are available for re-use by the user
\item
comprehensive reference manual documenting all the functions supplied:

$>$ 600 pages; $>$1000 ML names
\item
libraries of theories and ``proof contexts'' provided for re-use
\end{itemize}
\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Extensibility}

\end{center}
\vfill

\begin{itemize}
\item
User has access to metalanguage (Standard ML) for:
\begin{itemize}
\item
developing proofs
\item
extending system
\item
domain specific proof automation
\end{itemize}
\item
extendible definitional forms
\item
customisable ``proof contexts''
\item
designed to support multiple object languages
\item
parser generator available
\end{itemize}
\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Languages Supported}

\end{center}
\vfill

\begin{itemize}
\item
NOW:
\begin{itemize}
\item
Standard ML (as metalanguage)
\item
Higher Order Logic
\item
Z
\end{itemize}

\item
SOON:
\begin{itemize}
\item
SPARK Annotation Language, via DRA's Compliance Notation
\end{itemize}

\item
EVENTUALLY (we hope):
\begin{itemize}
\item
ISO Standard Z
\item
others
\end{itemize}
\end{itemize}
\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Functionality}

\end{center}

\begin{itemize}
\vfill

{\small
\item
document preparation/printing:

\begin{itemize}
\item
using {\LaTeX} ``literate scripts'' with extended fonts for document sources
\item
indexes, cross reference and theory listings
\end{itemize}

\item
syntax check/type check (interactive or batch)

\item
formal reasoning (interactive or batch)

\item
theory management:

\begin{itemize}
\item
specifications and theorems held in theory hierarchy
\item
programmable access to theory hierarchy
\end{itemize}
}

\end{itemize}
\vfill

\end{slide}

% =====================================================================
\Slide
\begin{center}

{\bf Levels of Use of ProofPower}

\end{center}
\vfill

\begin{itemize}
\item
Education

{\tiny ProofPower is suitable for hands on interactive courses in mathematical logic, discrete mathematics and formal methods including Z.
(however, course material needs to be developed)}

\item
Specification

{\tiny ProofPower HOL can be used as a specification language without the need to understand the proof development facilities.}

\item
Proof Development

{\tiny Most application proofs require knowledge of a modest subset of the proof facilities.}

\item
Research/ Proof tool development

{\tiny ProofPower, like Cambridge HOL, is a good vehicle for research in a number of areas.
Research, or other developments to the capabilities of the tool, can be undertaken by users, but requires deeper knowledge and understanding of the system.}
\end{itemize}
\vfill
\end{slide}
% =====================================================================

\Slide
\begin{center}
\vfill

{\bf Some Proofs are Easy with ProofPower}
\end{center}

\begin{itemize}
\item
propositional tautologies

{\tiny ProofPower proves these automatically, and uses propositional reasoning to simplify non-propositional goals automatically.}

\item
first order predicate calculus

{\tiny Often these will also be automatically provable using resolution.
Where resolution fails, there is a simple systematic approach to proving these results using ProofPower.}

\item
elementary set theory

{\tiny A useful class of results from elementary set theory are automatically provable.}

\item
other classes of results

{\tiny Whenever a new theory is introduced one or more proof contexts may be developed to solve automatically a range of results in that theory.
``Decision procedures'' for such classes of results can be made available via ``prove\_tac''.}
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Simple Predicate Calculus Proofs}
\end{center}
\vfill
{\small

\begin{itemize}
\item
use the subgoaling package

\item
set the goal

=SML
set_goal([],⌜(∀x y⦁ P x ⇒ R y)
	⇔ (∀v w⦁ ¬ P w ∨ R v)⌝);
=IGN
set_goal([],⌜(∀x y⦁ P x ⇒ R y) ⇔ (∀v w⦁ P w ∨ R v)⌝);
=TEX
\item
initiate proof by contradiction
=SML
a contr_tac;
=TEX
=GFT ProofPower output
Tactic produced 2 subgoals:
...
(* *** Goal "1" *** *)

(*  3 *)  ⌜∀ x y⦁ P x ⇒ R y⌝
(*  2 *)  ⌜P w⌝
(*  1 *)  ⌜¬ R v⌝

(* ?⊢ *)  ⌜F⌝
=TEX
\item
instantiate assumptions as required
=SML
a (list_spec_asm_tac ⌜∀ x y⦁ P x ⇒ R y⌝ [⌜w⌝,⌜v⌝]);
=TEX
\end{itemize}
\vfill
}%\small
\end{slide}

% =====================================================================

\Slide
\vfill
{\small
=GFT ProofPower output
Tactic produced 0 subgoals:
(* *** Goal "2" *** *)

(*  3 *)  ⌜∀ v w⦁ ¬ P w ∨ R v⌝
(*  2 *)  ⌜P x⌝
(*  1 *)  ⌜¬ R y⌝

(* ?⊢ *)  ⌜F⌝
=SML
a (list_spec_asm_tac ⌜∀ v w⦁ ¬ P w ∨ R v⌝ [⌜y⌝,⌜x⌝]);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
=SML
pop_thm();
=GFT ProofPower output
Now 0 goals on the main goal stack
val it = ⊢ (∀ x y⦁ P x ⇒ R y)
		⇔ (∀ v w⦁ ¬ P w ∨ R v) : THM
=TEX
\vfill
}%\small
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Exercises 1: Proof}
\end{center}
{\small
\vfill
Set the theory and the proof context:
=SML
open_theory"hol";
set_pc "hol2";
=TEX
Set the goal (from the examples supplied):
=GFT
set_goal([],⌜conjecture⌝);
=TEX
Then try the following methods of proof:
\begin{itemize}
\item
Two tactic method using:
=GFT
a contr_tac; (* once *)
a (list_spec_asm_tac ⌜asm⌝ [⌜t1⌝, ⌜t2⌝]);
  (* as many as necessary *)
=TEX
\item or
=GFT
a (prove_tac[]); (* once *)
=TEX
\item or
=GFT
a step_strip_tac; (* many times *)
=IGN
drop_main_goal();
repeat drop_main_goal;
=TEX
\end{itemize}
in case of difficulty, revert to the two tactic method.
\vfill
}%\small
\end{slide}

% =====================================================================
{\tiny
\Slide
\vfill
=IGN bits and pieces
set_goal([],⌜⌝);
a contr_tac;
a strip_tac;
a step_strip_tac;
prove_rule []
;
map (prove_rule [])
;
map (fn t => tac_proof (([],t),(REPEAT step_strip_tac))) ZRM2
;
map (fn t => tac_proof (([],t),prove_tac[])) ZRM3
;
a (list_spec_nth_asm_tac 1 [⌜⌝]);
=TEX
=SML
(* Results from Principia Mathematica *2 *)
val PM2 =[
⌜(* *2.02 *) q ⇒ ( p ⇒ q)⌝,
⌜(* *2.03 *) (p ⇒ ¬ q) ⇒ (q ⇒ ¬ p)⌝,
⌜(* *2.15 *) (¬ p ⇒ q) ⇒ (¬ q ⇒ p)⌝,
⌜(* *2.16 *) (p ⇒ q) ⇒ (¬ q ⇒ ¬ p)⌝,
⌜(* *2.17 *) (¬ q ⇒ ¬ p) ⇒ (p ⇒ q)⌝,
⌜(* *2.04 *) (p ⇒ q ⇒ r) ⇒ (q ⇒ p ⇒ r)⌝,
⌜(* *2.05 *) (q ⇒ r) ⇒ (p ⇒ q) ⇒ (p ⇒ r)⌝,
⌜(* *2.06 *) (p ⇒ q) ⇒ (q ⇒ r) ⇒ (p ⇒ r)⌝,
⌜(* *2.08 *) p ⇒ p⌝,
⌜(* *2.21 *) ¬ p ⇒ (p ⇒ q)⌝];
=TEX
\vfill
=SML
(* Results from Principia Mathematica *3 *)
val PM3 =[
(* *3.01 *) ⌜p ∧ q ⇔ ¬(¬ p ∨ ¬ q)⌝,
(* *3.2  *) ⌜p ⇒ q ⇒ p ∧ q⌝,
(* *3.26 *) ⌜p ∧ q ⇒ p⌝,
(* *3.27 *) ⌜p ∧ q ⇒ q⌝,
(* *3.3  *) ⌜(p ∧ q ⇒ r) ⇒ (p ⇒ q ⇒ r)⌝,
(* *3.31 *) ⌜(p ⇒ q ⇒ r) ⇒ (p ∧ q ⇒ r)⌝,
(* *3.35 *) ⌜(p ∧ (p ⇒ q)) ⇒ q⌝,
(* *3.43 *) ⌜(p ⇒ q) ∧ (p ⇒ r) ⇒ (p ⇒ q ∧ r)⌝,
(* *3.45 *) ⌜(p ⇒ q) ⇒ (p ∧ r ⇒ q ∧ r)⌝,
(* *3.47 *) ⌜(p ⇒ r) ∧ (q ⇒ s) ⇒ (p ∧ q ⇒ r ∧ s)⌝];
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
\vfill
=SML
(* Results from Principia Mathematica *4 *)
val PM4 =[
(* *4.1  *) ⌜p ⇒ q ⇔ ¬ q ⇒ ¬ p⌝,
(* *4.11 *) ⌜(p ⇔ q) ⇔ (¬ p ⇔ ¬ q)⌝,
(* *4.13 *) ⌜p ⇔ ¬¬ p⌝,
(* *4.2  *) ⌜p ⇔ p⌝,
(* *4.21 *) ⌜(p ⇔ q) ⇔ (q ⇔ p)⌝,
(* *4.22 *) ⌜(p ⇔ q) ∧ (q ⇔ r) ⇒ (p ⇔ r)⌝,
(* *4.24 *) ⌜p ⇔ p ∧ p⌝,
(* *4.25 *) ⌜p ⇔ p ∨ p⌝,
(* *4.3  *) ⌜p ∧ q ⇔ q ∧ p⌝,
(* *4.31 *) ⌜p ∨ q ⇔ q ∨ p⌝,
(* *4.33 *) ⌜(p ∧ q) ∧ r ⇔ p ∧ (q ∧ r)⌝,
(* *4.4  *) ⌜p ∧ (q ∨ r) ⇔ (p ∧ q) ∨ (p ∧ r)⌝,
(* *4.41 *) ⌜p ∨ (q ∧ r) ⇔ (p ∨ q) ∧ (p ∨ r)⌝,
(* *4.71 *) ⌜(p ⇒ q) ⇔ (p ⇔ (p ∧ q))⌝,
(* *4.73 *) ⌜q ⇒ (p ⇔ (p ∧ q))⌝];
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
\vfill
=SML
(* Results from Principia Mathematica *5 *)
val PM5 =[
(* *5.1  *) ⌜p ∧ q ⇒ (p ⇔ q)⌝,
(* *5.32 *) ⌜(p ⇒ (q ⇔ r)) ⇒ ((p ∧ q) ⇔ (p ∧ r))⌝,
(* *5.6  *) ⌜(p ∧ ¬ q ⇒ r) ⇒ (p ⇒ (q ∨ r))⌝];
=TEX
=SML
(* Definitions from Principia Mathematica *9 *)
val PM9 =[
(* *9.01 *) ⌜¬ (∀x⦁ φx) ⇔ (∃x⦁ ¬ φx)⌝,
(* *9.02 *) ⌜¬ (∃x⦁ φx) ⇔ (∀x⦁ ¬ φx)⌝,
(* *9.03 *) ⌜(∀x⦁ φx ∨ p) ⇔ (∀x⦁ φx) ∨ p⌝,
(* *9.04 *) ⌜p ∨ (∀x⦁ φx) ⇔ (∀x⦁ p ∨ φx)⌝,
(* *9.05 *) ⌜(∃x⦁ φx ∨ p) ⇔ (∃x⦁ φx) ∨ p⌝,
(* *9.06 *) ⌜p ∨ (∃x⦁ φx) ⇔ p ∨ (∃x⦁ φx)⌝];
val PM9b =[
(* *9.07 *) ⌜(∀x⦁ φx) ∨ (∃y⦁ ψy) ⇔ (∀x⦁∃y⦁ φx ∨ ψy)⌝,
(* *9.08 *) ⌜(∃y⦁ ψy) ∨ (∀x⦁ φx) ⇔ (∀x⦁∃y⦁ ψy ∨ φx)⌝];
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
\vfill
=SML
(* Results from Principia Mathematica *10 *)
val PM10 =[
(* *10.01  *) ⌜(∃x⦁ φx) ⇔ ¬ (∀y⦁ ¬ φy)⌝,
(* *10.1   *) ⌜(∀x⦁ φx) ⇒ φy⌝,
(* *10.21  *) ⌜(∀x⦁ p ⇒ φx) ⇔ p ⇒ (∀y⦁ φy)⌝,
(* *10.22  *) ⌜(∀x⦁ φx ∧ ψx) ⇔ (∀y⦁ φy) ∧ (∀z⦁ ψz)⌝,
(* *10.24  *) ⌜(∀x⦁ φx ⇒ p) ⇔ (∃y⦁ φy) ⇒ p⌝,
(* *10.27  *) ⌜(∀x⦁ φx ⇒ ψx) ⇒ ((∀y⦁ φy) ⇒ (∀z⦁ ψz))⌝,
(* *10.271 *) ⌜(∀x⦁ φx ⇔ ψx) ⇒ ((∀y⦁ φy) ⇔ (∀z⦁ ψz))⌝,
(* *10.28  *) ⌜(∀x⦁ φx ⇒ ψx) ⇒ ((∃y⦁ φy) ⇒ (∃z⦁ ψz))⌝,
(* *10.281 *) ⌜(∀x⦁ φx ⇔ ψx) ⇒ ((∃y⦁ φy) ⇔ (∃z⦁ ψz))⌝,
(* *10.35  *) ⌜(∃x⦁ p ∧ φx) ⇔ p ∧ (∃y⦁ φy)⌝,
(* *10.42  *) ⌜(∃x⦁ φx) ∨ (∃y⦁ ψy) ⇔ (∃z⦁ φz ∨ ψz)⌝,
(* *10.5   *) ⌜(∃x⦁ φx ∧ ψx) ⇒ (∃y⦁ φy) ∧ (∃z⦁ ψz)⌝,
(* *10.51  *) ⌜¬(∃x⦁ φx ∧ ψx) ⇒ (∀y⦁ φy ⇒ ¬ ψy)⌝];
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
\vfill
=SML
(* Results from Principia Mathematica *11 *)
val PM11 =[
(* *11.1  *) ⌜(∀x y⦁ φ(x,y)) ⇒ φ(z,w)⌝,
(* *11.2  *) ⌜(∀x y⦁ φ(x,y)) ⇔ ∀y x⦁ φ(x,y)⌝,
(* *11.3  *) ⌜(p ⇒ (∀x y⦁ φ(x,y)))
		⇔ (∀x y⦁ p ⇒ φ(x,y))⌝,
(* *11.32 *) ⌜(∀x y⦁ φ(x,y) ⇒ ψ(x,y))
		⇒ (∀x y⦁ φ(x,y)) ⇒ (∀x y⦁ ψ(x,y))⌝,
(* *11.35 *) ⌜(∀x y⦁ φ(x,y) ⇒ p) ⇔ (∃x y⦁ φ(x,y)) ⇒ p⌝,
(* *11.45 *) ⌜(∃x y⦁ p ⇒ φ(x,y))
		⇔ (p ⇒ (∃x y⦁ φ(x,y)))⌝,
(* *11.54 *) ⌜(∃x y⦁ φx ∧ ψy) ⇔ (∃x⦁ φx) ∧ (∃y⦁ ψy)⌝,
(* *11.55 *) ⌜(∃x y⦁ φx ∧ ψ(x,y))
		⇔ (∃x⦁ φx ∧ (∃y⦁ ψ(x,y)))⌝,
(* *11.6  *) ⌜(∃x⦁ (∃y⦁ φ(x,y) ∧ ψy) ∧ χx)
		⇔ (∃y⦁ (∃x⦁ φ(x,y) ∧ χx) ∧ ψy)⌝,
(* *11.62 *) ⌜(∀x y⦁ φx ∧ ψ(x,y) ⇒ χ(x,y))
  		⇔ (∀x⦁ φx ⇒ (∀y⦁ ψ(x,y) ⇒ χ(x,y)))⌝
];
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
\vfill
=SML
(* results from ZRM provable by stripping *)
val ZRM1 = [
⌜a ∪ a = a ∪ {}⌝,
⌜a ∪ {} = a ∩ a⌝,
⌜a ∩ a = a \ {}⌝,
⌜a \ {} = a⌝,
⌜a ∩ {} = a \ a⌝,
⌜a \ a = {} \ a⌝,
⌜{} \ a = {}⌝,
⌜a ∪ b = b ∪ a⌝,
⌜a ∩ b = b ∩ a⌝,
⌜a ∪ (b ∪ c) = (a ∪ b) ∪ c⌝,
⌜a ∩ (b ∩ c) = (a ∩ b) ∩ c⌝,
⌜a ∪ (b ∩ c) = (a ∪ b) ∩ (a ∪ c)⌝,
⌜a ∩ (b ∪ c) = (a ∩ b) ∪ (a ∩ c)⌝,
⌜(a ∩ b) ∪ (a \ b) = a⌝,
⌜(a \ b) ∩ b = {}⌝,
⌜a \ (b \ c) = (a \ b) ∪ (a ∩ c)⌝,
⌜(a \ b) \ c = (a \ (b ∪ c))⌝,
⌜a ∪ (b \ c) = (a ∪ b) \ (c \ a)⌝,
⌜a ∩ (b \ c) = (a ∩ b) \ c⌝,
⌜(a ∪ b) \ c = (a \ c) ∪ (b \ c)⌝];
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
\vfill
=SML
val ZRM2 = [
⌜a \ (b ∩ c) = (a \ b) ∪ (a \ c)⌝,
⌜¬ x ∈ {}⌝,
⌜a ⊆ a⌝,
⌜¬ a ⊂ a⌝,
⌜{} ⊆ a⌝,
⌜⋃ {} = {}⌝,
⌜⋂ {} = Universe⌝];
=TEX
\vfill
=SML
(* results from ZRM *)
val ZRM3 = [
⌜a ⊆ b ⇔ a ∈ ℙ b⌝,
⌜a ⊆ b ∧ b ⊆ a ⇔ a = b⌝,
⌜¬ (a ⊂ b ∧ b ⊂ a)⌝,
⌜a ⊆ b ∧ b ⊆ c ⇒ a ⊆ c⌝,
⌜a ⊂ b ∧ b ⊂ c ⇒ a ⊂ c⌝,
⌜{} ⊂ a ⇔ ¬ a = {}⌝,
⌜⋃ (a ∪ b) = (⋃ a) ∪ (⋃ b)⌝,
⌜⋂ (a ∪ b) = (⋂ a) ∩ (⋂ b)⌝,
⌜ a ⊆ b ⇒ ⋃ a ⊆ ⋃ b ⌝,
⌜ a ⊆ b ⇒ ⋂ b ⊆ ⋂ a ⌝];
=TEX
\vfill
\end{slide}

}%\tiny
% =====================================================================

\Slide
\begin{center}

{\bf The HOL Type System}

\end{center}
{\small
\vfill

\begin{itemize}
\item
abstract syntax/computation
=SML
mk_vartype	: string			-> TYPE;
mk_ctype	: string * TYPE list	-> TYPE;
=TEX
\item
concrete syntax
=GFT BNF
	Type	=	Name	
		|	Typars, Name
		|	Type, InfixName, Type
		| 	`(`, Type, `)`;
	Typars	=	Type
		|	`(`, Type, { `,`, Type }, `)`;
=TEX
{\tiny
Type variables must begin with a prime.\\
Infix status and priority determined by fixity declarations.
}%\tiny
\item
semantics
\begin{itemize}
\item
Types denote non-empty sets of values.
\item
Type variables range over non-empty sets of values.
\item
Type constructors denote functions from\\
tuples of sets to sets.
\end{itemize}
\end{itemize}
\vfill
}%\small
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Examples of Types}

\end{center}
\vfill
{\tiny
=SML
ⓣ'a⌝;
		(* parsed type variable *)
val t = mk_vartype "'a";
		(* computed type variable *)
val u = ⓣBOOL⌝;
		(* 0-ary type constructor *)
mk_ctype ("BOOL",[]);
		(* computed 0-ary type construction *)
ⓣℕ⌝;
		(* 0-ary type constructor *)
ⓣ'a LIST⌝;
		(* polymorphic list type *)
ⓣ(ℕ) LIST⌝;
		(* lists of natural numbers *)
ⓣℕ → ℕ⌝;
		(* infix type constructor *)
mk_ctype ("→",[ⓣℕ⌝,ⓣℕ⌝]);
		(* computed function space *)
ⓣ ⌜↘SML:↕ t⌝ → ⌜↘SML:↕ u⌝⌝;
	(* another way of writing ⓜmk_ctype("→",[t,u])⌝ *)
ⓣℕ × ℕ⌝;
		(* pairs of natural numbers *)
ⓣℕ + BOOL⌝;
		(* disjoint union of ℕ and BOOL *)
ⓣ(ℕ, ℕ) $×⌝;
		(* suspending infix status *)
=TEX
}%\tiny
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Computation with TYPEs (I)\\
recognisers and destructors}
\end{center}
\vfill

\begin{itemize}
\item constructors
=SML
mk_vartype :string		-> TYPE;
mk_ctype   :string*TYPE list	-> TYPE;
=TEX
\item recognisers
=SML
is_vartype	:TYPE -> bool;
is_ctype	:TYPE -> bool;
=TEX
\item destructors
=SML
dest_vartype	:TYPE -> string;
dest_ctype	:TYPE -> string * TYPE list;
=TEX
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Computation with TYPEs (II)\\
sample functions}

\end{center}
\vfill
\begin{itemize}
\item type equality
=SML
op =: : TYPE * TYPE -> bool;
=TEX
\item type variables in a type
=SML
type_tyvars : TYPE -> string list;
=TEX
\item type constructors in a type
=SML
type_tycons : TYPE -> (string * int) list;
=TEX
\item type instantiation
=SML
inst_type : (TYPE * TYPE) list
		-> TYPE -> TYPE;
=TEX
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Computation with TYPEs (III)\\
support for pattern matching}
\end{center}
\vfill

{\small
\begin{itemize}
\item DEST\_SIMPLE\_TYPE
=GFT
datatype DEST_SIMPLE_TYPE =
	Vartype of string
|	Ctype of (string * TYPE list);
=TEX
\item generalised destructor
=SML
dest_simple_type: TYPE -> DEST_SIMPLE_TYPE;
=TEX
\item generalised constructor
=SML
mk_simple_type : DEST_SIMPLE_TYPE -> TYPE;
=TEX
\item pattern matching recursive functions
=SML
fun type_tyvars2 t =
 (fn Vartype s	=> [s]
 |   Ctype (s,tl)	=> list_cup (map type_tyvars2 tl))
 (dest_simple_type t);
=TEX
\end{itemize}
\vfill
}%\small
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf HOL Terms}

\end{center}
\vfill
{\small

\begin{itemize}
\item
abstract syntax/computation
=GFT
datatype DEST_SIMPLE_TERM =
		Var	of string * TYPE
	|	Const	of string * TYPE
	|	App	of TERM * TERM
	|	Simpleλ	of TERM * TERM;

dest_simple_term: TERM -> DEST_SIMPLE_TERM;
mk_simple_term: DEST_SIMPLE_TERM -> TERM;
=TEX
\item
concrete syntax
=GFT BNF
Term	=
		`λ`, Name, [`:`, Type], `⦁`, Term
	|	Term, Term
	|	Term, InfixName, Term
	|	Term, `:`, Type
	|	Name
	|	`(`, Term, `)`;		
=TEX
{\tiny
Names are treated as variables unless declared as constants.\\
Infix status and priority determined by fixity declarations.
}%\tiny
\end{itemize}
\vfill
}%\small
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Types of Terms}

\end{center}
\vfill
Terms must be well typed.\\
The type of a term is determined by type inference using the following rules:
\begin{itemize}
\item variables
=FRULE 1
├
├
⌜v:α⌝ : α
=TEX
\item constants
=FRULE 1
├
├
⌜c:α⌝ : α
=TEX
\item lambda abstractions
=FRULE 1
├
t : α
├
⌜λ x:β ⦁ t⌝ : β → α
=TEX
\item applications
=FRULE 1
├
f : α → β; x : α
├
⌜f x⌝ : β
=TEX
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Types of Terms}

\end{center}
\vfill
{\small
\def\FruleLeftWidth{0.9\textwidth}
\def\FruleRightWidth{0.0\textwidth}
The same rules may be rendered in ML as follows:
\begin{itemize}
=IGN
(* if you execute the following declarations first then
the expressions in the rules below will evaluate *)
val vname = "var";
val vtype = ⓣBOOL⌝;
val cname = "0";
val ctype = ⓣℕ⌝;
val term = ⌜0⌝;
val ttype = ⓣℕ⌝;
val funterm = ⌜fun : 'a → 'b⌝;
val arg = ⌜arg : 'a⌝;
=TEX
\item variables
=FRULE 1
├
├
type_of (mk_var(vname,vtype)) =: vtype;
=TEX
\item constants
=FRULE 1
├
├
type_of (mk_const(cname,ctype)) =: ctype;
=TEX
\item lambda abstractions
=FRULE 1
├
type_of term =: ttype;
├
type_of ⌜λ x:'a ⦁ ⓜterm⌝⌝ =: ⓣ'a → ⌜↘SML:↕ ttype⌝⌝;
=TEX
\item applications
=FRULE 1
├
type_of funterm =: ⓣ'a → 'b⌝;
type_of arg =: ⓣ'a⌝;
├
type_of ⌜ⓜfunterm⌝ ⓜarg⌝⌝ =: ⓣ'b⌝;
=TEX
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Types of Terms - Examples}

\end{center}
{\small
\vfill
=SML
type_of ⌜x:ℕ⌝		=: ⓣℕ⌝;
type_of ⌜x:'a⌝		=: ⓣ'a⌝;
type_of ⌜0⌝		=: ⓣℕ⌝;
type_of ⌜λx:ℕ ⦁ x + 1⌝	=: ⓣℕ → ℕ⌝;
type_of ⌜λx ⦁ x + 1⌝	=: ⓣℕ → ℕ⌝;
type_of ⌜(λx ⦁ x + 1) 3⌝	=: ⓣℕ⌝;
type_of ⌜$+ 1⌝		=: ⓣℕ → ℕ⌝;
type_of ⌜$+⌝		=: ⓣℕ → ℕ → ℕ⌝;
type_of ⌜T⌝	=: ⓣBOOL⌝;
type_of ⌜¬ T⌝	=: ⓣBOOL⌝;
type_of ⌜$¬⌝	=: ⓣBOOL → BOOL⌝;
type_of ⌜$∧⌝	=: ⓣBOOL → BOOL → BOOL⌝;
type_of ⌜$∀⌝	=: ⓣ('a → BOOL) → BOOL⌝;
=TEX
\vfill
}%\small
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Semantics of Terms}

\end{center}
\vfill

\begin{itemize}
\item
{\bf Variables}\\
{\small range over the set denoted by their type.}
\item
{\bf Constants}\\
{\small denote particular values in the set denoted by their type.}
\item
{\bf Lambda Abstractions}\\
{\small denote total functions from the set denoted by the type of the variable to the set denoted by the type of the body.}

{\small The value at point ``p'' is the value of the body when the variable is assigned value ``p''.}
\item
{\bf Applications}\\
{\small denote the value of the function denoted by the first term at the point which is the value denoted by the second term.}
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Semantics of Terms - Examples}

\end{center}
{\small
\vfill
=SML
β_conv ⌜(λx ⦁ x + 1) 3⌝;
=GFT Hol Output
val it = ⊢ (λ x⦁ x + 1) 3 = 3 + 1 : THM
=SML
rewrite_conv[] ⌜(λx ⦁ x + 1) 3⌝;
=GFT Hol Output
val it = ⊢ (λ x⦁ x + 1) 3 = 4 : THM
=SML
η_axiom;
=GFT Hol Output
val it = ⊢ ∀ f⦁ (λ x⦁ f x) = f : THM
=SML
ext_thm;
=GFT Hol Output
val it = ⊢ ∀ f g⦁ f = g ⇔ (∀ x⦁ f x = g x) : THM
=SML
prove_rule[] ⌜∃ x:ℕ ⦁	43 = x⌝;
prove_rule[] ⌜∃ b:BOOL ⦁	T = b⌝;
prove_rule[] ⌜∀ x:ℕ ⦁	x ≥ 0⌝;
prove_rule[] ⌜∀ b:BOOL ⦁	b = T ∨ b = F⌝;
=TEX
\vfill
}%\small
\end{slide}

% =====================================================================

\Slide
\begin{center}

{\bf Derived Syntax - DEST\_TERM}

\end{center}
{\small
\vfill
=GFT
datatype ⦏DEST_TERM⦎ =
   ⦏DVar⦎		of string * TYPE
|  ⦏DConst⦎	of string * TYPE
|  ⦏DApp⦎		of TERM * TERM
|  ⦏Dλ⦎		of TERM * TERM
|  ⦏DEq⦎		of TERM * TERM
|  ⦏D⇒⦎		of TERM * TERM
|  ⦏DT⦎
|  ⦏DF⦎
|  ⦏D¬⦎		of TERM
|  ⦏DPair⦎		of TERM * TERM
|  ⦏D∧⦎		of TERM * TERM
|  ⦏D∨⦎		of TERM * TERM
|  ⦏D⇔⦎		of TERM * TERM
|  ⦏DLet⦎		of ((TERM * TERM)list * TERM)
|  ⦏DEnumSet⦎	of TERM list
|  ⦏D∅⦎		of TYPE
|  ⦏DSetComp⦎	of TERM * TERM
|  ⦏DList⦎		of TERM list
|  ⦏DEmptyList⦎	of TYPE
|  ⦏D∀⦎		of TERM * TERM
|  ⦏D∃⦎		of TERM * TERM
|  ⦏D∃⋎1⦎		of TERM * TERM
|  ⦏Dε⦎		of TERM * TERM
|  ⦏DIf⦎		of (TERM * TERM * TERM)
|  ⦏Dℕ⦎		of int
|  ⦏DChar⦎		of string
|  ⦏DString⦎	of string;
=TEX
\vfill
}%\small
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Derived Syntax}
\end{center}
\vfill

\begin{itemize}
\item
prefix, infix and postfix operators
\item
binders
\item
pair matching lambda abstractions
\item
conditionals
\item
local definitions
\item
set displays and abstractions
\item
list displays
\item
literals (numeric, character, and string)
\end{itemize}
\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Binders}
\end{center}
\vfill
\begin{itemize}
\item
Constants having type: ⓣ('a → 'b) → 'c⌝\\
(or any instance of this)\\
may be declared as ``binders''.
\vfill
\item
Normally a ``binder'' is applied to a lambda expression, in which case the $λ$ is omitted.
\vfill
\item
binder status may be suspended by use of $\$$.
=SML
⌜∃ x⦁ x = 4⌝ =$ ⌜$∃ λ x⦁ x = 4⌝;
=IGN
new_const ("α", ⓣ('a → 'b) → 'c⌝);
declare_binder"α";
⌜α x⦁ x = 4⌝ =$ ⌜$∃ (λ x⦁ x = 4)⌝;
=TEX
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Nested Paired Abstractions}
\end{center}
\vfill
{\small
\begin{itemize}
\item
nested lambda abstractions can be abbreviated as follows:
=SML
⌜λx:ℕ⦁λy:ℕ⦁ (x,y)⌝ =$ ⌜λ x y:ℕ⦁ (x,y)⌝;
=TEX
This function takes two natural numbers and returns a pair.
(``,'' is the infix pairing operator.)
\item
functions taking pairs may be written:
=SML
rewrite_conv[] ⌜(λ(x,y):ℕ × ℕ⦁ x)=Fst⌝;
=GFT ProofPower output
val it = ⊢ (λ (x, y)⦁ x) = Fst ⇔ T : THM
=TEX
This function takes an argument which is an ordered pair, and returns the first element of the pair.
\item
these effects can be iterated or combined.
=SML
rewrite_conv []
	⌜(λ(x,y):ℕ × ℕ; ((v,w),z)⦁ x + y + v + w + z)
	(1,2) ((3,4),5)⌝;
=GFT ProofPower output
val it =
	⊢ (λ (x, y) ((v, w), z)⦁ x + y + v + w + z)
	(1, 2) ((3, 4), 5) = 15 : THM
=TEX
\end{itemize}
\vfill
}%\small
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Conditionals}
\end{center}
\vfill
\begin{itemize}
\item
Conditionals may be written:

{\bf if} t1 {\bf then} t2 {\bf else} t3
=SML
rewrite_conv[] ⌜if T then 0 else 1⌝;
=GFT ProofPower output
val it = ⊢ (if T then 0 else 1) = 0 : THM
=TEX
=SML
rewrite_conv[] ⌜if F then 0 else 1⌝;
=GFT ProofPower output
val it = ⊢ (if F then 0 else 1) = 1 : THM
=TEX
=SML
rewrite_conv[] ⌜if 3>6 then x else y⌝;
=GFT ProofPower output
val it = ⊢ (if 3 > 6 then x else y) = y : THM
=TEX
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Let Clauses (I)}
\end{center}
\vfill
\begin{itemize}
\item
Local declarations may be made in the form:

{\bf let} defs {\bf in} term
=SML
rewrite_conv[let_def]⌜let a = "Peter" in a,a⌝;
=GFT ProofPower output
val it = ⊢ (let a = "Peter" in (a, a))
		= ("Peter", "Peter") : THM
=TEX
\item
The left hand side of a definition may be a ``varstruct'':
=SML
rewrite_conv[let_def]
	⌜let (x,y) = (1,T) in (y,x)⌝;
=GFT ProofPower output
val it = ⊢ (let (x, y) = (1, T) in (y, x))
		= (T, 1) : THM
=TEX
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Let Clauses (II)}
\end{center}
\vfill
\begin{itemize}
\item
The left hand side of a definition may be a function definition:
=SML
rewrite_conv[let_def]⌜let f x = x*x in f 3⌝;
=GFT ProofPower output
val it = ⊢ (let f x = x * x in f 3)
		= 9 : THM
=TEX
\item
Multiple definitions may be given in a single let clause.
=SML
rewrite_conv[let_def]
	⌜let a = 1 and b = 2 in (a,b)⌝;
=GFT ProofPower output
val it = ⊢ (let a = 1 and b = 2 in (a, b))
		= (1, 2) : THM
=TEX
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Set Displays}
\end{center}
\vfill

{\small
\begin{itemize}
\item
Sets may be entered as terms by enumeration:
=SML
rewrite_conv[]⌜9 ∈ {1*1; 2*2; 3*3; 4*4}⌝;
=GFT ProofPower Output
val it = ⊢ 9 ∈ {1 * 1; 2 * 2; 3 * 3; 4 * 4}
	⇔ T : THM
=TEX
=SML
rewrite_conv[]⌜10 ∈ {1*1; 2*2; 3*3; 4*4}⌝;
=GFT ProofPower Output
val it = ⊢ 10 ∈ {1 * 1; 2 * 2; 3 * 3; 4 * 4}
	⇔ F : THM
=TEX
\item
Sets may also be entered as set abstractions:
=SML
rewrite_conv[]⌜9 ∈ {x | x < 12}⌝;
=GFT ProofPower Output
val it = ⊢ 9 ∈ {x|x < 12} ⇔ T : THM
=TEX
=SML
rewrite_conv[]⌜z ∈ {(x, y) | x < y}⌝;
=GFT ProofPower Output
val it = ⊢ z ∈ {(x, y)|x < y}
	⇔ Fst z < Snd z : THM
=TEX
\end{itemize}
\vfill
}%\small

\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf List Displays}
\end{center}
\vfill
\begin{itemize}
\item
A similar syntax is available for lists:
\vfill
=SML
rewrite_conv[append_def]
	⌜[1*1; 2*2; 3*3; 4*4] @ [5*5]⌝;
=GFT ProofPower Output
val it = ⊢
	[1 * 1; 2 * 2; 3 * 3; 4 * 4] @ [5 * 5]
	= [1; 4; 9; 16; 25] : THM
=TEX
\vfill
=SML
⌜Cons 1 [2;3;4;5]⌝;
=GFT ProofPower Output
val it = ⌜[1; 2; 3; 4; 5]⌝ : TERM
=TEX
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Literals (I)}
\end{center}
\vfill
\begin{itemize}
\item
Numeric literals consist of a sequence of decimal digits (no sign):
=SML
dest_simple_term ⌜123⌝;
=GFT ProofPower output
val it = Const ("123", ⓣℕ⌝)
	: DEST_SIMPLE_TERM
=TEX
\vfill
\item
Character literals consist of a single character in \verb!`! characters:
=SML
dest_simple_term ⌜`α`⌝;
=GFT ProofPower output
val it = Const ("`α", ⓣCHAR⌝) (* ` *)
	: DEST_SIMPLE_TERM
=TEX
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Literals (II)}
\end{center}
\vfill
{\small
\begin{itemize}
\item
String literals consist of zero or more characters in ``\verb!"!'' characters:
=SML
dest_simple_term ⌜"many characters αβγ"⌝;
=GFT ProofPower output
val it = Const ("\"many characters αβγ", (* " *)
	ⓣCHAR LIST⌝) : DEST_SIMPLE_TERM
=TEX
% "
\vfill
\item
A string literal denotes a LIST of characters:
=SML
TOP_MAP_C string_conv ⌜"characters αβγ"⌝;
=GFT ProofPower output
val it = ⊢ "characters αβγ"
    = [`c`; `h`; `a`; `r`; `a`; `c`; `t`; `e`; `r`; `s`;
    ` `; `α`; `β`; `γ`] : THM
=TEX
\end{itemize}
\vfill
}%\small
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Theories/Declarations/Definitions\\
Specifications/Paragraphs}
\end{center}
\vfill
\begin{itemize}
\item
Information about specifications is held in the theory database.
\vfill
\item
The information is mainly put in the theories using various declarations and definitions, which are calls to ML functions.
\vfill
\item
Some specifications may be effected using ``paragraphs'' in the object language (HOL).
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Theories}
\end{center}
\vfill
A theory contains the following information:
\begin{itemize}
\item
The name of the theory and the names of its parents and children.
\item
The names and arities of type constructors declared in the theory.
\item
The names and types of constants declared in the theory.
\item
Fixity and aliasing information.
\item
Definitions of constants.
\item
A collection of saved theorems.
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Access to Theories}
\end{center}
\vfill
\begin{itemize}
\item
To use a theory it must be ``in context'', this can be achieved be opening the theory or one of its descendents:
=SML
open_theory : string -> unit;
=TEX
\item
To display the contents of a theory:
=SML
print_theory : string -> unit;
=TEX
\item
To get things from the theory:
=SML
get_aliases; get_ancestors; get_axiom; get_axioms;
get_binders; get_children; get_consts; get_defn;
get_defns; get_descendants; get_parents; get_thm;
get_thms; get_spec;
=TEX
\item
To save things in the theory use declarations, definitions, specifications or paragraphs (see below).
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Exercises 2:
HOL Theory Explorations}
\end{center}
\vfill
{\tiny
\begin{itemize}
\item
Find the names of all the theories:
=SML
get_theory_names();
=TEX
\item
Print selected theories, e.g.:
=SML
open_theory"sets";
print_theory"sets";
=TEX
\item
Get the terms from the definitions in a theory, e.g.:
=SML
open_theory "bin_rel";
(map concl o map snd o get_defns) "bin_rel";
=TEX
\item
Now select interesting terms and take them apart using, e.g.:
=SML
dest_simple_term ⌜∀ r s⦁ r ⊕ s = (Dom s ⩤ r) ∪ s⌝;
=GFT Hol Output
val it = App (⌜$∀⌝, ⌜λ r⦁ ∀ s⦁ r ⊕ s = (Dom s ⩤ r) ∪ s⌝)
				: DEST_SIMPLE_TERM
=SML
dest_simple_term ⌜{1;2;3}⌝;
=GFT Hol Output
val it = App (⌜Insert 1⌝, ⌜{2; 3}⌝) : DEST_SIMPLE_TERM
=SML
get_spec ⌜Insert⌝;
=GFT Hol Output
val it = ⊢ ∀ x y a
  ⦁ ¬ x ∈ {} ∧ x ∈ Universe ∧ (x ∈ Insert y a ⇔ x = y ∨ x ∈ a) : THM
=TEX
\end{itemize}
}%\tiny
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Declarations (I)}
\end{center}

\vfill

\begin{itemize}
\item
theories and parents
=SML
open_theory	: string -> unit;
new_theory	: string -> unit;
new_parent	: string -> unit;
=TEX
\item
types
=SML
new_type
 : string * int -> TYPE;
new_type_defn
 : string list * string * string list * THM -> THM;
declare_type_abbrev
 : string * string list * TYPE -> unit;
=TEX
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Declarations (II)}
\end{center}

\vfill

\begin{itemize}
\item
constants
=SML
new_const
  : string * TYPE -> TERM;
simple_new_defn
  : string list * string * TERM -> THM;
new_spec
  : string list * int * THM -> THM;
const_spec
  : string list * TERM list * TERM -> THM;
=TEX
\item
types and constants
=SML
unlabelled_product_spec;
	(* mainly for use with Z *)
labelled_product_spec;
	(* see paragraphs below *)
=TEX
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Declarations (III)}
\end{center}

\vfill

Any identifier can be declared:

\begin{itemize}
\item
prefix, infix, postfix (with a priority)
\item
a binder (like ``∀'' and ``∃'')
\end{itemize}
=SML
declare_prefix	: int * string -> unit;
declare_infix	: int * string -> unit;
declare_postfix	: int * string -> unit;
declare_binder	: string -> unit;
get_fixity	: string -> Lex.FIXITY;
declare_nonfix	: string -> unit;
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Paragraphs}
\end{center}
\vfill

Some declarations may be done without resort to the metalanguage:

\begin{itemize}
\item
constant declarations (based on $const\_spec$)
=SML
new_theory "tutorial";
declare_postfix (200, "!");
ⓈHOLCONST
│
│ $! : ℕ → ℕ
├────────────────
│		0! = 1
│∧	∀n:ℕ⦁	(n+1)! = n! * (n+1)
■
=TEX
\item
labelled product declarations
ⓈHOLLABPROD Date───────
│	day month year:ℕ
■────────────────
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Paragraphs - Example}
\end{center}

\vfill

ⓈHOLCONST
│ length : 'a LIST → ℕ
├────────────────
│	length [] = 0
│∧ ∀ h t⦁
│	length (Cons h t) = length t + 1
│
■
=SML
print_theory "tutorial";
rewrite_conv[get_spec⌜length⌝]
	⌜length [1;2;3;4;5]⌝;
=TEX
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Exercises 3: Specification}
\end{center}

\vfill

\begin{itemize}
\item
Create a new theory as a child of ``hol''.
=SML
open_theory "tutorial";
=TEX
\item
Write a specification in HOL of a function to add the elements of a list of numbers.

{\tiny HINT: if your specification goes in as a ``Constspec'' then the system could not prove it consistent, and its probably either wrong or poorly structured.
Try to make it clearly `primitive recursive'.}
\item
Use it to ``evaluate'' the term\\
$⌜list\_sum [1;2;3;4;5]⌝$.
=GFT
rewrite_conv[get_spec⌜list_sum⌝]
	⌜list_sum [1;2;3;4;5]⌝;
=TEX
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Forward Proof in ProofPower
\end{center}
\vfill
\begin{itemize}
\item
{\bf theorems} - {\small values of type THM computed from {\bf axioms} and {\bf definitions} using {\bf rules} and {\bf conversions}.}
\item
{\bf axioms} - {\small theorems introduced without proof.}
\item
{\bf definitions} - {\small axioms introduced by ``conservative'' mechanisms.}
\item
{\bf rules} - {\small functions which compute theorems.}
\item
{\bf conversions} - {\small rules which prove equations from terms.}
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Theorems
\end{center}
\vfill
{\small
\begin{itemize}
\item
The {\bf HOL logic} is a ``sequent calculus''.
\item
A {\bf sequent} is a ``(TERM list) * TERM''(=SEQ) where each term must have type ⓣBOOL⌝.
\item
The list of TERMs are known as ``assumptions'' the single term is the conclusion of the sequent.
\item
A sequent is valid if whenever the assumptions are all true the conclusion is also true.
\item
A theorem is a sequent which has been derived from axioms and definitions using the rules of the logic.
Theorems are tagged with an indicator of the context in which they were derived.
\item
\ftlmargin=\leftmargin
The sequent part of a theorem may be accessed using:
=SML
dest_thm	: THM -> SEQ;
asms		: THM -> TERM list;
concl		: THM -> TERM;
=TEX
\item
Theorems are displayed without ``quine corners''; they cannot be parsed, they must be proven (or introduced as axioms).
\item
To see the primitive constants and axioms look in theories ``min'', ``log'' and ``init''.
\end{itemize}
}%\small
\ftlmargin=\leftmargin
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Naming Conventions for Theorems and Rules
\end{center}
\vfill
\begin{itemize}
\item $\_axiom$\\
ML names ending with $\_axiom$ are used for axioms and for functions (e.g. $new\_axiom$) for introducing or accessing axioms.
\item $\_def$ $\_spec$\\
ML name suffixes used for definitions.
\item $\_thm$ $\_clauses$\\
ML name suffixes for theorems.
\item $\_rule$ $\_elim$ $\_intro$\\
used for inference rules.
\item $\_conv$\\
for conversions, rules having type TERM -$>$ THM where the THM is an equation with the TERM as its left hand operand.
\end{itemize}
\vfill
\end{slide}

% =====================================================================

{\small
\Slide
\begin{center}
\bf A Selection of Useful Rules (I)
\end{center}
\vfill
\begin{itemize}
\item assume rule:
=SML
val thm1 = asm_rule ⌜∀x y:ℕ⦁ x*y > 0⌝;
=GFT ProofPower Output
val thm1 = ∀ x y⦁ x * y > 0
		⊢ ∀ x y⦁ x * y > 0 : THM
=TEX
\item modus ponens
=SML
val thm_a = asm_rule⌜a:BOOL⌝;
val thm_b = asm_rule⌜a⇒b⌝;
=GFT ProofPower Output
val thm_a = a ⊢ a : THM
val thm_b = a ⇒ b ⊢ a ⇒ b : THM
=SML
val thm_c = ⇒_elim thm_b thm_a;
=GFT ProofPower Output
val thm_c = a ⇒ b, a ⊢ b : THM
=TEX
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf A Selection of Useful Rules (II)
\end{center}
\vfill
\begin{itemize}
\item specialisation
=SML
val thm2 = ∀_elim ⌜455⌝ thm1;
=GFT ProofPower Output
val thm2 = ∀ x y⦁ x * y > 0
		⊢ ∀ y⦁ 455 * y > 0 : THM
=TEX
\item multiple specialisation
=SML
val thm3 = list_∀_elim [⌜455⌝,⌜0⌝] thm1;
=GFT ProofPower Output
val thm3 = ∀ x y⦁ x * y > 0
		⊢ 455 * 0 > 0 : THM
=TEX
\item removing outermost universals
=SML
val thm4 = all_∀_elim thm1;
=GFT ProofPower Output
val thm4 = ∀ x y⦁ x * y > 0 ⊢ x * y > 0 : THM
=TEX
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf A Selection of Useful Rules (III)
\end{center}
\vfill
\begin{itemize}
\item splitting conjunctions
=SML
val thm5 = all_∀_elim plus_order_thm;
=GFT ProofPower output
val thm5 = ⊢ m + i = i + m
	∧ (i + m) + n = i + m + n
	∧ m + i + n = i + m + n : THM
=SML
val thms1 = strip_∧_rule thm5;
=GFT ProofPower output
val thms1 = [⊢ m + i = i + m,
	⊢ (i + m) + n = i + m + n,
	⊢ m + i + n = i + m + n] : THM list
=TEX
\item adding universals (I)
=SML
val thm6 = all_∀_intro (nth 2 thms1);
=GFT ProofPower output
val thm6 = ⊢ ∀ m i n⦁ m + i + n = i + m + n : THM
=TEX
\item adding universals (II)
=SML
val thm7 = list_∀_intro [⌜i⌝,⌜m⌝,⌜n⌝] (nth 2 thms1);
=GFT ProofPower output
val thm7 = ⊢ ∀ i m n⦁ m + i + n = i + m + n : THM
=TEX
\end{itemize}
\vfill
\end{slide}
}%\small
% =====================================================================

\Slide
\begin{center}
\bf Exercises 4: Forward Proof
\end{center}
\vfill
{\small
=IGN
asm_rule
strip_∧_rule
⇒_elim
∀_elim
all_∀_elim
list_∀_elim
all_∀_intro
list_∀_intro
¬_plus1_thm
≤_trans_thm
¬_less_thm
=TEX
\begin{enumerate}
\item
Using $⇒\_elim$ and $asm\_rule$ prove:
\begin{enumerate}
\item
$ b⇒c, a⇒b, a ⊢ c$
\item
$ a⇒b⇒c, a, b ⊢ c$
\end{enumerate}
\item
Using $∀\_elim$ with $¬\_plus1\_thm$ prove:
\begin{enumerate}
\item
$ ⊢ ¬ 0+1=0 $
\item
$ ⊢ ¬ x*x+1=0 $
\end{enumerate}
\item
Using $all\_∀\_elim$ with $≤\_trans\_thm$ prove:
\begin{enumerate}
\item
$⊢ m ≤ i ∧ i ≤ n ⇒ m ≤ n $
\end{enumerate}
\item
Using $list\_∀\_elim$ prove:
\begin{enumerate}
\item (with $¬\_less\_thm$)\\
$⊢ ¬ 0 < 1 ⇔ 1 ≤ 0$
\item (with $≤\_trans\_thm$)\\
⊢ ∀ n⦁ 3 ≤ x * x ∧ x * x ≤ n ⇒ 3 ≤ n
\end{enumerate}
\item
Using $all\_∀\_elim$, $strip\_∧\_rule$, $nth$, $all\_∀\_intro$:
\begin{enumerate}
\item (with $≤\_clauses$)\\
⊢ ∀ i m n⦁ i + m ≤ i + n ⇔ m ≤ n
\item (using $list\_∀\_intro$)\\
⊢ ∀ m i n⦁ i + m ≤ i + n ⇔ m ≤ n
\end{enumerate}
\end{enumerate}
}%\small
\vfill
\end{slide}

% =====================================================================

{\tiny
\Slide
\begin{center}
\bf Exercises 4: Solutions
\end{center}
\vfill
=SML
(* 1(a) *)
val ext1_thm1 = asm_rule ⌜a⇒b⌝;
val ext1_thm2 = asm_rule ⌜b⇒c⌝;
val ext1_thm3 = asm_rule ⌜a:BOOL⌝;
val ext1_thm4 = ⇒_elim ext1_thm1 ext1_thm3;
val ext1_thm5 = ⇒_elim ext1_thm2 ext1_thm4;
(* 1(b) *)
val ext2_thm1 =
 ⇒_elim (asm_rule ⌜a⇒b⇒c⌝)(asm_rule ⌜a:BOOL⌝);
=TEX
=SML
(* 2(a) *)
val ext3_thm1 = ∀_elim ⌜0⌝ ¬_plus1_thm;
(* 2(b) *)
val ext4_thm1 = ∀_elim ⌜x*x⌝ ¬_plus1_thm;
=TEX
=SML
(* 3(a) *)
val ext5_thm1 = all_∀_elim ≤_trans_thm;
=TEX
=SML
(* 4(a) *)
val ext6_thm1 = list_∀_elim [⌜0⌝,⌜1⌝] ¬_less_thm;
(* 4(b) *)
val ext7_thm1 = list_∀_elim [⌜3⌝,⌜x*x⌝] ≤_trans_thm;
=TEX
=SML
(* 5(a) *)
val ext8_thm1 = strip_∧_rule (all_∀_elim ≤_clauses);
val ext8_thm2 = all_∀_intro (nth 3 ext8_thm1);
(* 5(b) *)
val ext8_thm2 = list_∀_intro [⌜m⌝,⌜i⌝,⌜n⌝](nth 3 ext8_thm1);
=TEX
\vfill
\end{slide}
}%\tiny

% =====================================================================

\Slide
\begin{center}
\bf Goal Oriented Proof
\end{center}
\vfill
{\small
\begin{itemize}
\item a GOAL,

is just a sequent, viz:
\begin{itemize}
\item
a list of assumptions (BOOLean TERMs)
\item
a conclusion (also a BOOLean TERM)
\end{itemize}

GOAL = TERM list * TERM = SEQ
\item a PROOF,

is a function which computes a theorem from a list of theorems.

PROOF = THM list -$>$ THM
\item a TACTIC,

is a function which:
\begin{itemize}
\item
takes a GOAL
\item
returns
\begin{itemize}
\item
a list of sub-GOALs
\item
a PROOF which will compute a theorem corresponding to (``achieving'') the input goal from theorems corresponding to the sub-GOALs.
\end{itemize}
\end{itemize}

TACTIC = GOAL -$>$ (GOAL list * PROOF)
\end{itemize}
\vfill
}%\small
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Using the Subgoal Package
\end{center}
\vfill
{\small
\begin{itemize}
\item
Getting started:
=SML
set_goal : GOAL -> unit;
push_goal : GOAL -> unit;
push_consistency_goal : TERM -> unit;
=TEX
\item
Moving along:
=SML
apply_tactic : TACTIC -> unit;
a : TACTIC -> unit;
undo : int -> unit;
set_labelled_goal : string -> unit;
lemma_tac : TERM -> TACTIC;
=TEX
\item
Finishing off:
=SML
top_thm : unit -> THM;
pop_thm : unit -> THM;
save_pop_thm : string -> THM;
=TEX
\item
also note:
=SML
save_thm : string * THM -> THM;
list_save_thm
	: string list * THM -> THM;
save_consistency_thm
	: TERM -> THM -> THM;
=TEX
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Rewriting
\end{center}
\vfill

$$ [pure\_] [once\_] [asm\_] rewrite\_ \cases{conv \cr rule \cr tac \cr thm\_tac} $$
	
$ :THM\ list -> \cases{conv (= TERM -> THM)\cr THM -> THM\cr TACTIC\cr } \hfill $

$ :THM -> TACTIC \hfill$
\vfill
{\small
rewrites the term, theorem or goal using:

\vfill

\begin{itemize}
\item
conversions in ``proof context'' (unless {\bf pure})
\item
assumptions (if {\bf asm} but not {\bf conv}) (after context sensitive pre-processing)
\item
theorems in $THM\ list$ (or $THM$) parameter (after context sensitive pre-processing)
\end{itemize}

\vfill

Rewriting continues until no more rewrites are possible (unless {\bf once}).
}%\small

\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercises 5:
Rewriting with the Subgoal Package
\end{center}
\vfill
{\small
\begin{enumerate}
\item
set a goal from the examples on set theory, e.g.:
=SML
set_goal([],⌜a \ (b ∩ c) = (a \ b) ∪ (a \ c)⌝);
=TEX
\item
rewrite the goal using the current proof context:
=SML
a (rewrite_tac[]);
=TEX
\item
step back using undo:
=SML
undo 1;
=TEX
\item
now try rewriting without using the proof context:
=GFT
a (pure_rewrite_tac[]);
=TEX
(this should fail)
\end{enumerate}
}%\small
\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercises 5 - Continued
\end{center}
\vfill
{\small
\begin{enumerate}
\setcounter{enumi}{4}
\item
try rewriting one layer at a time:
=SML
a (once_rewrite_tac[]);
=TEX
repeat until it fails.
\item
now try rewriting with specific theorems:
=SML
set_goal([],⌜a \ (b ∩ c) = (a \ b) ∪ (a \ c)⌝);
a (pure_rewrite_tac[sets_ext_clauses]);
a (pure_rewrite_tac[set_dif_def]);
a (pure_rewrite_tac[∩_def, ∪_def]);
a (pure_rewrite_tac[set_dif_def]);
=TEX
\item
finish the proof by stripping:
=SML
a (REPEAT strip_tac);
=TEX
\item
extract the theorem
=SML
top_thm();
=TEX
\item repeat the above then try repeating:
=SML
pop_thm();
=TEX
\end{enumerate}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercises 6:
Combining Forward and Backward Proof
\end{center}
\vfill
{\small
Prove the following results by rewriting using the goal package:
{\tiny for each example try the previous methods to see how they fail before following the hint
}%\tiny
\begin{enumerate}
\item :
=SML
set_goal([],⌜x + y = y + x⌝);
=TEX
\item :
=SML
set_goal([],⌜x + y + z = (x + y) + z⌝);
(* hint : try using plus_assoc_thm *)
=TEX
\item :
=SML
set_goal([],⌜z + y + x = y + z + x⌝);
(* hint : try using plus_assoc_thm1 *)
=TEX
\item :
=SML
set_goal([],⌜x + y + z = y + z + x⌝);
(* hint : try using ∀_elim with plus_assoc_thm1 *)
=TEX
\item :
=SML
set_goal([],⌜x + y + z + v = y + v + z + x⌝);
(* hint : try using ∀_elim with plus_order_thm *)
=TEX
\end{enumerate}
}%\small
\vfill
\end{slide}

% =====================================================================

{\small
\Slide
\begin{center}
\bf Exercises 6: Solutions
\end{center}
\vfill
\begin{enumerate}
\item :
=SML
set_goal([],⌜x + y = y + x⌝);
a (rewrite_tac[]);
=TEX
\item :
=SML
set_goal([],⌜x + y + z = (x + y) + z⌝);
a (rewrite_tac[plus_assoc_thm]);
=TEX
\item :
=SML
set_goal([],⌜z + y + x = y + z + x⌝);
a (rewrite_tac[plus_assoc_thm1]);
=TEX
\item :
=SML
set_goal([],⌜x + y + z = y + z + x⌝);
a (rewrite_tac[∀_elim ⌜y⌝ plus_assoc_thm1]);
=TEX
\item :
=SML
set_goal([],⌜x + y + z + v = y + v + z + x⌝);
a (rewrite_tac[∀_elim ⌜x⌝ plus_order_thm]);
=TEX
\end{enumerate}
\vfill
\end{slide}
}%\small

% =====================================================================

\Slide
\begin{center}
\bf Stripping
\end{center}
\vfill
\raggedright
\begin{itemize}
\item
``stripping'' facilities incorporate automatic propositional reasoning and enable domain specific knowledge to be invoked automatically during proof.
\item
$strip\_tac$ processes the conclusion of the current goal
\item
When new assumptions are created, by $strip\_tac$ or otherwise, they are normally stripped before being entered into the assumption list.
\item
Stripping of assumptions is different from stripping of conclusions.
\end{itemize}
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Stripping Conclusions (concl's)
\end{center}
\vfill
{\small
\begin{enumerate}
\item
apply conclusion stripping conversions from proof context
\item
if no conversion applies then attempt one of the following:
\begin{enumerate}
\item :
=GFT
	.. ?⊢ ∀x⦁ P x ===> .. ?⊢ P x'
=TEX
\item :
=GFT
	.. ?⊢ P1 ∧ P2 ===>
		.. ?⊢ P1 and .. ?⊢ P2 (two subgoals)
=TEX
\item :
=GFT
	.. ?⊢ P1 ⇒ P2 ===>
		strip_asm_tac(P1), .. ?⊢ P2
=TEX
\end{enumerate}
\item
then check if:
\begin{enumerate}
\item conclusion of the goal is ⌜T⌝
\item conclusion is in the assumptions
\end{enumerate}
if so, prove the result
\end{enumerate}
}%\small
\vfill
\end{slide}

% =====================================================================

{\small
\Slide
\begin{center}
\bf Stripping Assumptions (asm's)
\end{center}
\vfill
\begin{enumerate}
\item
Repeat the following transformations until no further changes occur:
apply assumption stripping conversions from proof context
\begin{enumerate}
\item :
apply assumption stripping conversions from proof context
\item :
=GFT
	∃x⦁ P x ⊢? .. ===> P x' ⊢? ..
=TEX
\item :
=GFT
	P1 ∨ P2 ⊢? .. ===>
		P1 ⊢? .. and P2 ⊢? .. (two subgoals)
=TEX
\item :
=GFT
	P1 ∧ P2 ⊢? .. ===>
		P1, P2 ⊢? .. (two assumptions)
=TEX
\end{enumerate}
\item
then for each resulting assumption, check if:
\begin{enumerate}
\item assumption = F
\item assumption = concl
\item contradicts an existing assumption
\end{enumerate}
if so, prove the result.
\item
also check if:
\begin{enumerate}
\item assumption = T
\item is same as an existing assumption
\end{enumerate}
if so, discard the assumption.
\end{enumerate}
\vfill
\end{slide}
}%\small

% =====================================================================

\Slide
\begin{center}
\bf Exercises 7: Stripping
\end{center}
\vfill
{\small
\begin{itemize}
\item
Use the examples from Principia Mathematica \& ZRM given earlier, e.g.:
=SML
	set_goal([],⌜p ∧ q ⇒ (p ⇔ q)⌝);
=TEX
with
\begin{enumerate}
\item :
=SML
	a strip_tac;
=TEX
\item and/or:
=SML
	a step_strip_tac;
=TEX
\end{enumerate}
\item
Observe the steps taken and try to identify the reasons for discharge of subgoals.
\item
Select the weakest ``proof context'':
=SML
	push_pc"initial";
=TEX
then retry the examples (or previous exercises).
\item
When you have finished restore the original proof context by:
=SML
	pop_pc();
=TEX
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Induction
\end{center}
\vfill
Induction principles can be expressed as theorems in Higher Order Logic, e.g.:
\vfill
{\small
\begin{itemize}
\item $induction\_thm$
=GFT
	⊢ ∀ p⦁	p 0	∧
	  (∀ m⦁ p m ⇒ p (m + 1))
	⇒	(∀ n⦁ p n) : THM
=TEX
\item $cov\_induction\_thm$
=GFT
	⊢ ∀ p⦁	(∀ n⦁ (∀ m⦁ m < n ⇒ p m) ⇒ p n)
	⇒	(∀ n⦁ p n) : THM
=TEX
\item $list\_induction\_thm$
=GFT
	⊢ ∀ p⦁	p [] ∧
	  (∀ list⦁ p list ⇒ (∀ x⦁ p (Cons x list)))
	⇒	(∀ list⦁ p list) : THM
=TEX
\end{itemize}
}%\small
\vfill
Using $∀\_elim$ and $all\_β\_rule$ these can be specialised for use in forward proofs.
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Induction Tactics
\end{center}
\vfill
{\small
Special tactics are available to facilitate the use\\
of induction principles:
\begin{itemize}
\item induction over natural numbers using\\
$induction\_tac$
\def\FruleLeftWidth{0.57\textwidth}
\def\FruleRightWidth{0.33\textwidth}
=FRULE 2
induction_tac⌜x⌝
├
{Γ} t
├
{Γ} t[0/x]; strip{t, Γ} t[x+1/x]
=TEX
\item induction over natural numbers using\\
$cov\_induction\_tac$
\def\FruleLeftWidth{0.57\textwidth}
\def\FruleRightWidth{0.33\textwidth}
=FRULE 2
cov_induction_tac⌜x⌝
├
{Γ} t
├
strip{⌜∀m⦁ m < x ⇒ t[m/x]⌝, Γ} t
=TEX
\item induction over lists using\\
$list\_induction\_tac$
\def\FruleLeftWidth{0.574\textwidth}
\def\FruleRightWidth{0.326\textwidth}
=FRULE 2
list_induction_tac⌜x⌝
├
{Γ} t
├
{Γ}t[[]/x]; strip{t, Γ} t[Cons h x/x]
=TEX
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Induction - Example (I)
\end{center}
\vfill
Prove the associativity of append.
\vfill
{\small
=SML
set_goal([],⌜∀l1 l2 l3:'a LIST ⦁
	(l1 @ l2) @ l3 = l1 @ (l2 @ l3)⌝);
(* remove universal quantifiers *)
a (REPEAT strip_tac);
=GFT ProofPower output
(* *** Goal "" *** *)

(* ?⊢ *)  ⌜(l1 @ l2) @ l3 = l1 @ l2 @ l3⌝
=SML
(* induct on ⌜l1⌝ *)
a (list_induction_tac ⌜l1⌝);
=GFT ProofPower output
(* *** Goal "2" *** *)

(*  1 *)  ⌜(l1 @ l2) @ l3 = l1 @ l2 @ l3⌝

(* ?⊢ *)  ⌜∀ x⦁ (Cons x l1 @ l2) @ l3
		= Cons x l1 @ l2 @ l3⌝

(* *** Goal "1" *** *)

(* ?⊢ *)  ⌜([] @ l2) @ l3 = [] @ l2 @ l3⌝
=TEX
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
{\bf Induction Example (II)}
\end{center}
\vfill
{\small
=SML
a (rewrite_tac [append_def]);
=GFT ProofPower output
Tactic produced 0 subgoals:
Current goal achieved, next goal is:

(* *** Goal "2" *** *)

(*  1 *)  ⌜(l1 @ l2) @ l3 = l1 @ l2 @ l3⌝

(* ?⊢ *)  ⌜∀ x⦁ (Cons x l1 @ l2) @ l3
		= Cons x l1 @ l2 @ l3⌝
=TEX
\vfill
=SML
a (asm_rewrite_tac [append_def]);
val append_assoc_thm = pop_thm();
=GFT ProofPower output
Tactic produced 0 subgoals:
Current and main goal achieved
val append_assoc_thm =
 ⊢ ∀ l1 l2 l3⦁ (l1 @ l2) @ l3 = l1 @ l2 @ l3 : THM
=TEX
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercises 8: Induction
\end{center}
\vfill
\begin{enumerate}
\item
Appending the empty list has no effect:
=SML
set_goal([], ⌜∀l1 ⦁ l1 @ [] = l1⌝);
=TEX
\item
``Reverse'' distributes over ``@'' (sort of):
=SML
set_goal([], ⌜∀l1 l2 ⦁
  Rev (l1 @ l2) = (Rev l2) @ (Rev l1)⌝);
=TEX
\item
``Map'' distributes over ``@'':
=SML
set_goal([], ⌜∀f l1 l2 ⦁
  Map f (l1 @ l2) = (Map f l1) @ (Map f l2)⌝);
=TEX
\item
``Length'' distributes over ``@'':
=SML
set_goal([], ⌜∀l1 l2⦁ Length (l1 @ l2)
	= Length l1 + Length l2⌝);
=TEX
\end{enumerate}
\vfill
\end{slide}

% =====================================================================

{\tiny
\Slide
\begin{center}
\bf Exercises 8: Solutions
\end{center}
\vfill
=SML
set_goal([],⌜∀l1 ⦁ l1 @ [] = l1⌝);		(* no. 1 *)
a strip_tac;
a (list_induction_tac ⌜l1⌝
  THEN asm_rewrite_tac [append_def]);
val empty_append_thm = pop_thm();
=TEX
=SML
set_goal([],⌜∀l1 l2 ⦁ Rev (l1 @ l2) =
	(Rev l2) @ (Rev l1)⌝);	(* no. 2 *)
a (REPEAT strip_tac);
a (list_induction_tac ⌜l1⌝ THEN asm_rewrite_tac
  [append_assoc_thm, empty_append_thm,
	append_def, rev_def]);
val rev_distrib_thm = pop_thm();
=TEX
=SML
set_goal([],⌜∀f l1 l2 ⦁ Map f (l1 @ l2) =
	(Map f l1) @ (Map f l2)⌝);	(* no. 3 *)
a (REPEAT strip_tac);
a (list_induction_tac ⌜l1⌝ THEN asm_rewrite_tac
  [map_def, empty_append_thm, append_def]);
val rev_distrib_thm = pop_thm();
=TEX
=SML
set_goal([],⌜∀l1 l2⦁ Length (l1 @ l2) =
	Length l1 + Length l2⌝);	(* no. 4 *)
a (REPEAT strip_tac);
a (list_induction_tac ⌜l1⌝ THEN asm_rewrite_tac
  [append_def, length_def, plus_assoc_thm]);
val length_distrib_thm = pop_thm();
=TEX
\vfill
\end{slide}
}%\tiny

% =====================================================================

\Slide
\begin{center}
\bf TACTICALs and other -ALs
\end{center}
{\small
\vfill
\begin{itemize}
\item
TACTICALs may be used to combine the available tactics.
\item
Expressions using TACTICALs may be used directly in proofs, e.g.:
=GFT
	a (REPEAT strip_tac);
=TEX
\item
named tactics may be defined using TACTICALs:
=SML
	val repeat_strip_tac = REPEAT strip_tac;
=TEX
\item
TACTICALs may be used to define parameterised tactics:
=SML
	fun list_induct_tac t = REPEAT strip_tac
			THEN list_induction_tac t;
=TEX
\item
tacticals usually have capitalised names ending in ``\_T'', though the most common (e.g. REPEAT, THEN) have aliases omitting the ``\_T''
\item
other higher order functions are available:

conversionals (\_C suffix)\\
THM\_TACTICALs (\_THEN suffix)\\
THM\_TACTICAL combinators (\_TTCL suffix)
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Commonly used TACTICALs
\end{center}
{\small
\vfill
\begin{itemize}
\item
REPEAT - takes a tactic and returns a tactic which repeats that tactic until it fails.

If goal splits occur the repeating continues on all subgoals.

\item

THEN - an infix tactical which composes two tactics together.
The second tactic is applied to all subgoals arising from the first tactic.
If any applications of the operand tactics fail then the resulting tactic fails.

\item

ORELSE - an infix tactical which attempts to apply its first argument, and if this fails applies its second argument.
If both arguments fail then the resulting tactic fails.

\item
TRY\_T - a tactical taking one argument which will do nothing (but succeed!) if it argument tactic fails.

\item
THEN$\_$TRY - variant on THEN which does not fail even if the second tactic fails.

t1 THEN$\_$TRY t2 = t1 THEN (TRY\_T t2)
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercises 9: TACTICALs
\end{center}
{\small
\vfill
\begin{enumerate}
\item
Write a tactic which does $strip\_tac$ three times.

test it on:
=SML
set_goal([],⌜(a ⇒ b ⇒ c) ⇒ a ⇒ b ⇒ c⌝);
set_goal([],⌜(a ⇒ b) ⇒ a ⇒ c⌝);
=TEX
\item
Write a tactic which does $strip\_tac$ up to 3 times.

Try it on the same examples.
\item
Write a tactic which takes two arguments:
\begin{itemize}
\item
a term which is a variable
\item
a list of theorems
\end{itemize}
and performs an inductive proof of a theorem concerning lists by:
\begin{itemize}
\item
stripping the goal
\item
inducting on the variable
\item
rewriting with the assumptions and the list of theorems
\end{itemize}

Use it to shorten the earlier proofs about lists.
\end{enumerate}
}%\small
\vfill
\end{slide}

% =====================================================================
\Slide
\begin{center}
\bf Exercises 9: Solutions
\end{center}
{\tiny
\vfill
=SML
(* no. 1 *)
val strip3_tac = strip_tac THEN strip_tac THEN strip_tac;
set_goal([],⌜(a ⇒ b ⇒ c) ⇒ a ⇒ b ⇒ c⌝);
a strip3_tac;
=TEX
\vfill
=SML
(* no. 2 *)
val stripto3_tac = strip_tac THEN_TRY strip_tac
		THEN_TRY strip_tac;
set_goal([],⌜(a ⇒ b) ⇒ a ⇒ c⌝);
a stripto3_tac;
=TEX
\vfill
=SML
(* no. 3 *)
fun list_induct_tac var thl =
	REPEAT strip_tac
	THEN list_induction_tac var
	THEN_TRY asm_rewrite_tac thl;

set_goal([],⌜∀l1 l2 l3 ⦁
  (l1 @ l2) @ l3 = l1 @ (l2 @ l3)⌝);
a (list_induct_tac ⌜l1:'a LIST⌝ [append_def]);
val append_assoc_thm = pop_thm ();

set_goal([], ⌜∀l1:'a LIST ⦁ l1 @ [] = l1⌝);
a (list_induct_tac ⌜l1:'a LIST⌝ [append_def]);
val empty_append_thm = pop_thm();
=TEX
=IGN
set_goal([], ⌜∀l1 l2:'a LIST  ⦁
  Rev (l1 @ l2) = (Rev l2) @ (Rev l1)⌝);
a (list_induct_tac ⌜l1:'a LIST⌝
  [append_def, rev_def, append_assoc_thm, empty_append_thm]);
set_goal([], ⌜∀f; l1 l2:'a LIST⦁
  Map f (l1 @ l2) = (Map f l1) @ (Map f l2)⌝);
a (list_induct_tac ⌜l1:'a LIST⌝
  [append_def, map_def, append_assoc_thm, empty_append_thm]);
set_goal([], ⌜∀l1 l2:'a LIST⦁ Length (l1 @ l2)
	= Length l1 + Length l2⌝);
a (list_induct_tac ⌜l1:'a LIST⌝
  [append_def, length_def, append_assoc_thm,
  empty_append_thm, plus_assoc_thm]);
=TEX
}%\tiny
\vfill
\end{slide}
=TEX
% =====================================================================

\Slide
\begin{center}
\bf More Predicate Calculus Tactics (I) \\ $strip\_asm\_tac$\\
\end{center}
\vfill
{\small
\begin{itemize}
\item $\bf strip\_asm\_tac$ strips a theorem into the assumptions in the
same way that $strip\_tac$ adds new assumptions
=FRULE 2 Tactic
strip_asm_tac
(⊢ c)
├
{ Γ } t
├
{strip c, Γ } t
=TEX

\item a {\bf case split} results if the conclusion of the theorem is a disjunction

\item names ending in $\bf \_cases\_thm$ indicate theorems designed for use with $strip\_asm\_tac$ for case splits:

=GFT
ℕ_cases_thm	⊢ ∀ m⦁ m = 0 ∨ (∃ i⦁ m = i + 1)
less_cases_thm	⊢ ∀ m n⦁ m < n ∨ m = n ∨ n < m
=TEX

\item use $[list\_]∀\_elim$ to specialise the $\_cases\_thm$
\end{itemize}
}%\small

\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf $strip\_asm\_tac$: example\\
\end{center}
\vfill
{\small
=SML
set_goal([], ⌜(if x = 0 then 1 else x) > 0⌝);
=TEX
\vfill
=SML
∀_elim⌜x⌝ℕ_cases_thm;
=TEX
\vfill
=GFT ProofPower Output
val it = ⊢ x = 0 ∨ (∃ i⦁ x = i + 1) : THM
=TEX
\vfill
=SML
a(strip_asm_tac(∀_elim⌜x⌝ℕ_cases_thm));
=TEX
\vfill
=GFT ProofPower Output
(* *** Goal "2" *** *)

(*  1 *)  ⌜x = i + 1⌝

(* ?⊢ *)  ⌜(if x = 0 then 1 else x) > 0⌝

(* *** Goal "1" *** *)

(*  1 *)  ⌜x = 0⌝

(* ?⊢ *) ⌜(if x = 0 then 1 else x) > 0⌝
=TEX
}%\small

\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf More Predicate Calculus Tactics (II) \\ $cases\_tac$\\
\end{center}
\vfill
{\small
\begin{itemize}
\item
$\bf cases\_tac⌜c⌝$ lets you reason by cases according as a chosen
condition $c$ is true or false:
=FRULE 2 Tactic
cases_tac
⌜c:BOOL⌝
├
{ Γ } t
├
{strip c, Γ } t;
{strip ¬c, Γ } t
=TEX
\item
$cases\_tac⌜c:BOOL⌝$ is effectively the same as:
=GFT
strip_asm_tac(∀_elim⌜c:BOOL⌝(prove_rule[]⌜∀b⦁b ∨ ¬b⌝));
=TEX
but it's less to type and quicker.
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf $cases\_tac$: example\\
\end{center}
\vfill
{\small
=SML
set_goal([], ⌜(if x < y + 1 then x else y) < y + 1⌝);
=TEX
\vfill
=SML
a(cases_tac ⌜x < y + 1⌝);
=TEX
\vfill
=GFT ProofPower Output
(* *** Goal "2" *** *)

(*  1 *)  ⌜¬ x < y + 1⌝

(* ?⊢ *)  ⌜(if x < y + 1 then x else y) < y + 1⌝

(* *** Goal "1" *** *)

(*  1 *)  ⌜x < y + 1⌝

(* ?⊢ *)  ⌜(if x < y + 1 then x else y) < y + 1⌝
=TEX
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf More Predicate Calculus Tactics (III) \\ $swap\_asm\_concl\_tac$\\
\end{center}
\vfill
{\small
\begin{itemize}
\item
$\bf swap\_asm\_concl\_tac$ lets you interchange (the negations) of
an assumption and a conclusion
=FRULE 2 Tactic
swap_asm_concl_tac
⌜t1⌝
├
{ Γ, t1 } t2
├
{strip ¬t2, Γ } ¬t1
=TEX
\item Often used to rewrite one assumption with another
\item Also useful when the conclusion is a negated equation
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf $swap\_asm\_concl\_tac$: example\\
\end{center}
\vfill
{\small
=SML
set_goal([], ⌜(∀x y⦁x ≤ y ⇒ P(x,y)) ∧ x = y ⇒ P(x,y)⌝);
a(strip_tac);
=TEX
\vfill
=GFT ProofPower Output
(*  2 *)  ⌜∀ x y⦁ x ≤ y ⇒ P (x, y)⌝
(*  1 *)  ⌜x = y⌝

(* ?⊢ *)  ⌜P (x, y)⌝
=TEX
\vfill
=GFT ProofPower Output
=SML
a(list_spec_nth_asm_tac 2 [⌜x⌝, ⌜y⌝]);
=TEX
\vfill
=GFT ProofPower Output
(*  3 *)  ⌜∀ x y⦁ x ≤ y ⇒ P (x, y)⌝
(*  2 *)  ⌜x = y⌝
(*  1 *)  ⌜¬ x ≤ y⌝

(* ?⊢ *)  ⌜P (x, y)⌝
=SML
a(swap_asm_concl_tac ⌜¬ x ≤ y⌝);
=TEX
=GFT ProofPower Output
(*  3 *)  ⌜∀ x y⦁ x ≤ y ⇒ P (x, y)⌝
(*  2 *)  ⌜x = y⌝
(*  1 *)  ⌜¬ P (x, y)⌝

(* ?⊢ *)  ⌜x ≤ y⌝
=TEX
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf More Predicate Calculus Tactics (IV) \\ $lemma\_tac$\\
\end{center}
\vfill
{\small
\begin{itemize}
\item
$\bf lemma\_tac$ lets you state and prove an ``in-line'' lemma
=FRULE 2 Tactic
lemma_tac
⌜lemma⌝
├
{ Γ } conc
├
{ Γ } lemma;
{strip lemma, Γ } conc
=TEX
\item Gives a more natural feel to many proofs
\item If just one tactic will prove the lemma then $\bf THEN1$ is a
convenient way of applying it
\item $tac1\,THEN1\,tac2$ first applies $tac1$
and then applies $tac2$ to the first resulting subgoal
=TEX
=TEX
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf $lemma\_tac$: example\\
\end{center}
\vfill
{\small
=TEX
=SML
set_goal([], ⌜(∀x y⦁x ≤ y ⇒ P(x,y)) ∧ x = y ⇒ P(x,y)⌝);
a(strip_tac);
=TEX
\vfill
=GFT ProofPower Output
(*  2 *)  ⌜∀ x y⦁ x ≤ y ⇒ P (x, y)⌝
(*  1 *)  ⌜x = y⌝

(* ?⊢ *)  ⌜P (x, y)⌝
=TEX
\vfill
=SML
a(lemma_tac⌜x ≤ y⌝);
=GFT ProofPower Output
(* *** Goal "2" *** *)
(*  3 *)  ⌜∀ x y⦁ x ≤ y ⇒ P (x, y)⌝
(*  2 *)  ⌜x = y⌝
(*  1 *)  ⌜x ≤ y⌝

(* ?⊢ *)  ⌜P (x, y)⌝

(* *** Goal "1" *** *)
(*  2 *)  ⌜∀ x y⦁ x ≤ y ⇒ P (x, y)⌝
(*  1 *)  ⌜x = y⌝

(* ?⊢ *)  ⌜x ≤ y⌝
=TEX
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Processing of ``New'' Assumptions
\end{center}
\vfill
{\small
\begin{itemize}
\item
Tactics which add new assumptions normally do so with $strip\_asm\_tac$.

E.g., $strip\_tac$, $cases\_tac$, $lemma\_tac$ work like this.

{\tiny
Sometimes, this causes more case splitting than you might expect.
}%\tiny
\item
if $xxx\_tac$ adds new assumptions, then often $XXX\_T$ exists to
allow the new assumption to be used some other way.

\item
commonly, $XXX\_T$ has an argument of type $THM -> TACTIC$ telling
what to do with the new assumption.

E.g., $cases\_tac$ is the same as $CASES\_T\ strip\_asm\_tac$.

\item Other useful $THM -> TACTICS$ include:

\begin{tabular}{lp{3.45in}}
$asm\_tac(⊢ t)$ & put $t$ into the assumptions as is (good for debugging) \\
$ante\_tac$(⊢ t) & conclusion, $c$, becomes $t ⇒ c$\\
$rewrite\_thm\_tac$(⊢ t) & rewrite with $⊢ t$
\end{tabular}
\end{itemize}
}%\small

{\tiny
Take care with $rewrite\_thm\_tac$: it discards the new assumption after
rewriting with it. It's safe in examples like:
=GFT SML
set_goal([], ⌜(if x < y + 1 then x else y) < y + 1⌝);
a(CASES_T ⌜x < y + 1⌝ rewrite_thm_tac);
=GFT ProofPower Output
Tactic produced 0 subgoals:
Current and main goal achieved
=TEX
}%\tiny
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercises 10: $strip\_asm\_tac$ etc.\\
\end{center}
\vfill
{\small
\begin{enumerate}
\item Use $strip\_asm\_tac$ (with $∀\_elim$ and $ℕ\_cases\_thm$) or $cases\_tac$
to prove
{\tiny
\begin{enumerate}
\item
=INLINEFT
∀x⦁(if x = 0 then 1 else x) > 0
=TEX
\item
=INLINEFT
∀x y⦁(if x < y + 1 then x else y) < y + 1
=TEX
\item
=INLINEFT
∀a b⦁a ≤ (if a ≤ b then b else a)
=TEX
\item
=INLINEFT
∀a⦁a = 0 ∨ 1 ≤ a
=TEX
\end{enumerate}
}%\tiny
\item
Using {\it(i)} $swap\_asm\_concl\_tac$ and {\it(ii)} $lemma\_tac$ give two different
proofs of each of:
{\tiny
\begin{enumerate}
\item
=INLINEFT
(∀x y⦁x ≤ y ⇒  P(x, y)) ⇒ (∀x y⦁x = y ⇒  P(x, y))
=TEX
\item
=INLINEFT
(∀x y⦁f x ≤ f y ⇒  x ≤ y) ⇒ (∀x y⦁f x = f y ⇒ x ≤ y)
=TEX
\end{enumerate}
}%\tiny
\end{enumerate}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercises 10/1 : Solutions\\
\end{center}
\vfill
{\tiny
=SML
					(* (a) *)
set_goal([], ⌜∀x⦁(if x = 0 then 1 else x) > 0⌝);
a(REPEAT strip_tac);
a(strip_asm_tac(∀_elim⌜x⌝ℕ_cases_thm) THEN asm_rewrite_tac[]);
pop_thm();
=TEX
=SML
					(* (b) *)
set_goal([], ⌜∀x y⦁(if x < y + 1 then x else y) < y + 1⌝);
a(REPEAT strip_tac);
a(CASES_T ⌜x < y + 1⌝ rewrite_thm_tac);
pop_thm();
=TEX
=SML
					(* (c) *)
set_goal([], ⌜∀a b⦁a ≤ (if a ≤ b then b else a)⌝);
a(REPEAT strip_tac);
a(CASES_T ⌜a ≤ b⌝ rewrite_thm_tac);
pop_thm();
=TEX
=SML
					(* (d) *)
set_goal([], ⌜∀a⦁a = 0 ∨ 1 ≤ a⌝);
a(strip_tac);
a(strip_asm_tac(∀_elim⌜a⌝ℕ_cases_thm) THEN asm_rewrite_tac[]);
pop_thm();
=TEX
}%\tiny
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercises 10/2 : Solutions\\
\end{center}
\vfill
{\tiny
With $swap\_asm\_concl\_tac$:
=SML
set_goal([], 				(* (i)(a) *)
 ⌜(∀x y⦁x ≤ y ⇒  P(x, y)) ⇒ (∀x y⦁x = y ⇒  P(x, y))⌝);
a(REPEAT strip_tac);
a(list_spec_nth_asm_tac 2[⌜x⌝, ⌜y⌝]);
a(swap_asm_concl_tac ⌜¬ x ≤ y⌝ THEN asm_rewrite_tac[]);
pop_thm();
=TEX
=SML
set_goal([], 				(* (i)(b) *)
 ⌜(∀x y⦁f x ≤ f y ⇒  x ≤ y) ⇒ (∀x y⦁f x = f y ⇒ x ≤ y)⌝);
a(REPEAT strip_tac);
a(list_spec_nth_asm_tac 2[⌜x⌝, ⌜y⌝]);
a(swap_asm_concl_tac ⌜¬ f x ≤ f y⌝ THEN asm_rewrite_tac[]);
pop_thm();
=TEX
With $lemma\_tac$:
=SML
set_goal([], 				(* (ii)(a) *)
 ⌜(∀x y⦁x ≤ y ⇒  P(x, y)) ⇒ (∀x y⦁x = y ⇒  P(x, y))⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜x ≤ y⌝ THEN1 asm_rewrite_tac[]);
a(list_spec_nth_asm_tac 3 [⌜x⌝, ⌜y⌝]);
pop_thm();
=TEX
=SML
set_goal([], 				(* (ii)(b) *)
 ⌜(∀x y⦁f x ≤ f y ⇒  x ≤ y) ⇒ (∀x y⦁f x = f y ⇒ x ≤ y)⌝);
a(REPEAT strip_tac);
a(lemma_tac⌜f x ≤ f y⌝ THEN1 asm_rewrite_tac[]);
a(list_spec_nth_asm_tac 3 [⌜x⌝, ⌜y⌝]);
pop_thm();
=TEX
}%\tiny
\vfill
\end{slide}


% =====================================================================

\Slide
\begin{center}
\bf Forward Chaining (I)\\
\end{center}
\vfill
{\small
\begin{itemize}
\item
{\bf Forward chaining} refers to a group of tactics for reasoning
forward from the assumptions.
\item
Based on a rule, $\bf fc\_rule$, which uses a list of implications
to generate a list of new theorems from a list of ``seed'' theorems.
Arguments are two lists:

%{\tiny
\begin{tabular}{ll}
{\bf Implications} & maybe universally quantified: \\ & \hskip 0.25in
=INLINEFT
[Γ⋎1 ⊢ ∀x1 x2 ...⦁A⋎1 ⇒ B⋎1, ...]
=TEX
\\
{\bf Seeds} & any form: \\ & \hskip 0.25in
=INLINEFT
[Γ⋎1 ⊢ c⋎1, ...]
=TEX
\end{tabular}
%}%\tiny
\item
For each implication,
=INLINEFT
⊢ ∀x1 x2 ...⦁A ⇒ B
=TEX
\ and for each seed
=INLINEFT
⊢ c
=TEX
, $fc\_rule$ determines whether $A$ can be specialised
to give $c$ and if so it includes the corresponding specialisation
of $B$ in its result.
For example:
=SML
(fc_rule : THM list -> THM list -> THM list)
	[asm_rule⌜∀x⦁x > 10 ⇒ P x⌝,
	 asm_rule⌜∀y⦁y < 10 ⇒ Q y⌝]
	[prove_rule[]⌜101 > 10⌝,
	 prove_rule[]⌜4 < 10⌝];
=GFT ProofPower Output
val it = [∀ y⦁ y < 10 ⇒ Q y ⊢ Q 4,
	∀ x⦁ x > 10 ⇒ P x ⊢ P 101] : THM list
=TEX
\end{itemize}
}%\small

\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Forward Chaining (II)\\
\end{center}
\vfill
{\small
\begin{itemize}
\item
In practice, don't call $fc\_rule$ directly. Instead use
one of the forward chaining tactics:
$$ [all\_] [asm\_] fc\_tac $$
$$ [all\_] [asm\_] forward\_chain\_tac $$
\item
All have type
$$ THM\,list\,->\,TACTIC $$
\item
$asm\_$ variants take implications to be
the argument together with the assumptions.
Other variants just use list given as argument.
In all cases the seeds are the assumptions.
\item
Variants without $all\_$ take one pass over the seeds for each implication.
Variants with $all\_$ add any new implications to the
list of implications and loop until no new results can be generated.
\item
New theorems deduced are stripped into the assumptions.  The $all\_$ variants
only strip in theorems which are not themselves implications.
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Forward Chaining (III) \\
\end{center}
\vfill
{\small
For example:
=GFT SML
set_goal([], ⌜∀a b c d⦁a ≤ b ∧ b ≤ c ∧ c ≤ d ⇒ a ≤ d⌝);
a(REPEAT strip_tac);
=GFT ProofPower Output
(*  3 *)  ⌜a ≤ b⌝
(*  2 *)  ⌜b ≤ c⌝
(*  1 *)  ⌜c ≤ d⌝

(* ?⊢ *)  ⌜a ≤ d⌝
=GFT SML
a(fc_tac[≤_trans_thm]);
=GFT ProofPower Output
(*  6 *)  ⌜a ≤ b⌝
(*  5 *)  ⌜b ≤ c⌝
(*  4 *)  ⌜c ≤ d⌝
(*  3 *)  ⌜∀ n⦁ b ≤ n ⇒ a ≤ n⌝
(*  2 *)  ⌜∀ n⦁ c ≤ n ⇒ b ≤ n⌝
(*  1 *)  ⌜∀ n⦁ d ≤ n ⇒ c ≤ n⌝

(* ?⊢ *)  ⌜a ≤ d⌝
=GFT SML
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
=GFT ProofPower Output
Tactic produced 0 subgoals:
Current and main goal achieved
=TEX
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Forward Chaining (IV)\\
\end{center}
\vfill
{\small
\begin{itemize}
\item
Many useful properties are naturally formulated as universally
quantified implications:
=GFT
≤_trans_thm	⊢ ∀ m i n⦁ m ≤ i ∧ i ≤ n ⇒ m ≤ n
less_trans_thm	⊢ ∀ m i n⦁ m < i ∧ i < n ⇒ m < n
mod_less_thm	⊢ ∀ m n⦁ 0 < n ⇒ m Mod n < n
=TEX
Forward chaining saves having to specialise such facts explicitly.
\item
A function, $fc\_canon$, is used to generate implications
from the arguments to the forward chaining. E.g.,
=GFT
⊢ (A ∧ B) ∨ C
⊢ ∀ m i n⦁ m ≤ i ∧ i ≤ n ⇒ m ≤ n
=TEX
are treated as:

=GFT
⊢ ¬ B ⇒ ¬ C ⇒ F
⊢ ¬ A ⇒ ¬ C ⇒ F
⊢ ∀ n i m⦁ m ≤ i ⇒ i ≤ n ⇒ ¬ m ≤ n ⇒ F
=TEX
\item
The $⇒ F$ part produced by $fc\_canon$
is simplified away when the new theorem is stripped
into the assumptions.
\item
The new theorems stripped into the assumptions are made as general
as possible by universally quantifying them over any free variables
which do not appear in the goal.
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercises 11 : Forward Chaining\\
\end{center}
\vfill
{\small
\begin{enumerate}
\item
Experiment with the various $all\_$ and $asm\_$ variants of $fc\_tac$
to prove the following goals:
\begin{enumerate}
\item (using $≤\_trans\_thm$) \\
=INLINEFT
∀a b c d⦁a ≤ b ∧ b ≤ c ∧ c ≤ d ⇒ a ≤ d
=TEX
\item (no theorem required)\\
=INLINEFT
∀X Y Z⦁X ⊆ Y ∧ Y ⊆ Z ⇒ X ⊆ Z
=TEX
\end{enumerate}

In each case, what is the minimum number of applications of
a forward chaining tactic required and why?

\item
Can you use forward chaining to simplify the proof of the
following example from exercises 10:\\
{\tiny
=INLINEFT
(∀x y⦁f x ≤ f y ⇒  x ≤ y) ⇒ (∀x y⦁f x = f y ⇒ x ≤ y)
=TEX
}%\tiny
\end{enumerate}

}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercises 11 : Solutions\\
\end{center}
\vfill
{\tiny
=SML
set_goal([], ⌜∀a b c d⦁a ≤ b ∧ b ≤ c ∧ c ≤ d ⇒ a ≤ d⌝);
					(* 1(a) *)
a(REPEAT strip_tac);
a(all_fc_tac[≤_trans_thm] THEN all_fc_tac[≤_trans_thm]);
pop_thm();
=TEX
=SML
set_goal([], ⌜∀X Y Z⦁X ⊆ Y ∧ Y ⊆ Z ⇒ X ⊆ Z⌝);	(* 1(b) *)
a(REPEAT strip_tac);
a(all_asm_fc_tac[] THEN all_asm_fc_tac[]);
pop_thm();
=TEX
In both cases, at least 2 applications of forward chaining are
needed since a result from one forward chaining pass must be
added to the assumptions to ``seed'' the second pass.
=SML
set_goal([],				(* 2 *)
 ⌜(∀x y⦁f x ≤ f y ⇒  x ≤ y) ⇒ (∀x y⦁f x = f y ⇒ x ≤ y)⌝);
a(REPEAT strip_tac);
a(lemma_tac ⌜f x ≤ f y⌝ THEN1 asm_rewrite_tac[]);
a(all_asm_fc_tac[]);
pop_thm();
=TEX
}%\tiny
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Proof Contexts\\
\end{center}
\vfill
{\small
\begin{itemize}
\item
A {\bf proof context} is a named collection of settings of parameters
for many of the tactics, conversions, rules etc.
\item
Customises many parts of the system including:
{\tiny
\begin{itemize}
\item stripping ($strip\_tac$, $strip\_asm\_tac$ etc.)
\item rewriting ($rewrite\_tac$ etc.)
\item automatic proof ($prove\_tac$, $asm\_prove\_tac$)
\item automatic existence proof ($prove\_∃\_tac$)
\end{itemize}
}%\tiny
\item
Some proof contexts recommended for everyday use:

\begin{tabular}{ll}
predicate calculus & $predicates$ \\
sets & $sets\_ext1$\\
above + lists etc. & $hol2$, $hol$ \\
\end{tabular}

\item use $\bf get\_pcs$ to list the proof context names together with
the theory each proof context belongs to.
\end{itemize}
}%\small

{\tiny
Names with $'$ are {\em component} proof contexts: mainly intended for
use in conjunction with others.\\
Names without $'$ are {\em complete} proof contexts: usable on their own.
}%\tiny

\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Using Proof Contexts\\
\end{center}
\vfill
{\small
\begin{itemize}
\item
Switch proof context for just one tactic, conversion or rule using:

=SML
PC_T : string -> TACTIC -> TACTIC;
PC_T1 : string -> ('a -> TACTIC) -> 'a -> TACTIC;

PC_C : string -> CONV -> CONV;
PC_C1 : string -> ('a -> CONV) -> 'a -> CONV;

pc_rule : string -> ('a -> THM) -> 'a -> THM;
pc_rule1 : string -> ('a -> 'b -> THM) ->
			'a -> 'b -> THM;
=TEX
\item
Work with a proof context over several steps using:
=SML
set_pc : string -> unit;

push_pc : string -> unit;
pop_pc : unit -> unit;
=TEX
\item
Work with multiple merged proof contexts using, e.g:
=SML
MERGE_PCS_T : string list -> TACTIC -> TACTIC;
set_merge_pcs : string list -> unit;
=TEX
etc.
\item
Find out what proof context is in force using:
=SML
print_status : unit -> unit;
=TEX
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================
\Slide
\begin{center}
\bf What's in the proof contexts?\\
\end{center}
\vfill
{\small
=SML
PC_C1 "sets_ext1" rewrite_conv[]
	⌜{(1, 2)} ⊆ {(x, y) | x + 1 ≤ y} ∨ 4 > 5⌝;
=GFT ProofPower Output:
val it = ⊢ {(1, 2)} ⊆ {(x, y)|x + 1 ≤ y} ∨ 4 > 5
   ⇔ (∀ x1 x2⦁ (x1, x2) = (1, 2) ⇒ x1 + 1 ≤ x2)
	∨ 4 > 5 : THM
=SML
PC_C1 "hol2" rewrite_conv[]
	⌜{(1, 2)} ⊆ {(x, y) | x + 1 ≤ y} ∨ 4 > 5⌝;
=GFT ProofPower Output:
val it = ⊢ {(1, 2)} ⊆ {(x, y)|x + 1 ≤ y} ∨ 4 > 5
   ⇔ (∀ x1 x2⦁ x1 = 1 ∧ x2 = 2 ⇒ x1 + 1 ≤ x2) : THM
=TEX
=SML
PC_C1 "hol2" rewrite_conv[]⌜A ∩ A ⊆ B⌝;
=GFT ProofPower Output:
val it = ⊢ A ∩ A ⊆ B ⇔ (∀ x⦁ x ∈ A ⇒ x ∈ B) : THM
=TEX
=SML
PC_C1 "hol" rewrite_conv[]⌜A ∩ A ⊆ B⌝;
=GFT ProofPower Output:
val it = ⊢ A ∩ A ⊆ B ⇔ A ⊆ B : THM
=TEX
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Automatic Proof Procedures\\
\end{center}
{\small
\begin{itemize}

\item
Proof context component accessed via:

{\tiny
\begin{tabular}{lp{3.5in}}
$\bf prove\_tac$ & when the conclusion of a goal is automatically provable on its own\\
$\bf asm\_prove\_tac$ & when the goal is automatically provable using the assumptions\\
$\bf prove\_rule$ & to state and prove a conjecture automatically\\
\end{tabular}
}%\tiny

\item
If you merge several proof contexts, the ``$prove\_tac$''
comes from the last one in the list.
\item
Many proof contexts contain $basic\_prove\_tac$.
It uses rewriting, a simple heuristic for
eliminating equations involving variables, and a few steps of first-order
resolution.

As seen with the theorems from PM and ZRM,
this is useful for simple predicate calculus theorems and for elementary
facts about sets. For example:

=SML
prove_rule[]⌜(∃x⦁ φx) ∨ (∃y⦁ ψy) ⇔ (∃z⦁ φz ∨ ψz)⌝;
prove_rule[]⌜∀a b⦁a ⊆ b ∧ b ⊆ a ⇔ a = b⌝;
=GFT ProofPower Output
val it = ⊢ (∃ x⦁ φ x) ∨ (∃ y⦁ ψ y)
	⇔ (∃ z⦁ φ z ∨ ψ z) : THM
val it = ⊢ ∀ a b⦁ a ⊆ b ∧ b ⊆ a ⇔ a = b : THM
=TEX
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Linear Arithmetic (I)\\
\end{center}
\vfill
{\small
\begin{itemize}
\item
Proof context $\bf lin\_arith$ contains an automatic proof procedure for
{\bf linear arithmetic}.

\item Useful for many simple arithmetic problems. For example,
=SML
pc_rule1 "lin_arith" prove_rule[]
	⌜a ≤ b ∧ a + b < c + a ⇒ a < c⌝;
=GFT ProofPower Output
val it = ⊢ a ≤ b ∧ a + b < c + a ⇒ a < c : THM
=TEX
\item Strictly speaking, ``linear arithmetic'' means terms built up from:

\begin{tabular}{l}
``Atoms'' (numeric literals, variables of type ℕ, etc.) \\
Multiplication by numeric literals \\
Addition \\
$=$, $≤$, $≥$, $<$, $>$ \\
Logical operators \\
\end{tabular}
=TEX
\item E.g. all the following are terms of linear arithmetic:
=GFT
∀a c⦁(∃b⦁a ≥ b ∧ ¬ b < c) ⇒ a ≥ c
∀a b c⦁a + 2*b < 2*a ⇒ b + b < a
∀ x y⦁ ¬ (2*x + y = 4 ∧ 4*x + 2*y = 7)
=TEX
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Linear Arithmetic (II)\\
\end{center}
\vfill
{\small
\begin{itemize}
\item
Rewriting/stripping in $lin\_arith$ processes numeric relations
by ``multiplying out and collecting like terms''.
=SML
pc_rule1 "lin_arith" rewrite_conv[]
	⌜(i + j)*(j + i) ≤ j*j + j⌝;
=GFT ProofPower Output
val it = ⊢ (i + j) * (j + i) ≤ j * j + j
	⇔ i * i + 2 * i * j ≤ j : THM
=TEX
$i * i$, $i * j$ and $j$ now treated as atoms.

So a little more general than ``strict'' linear arithmetic.
\item
=INLINEFT
¬(a < 1 + 2*b ∧ 4*b < 2*a)
=TEX
\ is proved thus:
\end{itemize}

\begin{tabular}{lll}
if &(1) & $a \leq 2*b$ \\
and & (2) & $4*b + 1 \leq 2*a$ \\
\\
then & 2*(1) +(2) & $2*a +4*b + 1 \leq 2*a + 4*b$ \\
whence &  & $1 \leq 0$ \\
whence &  & CONTRADICTION \\
\end{tabular}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercises 12: Proof Contexts\\
\end{center}
\vfill
{\small
\begin{enumerate}
\item
Using $REPEAT\,strip\_tac$ and $asm\_rewrite\_tac$ prove
\begin{description}
\item[]
=INLINEFT
(∀x y⦁f(x, y) = (y, x)) ⇒ ∀x y⦁f(f (x, y)) = (x, y)
=TEX
\end{description}
Apply the tactics one at a time rather than using $THEN$.
Now set the proof context to ``$predicates$'' using $set\_pc$ and prove
it again. What differences do you observe?

Set the proof context back to ``$hol2$'' when you've finished.
\item
Prove the following
\begin{enumerate}
\item
=INLINEFT
{(x, y) | ¬x = 0 ∧ y = 2*x} ⊆ {(x, y) | x < y}
=TEX
\item
=INLINEFT
{(x, y) | x ≥ 2 ∧ y = 2*x} ⊆ {(x, y) | x + 1 < y}
=TEX
\item
=INLINEFT
A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
=TEX
\item
=INLINEFT
∀m⦁{i | m ≤ i ∧ i < m + 3} = {m; m+1; m+2}
=TEX
\item
=INLINEFT
{i | 5*i = 6*i} = {0}
=TEX
\end{enumerate}
\end{enumerate}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercises 12: Solutions\\
\end{center}
\vfill
{\tiny
=SML
					(* 1 *)
set_goal([], ⌜(∀x y⦁f(x, y) = (y, x)) ⇒ ∀x y⦁f(f (x, y)) = (x, y)⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(asm_rewrite_tac[]);
pop_thm();
=TEX
=SML
set_pc"predicates";
set_goal([], ⌜(∀x y⦁f(x, y) = (y, x)) ⇒ ∀x y⦁f(f (x, y)) = (x, y)⌝);
a(REPEAT strip_tac);
a(asm_rewrite_tac[]);
pop_thm();
set_pc"hol2";
=TEX
The second proof is shorter because the proof context $predicates$
does not cause equations between pairs to be split into pairs of equations.
=SML
					(* 2 *)
map (merge_pcs_rule1["hol2", "lin_arith"] prove_rule[]) [
(* (a) *)	⌜{(x, y) | ¬x = 0 ∧ y = 2*x} ⊆ {(x, y) | x < y}⌝,
(* (b) *)	⌜{(x, y) | x ≥ 2 ∧ y = 2*x} ⊆ {(x, y) | x + 1 < y}⌝,
(* (d) *)	⌜∀m⦁{i | m ≤ i ∧ i < m + 3} = {m; m+1; m+2}⌝,
(* (e) *)	⌜{i | 5*i = 6*i} = {0}⌝];
(* (c) *)	pc_rule1 "sets_ext1" prove_rule[]
		⌜A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)⌝;
=TEX
(Alternatively, use the subgoal package and $PC\_T1$.).
}%\tiny
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Case Study: Vending Machine\\
System Model\\
\end{center}
\vfill
{\small
The following paragraphs give a model of a simple vending machine:
=SML
new_theory"vm";
=TEX
ⓈHOLLABPROD VM_State─────────────────
│	takings			: ℕ;
│	stock			: ℕ;
│	price			: ℕ;
│	cash_tendered		: ℕ
■─────────────────────────────

ⓈHOLCONST
│	vm : VM_State → VM_State
├──────────────────
│∀st⦁	vm st
│=	if	stock st = 0
│	then	MkVM_State
│		(takings st) (stock st) (price st) 0
│	else	if cash_tendered st < price st
│	then	st
│	else	if cash_tendered st = price st
│	then	MkVM_State
│		(takings st + cash_tendered st)
│		(stock st - 1) (price st) 0
│	else	MkVM_State
│		(takings st) (stock st) (price st) 0
■
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Case Study: Vending Machine\\
Discussion (I)\\
\end{center}
\vfill
{\small
\begin{itemize}
\item
the state of the vending machine is defined
as a labelled record type $VM\_State$.
\item labelled record type declares {\bf projection functions}:

{\tiny
=GFT Projection Functions
takings:		VM_State → ℕ
stock:		VM_State → ℕ
price:		VM_State → ℕ
cash_tendered:	VM_State → ℕ
=TEX
}%\tiny
If $st$ is a state value, $takings\,st$ is like $st.takings$
in Z or Pascal or Ada.
\item also introduces {\bf constructor functions}:

=GFT Constructor Function
MkVM_State:	ℕ → ℕ → ℕ → ℕ → VM_State
=TEX

If $t$, $s$, $p$, and $ct$ are numbers,
$MkVM\_State\,t\,s\,p\,ct$ is a state value with
those numbers as its components.
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Case Study: Vending Machine\\
Discussion (II)\\
\end{center}
\vfill
{\small
\begin{itemize}
\item
Can test the behaviour of the vending machine model by rewriting.
\item
E.g. introduce a conversion to do this
{\tiny
=SML
val run_vm = rewrite_conv[get_spec⌜vm⌝, get_spec⌜MkVM_State⌝];
=GFT ProofPower Output
val run_vm = fn : CONV
=TEX
}%\tiny
\item Now look at test  cases
{\tiny
=SML
run_vm ⌜vm (MkVM_State 0 20 5 5)⌝;
run_vm ⌜vm (MkVM_State t 20 5 5)⌝;
=GFT ProofPower Output
val it = ⊢ vm (MkVM_State 0 20 5 5)
		= MkVM_State 5 19 5 0 : THM

val it = ⊢ vm (MkVM_State t 20 5 5)
		= MkVM_State (t + 5) 19 5 0 : THM
=TEX
}%\tiny
=TEX
\item Second test case does {\bf symbolic} execution
\end{itemize}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Case Study: Vending Machine\\
Critical Requirements\\
\end{center}
\vfill
{\small
Informal statement of critical requirement:
{\em ``No transaction of the vending machine causes the machine's owner
to lose money''}.

We formalise this by specifying the set of transition functions
which never reduce the value of the machine's contents. The value of
a state is computed by the following function.
ⓈHOLCONST
│	value : VM_State → ℕ
├─────────────────────────────
│∀st⦁value st = takings st + stock st * price st
■
The set of machines satisfying the critical requirement is then:
ⓈHOLCONST
│	vm_ok : (VM_State → VM_State) SET
├─────────────────
│	vm_ok
│=	{	trf
│	|	∀cb s p ct⦁
│		let	s1 = MkVM_State cb s p ct
│		in let	s2 = trf s1
│		in	value s2 ≥ value s1}
■
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercises 13: Case Study\\
\end{center}
{\tiny
First of all execute the $new\_theory$ command and the 4 paragraphs
of the vending machine specification.
\begin{enumerate}
\item
Execute the definition of $run\_vm$:
=SML
val run_vm = rewrite_conv[get_spec⌜vm⌝, get_spec⌜MkVM_State⌝];
=TEX

Experiment with the model by using $run\_vm$ to
see what it does on various test data. What does the vending machine do
if the price is set to $0$?
\item
Prove that the model of the vending machine satisfies its critical
requirements. I.e., prove:
$$ vm\,∈\,vm\_ok $$
=TEX
Hints:
\begin{enumerate}
\item
Try $REPEAT\,strip\_tac$
\item
Try rewriting with the definitions of any of
$MkVM\_State$, $vm$, $vm\_ok$ or $worth$
which appear in the goal.
\item
$let$-expressions may be eliminated by rewriting with $let\_def$.
\item
Is there an $if$-term in the goal?
Can you use $ℕ\_cases\_thm$ or $less\_cases\_thm$ (together
with $strip\_asm\_tac$ and $∀\_elim$ or $list\_∀\_elim$) to perform
the relevant case analysis?
\item
If you believe the goal is true by dint of arithmetic facts alone
try
=INLINEFT
PC_T1"lin_arith" asm_prove_tac[]
=TEX
.
\item
If none of the above hints apply, do you have an $if$-term which
could be simplified using an ``obvious'' arithmetic consequence of
your assumptions. If so set the ``obvious'' consequence up as a lemma
with $lemma\_tac$.
\end{enumerate}
\end{enumerate}
}%\tiny
\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercise 13/1: Solution\\
\end{center}
\vfill
{\tiny
The following test cases check out each branch of the $if$-terms in the definition
of $vm$:

Branch 1: out of stock: the machine refunds any cash tendered.
=SML
run_vm ⌜vm (MkVM_State t 0 p ct)⌝;
=TEX
Branch 2: in stock; cash tendered is less than the price: the machine
waits for more cash to be tendered:
=SML
run_vm ⌜vm (MkVM_State t 20 5 2)⌝;
=TEX
Branch 3: in stock; cash tendered is equal to the price: the machine
dispenses a chocolate bar and adds the cash tendered to its takings:
=SML
run_vm ⌜vm (MkVM_State t 20 5 5)⌝;
=TEX
=TEX
Branch 4: in stock; cash tendered exceeds the price: the machine
refunds the cash tendered:
=SML
run_vm ⌜vm (MkVM_State t 20 5 6)⌝;
=TEX

If the price is set to $0$, the machine first refunds any cash
tendered and then gives away all the stock!
=SML
run_vm ⌜vm (MkVM_State t 4 0 6)⌝;
run_vm ⌜vm (MkVM_State t 4 0 0)⌝;
run_vm ⌜vm (MkVM_State t 3 0 0)⌝;
run_vm ⌜vm (MkVM_State t 2 0 0)⌝;
run_vm ⌜vm (MkVM_State t 1 0 0)⌝;
run_vm ⌜vm (MkVM_State t 0 0 0)⌝;
=TEX
}%\tiny

\vfill
\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercise 13/2: Solution\\
\end{center}
\vfill
{\tiny
=SML
set_goal([], ⌜vm ∈ vm_ok⌝);
(* Goal "": Expand definitions and let-terms: *)
a(rewrite_tac [get_spec ⌜vm_ok⌝, get_spec⌜vm⌝,
		get_spec⌜MkVM_State⌝, let_def]);

(* Goal "": remove outer universal quantifiers *)
a(REPEAT strip_tac);

(* Goal "": case split on the amount of stock:
			s = 0 ∨ s = i + 1 for some i *)
a(strip_asm_tac(∀_elim⌜s⌝ ℕ_cases_thm) THEN asm_rewrite_tac[]);

(* Goal "1": s = 0 *)
a(asm_rewrite_tac[get_spec⌜value⌝, get_spec⌜MkVM_State⌝]);

(* Goal "2": case split on ct < p: ct < p ∨ ct = p ∨ p < ct *)
a(strip_asm_tac(list_∀_elim[⌜ct⌝, ⌜p⌝] less_cases_thm));

(* Goal "2.1": ct < p: *)
a(asm_rewrite_tac[get_spec⌜MkVM_State⌝]);

(* Goal "2.2": ct = p: *)
a(asm_rewrite_tac[get_spec⌜value⌝, get_spec⌜MkVM_State⌝]);
a(PC_T1 "lin_arith" asm_prove_tac[]);

(* Goal "2.3": ct > p: need ¬ct < p ∧ ¬ ct = p to evaluate if *)
a(lemma_tac ⌜¬ct < p ∧ ¬ ct = p⌝ THEN1
	PC_T1 "lin_arith" asm_prove_tac[]);
a(asm_rewrite_tac[get_spec⌜value⌝, get_spec⌜MkVM_State⌝]);

val vm_ok_thm = pop_thm();
=TEX
}%\tiny
\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Proof Strategy
\end{center}
\vfill
\begin{itemize}
\item

A large application proof may take several man years of effort to complete.
\vfill

\item

Top level proof strategy for large proofs must be carefully thought out.

{\tiny
The lemmas are best proven separately, stored in the theory, and combined in a top level proof delivering the required result from the major lemmas.
Exploration may be forwards or backwards.
}%\tiny
\vfill

\item

Lemmas of moderate size may be proven using the goal package.

{\tiny
Such a proof would consist of a combination of stripping, rewriting with definitions, assumptions and previously proven results, and other uses of previous results.
}%\tiny
\end{itemize}
\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf What to do when faced with a Goal\\
Sanity Checks
\end{center}
\vfill
\begin{itemize}
\item
Decide whether the goal is true, if not, don't try to prove it!
\vfill
\item
Decide whether the conclusion is relevant (are the assumptions inconsistent?).
\vfill
\item
Do you see what the goal means? If not, can you simplify it.
\vfill
\item
If all else fails, try retracing your steps.
\end{itemize}
\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf What to do when faced with a Goal\\
Main Choices
\end{center}
\vfill
{\small
\begin{itemize}
\item
Decompose by stripping or contradiction\\
($strip\_tac$, $contr\_tac$)
\item
Work forwards from assumptions\\
(e.g. $spec\_asm\_tac$, $fc\_tac$)
\item
Do a case split ($strip\_asm\_tac$, $cases\_tac$)
\item
Swap the conclusion with an assumption\\
($swap\_asm\_concl\_tac$)
\item
Prove a lemma ($lemma\_tac$)
\item
Prove automatically (e.g. $asm\_prove\_tac$, $prove\_∃\_tac$)
\item
Transform the conclusion by rewriting\\
(e.g. with a definition)
\item
Induction ($\ldots\_induction\_tac$)
\end{itemize}
}%\small
\vfill

\end{slide}

% =====================================================================

\Slide
\begin{center}
\bf Exercises 14.
\end{center}
{\tiny
\vfill
\begin{description}
\item[1.]
Use $contr\_tac$, and $spec\_asm\_tac$ and rewriting
prove that there is no greatest natural number:
=SML
set_goal([], ⌜∀m⦁∃n⦁ m < n⌝);
=TEX
(Hint: $m < m + 1$).
\item[2.]
Rather than using $contr\_tac$, it is often more natural to prove goals
with existentially quantified conclusions directly. $∃\_tac$ lets you
do this by supplying a term to act as a ``witness''.
Use $∃\_tac$ to give a more natural solution to the previous exercise:
=SML
set_goal([], ⌜∀m⦁∃n⦁ m < n⌝);
=TEX
\item[3.]
Prove that there is no onto function from the natural numbers to the
set of all numeric functions on the natural numbers:
=SML
set_goal([], ⌜∀f : ℕ → (ℕ → ℕ)⦁∃g⦁∀i⦁¬f i = g⌝);
=TEX
(Hints: Note that for $f$ of the above type, $λj⦁(f\,j\,j) + 1$ cannot be
in the range of $f$. Rewriting with $ext\_thm$
is useful for reasoning about equations between functions.)
\end{description}
}%\tiny
\vfill
\end{slide}

% =====================================================================
\Slide
{\tiny
\begin{description}
\item[4.]
It can happen that an equation is the wrong way round for use as
a rewrite rule. The usual means for dealing with this type of
problem is the conversion $eq\_sym\_conv$. Like other conversions
this may be propagated over a term using the conversionals $MAP\_C$
and $ONCE\_MAP\_C$.
Execute the following lines one at a time to see what happens:
=GFT
eq_sym_conv ⌜1 + 1 + 1 = 3⌝;
eq_sym_conv ⌜∀x⦁x + x + x = 3*x⌝;
ONCE_MAP_C eq_sym_conv ⌜∀x⦁x + x + x = 3*x⌝;
=TEX
A conversion may be converted into a tactic using $conv\_tac$.
Use this and the conversion and conversional you have just experimented
with together with the tactics $swap\_asm\_concl\_tac$
and the theorems $ext\_thm$ and $comb\_k\_def$ to prove the following:
=SML
set_goal([], ⌜∀f:'a→'b→'a⦁(∀x y⦁x = f x y) ⇒ f = CombK⌝);
=TEX
(Hint: take care to avoid looping rewrites by using the ``once'' rewriting
tactics while you look for the proof.)
\item[5.]
A common way of using a theorem is to
to strip it into the assumptions. This is done with $strip\_asm\_tac$.
Very often one specialises the theorem with $∀\_elim$ or $list\_∀\_elim$
before stripping it in and sometimes one may wish to use
$rewrite\_rule$ to rewrite it too.
Use the theorem $div\_mod\_unique\_thm$ in this way to prove:
=SML
set_goal([], ⌜∀i j⦁0 < i ⇒ (i * j) Div i = j⌝);
=TEX
(Hints: rewrite the theorem with $times\_comm\_thm$ suitably specialised
to identify subterms of the form $i * j$ and $j * i$ into the same form;
use the technique of the previous exercise to avoid a looping rewrite with
the assumption added by $strip\_asm\_tac$).
\end{description}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
{\tiny
\begin{description}
\item[6.]
Execute the following paragraph to define a function σ which maps $i$
to the sum of the first $i$ positive integers:
ⓈHOLCONST
│	σ : ℕ → ℕ
├──────────────
│	σ 0 = 0
│ ∧	∀i⦁ σ(i+1) = σ i + (i + 1)
■
The consistency of this paragraph should be proved automatically.
Check this by using $get\_spec$ to get the defining axiom for σ,
which should have no assumptions.
Prove the following theorem:
=SML
set_goal([], ⌜∀i⦁σ i = (i*(i + 1)) Div 2⌝);
=TEX
(Hint: use induction to prove a lemma that
$i*(i + 1) = 2\,*\,σ i$ and then use the result of the previous exercise;
the lemma may be proved by rewriting with assumptions and the definition
of σ and then using the proof context $lin\_arith$.)
\item[7.]
Construct a paragraph defining a function $φ$ such that for positive $i$,
$φ i$ is the $i\sp{th}$ element of the Fibonacci sequence,
$1, 1, 2, 3, 5, \ldots$, where each number is the sum of the previous
two. Does the system automatically prove the consistency of your
definition?
\end{description}
}%\small
\vfill
\end{slide}

% =====================================================================

\Slide
{\tiny
\begin{description}
\item[8.]
If you did the previous exercise, delete the function $φ$ you defined (using $delete\_const$).
Enter the following paragraphs which define $φ$ using an auxiliary function $γ$:
ⓈHOLCONST
│	γ : ℕ → (ℕ × ℕ)
├────────────
│	γ 0 = (0, 1)
│ ∧	∀i⦁γ(i+1) = let (a, b) = γ i in (b, a + b)
│	
■
ⓈHOLCONST
│	φ : ℕ → ℕ
├────────────
│ 	∀i⦁φ i = Fst (γ i)
│	
■
These definitions are proved consistent automatically.
Prove that $φ$ does indeed compute the Fibonacci numbers:
=GFT
set_goal([], ⌜
	φ 0 = 0
∧	φ 1 = 1
∧	∀i⦁φ(i+2) = φ(i+1) + φ i
⌝);
=TEX
(Hints: first rewrite with the definition of $φ$; then prove a lemma
or lemmas showing how $γ\,1$ and $γ(i+2)$ may be rewritten so that
the definition of $γ$ may be used to rewrite them.)

\item[9.]

The approach of the previous exercise has the disadvantage that the specification was not as abstract as one might like.
A cleaner approach is to use the obvious definition of $φ$, and then prove that it
is consistent using a function $γ$ which is only introduced as a variable during the course of the proof.
The tactic $prove\_∃\_tac$ gives access to the mechanisms that the system uses in its attempt to prove that paragraphs are consistent.

We demonstrate the above technique in this exercise.
\end{description}
}%\tiny
\vfill
\end{slide}

% =====================================================================
\Slide
{\tiny
\begin{description}

\item[9.(cont)]

First of all, delete the function $γ$ that you defined in the previous
exercise
(using $delete\_const$, which will also cause $φ$ to be deleted).
=SML
delete_const⌜γ⌝;
=TEX
Enter the following paragraph which gives the natural definition of
$φ$:
ⓈHOLCONST
│	φ : ℕ → ℕ
├────────────
│	φ 0 = 0
│ ∧	φ 1 = 1
│ ∧	∀i⦁φ(i+2) = φ(i+1) + φ i
■
Examine the theorem that $get\_spec$ returns for $φ$, it has
a consistency caveat as an assumption.
Discharge this consistency caveat as follows:

First of all go into the subgoaling package using the following command:
=GFT
push_consistency_goal⌜φ⌝;
=TEX
Now set as a lemma the existence of a $γ$ as in the previous exercise;
the lemma is proved immediately by $prove\_∃\_tac$ and you can
then use $∃\_tac⌜λi⦁Fst(γ\,i)⌝$ followed a proof almost identical with the previous
exercise (hint: $rewrite\_tac$ will eliminate the β-redexes introduced
when you apply $∃\_tac$). Save the consistency theorem using the
following command:
=GFT
save_consistency_thm ⌜φ⌝ (pop_thm());
=TEX
If you now examine the theorem that $get\_spec$ returns for $φ$, you
should see that it no longer has an assumption.

{\tiny
(Note: the variable name `φ$'$', created by decorating `φ' is displayed by the pretty printer as $\$\,$``φ$'$'' since it violates the HOL lexical rules for identifiers.
The parser will accept identifiers violating the normal lexical rules if they are presented in this way.)
}%\tiny
\end{description}
}%\small
\vfill
\end{slide}

% =====================================================================
\Slide
\begin{center}
\bf Exercises 14: Solutions
\end{center}
{\tiny
\vfill
=IGN
No 1. - simplified.
=SML
(* no. 1 *)
set_goal([], ⌜∀m⦁∃n⦁ m < n⌝);
a(contr_tac);
a(spec_asm_tac⌜∀ n⦁ ¬ m < n⌝⌜m+1⌝);
val thm1 = pop_thm();
=TEX
=SML
(* no. 2 *)
set_goal([], ⌜∀m⦁∃n⦁ m < n⌝);
a(REPEAT strip_tac);
a(∃_tac⌜m+1⌝);
a(rewrite_tac[]);
val thm2 = pop_thm();
=TEX
=SML
(* no. 3 *)
set_goal([], ⌜∀f : ℕ → (ℕ → ℕ)⦁∃g⦁∀i⦁¬f i = g⌝);
a(REPEAT strip_tac);
a(∃_tac⌜λj⦁(f j j) + 1⌝);
a(rewrite_tac[ext_thm]);
a(REPEAT strip_tac);
a(∃_tac⌜i⌝ THEN REPEAT strip_tac);
val thm3 = pop_thm();
=SML
(* no. 4 *)
set_goal([], ⌜∀f:'a→'b→'a⦁(∀x y⦁x = f x y) ⇒ f = CombK⌝);
a (REPEAT strip_tac);
a (rewrite_tac[ext_thm, comb_k_def]);
a (swap_asm_concl_tac⌜∀ x y⦁ x = f x y⌝);
a (conv_tac(ONCE_MAP_C eq_sym_conv));
a (swap_asm_concl_tac⌜¬ f x x' = x⌝ THEN asm_rewrite_tac[]);
val thm4 = pop_thm();
=TEX
\vfill
}
\end{slide}

% =====================================================================

\Slide
{\tiny
=SML
(* no. 5 *)
set_goal([], ⌜∀i j⦁0 < i ⇒ (i * j) Div i = j⌝);
a (REPEAT strip_tac);
a (strip_asm_tac(
	rewrite_rule[∀_elim⌜j⌝times_comm_thm]
	(list_∀_elim[⌜i*j⌝, ⌜i⌝, ⌜j⌝, ⌜0⌝] div_mod_unique_thm)));
a (swap_asm_concl_tac⌜j = (i * j) Div i⌝ THEN
		(conv_tac(ONCE_MAP_C eq_sym_conv)));
a (strip_tac);
val thm5 = pop_thm();
=TEX
=SML
(* no. 6 *)
set_goal([], ⌜∀i⦁σ i = (i*(i + 1)) Div 2⌝);
a (REPEAT strip_tac);
a (lemma_tac⌜i * (i + 1) = 2 * σ i⌝);
(* *** Goal "1" *** *)
a (induction_tac⌜i⌝ THEN asm_rewrite_tac[get_spec⌜σ⌝]);
a(PC_T1 "lin_arith" asm_prove_tac[]);
(* *** Goal "2" *** *)
a (asm_rewrite_tac[rewrite_rule[](list_∀_elim[⌜2⌝, ⌜σ i⌝]thm5)]);
val thm6 = pop_thm();
=TEX
\vfill
}
\end{slide}

% =====================================================================

\Slide
{\tiny
=SML
(* no. 7 *)
=TEX
The obvious way of defining the Fibonacci function is not automatically
proved consistent:
=SML
delete_const⌜φ⌝;
ⓈHOLCONST
│	φ : ℕ → ℕ
├────────────
│	φ 0 = 0
│ ∧	φ 1 = 1
│ ∧	∀i⦁φ(i+2) = φ(i+1) + φ i
│	
■
=SML
get_spec⌜φ⌝;
=TEX
}%\tiny
\vfill
\end{slide}

% =====================================================================

\Slide
{\tiny
=SML
delete_const⌜φ⌝;
=SML
(* no. 8 *)
ⓈHOLCONST
│	γ : ℕ → (ℕ × ℕ)
├────────────
│	γ 0 = (0, 1)
│ ∧	∀i⦁γ(i+1) = let (a, b) = γ i in (b, a + b)
│	
■
ⓈHOLCONST
│	φ : ℕ → ℕ
├────────────
│ 	∀i⦁φ i = Fst (γ i)
│	
■
=SML
set_goal([], ⌜
	φ 0 = 0
∧	φ 1 = 1
∧	∀i⦁φ(i+2) = φ(i+1) + φ i
⌝);
a (rewrite_tac[get_spec⌜φ⌝]);
a (lemma_tac⌜γ 1 = γ(0 + 1) ∧ ∀i⦁ γ(i + 2) = γ((i+1)+1)⌝);
(* *** Goal "1" *** *)
a (rewrite_tac[plus_assoc_thm]);
(* *** Goal "2" *** *)
a (pure_asm_rewrite_tac[get_spec⌜γ⌝, let_def] THEN rewrite_tac[]);
val thm8 = pop_thm();
=TEX
}%\tiny
\vfill
\end{slide}

% =====================================================================

\Slide
{\tiny
=SML
(* no. 9 *)
delete_const⌜γ⌝;
ⓈHOLCONST
│	φ : ℕ → ℕ
├────────────
│	φ 0 = 0
│ ∧	φ 1 = 1
│ ∧	∀i⦁φ(i+2) = φ(i+1) + φ i
■
=SML
get_spec⌜φ⌝;
push_consistency_goal⌜φ⌝;
a (lemma_tac⌜∃γ⦁
	γ 0 = (0, 1)
∧	∀i⦁γ(i+1) = let (a, b) = γ i in (b, a + b)
⌝);
(* *** Goal "1" *** *)
a (prove_∃_tac);
(* *** Goal "2" *** *)
a (∃_tac⌜λi⦁Fst(γ i)⌝);
a (rewrite_tac[]);
a (lemma_tac⌜γ 1 = γ(0 + 1) ∧ ∀i⦁ γ(i + 2) = γ((i+1)+1)⌝);
(* *** Goal "2.1" *** *)
a (rewrite_tac[plus_assoc_thm]);
(* *** Goal "2.2" *** *)
a (pure_asm_rewrite_tac[let_def] THEN asm_rewrite_tac[]);
save_consistency_thm ⌜φ⌝ (pop_thm());
get_spec⌜φ⌝;
=TEX
}%\tiny
\vfill
\end{slide}
\end{document}


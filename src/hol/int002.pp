=IGN
********************************************************************************
int002.doc: this file is part of the PPHol system

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

\def\Title{Demonstration Script for the ProofPower System}

\def\AbstractText{This document provides a demonstration script for {\ppfont ProofPower}, and incidentally provides an integration test.}

\def\Reference{DS/FMU/IED/INT002}

\def\Author{R.D. ArthanWIN 01R.B.Jones, WIN 01\\K. Blackburn & WIN 01}


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
\underscoreoff
%% LaTeX2e port: \TPPproject{FST Project}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Demonstration Script for the ProofPower System}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Demonstration Script for the ProofPower System}
%% LaTeX2e port: \TPPref{DS/FMU/IED/INT002}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 3.6 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2003/04/28 14:11:37 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Approved}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: % \TPPauthor{K.Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{R.D. Arthan&WIN 01\\R.B.Jones & WIN 01\\K. Blackburn & WIN 01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & Project Manager}
%% LaTeX2e port: \TPPabstract{This document provides a demonstration script for \Product{},
%% LaTeX2e port: and incidentally provides an integration test.}
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
\item[Issue 2.1 (1992/09/29) (\FormatDate{92/09/29})] First approved issue.
\item[Issue 2.5 (1993/03/11) (\FormatDate{93/03/11})] Second approved issue.
\item[Issue 3.1 (1994/08/17) (\FormatDate{94/08/17})] Third approved issue.
\item[Issue 3.2 (1996/01/22) (\FormatDate{96/01/22})] Corrected use of fake test harness.
\item[Issue 3.3 (1999/03/09) (\FormatDate{99/03/09})] Update for new INTEGER type.
\item[Issue 3.4 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 3.5 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 3.6 (2003/04/28)] Implemented support for left-associative operators.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\section{GENERAL}
\subsection{Scope}\label{Scope}
This document provides a demonstration script for \Product{}.
This demonstration is intended to be appropriate for
people with little or no knowledge of Cambridge HOL or \Product{},
but with at least some slight aquaintance with the
predicate calculus.

The script also serves as something of an integration test,
though the primary integration testing is accessed
through \cite{DS/FMU/IED/INT001}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document provides a demonstration script for \Product{}.
It only concerns itself with the core of \Product{},
that uses the HOL language, and which is sometimes referred to as \ProductHOL{}.
An optional part of \Product{}, not exercised in this document, supports the Z language (e.g. \cite{Spivey89}).
It is called \ProductZ{}.

The script also serves as something of an integration test.
\subsubsection{Dependencies}
The script provided requires a complete version of \ProductHOL{}
 to be run.
\subsubsection{Deficiencies}
None known.
\subsubsection{Changes Forecast}
As \Product{} changes, and in particular new areas worthy of
demonstration are introduced.

\subsection{The HOL Proof Tool}
HOL (Higher Order Logic) is a polymorphic version of Church's type theory
due to M.J.C. Gordon  \cite{gordon87}. A system produced
by Cambridge University supporting
machine-checked reasoning in HOL has been available in the public domain for
several years \cite{SRI89a}. The Cambridge HOL system has been widely
used for a range of verification tasks in academia and has
been successfully exploited by a number of industrial users including
the High Assurance Team at ICL.

ICL are currently engaged in a research programme into formal proof
technology which includes a re-engineering of the HOL proof tool to
meet more fully the requirements of industrial use and to give a basis
for exploiting more recent research on the HOL technology.
The result is called \Product{}.
This
proof tool has been specifically designed with a view to its use to
provide support for specification and proof in formalisms other
than the HOL logic itself.

Space does not permit us to give a full exposition of the operation
of \Product{} here. However, we hope that some aspects of
this will be clear from the examples we give. It may be worth mentioning
some basic concepts:

The system is implemented in the interactive
functional programming language Standard ML (or, strictly speaking, an
extension of Standard ML giving a special syntax for entering
HOL terms and types and supporting the use of an extended character
set for mathematical notations). ML, often referred to
as the {\em metalanguage}, also acts as the command language through which
the user interacts with the system.

The types and terms of the HOL language
(the object language for \Product{}, often just referred to as ``HOL'') are implemented as abstract
data types, $TYPE$ and $TERM$.
The constructors of the
data type of terms guarantee that all values of type $TERM$ obey
the typing rules of the HOL language. Proof is conducted, at the most
primitive level, by computing theorems, i.e. values of an abstract
data type, $THM$. The constructors of this abstract data type implement
the primitive inference rules of the
logic. Thus, the only way to compute a theorem is via a sequence of
primitive inferences, and so any value of type $THM$ is indeed a theorem
of the HOL logic. On top of this logical kernel are implemented a wide
range of proof procedures which assist the user in performing proofs.
The great merit of this approach to implementing a proof tool is that the logical
kernel guarantees that the soundness of the system cannot be compromised
by infelicities in the coding of these derived proof procedures.

\section{THE ORGANISATION OF THE SCRIPT}

The present document is a
{\em literate script} containing a mixture of narrative
text and input for \ProductHOL{}.
The appendix contains a listing of \Product{} theories set up by the script
and section \ref{INDEX} contains an index of the objects defined in the script.
Defining occurrences of names are shown in {\bf bold}.

The input for \Product{} consists of a sequence of commands in an extension
of the interactive programming language Standard ML.
HOL terms appear enclosed by the symbols `⌜' and `⌝'
and HOL types by `ⓣ' and `⌝', the text between the symbols being parsed as HOL and
resulting in an ML value of type $TERM$ or $TYPE$.

HOL constants are introduced using constant definition
boxes which have the form:
=SML
(*
ⓈHOLCONST

	c : ty
├
	P
■
=SML
*)
=TEX
The intention of this is to introduce a new constant, $c$,
of type $ty$, satisfying the property $P$.

The definitions introduced by these boxes are {\em conservative}.
\Product{} maintains a distinction between conservative extensions
and the introduction of arbitrary axioms.

\section{THE SCRIPT : FREE VARIABLE CHECK}
It is a policynot to save theorems with free variables.

=SML
local
val thys = get_descendants "min";
fun check_thm (_, th) = (
	case frees (concl th) of
		[] => true
	|	_ => false
);
val bad = flat (map get_thms thys) drop check_thm;
in
val _ = case bad of
	[] => (	diag_line "*** All theorems passed the free variable test ***"
) |	some => (
	let	fun aux (names, thm) = (
			diag_line ("\t" ^ thm_theory thm ^ ": " ^ hd names)
		);
	in
		diag_line "*** The module test generated a warning: some saved theorems had free variables ***";
		diag_line "The following theorems failed the test (theory name: theorem name):";
		map aux bad; ()
	end
);
end;
=TEX
\section{THE SCRIPT : ARITHMETIC RESULTS}
\subsection{Prologue}
=SML
open_theory"hol";
new_theory ⦏"arith_demo"⦎;
repeat drop_main_goal;
=TEX
The first command in the example makes current a proof
context in which rewriting will automatically cause
arithmetic expressions with literal operands
to be evaluated:
=SML
push_pc "hol1";
=TEX
The following allows the script to be used as an integration test:
=SML
fun  ⦏summarize_mt_results⦎ () =
	"++++ Compilation of int002.sml halted unexpectedly ++++";
=TEX
\subsection{Functions for Compiling into a Proof Context}
The following extends the \Product{} proof context mechanisms
by allowing specifications and other theorems
to be apparently compiled into the current proof context.
Though this is not an approach that is likely
to be appropriate for the development of a proof
it does allow the power of the proof context mechanism
to be demonstrated.

$recur_conv$ is used for positive arguments to
functions defined by recursion. It replaces a
positive literal, $ⓜmk_ℕ\ i⌝$ say, by $ⓜ(mk_ℕ (i-1)⌝ +1$
so allowing rewriting with a recursive clause of
the form $f(n+1) = r$:
=SML
val 	⦏recur_conv⦎ : CONV = (fn m =>
	let	val tm = mk_plus(mk_ℕ(dest_ℕ m @- one), mk_ℕ one);
	in	eq_sym_rule (plus_conv tm)
	end
);
=TEX
=SML
recur_conv⌜7⌝;
=TEX
In $lhs_conv$, $lhs$ is expected to be the left-hand
side of a clause in a function definition. The conversion
which is returned will attempt to apply $recur_conv$
to any actual arguments for which the formal argument
had the form $n+1$:
=SML
fun ⦏lhs_conv⦎ (lhs : TERM) : CONV = (
	if is_plus lhs
	then recur_conv
	else if is_app lhs
	then	let val (f, arg) = dest_app lhs
		in	APP_C(lhs_conv f, lhs_conv arg)
	end else id_conv
);
=TEX
=SML
lhs_conv ⌜f (n+1, m+1) a⌝ ⌜f (1, 2) 4⌝;
=TEX
$lhs_pat$ computes the pattern to be associated with
the left-hand side of a definition. This is obtained
by replacing subterms of the form $a+b$ with a variable
so allowing these to be matched with anything.
=SML
fun ⦏lhs_pat⦎ (lhs : TERM) : TERM = (
	if is_plus lhs
	then mk_var("X", ℕ)
	else if is_app lhs
	then (mk_app o (lhs_pat ** lhs_pat) o dest_app) lhs
	else if is_λ lhs
	then (mk_λ o (lhs_pat ** lhs_pat) o dest_λ) lhs
	else lhs
);
=TEX
=SML
lhs_pat ⌜f (n+1, m+1) a⌝;
=TEX
$compile_eqn$ produces a pattern-conversion pair
(for use in a rewriting context) from a single
theorem (which is expected to be an equation).
=SML
fun ⦏compile_eqn⦎ (thm : THM) : (TERM * CONV)= (
	let	val (lhs, rhs) = dest_eq (concl thm);
	in	(lhs_pat lhs,
		lhs_conv lhs THEN_C eq_match_conv thm)
	end
);
=TEX
=SML
compile_eqn
(all_∀_elim(asm_rule⌜∀n m a⦁f(n+1, m+1) a = f(n, m) a + a⌝));
snd it ⌜f (1, 2) 4:ℕ⌝;
=TEX
$compile_thm$ applies $compile_eqn$ to each equational
conjunct of a theorem (typically a partial recursive
definition)
=SML
fun ⦏compile_thm⦎ (thm : THM) : (TERM * CONV) list = (
	(map compile_eqn o strip_∧_rule o all_∀_elim) thm
);
=TEX
We now set up a variable to contain the rewriting
context computed by the function $compile$.
This is initialised to the context we started with, ``hol1'', and
an additional conversion which tries hard to evaluate the condition in
an
=INLINEFT
if ... then ... else ...
=TEX
.
=SML
new_pc ⦏"accumulate"⦎;


val code : (TERM * CONV) list ref = ref [
	(⌜if a then b else c⌝, RATOR_C(RATOR_C(RAND_C(rewrite_conv[]))))];
set_rw_eqn_cxt (!code) "accumulate";


merge_pcs ["hol1"] "accumulate";
=TEX
Our ``compiler'' takes as its parameter either
a HOL constant, or
a string which is
the name of a theorem (which it looks for
in the ancestry of the current theory) and extends the proof context
$accumulate$ with the result of compiling the
constants specification, or by the saved theorem.
=SML
datatype ⦏FUNC_OR_THM⦎ = Function of TERM | Theorem of string;

fun ⦏compile⦎ (func_or_thm : FUNC_OR_THM) = (
	let	fun my_get_thm key (thy :: thys) = (
			(get_thm thy key)
			handle Fail _ => my_get_thm key thys
		) | my_get_thm key [] = get_thm "min" key;
		val def = case func_or_thm of
			Function tm => get_spec tm
			| Theorem key => my_get_thm key (get_ancestors"-");
		val this = compile_thm def;
		fun same ((t1, _), (t2, _)) = t1 ~=$ t2;
		val new = union same (!code) this;
		val sideeffect = set_rw_eqn_cxt new "accumulate";
	in	code := new;
		set_pc "accumulate"
	end
);
=TEX
Finally a function to reset the proof context ``accumulate''
back to its initial value.
=SML
fun ⦏reset_compile⦎ () = (
	code := [
	(⌜if a then b else c⌝, RATOR_C(RATOR_C(RAND_C(rewrite_conv[]))))];
	set_rw_eqn_cxt (!code) "accumulate";
	set_pc "accumulate"
);
=TEX
\subsection{Cumulative Effects of Proof Contexts}
=SML
new_pc ⦏"cumulative"⦎;
push_pc"cumulative";
=GFT HOL Input
rewrite_conv[]⌜(λi j k⦁ i*j + j*k +  i*k) 7 11 13⌝;
	(* fails - no rewriting occurs *)
=SML
set_rw_eqn_cxt[(⌜(λx⦁ y)z⌝, β_conv)]"cumulative";
set_pc"cumulative";
rewrite_conv[]⌜(λi j k⦁ i*j + j*k +  i*k) 7 11 13⌝;
set_rw_eqn_cxt[(⌜(λx⦁ y)z⌝, β_conv), (⌜x * y⌝, times_conv)]"cumulative";
set_pc"cumulative";
rewrite_conv[]⌜(λi j k⦁ i*j + j*k +  i*k) 7 11 13⌝;
pop_pc();

delete_pc"cumulative";

push_pc"hol1";
rewrite_conv[]⌜(λi j k⦁ i*j + j*k +  i*k) 7 11 13⌝;
pop_pc();

=TEX
\subsection{Arithmetic and Compiling into Proof Contexts}
First we demonstrate what the supplied proof context can do:
=SML
rewrite_conv[]⌜7 * 11 * 13⌝;
rewrite_conv[]⌜7 * 11 * 13 < (42 - 37) * (10 + 1) * 99⌝;
rewrite_conv[]⌜z + 128 + 64 + 32 + 16 + 8 + 4 + 2 + 1⌝;
rewrite_conv[]⌜
	if 2 * 3 ≤ 6
	then (99 Div 12, 99 Mod 12)
	else (1, 1)⌝;
=TEX
Let us now extend the system by introducing a factorial function:
=SML
declare_postfix(400, "!");
=TEX
ⓈHOLCONST
	$!: ℕ → ℕ
├
∀m⦁
		0! = 1
	∧	(m + 1)! = (m + 1) * m!
■
=SML
print_theory"-";
=TEX
Let us check our theorem compiler from the previous section:
=SML
compile_thm (get_spec ⌜$!⌝);
val [(_, c1), (_, c2)] = it;
c1 ⌜0!⌝;
c2 ⌜3!⌝;
=TEX
Now onto our accumulating proof context.
=SML
push_pc "accumulate";
=TEX
First we introduce factorial reasoning:
=GFT HOL Input
rewrite_conv[]⌜0!⌝;	(* Fails: need to compile in specification for ⌜!⌝ *)
=SML
compile (Function ⌜$!⌝);
rewrite_conv[]⌜0!⌝;
rewrite_conv[]⌜1!⌝;
rewrite_conv[]⌜6!⌝;
rewrite_conv[]⌜10!⌝;
rewrite_conv[]⌜20!⌝;
=TEX
$Enter$ is the inner loop of a bubble sort. It is
parameterised by an ordering relation.
=SML
ⓈHOLCONST
	⦏Enter⦎:('a → 'a → BOOL) → 'a → 'a LIST → 'a LIST
├
∀rel x y ys⦁
	Enter rel x [] = [x]
∧	Enter rel x (Cons y ys) =
		if 	rel x y
		then	Cons x (Cons y ys)
		else	Cons y (Enter rel x ys)
■
=SML
compile (Function ⌜Enter⌝);
rewrite_conv[]⌜Enter ($<) 1 []⌝;
rewrite_conv[]⌜Enter ($<) (3!) [2;3;4;10;20]⌝;

=TEX
$Sort$ is a bubble sort. Like $Enter$ it is
parameterised by an ordering relation.
=SML
ⓈHOLCONST
	⦏Sort⦎:('a → 'a → BOOL) → 'a LIST → 'a LIST
├
∀rel x xs⦁
	Sort rel [] = []
∧	Sort rel (Cons x xs) = Enter rel x (Sort rel xs)
■
=SML
compile (Function ⌜Sort⌝);
rewrite_conv[]⌜Sort ($<) []⌝;
rewrite_conv[]⌜Sort ($<) [3!;2;3;4;10;20]⌝;
=TEX
=SML
declare_infix (320, "**");
ⓈHOLCONST
	$⦏**⦎:ℕ → ℕ → ℕ
├
∀m n⦁
	m ** 0 = 1
∧	m ** (n+1) = m * m ** n
■
=SML
compile (Function ⌜$**⌝);
rewrite_conv[]⌜2**4⌝;
rewrite_conv[] ⌜[2**1; 2**2; 2**3; 2**4]⌝;
rewrite_conv[] ⌜[2**1; 2**2; 2**3; 2**4]⌝;
rewrite_conv[]
	⌜Sort ($<)[1!; 2!; 3!; 4!; 2**1; 2**2; 2**3; 2**4]⌝;
=TEX
As a final example, we define the binomial function,
which we write as an infix $C$:
=SML
declare_infix (330, "C");
ⓈHOLCONST
	$⦏C⦎:ℕ → ℕ → ℕ
├
∀n j⦁
	0 C 0 = 1
∧	(n+1) C 0 = 1
∧	0 C (j+1) = 0
∧	(n+1) C (j+1) = n C j + n C (j+1)
■
The following gives the first few rows of
Pascal's triangle.
=SML
compile (Function ⌜$C⌝);
rewrite_conv[] ⌜ [
[0 C 0; 0 C 1; 0 C 2];
[1 C 0; 1 C 1; 1 C 2];
[2 C 0; 2 C 1; 2 C 2]]⌝;
=TEX
To do eight rows takes a minute or two, since
the ``algorithm'' implicit in just writing out all
64 applications of $C$ involves a great deal of
recomputation.
=GFT HOL Input
rewrite_conv[] ⌜ [
[0 C 0; 0 C 1; 0 C 2; 0 C 3; 0 C 4; 0 C 5; 0 C 6; 0 C 7];
[1 C 0; 1 C 1; 1 C 2; 1 C 3; 1 C 4; 1 C 5; 1 C 6; 1 C 7];
[2 C 0; 2 C 1; 2 C 2; 2 C 3; 2 C 4; 2 C 5; 2 C 6; 2 C 7];
[3 C 0; 3 C 1; 3 C 2; 3 C 3; 3 C 4; 3 C 5; 3 C 6; 3 C 7];
[4 C 0; 4 C 1; 4 C 2; 4 C 3; 4 C 4; 4 C 5; 4 C 6; 4 C 7];
[5 C 0; 5 C 1; 5 C 2; 5 C 3; 5 C 4; 5 C 5; 5 C 6; 5 C 7];
[6 C 0; 6 C 1; 6 C 2; 6 C 3; 6 C 4; 6 C 5; 6 C 6; 6 C 7];
[7 C 0; 7 C 1; 7 C 2; 7 C 3; 7 C 4; 7 C 5; 7 C 6; 7 C 7]]⌝;
=TEX
\subsection{Prime Numbers}
=SML
open_theory "arith_demo";
new_theory ⦏"prime"⦎;
=TEX
First we define the notion of a factor of a number.
It is convenient only to consider the proper factors (i.e.
those greater than 1):
=SML
declare_infix(200, "Factor");
ⓈHOLCONST
	$Factor : ℕ → ℕ → BOOL
├
	∀m n⦁m Factor n ⇔ 1 < m ∧ n Mod m = 0
■
=SML
compile (Function ⌜$Factor⌝);
rewrite_conv[]⌜2 Factor 6⌝;
rewrite_conv[]⌜5 Factor 6⌝;
=TEX
A number may now be defined to be prime if it is greater than
1 and if its only proper factor is itself:
=SML
ⓈHOLCONST
	$Prime : ℕ → BOOL
├
	∀m⦁Prime m ⇔ 1 < m ∧ ∀i⦁i Factor m ⇒ i = m
■
We are going to implement a primality tester using a bounded search
operator, which we now define.
$Search\ m\ n\ p$ searches between the numbers $m$ and
$n$ inclusive for the first number to satisfy $p$ (and
returns $n+1$ if no such number exists).
=SML
ⓈHOLCONST
	Search : ℕ → ℕ → (ℕ → BOOL) → ℕ
├
	∀m n p⦁Search m n p =
		if	n < m
		then	n+1
		else if	p m
		then	m
		else	Search (m+1) n p
■
Verifying the consistency of the above definition is a fairly straightforward
application of the principle of primitive recursion.
=SML
push_consistency_goal ⌜Search⌝;
a(lemma_tac ⌜
	∃a⦁
	∀ i n p⦁
		a 0 n p	= n + 1
	∧	a (i+1) n p	= if p (n - i)
				  then (n - i)
				  else a i n p⌝);
(* *** Goal "1" *** *)
a(asm_prove_∃_tac);
(* *** Goal "2" *** *)
a(∃_tac⌜λm n p⦁ a (if n < m then 0 else (n - m) + 1) n p⌝);
a(REPEAT strip_tac);
a(cases_tac⌜n < m⌝ THEN asm_rewrite_tac[]);
a(POP_ASM_T (strip_asm_tac o rewrite_rule[¬_less_thm, ≤_def]));
a(POP_ASM_T (fn th => rewrite_tac[eq_sym_rule th]));
a(LEMMA_T ⌜(if i < 1 then 0 else ((m + i) - (m + 1)) + 1) = i⌝
	rewrite_thm_tac);
a(strip_asm_tac(∀_elim⌜i⌝ℕ_cases_thm) THEN asm_rewrite_tac[]);
a(LEMMA_T⌜m + i' + 1 = m + 1 + i'⌝rewrite_thm_tac);
(* *** Goal "2.1" *** *)
a(rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(rewrite_tac[plus_assoc_thm1]);
save_consistency_thm ⌜Search⌝(pop_thm());
=TEX
We don't want $Search$'s specification in the standard rewrites just yet.
=SML
push_pc "accumulate";
get_spec⌜Search⌝;
compile (Function ⌜Search⌝);
rewrite_conv[]⌜Search 1 10 (λi⦁i > 5)⌝;
rewrite_conv[]⌜Search 2 11 (λi⦁i Factor 11)⌝;
pop_pc();
=TEX
The search function is a little tricky to reason about. We want to
prove that, if a propositional function $p$ is satisfied by a
number between $m$ and $n$, then $Search\,m\,n\,p$ is such
a number. However, inductive reasoning about $Search$ has to be
done by induction on the difference between $n$ and $m$ and care is
needed to handle the various edge cases. We therefore sneak up on
the problem by proving some lemmas first.

The first lemma says that the result returned by $Search$ is bounded
below by the lower bound of the $Search$ interval (provided the interval
is non-empty):
=SML
push_goal([], ⌜
	∀p n j⦁	j ≤ n ⇒
		(n-j) ≤ (Search (n-j) n p)
⌝);
a(REPEAT ∀_tac);
a(induction_tac⌜j⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[]);
a(once_rewrite_tac[get_spec⌜Search⌝]);
a(rewrite_tac[]);
a(cases_tac⌜p n⌝);
(* *** Goal "1.1" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "1.2" *** *)
a(asm_rewrite_tac[]);
a(once_rewrite_tac[get_spec⌜Search⌝]);
a(asm_rewrite_tac[]);
(* *** Goal "2" *** *)
a(REPEAT strip_tac);
a(POP_ASM_T (strip_asm_tac o rewrite_rule[plus1_≤_thm]));
(* *** Goal "3" *** *)
a(once_rewrite_tac[get_spec⌜Search⌝]);
a(REPEAT strip_tac);
a(LEMMA_T ⌜¬ n < n - (j + 1)⌝ rewrite_thm_tac);
(* *** Goal "3.1" *** *)
a(asm_ante_tac⌜j + 1 ≤ n⌝ THEN rewrite_tac[≤_def]);
a(REPEAT strip_tac);
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
(* *** Goal "3.2" *** *)
a(LEMMA_T⌜(n - (j + 1)) + 1 = n - j⌝ asm_tac);
(* *** Goal "3.2.1" *** *)
a(asm_ante_tac⌜j + 1 ≤ n⌝ THEN rewrite_tac[≤_def]);
a(REPEAT strip_tac);
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(rewrite_tac[plus_assoc_thm]);
(* *** Goal "3.2.2" *** *)
a(CASES_T⌜p (n - (j + 1))⌝ rewrite_thm_tac);
a(asm_rewrite_tac[]);
a(strip_asm_tac(list_∀_elim[⌜n-(j+1)⌝, ⌜n-j⌝, ⌜Search (n - j) n p⌝]≤_trans_thm));
a(swap_asm_concl_tac ⌜¬ n - (j + 1) ≤ n - j⌝);
a(GET_ASM_T ⌜(n - (j + 1)) + 1 = n - j⌝ (rewrite_thm_tac o eq_sym_rule));
val ⦏search_lemma1⦎ = pop_thm();
=TEX
The second lemma about $Search$ says that if the result of a search
in a non-empty interval is not greater than the upper bound of the interval then
the search was successful:
=SML
push_goal([], ⌜
	∀p n j⦁	j ≤ n ⇒
		((Search (n-j) n p) ≤ n ⇒ p(Search (n-j) n p))
⌝);
a(REPEAT ∀_tac);
a(induction_tac⌜j⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[]);
a(once_rewrite_tac[get_spec⌜Search⌝]);
a(rewrite_tac[]);
a(cases_tac⌜p n⌝ THEN asm_rewrite_tac[]);
a(once_rewrite_tac[get_spec⌜Search⌝]);
a(rewrite_tac[]);
(* *** Goal "2" *** *)
a(strip_tac);
a(POP_ASM_T (strip_asm_tac o rewrite_rule[plus1_≤_thm]));
(* *** Goal "3" *** *)
a(REPEAT strip_tac);
a(once_rewrite_tac[get_spec⌜Search⌝]);
a(GET_ASM_T ⌜j + 1 ≤ n⌝ (strip_asm_tac o rewrite_rule[≤_def]));
a(POP_ASM_T (fn th => all_asm_ante_tac THEN
	rewrite_tac[eq_sym_rule th] THEN REPEAT strip_tac));
a(cases_tac⌜p i⌝ THEN asm_rewrite_tac[]);
a(swap_nth_asm_concl_tac 3);
a(rewrite_tac[plus_assoc_thm]);
a(swap_nth_asm_concl_tac 3);
a(once_rewrite_tac[get_spec⌜Search⌝]);
a(asm_rewrite_tac[plus_assoc_thm]);
a(rewrite_tac[∀_elim⌜1⌝ plus_order_thm]);
a(asm_rewrite_tac[∀_elim⌜j⌝ plus_order_thm]);
(* *** Goal "4" *** *)
a(REPEAT strip_tac);
a(once_rewrite_tac[get_spec⌜Search⌝]);
a(GET_ASM_T ⌜j + 1 ≤ n⌝ (strip_asm_tac o rewrite_rule[≤_def]));
a(POP_ASM_T (fn th => all_asm_ante_tac THEN
	rewrite_tac[eq_sym_rule th] THEN REPEAT strip_tac));
a(cases_tac⌜p i⌝ THEN asm_rewrite_tac[]);
a(DROP_NTH_ASM_T 3 ante_tac);
a(rewrite_tac[plus_assoc_thm]);
a(rewrite_tac[∀_elim⌜i⌝ plus_order_thm]);
val ⦏search_lemma2⦎ = pop_thm();
=TEX
The third lemma about $Search$ says that the search interval contains
a number with the desired property iff. the search returns an element
in the interval with the desired property.
=SML
push_goal([], ⌜
	∀p n j⦁	j ≤ n ⇒
	((∃i⦁(n-j) ≤ i ∧ i ≤ n ∧ p i)
		⇔	(Search (n-j) n p) ≤ n ∧ p(Search (n-j) n p))
⌝);
a(REPEAT ∀_tac THEN ⇒_tac THEN ⇔_tac);
(* *** Goal "1" *** *)
a(asm_ante_tac⌜j ≤ n⌝ THEN rewrite_tac[
	rewrite_rule[
	taut_rule⌜∀a b c⦁(a ⇒ b ⇒ c) ⇔ (a ⇒ (b ∧ c)) ⇔ (a ⇒ b)⌝
	]search_lemma2]);
a(asm_ante_tac ⌜n - j ≤ i⌝ THEN induction_tac⌜j⌝);
(* *** Goal "1.1" *** *)
a(rewrite_tac[]);
a(strip_tac THEN LEMMA_T⌜n = i⌝ rewrite_thm_tac);
(* *** Goal "1.1.1" *** *)
a(strip_asm_tac (list_∀_elim[⌜i⌝, ⌜n⌝] ≤_antisym_thm));
a(asm_rewrite_tac[]);
(* *** Goal "1.1.2" *** *)
a(once_rewrite_tac[get_spec⌜Search⌝]);
a(asm_rewrite_tac[]);
(* *** Goal "1.2" *** *)
a(REPEAT strip_tac);
a(DROP_ASM_T⌜¬ n - j ≤ i⌝ (strip_asm_tac o rewrite_rule[¬_≤_thm]));
a(lemma_tac⌜i ≤ n - (j+1)⌝);
(* *** Goal "1.2.1" *** *)
a(GET_ASM_T ⌜j + 1 ≤ n⌝ (strip_asm_tac o rewrite_rule[≤_def]));
a(asm_ante_tac ⌜i < n - j⌝);
a(POP_ASM_T(fn th => rewrite_tac[eq_sym_rule th]));
a(rewrite_tac[plus_assoc_thm]);
a(rewrite_tac[less_def]);
(* *** Goal "1.2.2" *** *)
a(strip_asm_tac(list_∀_elim[⌜n-(j+1)⌝, ⌜i⌝]≤_antisym_thm));
a(TOP_ASM_T rewrite_thm_tac);
a(once_rewrite_tac[get_spec⌜Search⌝]);
a(LEMMA_T ⌜¬n < i⌝ asm_rewrite_thm_tac);
a(asm_rewrite_tac[¬_less_thm]);
(* *** Goal "1.3" *** *)
a(REPEAT strip_tac);
a(lemma_tac⌜j ≤ n⌝);
a(strip_asm_tac(list_∀_elim[⌜j⌝, ⌜j+1⌝, ⌜n⌝]≤_trans_thm));
(* *** Goal "1.4" *** *)
a(REPEAT strip_tac);
a(once_rewrite_tac[get_spec⌜Search⌝]);
a(LEMMA_T⌜¬ n < n - (j + 1)⌝rewrite_thm_tac);
(* *** Goal "1.4.1" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[≤_def]));
a(POP_ASM_T (fn th => rewrite_tac[eq_sym_rule th]
	THEN REPEAT strip_tac));
(* *** Goal "1.4.2" *** *)
a(CASES_T ⌜p (n - (j + 1))⌝ rewrite_thm_tac);
(* *** Goal "1.4.2.1" *** *)
a(strip_asm_tac(list_∀_elim[⌜n-(j+1)⌝, ⌜i⌝, ⌜n⌝]≤_trans_thm));
(* *** Goal "1.4.2.2" *** *)
a(asm_ante_tac⌜Search (n - j) n p ≤ n⌝);
a(POP_ASM_T (strip_asm_tac o rewrite_rule[≤_def]));
a(POP_ASM_T (fn th => rewrite_tac[eq_sym_rule th]));
a(rewrite_tac[plus_assoc_thm]);
a(rewrite_tac[∀_elim⌜1⌝ plus_order_thm]);
(* *** Goal "2" *** *)
a(∃_tac⌜(Search (n - j) n p)⌝ THEN asm_rewrite_tac[]);
a(strip_asm_tac(all_∀_elim search_lemma1));
val ⦏search_lemma3⦎ = pop_thm();
=TEX
Our first main theorem about $Search$ captures the content of the above
three lemmas and also caters for the exceptional case where the
search interval is empty:
=SML
push_goal([], ⌜
	∀p m n⦁	(∃i⦁m ≤ i ∧ i ≤ n ∧ p i)
		⇔	(Search m n p) ≤ n ∧ p(Search m n p)
⌝);
a(REPEAT ∀_tac);
a(cases_tac⌜n < m⌝);
(* *** Goal "1" *** *)
a(once_rewrite_tac[get_spec⌜Search⌝]);
a(asm_rewrite_tac[]);
a(contr_tac);
a(strip_asm_tac(all_∀_elim ¬_≤_thm));
a(strip_asm_tac(all_∀_elim ≤_trans_thm));
(* *** Goal "2" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[¬_less_thm, ≤_def]));
a(lemma_tac⌜m = n - i ∧ i ≤ n⌝);
(* *** Goal "2.1" *** *)
a(POP_ASM_T (fn th => rewrite_tac[eq_sym_rule th]));
(* *** Goal "2.2" *** *)
a(POP_ASM_T ante_tac);
a(rename_tac[] THEN asm_rewrite_tac[search_lemma3]);
val ⦏search_thm1⦎ = save_thm ("search_thm1", pop_thm());
=TEX
For computational purposes, $search_thm1$
is not ideal since it requires computation of $Search$ twice (although
that is easy to remedy) and also, worse, it requires an unnecessary
evaluation of $p$. The following formulation is preferable for computational
purposes:
=TEX
=SML
push_goal([], ⌜
	∀p m n⦁	(∃i⦁m ≤ i ∧ i ≤ n ∧ p i)
		⇔	m ≤ n ∧ (Search m n p) ≤ n
⌝);
a(REPEAT ∀_tac);
a(cases_tac⌜m ≤ n⌝);
(* *** Goal "1" *** *)
a(asm_rewrite_tac[search_thm1, taut_rule⌜∀a b⦁(a ∧ b ⇔ a) ⇔ (a ⇒ b)⌝]);
a(POP_ASM_T (strip_asm_tac o rewrite_rule[≤_def]));
a(lemma_tac⌜m = n - i ∧ i ≤ n⌝);
(* *** Goal "1.1" *** *)
a(POP_ASM_T (fn th => rewrite_tac[eq_sym_rule th]));
(* *** Goal "1.2" *** *)
a(asm_ante_tac⌜i ≤ n⌝ THEN asm_rewrite_tac[search_lemma2]);
(* *** Goal "2" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[¬_≤_thm]));
a(once_rewrite_tac[get_spec⌜Search⌝]);
a(asm_rewrite_tac[]);
a(contr_tac);
a(strip_asm_tac(all_∀_elim ¬_≤_thm));
a(strip_asm_tac(all_∀_elim ≤_trans_thm));
val ⦏search_thm2⦎ = save_thm ("search_thm2", pop_thm());
=TEX
We now wish to apply $Search$ to give a program to test for
primality. To do this we must supply bounds
for the search for a proper factor. This requires some lemmas:
=SML
push_goal([], ⌜
	∀m n⦁	0 < n ⇒
		(m Mod n = 0 ⇔ ∃i⦁i * n = m)
⌝);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(strip_asm_tac(list_∀_elim[⌜m⌝, ⌜n⌝]div_mod_thm));
a(∃_tac⌜m Div n⌝ THEN POP_ASM_T ante_tac THEN asm_rewrite_tac[]);
a(⇒_T (accept_tac o eq_sym_rule));
(* *** Goal "2" *** *)
a(strip_asm_tac(list_∀_elim[⌜m⌝, ⌜n⌝]div_mod_thm));
a(lemma_tac⌜m = i * n + 0⌝);
(* *** Goal "2.1" *** *)
a(GET_ASM_T ⌜i * n = m⌝ rewrite_thm_tac);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(list_∀_elim[⌜m⌝, ⌜n⌝, ⌜i⌝, ⌜0⌝]div_mod_unique_thm));
a(POP_ASM_T rewrite_thm_tac);
val ⦏mod_eq_0_lemma⦎ = pop_thm();
=TEX
=SML
push_goal([], ⌜
	∀m n i⦁ 0 < n ⇒ i * n = m ⇒ i ≤ m
⌝);
a(conv_tac(∀_reorder_conv⌜∀i m n⦁ 0 < n ⇒ i * n = m ⇒ i ≤ m⌝));
a(strip_tac THEN induction_tac⌜i:ℕ⌝);
(* *** Goal "1" *** *)
a(rewrite_tac[]);
(* *** Goal "2" *** *)
a(rewrite_tac[times_def]);
a(REPEAT strip_tac);
a(list_spec_nth_asm_tac 3[⌜i*n⌝, ⌜n⌝]);
a(lemma_tac⌜i*n + 1 ≤ m' ∧ i + 1 ≤ i*n + 1⌝);
(* *** Goal "2.1" *** *)
a(asm_rewrite_tac[]);
a(DROP_ASM_T⌜0 < n⌝(strip_asm_tac o rewrite_rule[less_def, ≤_def]));
a(rewrite_tac[≤_def] THEN ∃_tac⌜i'⌝ THEN asm_rewrite_tac[plus_assoc_thm]);
(* *** Goal "2.2" *** *)
a(strip_asm_tac(rewrite_rule[]
	(list_∀_elim[⌜i+1⌝, ⌜i*n+1⌝, ⌜m'⌝]≤_trans_thm)));
val ⦏times_≤_lemma⦎ = pop_thm();
=TEX
We can now give a computable test for primality:
=SML
push_goal([], ⌜
	∀m⦁	Prime m
		⇔
		¬(	m < 2
		 ∨	2 ≤ (m-1) ∧ Search 2 (m-1) (λf⦁f Factor m) ≤ (m-1))
⌝);
a(rewrite_tac[conv_rule(ONCE_MAP_C eq_sym_conv)search_thm2,
	get_spec ⌜Prime⌝, get_spec ⌜$Factor⌝,
	mod_eq_0_lemma]);
a(REPEAT strip_tac);
(* *** Goal "1" *** *)
a(asm_ante_tac ⌜1 < m⌝ THEN rewrite_tac[¬_less_thm, less_def, ≤_def]);
(* *** Goal "2" *** *)
a(spec_nth_asm_tac 4 ⌜i⌝);
a(GET_NTH_ASM_T 6 (strip_asm_tac o rewrite_rule[less_def, ≤_def]));
a(POP_ASM_T (strip_asm_tac o eq_sym_rule));
a(swap_asm_concl_tac⌜i ≤ m - 1⌝ THEN asm_rewrite_tac[]);
a(LEMMA_T⌜2 = 1 + 1⌝ (fn th => pure_rewrite_tac[th, plus_assoc_thm]));
(* *** Goal "2.1" *** *)
a(rewrite_tac[]);
(* *** Goal "2.2" *** *)
a(rewrite_tac[]);
(* *** Goal "3" *** *)
a(asm_ante_tac ⌜¬ m < 2⌝ THEN rewrite_tac[¬_less_thm, less_def, ≤_def]);
(* *** Goal "4" *** *)
a(lemma_tac⌜2 ≤ i⌝);
(* *** Goal "4.1" *** *)
a(asm_ante_tac⌜1 < i⌝ THEN rewrite_tac[less_def]);
(* *** Goal "4.2" *** *)
a(strip_asm_tac(rewrite_rule[](list_∀_elim[⌜0⌝, ⌜1⌝, ⌜i⌝]less_trans_thm)));
a(strip_asm_tac(list_∀_elim[⌜m⌝, ⌜i⌝]mod_eq_0_lemma));
(* *** Goal "4.2.1" *** *)
a(spec_nth_asm_tac 1 ⌜i'⌝);
(* *** Goal "4.2.2" *** *)
a(POP_ASM_T (strip_asm_tac o once_rewrite_rule[times_comm_thm]));
a(strip_asm_tac(list_∀_elim[⌜m⌝, ⌜i'⌝, ⌜i⌝]times_≤_lemma));
(* *** Goal "4.2.2.1" *** *)
a(POP_ASM_T (strip_asm_tac o rewrite_rule[¬_less_thm]));
a(asm_ante_tac⌜i * i' = m⌝ THEN asm_rewrite_tac[]);
a(⇒_T(asm_tac o eq_sym_rule) THEN asm_ante_tac ⌜¬ m < 2⌝ THEN asm_rewrite_tac[]);
(* *** Goal "4.2.2.2" *** *)
a(spec_nth_asm_tac 7 ⌜i⌝);
a(lemma_tac⌜¬ i + 1 ≤ m⌝);
(* *** Goal "4.2.2.2.1" *** *)
a(LEMMA_T⌜m = (m-1)+1⌝ once_rewrite_thm_tac);
(* *** Goal "4.2.2.2.1.1" *** *)
a(GET_ASM_T ⌜¬ m < 2⌝ (strip_asm_tac o rewrite_rule[¬_less_thm, ≤_def]));
a(POP_ASM_T (rewrite_thm_tac o eq_sym_rule));
a(LEMMA_T⌜2 = 1 + 1⌝ (fn th => pure_rewrite_tac
		[th, plus_assoc_thm] THEN rewrite_tac[]));
a(rewrite_tac[]);
(* *** Goal "4.2.2.2.1.2" *** *)
a(asm_rewrite_tac[]);
(* *** Goal "4.2.2.2.2" *** *)
a(strip_asm_tac(list_∀_elim[⌜i⌝, ⌜m⌝]¬_plus1_≤_thm));
a(strip_asm_tac(list_∀_elim[⌜i⌝, ⌜m⌝]≤_antisym_thm));
val ⦏prime_thm1⦎ = save_thm ("prime_thm1", pop_thm());
=TEX
=SML
val ⦏prime_thm2⦎ = save_thm ("prime_thm2", (
push_goal([], ⌜
	∀m⦁	Prime m
		⇔
		if	m < 2
		then	F
		else if 2 ≤ (m-1)
		then ¬Search 2 (m-1) (λf⦁f Factor m) ≤ (m-1)
		else T
⌝);
a(rewrite_tac[taut_rule⌜∀a b c⦁(if a then F else if b then ¬c else T) ⇔ ¬(a ∨ (b ∧ c))⌝,
	prime_thm1]);
pop_thm()
));
=TEX
=SML
compile (Theorem "prime_thm2");
(* compile (Function ⌜Search⌝);
compile (Function ⌜$Factor⌝); *)
rewrite_conv[]⌜Prime 0⌝;
rewrite_conv[]⌜Prime 1⌝;
rewrite_conv[]⌜Prime 2⌝;
rewrite_conv[]⌜Prime 3⌝;
rewrite_conv[]⌜Prime 4⌝;
rewrite_conv[]⌜Prime 5⌝;
rewrite_conv[]⌜Prime 6⌝;
rewrite_conv[]⌜2**(2**1) + 1⌝;
rewrite_conv[]⌜Prime 5⌝;
rewrite_conv[]⌜2**(2**2) + 1⌝;
rewrite_conv[]⌜Prime 17⌝;
(RAND_C (rewrite_conv[]) THEN_C rewrite_conv[])⌜Prime (2**(2**2) + 1)⌝;
=GFT HOL Input
rewrite_conv[]⌜Prime (2**(2**2) + 1)⌝; (* loops *)
rewrite_conv[]⌜2**(2**3) + 1⌝;
rewrite_conv[]⌜Prime 257⌝;
rewrite_conv[]⌜2**(2**4) + 1⌝;
rewrite_conv[]⌜Prime 65537⌝;
rewrite_conv[]⌜2**(2**5) + 1⌝;
rewrite_conv[]⌜Prime 4294967297⌝;
rewrite_conv[]⌜Prime 101⌝;
=TEX
\subsection{Axiomatised Results}
Now to demonstration the behaviour of axiomatised results,
and cacheing possibilites:
=SML
open_theory "arith_demo";
new_theory ⦏"false"⦎;
val ⦏false_axiom⦎ = new_axiom(["false","false_axiom"],⌜F⌝);
open_theory"arith_demo";
new_theory ⦏"arith_demo2"⦎;
new_parent "false";

fun ⦏mk_thm⦎ (t:TERM) : THM = contr_rule t false_axiom;

infix C;
fun	0 C 0 = 1
|	n C 0 = 1
|	0 C n = 0
|	n C j = ((n-1) C (j-1)) + ((n-1) C j);
local val opC = ⌜$C⌝;
	val mk = mk_ℕ o integer_of_int;
	val dest = int_of_integer o dest_ℕ;
in
fun C_conv t =
	let	val (opr,b) = dest_app t;
	in	let val (opr, a) = dest_app opr;
		in	(if opr =$ opC
			then	mk_thm (mk_eq (t,mk((dest a) C (dest b))))
			else	fail_conv t)
		end
	end;
end;
=GFT HOL Input
ONCE_MAP_C C_conv ⌜[
[0 C 0; 0 C 1; 0 C 2; 0 C 3; 0 C 4; 0 C 5; 0 C 6; 0 C 7];
[1 C 0; 1 C 1; 1 C 2; 1 C 3; 1 C 4; 1 C 5; 1 C 6; 1 C 7];
[2 C 0; 2 C 1; 2 C 2; 2 C 3; 2 C 4; 2 C 5; 2 C 6; 2 C 7];
[3 C 0; 3 C 1; 3 C 2; 3 C 3; 3 C 4; 3 C 5; 3 C 6; 3 C 7];
[4 C 0; 4 C 1; 4 C 2; 4 C 3; 4 C 4; 4 C 5; 4 C 6; 4 C 7];
[5 C 0; 5 C 1; 5 C 2; 5 C 3; 5 C 4; 5 C 5; 5 C 6; 5 C 7];
[6 C 0; 6 C 1; 6 C 2; 6 C 3; 6 C 4; 6 C 5; 6 C 6; 6 C 7];
[7 C 0; 7 C 1; 7 C 2; 7 C 3; 7 C 4; 7 C 5; 7 C 6; 7 C 7]]⌝;
=SML
fun fact n = if n = zero then one else n @* fact(n@-one);

local val opfact = ⌜$!⌝
in
fun fact_conv t =
	let	val (opr,a) = dest_app t;
	in	if opr =$ opfact
		then	mk_thm (mk_eq (t,mk_ℕ(fact (dest_ℕ a))))
		else	fail_conv t
	end;
end;
=SML
(* compile (Function ⌜$!⌝); *)
rewrite_conv [] ⌜10!⌝;
fact_conv ⌜300!⌝;

fun ⦏CACHE_C⦎ (cnv:CONV):CONV = (
let	val cache = ref empty_net;
in
	(fn tm =>
	let	val poss = net_lookup (!cache)  tm
	in
	snd(find poss (fn (p,q) => p =$ tm))
	handle complaint =>
	(let val cnv_tm = cnv tm;
		val dummy = (cache:= net_enter (tm,(tm,cnv_tm)) (!cache));
	in
		cnv_tm
	end)
	end)
end);
val cache_fact_conv = CACHE_C fact_conv;
(* PolyML.timing true; *)
cache_fact_conv ⌜300!⌝;
cache_fact_conv ⌜300!⌝;
(* PolyML.timing false; *)


open_theory"arith_demo";
rewrite_conv []⌜10!⌝;
=TEX
=GFT HOL Input
fact_conv ⌜100!⌝; (* fails as ⊢ F out of scope *)
=TEX
=SML
get_ancestors"-";
get_ancestors"arith_demo2";
flat(map get_axioms (get_ancestors "arith_demo"));
flat(map get_axioms (get_ancestors "arith_demo2"));
=TEX

\section{THE SCRIPT : PREDICATE CALCULUS}
This section includes some examples of pure predicate calculus proofs,
proofs in set theory, and proofs of results involving
computation of arithmetic facts.
=SML
open_theory"hol";
repeat drop_main_goal;
push_pc "hol";
=TEX

The following are included to demonstrate the resolution package.
=SML
fun res_rule t = tac_proof (([],t), prove_tac[]);
=SML
taut_rule ⌜a ∧ b ∧ c ∧ d ∧ e ∧ f ⇒ g
	⇔ a ⇒ b ⇒ c ⇒ d ⇒ e ⇒ f ⇒ g⌝;
res_rule ⌜a ∧ b ∧ c ∧ d ∧ e ∧ f ⇒ g
	⇔ a ⇒ b ⇒ c ⇒ d ⇒ e ⇒ f ⇒ g⌝;
=TEX
A nice little result:
=SML
res_rule ⌜(∃x⦁∀y⦁ P x y) ⇒ ∀x⦁∃y⦁ P y x⌝;
=TEX
The first full example is intended to demonstrate how simple predicate calculus proofs are.
=SML
push_goal([],⌜
	(∃z⦁ p z)∧(∃z⦁ q z)
	⇒	(((∀z⦁ p z ⇒ r z) ∧ (∀z⦁ q z ⇒ s z))
		⇔ (∀z w⦁ p z ∧ q w ⇒ r z ∧ s w))
		⌝);
a contr_tac;

a (list_spec_asm_tac
	⌜∀ z⦁ p z ⇒ r z⌝ [⌜z''⌝]);
a (list_spec_asm_tac
	⌜∀ z⦁ q z ⇒ s z⌝ [⌜w⌝]);
a (list_spec_asm_tac
	⌜∀ z w⦁ p z ∧ q w ⇒ r z ∧ s w⌝ [⌜z''⌝,⌜z'⌝]);
a (list_spec_asm_tac
	⌜∀ z w⦁ p z ∧ q w ⇒ r z ∧ s w⌝ [⌜z⌝,⌜z''⌝]);
val P11_71 = pop_thm();
=TEX
To show that stripping in slow motion:
=GFT
push_goal([],⌜
	(∃z⦁ p z)∧(∃z⦁ q z)
	⇒	(((∀z⦁ p z ⇒ r z) ∧ (∀z⦁ q z ⇒ s z))
		⇔ (∀z w⦁ p z ∧ q w ⇒ r z ∧ s w))
		⌝);
a step_strip_tac;
a step_strip_tac;
a step_strip_tac;
a step_strip_tac;
    ....
=TEX
Finally, do it by resolution:
=SML
push_goal([],⌜
	(∃z⦁ p z)∧(∃z⦁ q z)
	⇒	(((∀z⦁ p z ⇒ r z) ∧ (∀z⦁ q z ⇒ s z))
		⇔ (∀z w⦁ p z ∧ q w ⇒ r z ∧ s w))
		⌝);
a(prove_tac []);
val P11_71 = pop_thm();
=TEX
Elementary set theory results are demonstrated next.
First the ones that stripping is good enough for.
=SML
push_pc "hol1";

(* results provable by stripping *)

val terms1 =
	[
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
		⌜(a ∪ b) \ c = (a \ c) ∪ (b \ c)⌝,
		⌜a \ (b ∩ c) = (a \ b) ∪ (a \ c)⌝,
		⌜¬ x ∈ {}⌝,
		⌜a ⊆ a⌝,
		⌜¬ a ⊂ a⌝,
		⌜{} ⊆ a⌝,
		⌜⋃ {} = {}⌝,
		⌜⋂ {} = Universe⌝
	];
	
=SML
(* results provable using resolution *)

val terms2 =
	[	⌜a ⊆ b ⇔ a ∈ ℙ b⌝,
		⌜a ⊆ b ∧ b ⊆ a ⇔ a = b⌝,
		⌜¬ (a ⊂ b ∧ b ⊂ a)⌝,
		⌜a ⊆ b ∧ b ⊆ c ⇒ a ⊆ c⌝,
		⌜a ⊂ b ∧ b ⊂ c ⇒ a ⊂ c⌝,
		⌜{} ⊂ a ⇔ ¬ a = {}⌝,
		⌜⋃ (a ∪ b) = (⋃ a) ∪ (⋃ b)⌝,
		⌜⋂ (a ∪ b) = (⋂ a) ∩ (⋂ b)⌝,
		⌜ a ⊆ b ⇒ ⋃ a ⊆ ⋃ b ⌝,
		⌜ a ⊆ b ⇒ ⋂ b ⊆ ⋂ a ⌝
	];
=TEX
=GFT
(* use this to step through individual proofs *)

set_goal([],⌜
⌝);
a step_strip_tac;
a (rewrite_tac[]);
a set_tac;
=TEX
=SML
(* use this to do them all at once *)

(* by stripping *)

let fun rule x = tac_proof (([],x),(REPEAT strip_tac))
in map rule terms1
end;

(* by resolution *)

let fun rule x = tac_proof (([],x), prove_tac [])
in map rule terms2
end;

=TEX
Next a more difficult one from Principia Mathematica.
=SML
push_goal([],⌜
	epsilon ⊆ alpha ∧ eta ⊆ beta ∧ ( alpha ∩ beta = {})
	⇒ ((epsilon ∪ eta)\ alpha=eta) ∧
		((epsilon ∪ eta)\ beta=epsilon)
		⌝);
a(prove_tac []);
val P24_494 = pop_thm();
=TEX
Or, done the hard way:
=SML
push_goal([],⌜
	epsilon ⊆ alpha ∧ eta ⊆ beta ∧ ( alpha ∩ beta = {})
	⇒ ((epsilon ∪ eta)\ alpha=eta) ∧
		((epsilon ∪ eta)\ beta=epsilon)
		⌝);
a (rewrite_tac []);
(* (map (get_defn "sets") ["⊆","\\","∪","∩","∈","Empty"]); *)

a contr_tac;
a (list_spec_nth_asm_tac 6 [⌜x⌝]);
a (list_spec_nth_asm_tac 4 [⌜x⌝]);
a (list_spec_nth_asm_tac 4 [⌜x⌝]);
a (list_spec_nth_asm_tac 5 [⌜x⌝]);
a (list_spec_nth_asm_tac 5 [⌜x⌝]);
a (list_spec_nth_asm_tac 4 [⌜x⌝]);
val P24_494 = pop_thm();
=TEX
=IGN
From wrk022.doc.
**************************************************
=TEX

\section{THE SCRIPT: MODAL LOGIC DEMONSTRATION}
As the HOL logic is well-established and uncontroversial
mathematically, and as \Product{}
is constructed so as to maximise assurance in the
correctness of the theorems it proves with respect
to that logic, use of HOL to support other formalisms
means that the soundness of such support tools does not
have to be established on an {\em ad hoc} basis.

This section reports on a brief investigation into embedding the
possible worlds semantics for modal logic in HOL.
The purpose of the investigation was to demonstrate some of the new
capabilities of \Product{} and to show
by means of examples
how a semantic embedding of this sort is used to provide
proof support for formalisms other than HOL.

The treatment of the possible worlds semantics we give is by no means new.
It is essentially just a translation into HOL
of the sort of set-theoretic treatment which may be found
in any text-book on modal logic, for example, \cite{Boolos79}.

\subsection{Modal Logics}
Modal propositional calculus is the ordinary propositional calculus
augmented by an additional connective, $\Box$. If $A$ is a proposition
then $\Box A$, the {\em necessitation} of $A$, was originally intended
to connote the idea that $A$ was, in some sense, a necessary rather
than a contingent fact. The semantics for this calculus, due to
Kripke, explicates this notion of necessity in terms of systems,
called {\em frames} in the literature.
A frame comprises a set of
{\em possible worlds} supplied with a relation of {\em accessibility}
between worlds. A proposition is viewed as necessary in a world
if its truth in each world, $x$, implies its truth in every world
accessible from $x$.

It turns out that by placing various constraints on the accessibility
relation, we arrive at semantics which interpret the
necessitation operator in interesting and useful ways, for example:

\begin{itemize}
\item
transitive accessibility relations for which all ascending chains
are finite correspond to
a view of $\Box$ which is closely related to the provability
predicate for Peano arithmetic. This leads to a useful conceptual framework
for understanding provability, consistency and self-reference
in the theory of arithmetic (see \cite{Boolos79}).
\item
Various forms of linear accessibility relation correspond to a view of $\Box$
as a temporal operator, with $\Box A$ meaning that $A$ will always hold
if it holds now (see, e.g., \cite{Benthem88}).
\item
Taking the worlds as the states of a computer and taking ``$x$ is accessible
from $y$'' to mean ``$x$ results when we execute program $p$ in state $y$'',
we get a modal logic which is closely connected with weakest-precondition
semantics for programming languages (see \cite{Benthem88}).
\item
Taking the worlds as the possible states of knowledge (or belief)
of some individual and taking
the accessibility relation to represent ways in which these states
grow through the acquisition of new knowledge (or belief), we get various forms
of {\em epistemic modal logic} (or {\em doxastic
modal logic}), in which $\Box A$ means that $A$ is known (or believed).
Such logics, usually extended to cover relationships between
the knowledge (or belief) of several individuals,
have many applications in artificial intelligence and in
the study of communication protocols in distributed computer systems
(see \cite{Ramsay88,burrows89}).
\end{itemize}

In the sequel we are going to formalise the possible worlds semantics
in HOL and prove the semantic justification of two rules
of inference for modal logic.

We will also prove some theorems, due to Kripke, about
some axioms used in various modal calculi.
To state the axioms we introduce the {\em possibility} operator, $\Diamond$.
$\Diamond A$ is defined as $¬(\Box(¬A))$.
In each case, the theorem we prove says that an axiom is valid provided
the accessibility relation possesses a certain property. The axioms
and properties are shown in the following table:

\begin{center}
\begin{tabular}{|l|l|l|}\hline
Axiom 1 & $\Box A⇒A$ & Reflexive \\\hline
Axiom 2 & $\Box A⇒\Box(\Box A)$ & Transitive \\\hline
Axiom 3 & $A⇒\Box (\Diamond A)$ & Symmetric \\\hline
Axiom 4 & $\Diamond A⇒\Box (\Diamond A)$ & Euclidean \\\hline
\end{tabular}
\end{center}

(The notion of a euclidean relation is defined in section \ref{AUXILIARYDEFINITIONS}
below.)

Note that the appropriateness of the above axioms depends on the application.
For example, they are all arguably appropriate for the epistemic reading,
for which, say, 2 is the so-called principle of ``positive introspection'':
`if $A$ is known, then it is known that $A$ is known'.
However, axiom 1 is inappropriate for the doxastic reading: we cannot
assert that a proposition is true just because it is believed.

=SML
open_theory"hol";
new_theory ⦏"modal_logic"⦎;

let	open ReaderWriterSupport.PrettyNames;
in	
	(add_new_symbols [(["Diamond"], Nil, Simple)] handle (Fail _) => ();
	add_new_symbols [(["Box"], Nil, Simple)] handle (Fail _) => ())
end;

repeat drop_main_goal;
push_pc "hol";
=TEX
\subsection{Auxiliary Definitions}\label{AUXILIARYDEFINITIONS}
We need definitions of the concepts of $reflexive$, $transitive$,
$symmetric$ and $euclidean$ relations in HOL.

As we have already mentioned, HOL is a polymorphic variant
of simple type theory. In such a system properties of values of type $τ$ are
represented as propositional functions, that is to say they are
objects of type
=INLINEFT
τ → BOOL
=TEX
{}, where $BOOL$ is the two-point type
of truth values. A binary relation on a type $τ$
is a two-argument propositional function, i.e., it has type
=INLINEFT
τ → τ → BOOL
=TEX
{}.

Polymorphism allows us to use variables
which range over types, such type variables are distinguished syntactically
by having names beginning with the character $'$.
The propositional functions $Reflexive$, $Transitive$, etc. which
we will shortly define are polymorphic constants, they may be applied
to any value whose type has the form
=INLINEFT
τ → τ → BOOL
=TEX
{}.

The definitions of the four properties of relations we need follow:

ⓈHOLCONST
	⦏Reflexive⦎: ('a → 'a → BOOL) → BOOL
├
	∀rel⦁ Reflexive rel ⇔ ∀x⦁ rel x x
■

ⓈHOLCONST
	⦏Transitive⦎: ('a → 'a → BOOL) → BOOL
├
	∀rel⦁ Transitive rel ⇔ ∀x y z⦁ rel x y ∧ rel y z ⇒ rel x z
■

ⓈHOLCONST
	⦏Symmetric⦎: ('a → 'a → BOOL) → BOOL
├
	∀rel⦁ Symmetric rel ⇔ ∀x y⦁ rel x y ⇒ rel y x
■

ⓈHOLCONST
	⦏Euclidean⦎: ('a → 'a → BOOL) → BOOL
├
	∀rel⦁ Euclidean rel ⇔ ∀x y z⦁ rel x y ∧ rel x z ⇒ rel y z
■
=TEX

\subsection{Possible World Semantics in HOL}
\subsubsection{Frames}
In a set-theoretic treatment a {\em frame} consists of a non-empty set $W$, of
{\em possible worlds}, equipped with a binary relation, $R$, the
{\em accessibility} relation. We will use a type variable
$'W$ to represent the set of possible worlds, so that our general treatment
can be instantiated to a particular type of possible worlds.
We can thus capture the notion
of a frame using the following type abbreviation:
=SML
declare_type_abbrev (⦏"FRAME"⦎, ["'W"], ⌜:'W → 'W → BOOL⌝);
=TEX
The above declaration introduces a new type abbreviation $FRAME$ with a single
formal parameter $'W$; The effect of the declaration is that, for example,
the type expression  $⌜{:}(ℕ)FRAME⌝$ will represent the type
$⌜:ℕ → ℕ → BOOL⌝$ of binary
relations on the type $ℕ$ of natural numbers. Thus a value
of type $⌜{:}(ℕ)FRAME⌝$ can be viewed as a frame in which the possible
worlds are numbers.

We will use the variable $R$ for accessibility relations,
and $x$, $y$ and $z$ for worlds.
\subsubsection{Valuations}
A {\em valuation} will be a function assigning a truth-value to every possible
world. In a syntactic treatment we would work with an {\em evaluator}
assigning valuations in this sense to the propositional variables. In our
approach we can use HOL variables of the appropriate type to represent
the semantics directly. We use the following type abbreviation for
valuations:
=SML
declare_type_abbrev (⦏"VALUATION"⦎, ["'W"], ⌜:'W →BOOL⌝);
=TEX
Thus, for example, a value of type $⌜{:}(ℕ)VALUATION⌝$ is a propositional function on
the natural numbers.

We will use the variables $A$, $B$ and $C$ for valuations.
\subsubsection{Propositional Connectives}
It is straightforward to give the semantics of the ordinary
propositional connectives in their modal guise.
In each case the modal version of a connective
combines the valuations which are its operands to give a valuation
which asserts that for every world
the corresponding propositional connective holds
between the values taken by the operands in that world.
The definitions of these connectives are therefore independent of
any accessibility relation.

We will take implication and negation as our primitive connectives
and define others in terms of them:

ⓈHOLCONST
	⦏⇒_modal⦎: ('W)VALUATION → ('W)VALUATION → ('W)VALUATION
├
	∀A B x⦁ ⇒_modal A B x ⇔ A x ⇒ B x
■


ⓈHOLCONST
	⦏¬_modal⦎: ('W)VALUATION → ('W)VALUATION
├
	∀A x⦁ ¬_modal A x ⇔ ¬A x
■
=TEX
In making the above definitions, we had to distinguish the names for the modal
connectives from those already reserved for the propositional connectives
in HOL. The {\em alias} mechanism supported by \Product{} allows us to use
the usual names instead as syntactic abbreviations. The following
declarations achieve this:
=SML
declare_alias(⦏"⇒"⦎, ⌜⇒_modal: ('W)VALUATION → ('W)VALUATION
	→ ('W)VALUATION⌝);
declare_alias(⦏"¬"⦎, ⌜¬_modal: ('W)VALUATION → ('W)VALUATION⌝);
=TEX
To see how this works, we can now use a more natural syntax for
the definition of modal disjunction and conjunction:

ⓈHOLCONST
	⦏∨_modal⦎: ('W)VALUATION → ('W)VALUATION →
		('W)VALUATION
├
	∀A B⦁ ∨_modal A B = (¬A ⇒ B)
■

ⓈHOLCONST
	⦏∧_modal⦎: ('W)VALUATION → ('W)VALUATION →
		('W)VALUATION
├
	∀A B⦁ ∧_modal A B = ¬(A ⇒ ¬B)
■
=TEX
Note here that $¬$ and $⇒$ refer to the modal connectives. The HOL
$¬$ and $⇒$ may still be used --- \Product{}
identifies the appropriate internal representation on the basis of the types
of the operands.

As with the other connectives we make alias declarations for the
modal disjunction and conjunction:
=SML
declare_alias(⦏"∨"⦎, ⌜∨_modal: ('W)VALUATION → ('W)VALUATION → ('W)VALUATION⌝);
declare_alias(⦏"∧"⦎, ⌜∧_modal: ('W)VALUATION → ('W)VALUATION → ('W)VALUATION⌝);
=TEX


\subsubsection{Necessitation}
The necessitation operator, $\Box$, is defined with respect to
a given frame $R$; The necessitation of a valuation, $A$, is the valuation
which is true at a world $x$ if and only if $A$ is true at every world
accessible from $x$. The HOL definition of this is as follows
ⓈHOLCONST
	⦏%Box%⦎: ('W)FRAME → ('W)VALUATION → ('W)VALUATION
├
	∀R A x⦁ %Box%R A x ⇔ ∀y⦁ R x y ⇒ A y
■
=TEX
\subsubsection{Possibility}
The possibility operator, $\Diamond$, is defined in terms of
necessitation and negation as follows:
ⓈHOLCONST
	⦏%Diamond%⦎: ('W)FRAME → ('W)VALUATION → ('W)VALUATION
├
	∀R A⦁ %Diamond% R A = ¬(%Box%R(¬A))
■
=TEX

\subsubsection{Validity}
A valuation is valid if it is true in every world. Thus:
ⓈHOLCONST
	⦏Valid⦎: ('W)VALUATION → BOOL
├
	∀A⦁ Valid A ⇔ ∀x⦁ A x
■
=TEX
\subsubsection{A Rewrite System}

In the sequel, we will use the above definitions to prove some theorems
about the semantics. The proofs will have a common pattern, in which
the first step is to expand out the above definitions to reduce the goal
to be proved to a proposition in the predicate calculus. The following
ML command gives us an ML value containing the list of defining theorems
which we use to do this.
=SML
val ⦏modal_rewrites⦎ = map snd (get_defns"-");
=TEX
This pattern of proof is common in most applications of HOL: at the beginning
of building a theory, one often has to reduce problems to first principles.
Usually, once one has established a basic repertoire of theorems
characterising the problem domain, subsequent
proofs are performed at a higher-level using the characterising theorems.

\subsection{Inference Rules}\label{INFERENCERULES}
Using the definitions of the previous section we can now prove
some results about the modal operators.
In this section we prove two theorems which are the semantic justifications
for the two inference rules usually associated with modal logics.

\subsubsection{Modus Ponens}
The rule of modus ponens for modal logic is given by the following
HOL theorem.
As an inference rule, modus ponens says that from (the theoremhood of)
$A\,⇒\,B$ and (the theoremhood of) $A$ we may infer
(the theoremhood of) $B$.
The semantic justification of this is the theorem we shall now
prove which asserts that if
$A\,⇒\,B$ and $A$ are valid, then so is $B$.

In the following statement of this theorem note that the conjunction
and the second implication are the HOL logical connectives. The first
implication is the modal one.
=SML
push_goal([], ⌜∀A B⦁ Valid (A ⇒ B) ∧ Valid A ⇒ Valid B⌝);
=TEX
The above command initiates a session with the \Product{} subgoal package,
the standard means of finding proofs by a goal oriented search.
Goals are reduced to subgoals by applying tactics. A discussion of
how proofs are conducted is outside the scope of this document.
The proofs given here follow a common pattern. First we rewrite with
the definitions to reduce the goal to a predicate calculus proposition.
We then break this down using the standard tactic for simplifying
such propositions, $strip_tac$.
This simplification gives us a simpler goal and some assumptions
with which to prove it. In most of the present proofs, one or more of the
assumptions turns out to be a universally quantified
formula, which we use to prove the goal by specialisation and rewriting.
=SML
a(rewrite_tac modal_rewrites);
a(REPEAT strip_tac);
a(POP_ASM_T (ante_tac o ∀_elim⌜x⌝) THEN asm_rewrite_tac[]);
=TEX
This completes the proof of our goal. We save the theorem in
the HOL theory as follows:
=SML
val ⦏modal_mp_thm⦎ = save_thm("modal_mp_thm", pop_thm());
=TEX
\subsubsection{Necessitation}
The rule of necessitation says that from $A$ we may infer $\Box A$.
Again this rule holds for any accessibility relation.
=SML
push_goal([], ⌜∀R A⦁ Valid A ⇒ Valid (%Box%R A)⌝);
=TEX
=SML
a(rewrite_tac modal_rewrites);
a(REPEAT strip_tac THEN asm_rewrite_tac[]);
=TEX
=SML
val ⦏necessitation_thm⦎ = save_thm("necessitation_thm", pop_thm());
=TEX
\subsection{The Distribution Axiom Schemata}
The distribution axiom schemata contains all sentences of the
form
=INLINEFT
%Box% (A ⇒ B) ⇒ (%Box% A ⇒ %Box% B)
=TEX
{}.
The semantic justification for this is proved as follows:
=SML
push_goal([], ⌜∀R A B⦁ Valid (%Box%R(A ⇒ B)) ⇒ Valid (%Box%R A ⇒ %Box%R B)⌝);
=TEX
=SML
a(rewrite_tac modal_rewrites);
a(REPEAT strip_tac);
a(DROP_NTH_ASM_T 3 (ante_tac o list_∀_elim[⌜x⌝, ⌜y⌝]));
a(DROP_NTH_ASM_T 2 (ante_tac o ∀_elim  ⌜y⌝) THEN asm_rewrite_tac[]);
a(REPEAT strip_tac);
=TEX
=SML
val ⦏distribution_thm⦎ = save_thm("distribution_thm", pop_thm());
=TEX
\subsection{Four Axioms}
In this section we prove the promised four theorems about the interplay
between certain modal axioms and properties of the accessibility
relation.
\subsubsection{Axiom 1}
This axiom holds for reflexive accessibility relations:
=SML
push_goal([], ⌜∀R⦁ Reflexive R ⇒ ∀A⦁ Valid(%Box%R A ⇒ A)⌝);
=TEX
=SML
a(rewrite_tac modal_rewrites);
a(REPEAT strip_tac);
a(POP_ASM_T (ante_tac o ∀_elim⌜x⌝) THEN asm_rewrite_tac[]);
=TEX
=SML
val ⦏axiom1_thm⦎ = save_thm("axiom1_thm", pop_thm());
=TEX
\subsubsection{Axiom 2}
This axiom holds for transitive accessibility relations:
=SML
push_goal([], ⌜∀R⦁ Transitive R ⇒ ∀A⦁ Valid(%Box%R A ⇒ %Box%R (%Box%R A))⌝);
=TEX
=SML
a(rewrite_tac modal_rewrites);
a(REPEAT strip_tac);
a(DROP_NTH_ASM_T 4 (ante_tac o list_∀_elim[⌜x⌝, ⌜y⌝, ⌜y'⌝]) THEN asm_rewrite_tac[]);
=TEX
=SML
val ⦏axiom2_thm⦎ = save_thm("axiom2_thm", pop_thm());
=TEX
\subsubsection{Axiom 3}
This axiom holds for symmetric accessibility relations:
=SML
push_goal([], ⌜∀R⦁ Symmetric R ⇒ ∀A⦁ Valid(A ⇒ %Box%R (%Diamond% R A))⌝);
=TEX
=SML
a(rewrite_tac modal_rewrites);
a(REPEAT strip_tac);
a(DROP_NTH_ASM_T 3 (ante_tac o list_∀_elim[⌜x⌝, ⌜y⌝]) THEN asm_rewrite_tac[]);
a(REPEAT strip_tac THEN simple_∃_tac⌜x⌝ THEN asm_rewrite_tac[]);
=TEX
=SML
val ⦏axiom3_thm⦎ = save_thm("axiom3_thm", pop_thm());
=TEX
\subsubsection{Axiom 4}
This axiom holds for euclidean accessibility relations:
=SML
push_goal([], ⌜∀R⦁ Euclidean R ⇒ ∀A⦁ Valid(%Diamond% R A ⇒ %Box%R (%Diamond% R A))⌝);
=TEX
=SML
a(rewrite_tac modal_rewrites);
a(REPEAT strip_tac);
a(DROP_NTH_ASM_T 4 (ante_tac o list_∀_elim[⌜x⌝, ⌜y'⌝, ⌜y⌝]) THEN asm_rewrite_tac[]);
a(REPEAT strip_tac THEN ∃_tac⌜y⌝ THEN asm_rewrite_tac[]);
=TEX
=SML
val ⦏axiom4_thm⦎ = save_thm("axiom4_thm", pop_thm());
=TEX

\subsection{Proof Support for a Modal Logic}
In this section we implement inference rules for modal logic,
and also implement the axiom schemata for
the modal logic traditionally called $T$.
$T$ has as its axioms all distribution axioms,
all instances of ordinary propositional tautologies
and all sentences of the form $\Box A ⇒ A$.

Note that we use the term ``axioms'' here
for what are actually theorems derived from our definitions
of the semantics.
The axiom schemata are implemented
as proof procedures, i.e.,
ML functions which prove rather than merely postulate the ``axioms''
in question.

Examples of the use of the rules and axiom schemata are given in section
\ref{ExampleProofs} below.

\subsubsection{Implementing the Inference Rules}
In this section we implement derived rules in HOL corresponding
to the theorems proved in section \ref{INFERENCERULES} above.

The first rule is modus ponens. Given as its arguments theorems of
the form $Γ ⊢ Valid(A ⇒ B)$\footnote{%
The HOL logic is formulated as a {\em sequent calculus}:
the assertions one proves comprise a list of assumptions and a
conclusion. We write $Γ ⊢ t$ for a theorem with assumptions $Γ$ and
conclusion $t$.}%
and $Δ ⊢ Valid\,A$ it will prove the theorem
$Γ ∪ Δ ⊢ Valid\,B$.
This is done with HOL rules to instantiate our
theorem on modus ponens and to use the theorem arguments to
discharge the antecedents of the resulting implication.
=SML
fun ⦏modal_mp_rule⦎ (thm1 : THM) (thm2 : THM) : THM = (
	simple_⇒_match_mp_rule modal_mp_thm (∧_intro thm1 thm2)
);
=TEX
The second rule is necessitation. Given as arguments a term, $⌜R⌝$,
and a theorem
of the form $Γ ⊢ Valid\,A$, it will prove $Γ ⊢ Valid(\Box R A)$.
This is done by instantiating our theorem on necessitation.
=SML
fun ⦏nec_rule⦎ (R : TERM) (thm : THM) : THM = (
	inst_term_rule [(R, ⌜R:('a)FRAME⌝)]
	(simple_⇒_match_mp_rule necessitation_thm thm)
);
=TEX

\subsubsection{Implementing the Axiom Schemata}
It is usual in modal calculi to take all ordinary propositional
tautologies as axioms. The following ML code implements this rule
by proving all such axioms. This proof procedure works
by rewriting with the
definitions of validity and all the modal connectives except $\Box$, and then
using $strip_tac$ to prove the resulting proposition.
=SML
local
	val rw_thms =
	(map(get_defn"-")
		["%Diamond%", "∧_modal", "∨_modal", "¬_modal",
		 "⇒_modal", "Valid"]);
in
fun ⦏modal_taut_rule⦎ (tm : TERM) : THM = (
	tac_proof( ([], tm),
	rewrite_tac rw_thms
	THEN REPEAT strip_tac)
);
end;
=TEX
It is also usual to take all instances of the distribution
axiom as axioms. This is implemented by the following proof procedure
which takes the accessibility relation, $⌜R⌝$, and terms
$⌜A⌝$ and $⌜B⌝$ as arguments and proves
$⊢ \Box R(A ⇒ B) ⇒ (\Box R\,A ⇒ \Box R\,B)$. The proof is done by
instantiating our theorem on the distribution axiom appropriately.
=SML
fun ⦏dist_rule⦎ (R : TERM) (A : TERM) (B : TERM) : THM = (
	inst_term_rule
	(combine [R, A, B] (fst(strip_∀(concl distribution_thm))))
	(all_simple_∀_elim distribution_thm)
);
=TEX
With reference to our theorem about axiom 1, to complete
our rules and axioms for the system $T$
we need assume that some unspecified accessibility relation
$R$ is symmetric.
The following proof procedure proves instances of axiom 1 on the
assumption of a symmetric
accessibility relation, $R$.
=SML
fun ⦏axiom1_rule⦎ (tm : TERM) : THM = (
	⇔_t_elim(rewrite_conv[undisch_rule(all_simple_∀_elim axiom1_thm)] tm)
);
=TEX

\subsubsection{Example Proofs}\label{ExampleProofs}
As examples, we will prove the (semantic justifications of)
the following two theorems of the system $T$. The
two results are given as theorem 6 in chapter 1 of \cite{Boolos79} and
the proofs we give follow the ones give there.

=GFT Informal Example
	⊢ A ⇒ %Diamond% A
	⊢ %Box% A ⇒ %Diamond% A
=TEX
For expository purposes, we have written the proof out step by step.
In actual use, the main purpose of the sort of rules we have implemented
is to enable the construction of higher-level and more powerful
facilities for finding proofs. Proofs at the level of detail seen
here would not be seen by the user.

The following sequence of computations, then, is the HOL
proof of the two results. After each step
we show the output produced by \Product{} after executing
that step.
Note that, essentially, we are now working purely in modal logic:
we no longer see any HOL logical operators, just
terms of the form $⌜Valid\,A⌝$ where $A$ involves only modal
connectives; all proof steps are done using the modal inference rules
and axiom schemata we have coded above.

=SML
val ⦏lemma1⦎ = axiom1_rule ⌜Valid(%Box% R (¬A) ⇒ ¬A)⌝;
=TEX
=GFT HOL Output
val lemma1 = Reflexive R ⊢ Valid (%Box% R (¬ A) ⇒ ¬ A) : THM
=TEX
=SML
val ⦏lemma2⦎ = modal_taut_rule⌜Valid((%Box% R(¬A) ⇒ ¬A) ⇒ (A ⇒ %Diamond% R A))⌝;
=TEX
=GFT HOL Output
val lemma2 = ⊢ Valid ((%Box% R (¬ A) ⇒ ¬ A) ⇒ A ⇒ %Diamond% R A) : THM
=TEX
=SML
val ⦏result1⦎ = save_thm("result1", modal_mp_rule lemma2 lemma1);
=TEX
=GFT HOL Output
val result1 = Reflexive R ⊢ Valid (A ⇒ %Diamond% R A) : THM
=TEX
=SML
val ⦏lemma3⦎ = modal_taut_rule⌜Valid((%Box% R A ⇒ A) ⇒ (A ⇒ %Diamond% R A) ⇒ (%Box% R A ⇒ %Diamond% R A))⌝;
=TEX
=GFT HOL Output
val lemma3 = ⊢ Valid ((%Box% R A ⇒ A) ⇒ (A ⇒ %Diamond% R A) ⇒ %Box% R A ⇒ %Diamond% R A) : THM
=TEX
=SML
val ⦏lemma4⦎ = axiom1_rule ⌜Valid(%Box%R A ⇒ A)⌝;
=TEX
=GFT HOL Output
val lemma4 = Reflexive R ⊢ Valid (%Box% R A ⇒ A) : THM
=TEX
=SML
val ⦏lemma5⦎ = modal_mp_rule lemma3 lemma4;
=TEX
=GFT HOL Output
val lemma5 = Reflexive R ⊢ Valid ((A ⇒ %Diamond% R A) ⇒ %Box% R A ⇒ %Diamond% R A) : THM
=TEX
=SML
val ⦏result2⦎ = save_thm("result2", modal_mp_rule lemma5 result1);
=TEX
=GFT HOL Output
val result2 = Reflexive R ⊢ Valid (%Box% R A ⇒ %Diamond% R A) : THM
=TEX
\pagebreak
\subsection{Practical Systems}
While based on a semantics similar to the semantics discussed here,
systems of modal logic intended for practical applications,
e.g. for program verification or protocol verification, will
involve application-specific syntactic features. It is important
for the ease of use of proof tools that the user should
interact with the tool using the natural formalism for the task at hand.
As we have seen, this can come with very little extra work in the case of
a sufficiently simple logical language.

Proof support offering this feature for more complex languages
may be supplied by combining
a semantic approach like the one given here  with use of the facilities
offered by \Product{} for manipulating syntax.
This technique is usually referred to as {\em semantic embedding} (as
opposed to a {\em syntactic} treatment, in which one would use HOL to reason
about syntactic notions, e.g. inference rules, rather than
semantic ones, e.g. the accessibility relation in the present treatment of
modal propositional logic).

In the semantic embedding technique,
sentences of the language to be supported are represented by
semantically equivalent HOL terms.
A parser maps sentences in the desired
concrete syntax to their HOL representation and a pretty-printer automatically
inverts this mapping when terms are displayed.
In the simple example we have given here the parser and pretty-printer
could be very easily constructed modifications of the HOL parser
and pretty-printer which would suppress the appearance of
the validity operator.
Tools assisting in the production of parsers and pretty-printers are
supplied as part of \Product{}.

On the basis of theorems proved about the semantic objects,
proof procedures, analogous to the rules we have implemented in
the present document,
may be produced which preserve the required syntax as far as the user
is concerned.
Such procedures may often be produced quite
readily by customising or specialising existing proof procedures for HOL.
As in our example,
if valid inference rules for the language are already known, then they
can be used as the basis for the design of such proof procedures.

An important advantage of the semantic embedding techniques is
that, compared with other approaches, such as coding a complete system
for manipulating syntax from scratch,
it drastically reduces the amount of code in which
errors can make the system inconsistent (i.e. allow the user to prove
an invalid result).

A system of this sort offering proof support for Z is currently being
released for field trial.
Z is in many respects much harder to accomodate than most of
the formalisms based on modal logics
which have been proposed for computer science applications, and so such
formalisms promise to be good applications for this semantic
embedding techniques.

\section{EPILOG}
The following allows the script to be used as an integration test:
=SML
fun  ⦏summarize_mt_results⦎ () = "Compiled OK: int002.sml";
val _ = diag_line "All module tests passed (by dint of reaching this output statement).";
=TEX

{\small
\twocolumn[\section{INDEX}]\label{INDEX}
\printindex}

\onecolumn
\appendix
\input{int002.thl.tex}

\section{CREATING THE THEORY LISTING}
Pipe the output of ``pp\_list'', with
``initialisation file'' ``int002.sml'' to ``int002.thl.doc'',
and process the result with ``doctex''.
=GFT csh
docsml int002
pp_list -d hol -i int002.sml arith_demo prime false arith_demo2 modal_logic > int002.thl.doc
doctex int002.thl
=TEX
The directory will now contain the file necessary for the
appendix to be created.
\end{document}

=IGN

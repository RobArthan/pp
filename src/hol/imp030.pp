=IGN
********************************************************************************
imp030.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp030.doc   ℤ $Date: 2014/03/25 13:58:51 $ $Revision: 1.43 $ $RCSfile: imp030.doc,v $
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

\def\Title{Implementation for the Subgoal Package}

\def\AbstractText{}

\def\Reference{DS/FMU/IED/IMP030}

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
%% LaTeX2e port: \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e port: \TPPtitle{Implementation for the Subgoal Package}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Implementation for the Subgoal Package}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP030}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.43 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2014/03/25 13:58:51 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: % \TPPauthors{K.~Blackburn & WIN01\\D.J.~King & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	    Project Library
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
\item [Issue 1.1 (1991/07/09)]
First version, working but untested.
\item [Issue 1.2 (1991/07/10)]
Changes during testing.
Added a local $nat\_of\_string$.
\item [Issue 1.3 (1991/07/10)]
Fixed some \LaTeX faults.
\item [Issue 1.4 (1991/07/22)]
Added $before\_kernel\_state\_change$.
Added some theorem validity checking.
Corrected errors in $goal\_rule$ et al.
Mentioned sensitivity to additional assumptions
in deficiencies section.
\item [Issue 1.5 (1991/07/23)]
Moved $print\_current\_goal$ to allow compilation.
Added and used $opt\_print\_current\_goal$ behind the scenes.
\item [Issue 1.6 (1991/07/29)]
Changed as result of changes caused by IR0016.
\item [Issue 1.7 (1991/07/29)]
Put back SCCS keywords.
\item [Issue 1.8 (1991/07/30)]
More changes as result of changes caused by IR0016.
\item [Issue 1.9 (1991/08/15)]
Renamings of functions containing the name atom $simple$,
and renaming of $aconv$.
\item [Issue 1.10 (1991/08/16)]
Changes to match changes in issue 1.11 of \cite{DS/FMU/IED/DTD030},
and various changes elsewhere in system.
\item [Issue 1.11 (1991/08/16)]
Fixed bug concerning $undo\_buffer\_length$.
\item[Issue 1.12 (1991/08/21)]
Function $format_term$ has new argument.
\item[Issue 1.13 (1991/09/25)]
Reacting to issue 1.12 of \cite{DS/FMU/IED/DTD030}.
\item[Issue 1.14 (1991/10/22),1.15 (1991/10/22)]
Improved failure messages, corrected $print\_goal$'s use
of $format\_term$.
\item[Issue 1.16 (1991/10/22)]
Protected $print\_goal$ against too short a line length.
\item[Issue 1.17 (1991/10/31)]
Fixed $goal\_rule$.
\item [Issue 1.18 (1992/01/17)]
Changes to $subgoal\_package\_quiet$, effect of duplicate free variables in goal, no longer observes kernel state change, message 30055.

\item[Issue 1.19 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 1.20 (1992/01/28)]
Added missing definition key.
\item[Issue 1.21 (1992/02/03)]
More satisfactory use of $translate\_for\_output$.
\item[Issue 1.22 (1992/03/18),1.23 (1992/03/18)]
Added $set\_goal$.
\item [Issue 1.24 (1992/04/09) (2nd April 1992)]
Changes required by CR0016.
\item [Issue 1.25 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.26 (1992/06/01) (1 June 1992)]
Call $translate\_for\_output$ for all formatted terms to be printed.
\item [Issue 1.27 (1992/06/04) (3 June 1992)]
Fix a buggette in $set\_goal$.
\item [Issue 1.28 (1992/06/24) (10 June 1992)]
Function $translate\_for\_output$ being called too often.
\item [Issue 1.29 (1992/06/25) (24th June 1992)]
Removed spurious use of "misc1" introduced in issue 1.28.
\item [Issue 1.30 (1992/06/26) (24th June 1992)]
Undo stacks persist over pushing and popping goals,
added $subgoal\_package\_size$.
\item [Issue 1.31 (1992/06/26) (24th June 1992)]
Corrected a typo.
\item [Issue 1.32 (1992/07/24) (24th July 1992)]
Added message 30018.
\item [Issue 1.33 (1992/08/13) (13th August 1992)]
Corrected error handling for interrupts.
\item [Issue 1.34 (1992/12/15) (15th December 1992)]
Added $pending\_reset\_subgoal\_package$.
\item [Issue 1.35 (1993/01/06) (6th January 1992)]
Fixed printing bug concerning order of additional goals to those requested.
\item [Issues 1.36 (1999/02/12),1.37 (1999/02/24)]
Updates for SML'97.

\item[Issue 1.39 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.40 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.41 (2003/04/02)] Improved error messages when applying a tactic results in an invalid proof.
\item[Issue 1.42 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 1.43 (2014/03/25)] Took advantage of 23 years of Moore's law and set the default undo buffer length to 1000.
\item[Issue 1.44 (2014/04/15)] Now use $gen\_new\_spec1$ rather than $new\_spec$.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains an implementation of the subgoal package.
The design is in \cite{DS/FMU/IED/DTD030}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation of the subgoal package.
\subsubsection{Deficiencies}
To be handled properly by the subgoal package the proofs given by tactics must be written to be insensitive to additional assumptions to those requested being present
in its argument theorems.
This will be true of all ICL supplied tactics,
and is likely to be true of any tactic, but
certain coding techniques may cause problems.

$print\_goal$ disobeys system line lengths that are set
 too small (around 30 is the break point).
\subsubsection{Possible Enhancements}

\section{THE SUBGOAL PACKAGE}
=SML
structure ⦏SubgoalPackage⦎ : SubgoalPackage = struct
val _ = open_theory "misc";
val _ = push_merge_pcs ["'propositions","'simple_abstractions"];
=TEX
\subsection{Quietening the Package}
We expect $imp036$ to execute $reset\_flag$ $"subgoal\_package\_quiet"$.
=SML
val subgoal_package_quiet : bool ref = ref true;
val _ = new_flag {
	name="subgoal_package_quiet",
	control=subgoal_package_quiet,
	default=(fn () => false),
	check= (fn x => true)};
=IGN
fun ⦏qdiag_string⦎  (s : string) : unit = (
	if (!subgoal_package_quiet)
	then ()
	else diag_string s
);
=SML
fun ⦏qdiag_line⦎ (s : string) : unit = (
	if (!subgoal_package_quiet)
	then ()
	else diag_line s
);
=TEX
\subsection{Labels}
A label of a goal within the subgoal package state is a list of integers,
though the user will view it as a string.
=SML
type ⦏LABEL⦎ = int list;

fun ⦏string_of_label⦎ (lab : LABEL) : string = (
	format_list string_of_int lab "."
);
=TEX
As $nat\_of\_string$ initially explodes and reverses its
string, and we already have an exploded, reversed list of
characters, we give a local version of that function,
using the same error numbers as the original
=SML
local
	val ord0 = ord "0";

	fun exr_nat_of_string (s : string list) : int = (
	let	fun aux (dig :: digs) = (
			let	val n = ord dig - ord0;
			in	if n >= 0 andalso n <= 9
				then n + (10 * aux digs)
				else fail "label_of_string" 1012 [(fn (():unit) => implode(rev s))]
			end
		) | aux [] = 0;
	in	case s of
			[] => fail "label_of_string" 1013 []
		|	_ => aux s
	end
	);

	fun aux acc ("." :: x) = (
	let
		val n = exr_nat_of_string acc
	in
		if n = 0
		then fail "label_of_string" 30042 []
		else n :: aux [] x
	end
	) | aux acc (a :: x) = (
		aux (a :: acc) x
	) | aux [] [] = []
	| aux acc [] = [exr_nat_of_string acc];
in
fun ⦏label_of_string⦎ (st : string) : LABEL = (
	aux [] (explode st)
);
end;
=TEX
The top label is just the empty list:
=SML
val ⦏top_label⦎ :LABEL = [];
=TEX
\subsection{Labelled Graphs}
The following is one approach to providing the functionality we want.
A different approach, with its own advantages and drawbacks
would be just to have a graph with nodes, leafs, and indications of proof.

The following is an association list of labels and terms,
combined with a list of ``achieved'' labels.
A label is present if it is in the association list;
it is achieved if it is in the second list (of just labels);
and it is superseded if it is a proper initial portion
of a label in either list.
A label cannot be both superseded and present or achieved,
by the functions that maintain the type.
=SML
type LABELLED = (LABEL * TERM) list * LABEL list;
=TEX
We now give some functions on this structure:
=SML
fun ⦏labelled_eq⦎ ((lst1,labs1) :LABELLED) ((lst2,labs2):LABELLED) : bool = (
let	fun aux ((lb1,tm1):: x) ((lb2,tm2)::y) = (
		lb1 = lb2 andalso (tm1 =$ tm2) andalso aux x y
	) | aux [] [] = true
	| aux _ _ = false;
in
	(labs1 = labs2) andalso aux lst1 lst2
end);
	
=TEX
Look up the label:
=SML
fun ⦏lookup_in_labelled⦎ (caller : string) (lab : LABEL)
	((assoc,ach) : LABELLED) : TERM = (
let	fun lab_eq (a1 :: x1) (a2 :: x2) =
		(a1 = a2) andalso
		lab_eq x1 x2
	| lab_eq [] (a2 :: x2) = fail caller 30041 [fn () => string_of_label lab]
	| lab_eq (a1 :: x1) [] = fail caller 30017 [fn () => string_of_label lab]
	| lab_eq [] [] = true;

in
	snd(find assoc (fn (x,_) => lab_eq lab x))
	handle complaint => (
	if area_of complaint = "find"
	then (	if any ach (lab_eq lab)
		then fail caller 30043 [fn () => string_of_label lab]
		else fail caller 30017 [fn () => string_of_label lab]
	) else reraise complaint caller)
end);
=TEX
=SML
fun ⦏replace_by_1_in_labelled⦎ (old : TERM) (new : TERM)
	((assoc,ach) : LABELLED) : LABELLED = (
let	fun aux ((lab, tm) :: x) = (
		if old ~=$ tm
		then (lab,new) :: aux x
		else (lab,tm) :: aux x
	) | aux [] = [];
in
	(aux assoc, ach)
end);
=TEX
=SML
fun ⦏replace_by_1_in_labelled⦎ (old : TERM) (new : TERM)
	((assoc,ach) : LABELLED) : LABELLED = (
let	fun aux ((lab, tm) :: x) = (
		if old ~=$ tm
		then (lab,new) :: aux x
		else (lab,tm) :: aux x
	) | aux [] = [];
in
	(aux assoc, ach)
end);
=TEX
=SML
fun ⦏replace_by_many_in_labelled⦎ (old : TERM) (newl : TERM list)
	((assoc,ach) : LABELLED) : LABELLED = (
let	val n_newl = length newl;
	val nl_newl = map (fn x => [x]) (interval 1 n_newl);
	val tm_nl_newl = combine nl_newl newl;
	fun aux ((lab, tm) :: x) = (
		if old ~=$ tm
		then  ((map (fn (lb,tm) => (lab @ lb, tm)) tm_nl_newl)
			@ aux x)
		else (lab,tm) :: aux x
	) | aux [] = [];
in
	(aux assoc, ach)
end);
=TEX
=SML
fun ⦏achieve_in_labelled⦎ (old : TERM) ((assoc,ach) : LABELLED) : LABELLED = (
let	fun aux ((lab, tm) :: x) ass prv = (
		if old ~=$ tm
		then  aux x ass (lab :: prv)
		else aux x ((lab,tm) :: ass) prv
	) | aux [] ass prv = (rev ass, prv);
in
	(aux assoc [] ach)
end);
=TEX
Find the labels of a given term:
=SML
fun ⦏labels_in_labelled⦎ (vl : TERM) ((assoc,_) :LABELLED) : LABEL list = (
let	fun aux ((lab, tm) :: x) = (
		if vl ~=$ tm
		then lab :: aux x
		else aux x
	) | aux [] = [];
in
	aux assoc
end);
=TEX
Find the ``next'' label in labelled to a given one.
This is done by comparing the closest so far to each subsequent label, updating the closest as necessary.
The label for which one wants the next may be present.
=SML
fun ⦏next_label⦎ (label : LABEL) ((assoc,_) : LABELLED) : LABEL OPT = (
=TEX
This auxiliary function returns true if the first label is ``smaller'' than the second.
=SML
let	fun aux_first ((a1 :: x1):LABEL) (a2 :: x2) = (
		if a1 = a2
		then aux_first x1 x2
		else a1 < a2
	) | aux_first [] (a2 :: x2) = error "next_label" 30031 []
	| aux_first (a1 :: x1) [] = error "next_label" 30031 []
	| aux_first [] [] = error "next_label" 30015 [];
=TEX
This auxiliary function returns true if the first label is ``closer'' to the third.
=SML
	fun aux ((a1 :: x1):LABEL) (a2 :: x2) (a :: x) = (
		if (a1 = a2)
		then 	(if a1 = a
			then aux x1 x2 x
			else aux_first x1 x2)
		else if a1 = a
		then true
		else if a2 = a
		then false
		else if (a1 > a)
		then 	(if (a2 > a)
			then (a1 < a2)
			else false)
		else if (a2 > a)
		then false
		else (a1 < a2)
	) | aux [] (a2 :: x2) _ = error "next_label" 30031 []
	| aux (a1 :: x1) [] _ = error "next_label" 30031 []
	| aux [] [] _ = error "next_label" 30015 []
	| aux a1x1 a2x2 []  = aux_first a1x1 a2x2;

	fun closest ((lab1,_), lab2) = (
		if aux lab1 lab2 label
		then lab1
		else lab2
	);
in
	if is_nil assoc
	then Nil
	else Value(fold closest (tl assoc) (fst(hd assoc)))
end);
=TEX
\subsection{Term Form Goals}
First introduce $pp'TS$:
=SML
local
val pp'ts_def_thm = tac_proof(([⌜pp'TS = λ y : BOOL ⦁ y⌝], ⌜∀ x ⦁ pp'TS x ⇔ x⌝),
	asm_rewrite_tac[]);
in
val ⦏pp'ts_def⦎ = gen_new_spec (["pp'TS","pp'ts_def"], pp'ts_def_thm);
end;
val ⦏pp'ts⦎ = ⌜pp'TS⌝;
val ⦏pp'ts_rev_thm⦎ = all_∀_intro(eq_sym_rule(
	all_simple_∀_elim pp'ts_def));
=TEX
We can now provide a function to make a term form of a goal.
This does not check that all the assumptions are $\alpha$-convertably
distinct.
=SML
fun ⦏mk_term_form_goal⦎ ((seqasms, conc) : GOAL) : TERM = (
let	val tm =  list_mk_⇒ (seqasms @ [mk_app(pp'ts, conc)]);
	val frees_tm = frees tm;
in
	list_mk_simple_∀ (rev frees_tm, tm)
end
handle complaint =>
list_divert complaint "mk_term_form_goal" [
	("mk_app",30002,[fn () => string_of_term conc]),
	("list_mk_⇒",30003,[fn () => string_of_term
		(find seqasms (fn x => not(type_of x =: BOOL)))])]
);
=TEX
Test of whether something is a term-form goal.
=SML
fun ⦏is_term_form_goal⦎ (tm : TERM) : bool = (
	((let	val tm1 = snd(strip_simple_∀ tm);
		val tm2 = hd(rev(strip_⇒ tm1));
		val pp'ts' = fst(dest_app tm2);
	in
		pp'ts' =$ pp'ts
	end)
	andalso (is_nil(frees tm)))
	handle (Fail _) => false
);
=TEX
Make a goal from a term:
=SML
local
	fun aux acc [tm] = (rev acc,tm)
	| aux acc (a :: x) = aux (a :: acc) x
	| aux acc _ = error "mk_goal_from_term" 0 []
in
fun ⦏mk_goal_from_term⦎ (tm : TERM) : GOAL = (
let	val tm1 = snd(strip_simple_∀ tm);
	val (seqasms, ts_conc) = aux [] (strip_⇒ tm1);
	val (ts,conc) = dest_app ts_conc;
in
	if ts =$ pp'ts
	then (seqasms,conc)
	else term_fail "mk_goal_from_term" 30023 [tm]
end
handle (Fail _) =>
term_fail "mk_goal_from_term" 30023 [tm]
);
end;
=TEX

\subsection{The Types of the Goal State and Package State}
The four components of the goal state are:
\begin{description}
\item [labelling]
This is an association list of term form goals and labels,
as well as a list of achieved labels.
\item [current\_goal]
The current goal, held as an optional label.
If its value is $Nil$ it indicates there are no remaining goals to be achieved.
\item [goal\_state\_thm]
This is the current state of the proof held as a theorem.
All successful inferences have had their effect here.
\item [mgst]
If this is true then the state's goal state theorem has
been manipulated by $modify\-\_goal\-\_state\-\_thm$.
This may have changed the main goal from its original setting,
and the user is informed if this has occurred at the point of
change, and when extracting the theorem of an achieved main goal.
\end{description}

The package state has three components:
\begin{description}
\item [main\_goal\_stack]
This is the stack of main goals, the head of the list, if any is the current main goal.
\item [undo\_buffer]
This is the stack of undo stacks, one undo stack per
main goal (the package is corrupt otherwise).
\item [redo]
This is either an empty list, or a singleton list.
If it contains anything it contains the last goal state
undone from.
\end{description}
=SML
abstype ⦏GOAL_STATE⦎ = GS of {labelling : LABELLED,
		current_goal : LABEL OPT,
		goal_state_thm : THM,
		mgst : bool}
with
type ⦏PACKAGE_STATE⦎ = {main_goal_stack : GOAL_STATE list,
		undo_buffer : (GOAL_STATE list) list,
		redo : GOAL_STATE list};
=TEX
A test for the equality of two goal states:
=SML
fun ⦏gs_equal⦎ (GS{labelling = lg1, current_goal = cg1, goal_state_thm = gst1,...})
	(GS{labelling = lg2, current_goal = cg2, goal_state_thm = gst2,...}) = (
	(labelled_eq lg1 lg2) andalso
	(cg1 = cg2) andalso
	(gst1 =|- gst2)
);
=TEX

Now we initialise the current state of the subgoal package:
=SML
val ⦏current⦎ : PACKAGE_STATE ref = ref {main_goal_stack = [],
	undo_buffer = [],
	redo = []};
=TEX
Storing a snapshot of this:
=SML
fun ⦏pending_reset_subgoal_package⦎ () : unit -> unit = (
let	val sbs = (!current);
in
	fn () => (
	current := sbs;
	()
	)
end);
=TEX
Its size is:
=SML
fun ⦏subgoal_package_size⦎ () : int = (
	warn "subgoal_package_size" 30060 [];
	~1
);
=POLYML
(*
fun ⦏subgoal_package_size⦎ () : int = System.objsize(!current);
*)
=TEX
\subsection{Handling the buffer}
We have a non-negative size of buffer:
=SML
local
	val undo_buffer_length : int ref = ref 1000;
	
	fun change_undo_buffer_length x = (
	if x >= 0
	then (let val {main_goal_stack = main_goal_stack,
		undo_buffer = undo_buffer,
		redo = redo} = (!current);
	in
	(current := {main_goal_stack = main_goal_stack,
		undo_buffer = map (fn y => y to (x-1)) undo_buffer,
		redo = redo};
	true)
	end)
	else false);

	val side_effect = new_int_control {
		name="undo_buffer_length",
		control=undo_buffer_length,
		default=(fn () => 12),
		check= change_undo_buffer_length};
in
fun ⦏add_to_buffer⦎ (s:GOAL_STATE) (ub : (GOAL_STATE list)list) : (GOAL_STATE list) list = (
	((s :: hd ub) to (!undo_buffer_length - 1)) :: tl ub
);
end;
=TEX
\subsection{Printing Some Labelled Subgoals}
The following should have all $⌜$  for assumptions in the same column,
and all multi-line assumptions have following lines starting
one character further in.
In the following we use the text for ``error'' messages 30053,
30054
and 30057 to define the layout.
We presume that ``?0'' precedes ``?1'' in message 30054 and 30057,
and we obey the detailed design in setting ``?0'' to ``\\n''.

We assume here and elsewhere that $translate\_for\_output$ wil leave integer strings untouched.
=SML
local
	fun last_line_of (str : string) : string = (
	let	val estr = explode str;
		fun strip_to_n ("\n" :: x) = []
		| strip_to_n (a :: x) = a :: strip_to_n x
		| strip_to_n [] = [];
	in
		implode(rev(strip_to_n (rev estr)))
	end);
in
fun ⦏print_goal⦎ ((seqasms, conc): GOAL) : unit = (
	if (!subgoal_package_quiet)
	then ()
	else
let	val orig_line_length = get_line_length();
	val lasms = length seqasms;
	val nasms = combine (interval 1 lasms) seqasms;
	val asm_mess = translate_for_output
		(get_error_message 30053 [""]);
	val max_nasm_length = size(string_of_int lasms);
	val min_asm_length = size asm_mess;
	val max_asm_length = max_nasm_length + min_asm_length;
	val init_ts = translate_for_output(if is_nil seqasms
		then get_error_message 30057 ["\n",""]
		else get_error_message 30054 ["\n",""]);
	val init_ts_length = size(last_line_of init_ts);
	val str_length = if max_asm_length > init_ts_length
		then max_asm_length
		else init_ts_length;
	val lline_length = orig_line_length - str_length;
	val lline_length = if lline_length < 20
		then 20
		else lline_length;
	val pad_asms_by = str_length - (min_asm_length+1);

	val padding = map (fn _=>" ") (interval 1 str_length);
	val tpadding = implode padding ^ " ";
	val ts = if is_nil seqasms
		then get_error_message 30057 ["\n",
			implode(padding to (str_length - (init_ts_length+1)))]
		else get_error_message 30054 ["\n",
			implode(padding to (str_length - (init_ts_length+1)))];

	fun print_asm (n,asm) = (
	let 	val asml = (
				PrettyPrinter.format_term1
					true lline_length asm);
		val nstr = string_of_int n;
		val pad = implode(padding to (pad_asms_by - size nstr));
		val hstring = get_error_message 30053 [pad ^ nstr];
	in
		(qdiag_line (hstring ^ hd asml);
		map (fn x => qdiag_line (tpadding ^ x)) (tl asml))
	end);
	val form_conc = (
				PrettyPrinter.format_term1 true
					lline_length conc);
in
	(map print_asm (rev nasms);
	qdiag_line (ts ^(hd form_conc));
	map(fn x =>  qdiag_line(tpadding ^ x)) (tl form_conc);
	qdiag_line "";
	())
end);
end;
=TEX
We presume 3052 contains that ``?0'' precedes ``?1'' in message 3052,
and we obey the detailed design in setting ``?0'' to ``\\n''..
=SML
fun ⦏print_goal_with_label⦎ (lab: LABEL) (gl : TERM) : unit = (
	qdiag_line(get_error_message 30052 ["\n",string_of_label lab]);
	print_goal (mk_goal_from_term gl)
);
=TEX
=SML
fun ⦏print_labelled_goal⦎ (lab: LABEL) : unit = (
let	val {main_goal_stack = main_goal_stack, ...} = !current;
	val GS{labelling = lg,...} = case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "print_labelled_goal" 30010 [];
	val gl = lookup_in_labelled "print_labelled_goal" lab lg;
in
	print_goal_with_label lab gl
end);
=TEX
=SML
fun ⦏print_current_goal⦎ () : unit = (
let	val {main_goal_stack = main_goal_stack,...} = !current;
	val GS{labelling = labelling,
		current_goal = current_goal,...} =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "print_current_goal" 30026 []);
	val cg = case current_goal of
		Value v => v
		| Nil => fail "print_current_goal" 30026 [];
in
	print_labelled_goal cg
end);
=TEX
We use the following function when we would like to print out
a current goal if present, but merely to say if
there is none in the current goal state, rather
that fail as $print\_current\_goal$ does.
This function is meant to be protected against
there being no current goal state, so it is an $error$
if there is not.
=SML
fun ⦏opt_print_current_goal⦎ () : unit = (
let	val {main_goal_stack = main_goal_stack,...} = !current;
	val GS{labelling = labelling,
		current_goal = current_goal,...} =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  error "opt_print_current_goal" 30026 []);
in
	(case current_goal of
		Value v => print_labelled_goal v
		| Nil => qdiag_line(get_error_message 30048 []))
end);
=TEX
=SML
fun ⦏print_goals_labelled⦎ (labs: LABEL list) : unit = (
let	val {main_goal_stack = main_goal_stack, ...} = !current;
	val GS{labelling = lg,...} = case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "print_labelled_goal" 30010 [];
	fun aux (lab :: x) = (
	let	val gl = lookup_in_labelled "print_goals_labelled" lab lg;
	in
		(print_goal_with_label lab gl;
		aux x)
	end) | aux [] = ();
in
	aux labs
end);
=TEX
\subsection{Maintaining the Type Context}
The following gives an argument for calling warning messages 30056 or 30059, when the type context has problems.
=SML
local
	fun aux_dups (s :: rest) = (
	if s mem rest
	then s :: aux_dups (rest less s)
	else aux_dups rest
	) | aux_dups [] = []
in
fun ⦏local_set_ti_context⦎ (tms:TERM list) : unit = (
let	val allfrees = list_term_union (map frees tms);
	val dups = aux_dups (map (fst o dest_var) allfrees);
in
	case dups of
	[] =>  TypeInference.set_ti_context allfrees
	| [a] => (warn "subgoal package" 30059 [fn () => a];
		TypeInference.set_ti_context (allfrees drop (fn x=> fst(dest_var x) = a)))
	| _ => (warn "subgoal package" 30056
			[fn () => format_list (Combinators.I) dups ", "];
		TypeInference.set_ti_context (allfrees drop (fn x=> fst(dest_var x) mem dups)))
end);
end;
=TEX
=SML
local
	val subgoal_package_ti_context : bool ref = ref true;
in
	fun ⦏set_ti_context_to_empty⦎ (():unit):unit = (
		TypeInference.set_ti_context []
	);
=TEX
The check function in the call of $new\_flag$ will clear or set the type context as necessary.
=SML
local
fun check_fun (flag : bool) : bool = (
let	val {main_goal_stack = main_goal_stack,...} = !current;
in
	((if is_nil main_goal_stack orelse not flag
	then set_ti_context_to_empty()
	else (let val GS{labelling = lg,current_goal = current_goal, ...} =
		hd main_goal_stack;
	in
	(case current_goal of
		Nil => set_ti_context_to_empty()
		| Value lb =>  (
let	val (seqasms,conc) = mk_goal_from_term(lookup_in_labelled
		"subgoal_package_ti_context" lb lg);
in
	local_set_ti_context (conc :: seqasms)
end
			))
	end));
	true)
end);
in
	val side_effect = new_flag {
		name="subgoal_package_ti_context",
		control=subgoal_package_ti_context,
		default=(fn () => check_fun true),
		check= check_fun};
end;
=TEX
=SML
	fun ⦏set_ti_context_to_goal⦎ ((seqasms,conc):GOAL) : unit = (
		if (!subgoal_package_ti_context)
		then local_set_ti_context (conc :: seqasms)
		else ()
	);
	fun ⦏set_ti_context_to_label⦎ (lab : LABEL OPT) (gs : GOAL_STATE) : unit = (
		if (!subgoal_package_ti_context)
		then (case lab of
			Nil => set_ti_context_to_empty()
			| Value lb =>  (
let	val {main_goal_stack = main_goal_stack, ...} = !current;
	val GS{labelling = lg,...} = gs;
	val (seqasms,conc) = mk_goal_from_term(lookup_in_labelled
		"set_ti_context_to_label" lb lg);
in
	local_set_ti_context (conc :: seqasms)
end
			))
		else ()
	);
=TEX
=SML
end; (* local *)
=TEX
\subsection{Starting a New Main Goal}
Check whether two distinct free variables in a goal have
same names.
$two\_the\_same$ fails with message raised by $error$
because it shouldn't fail at all.
=SML
local
fun two_the_same (a :: x) = if a mem x
	then a
	else two_the_same x
| two_the_same _ = error "two_the_same" 30058 [];
in
fun ⦏two_same_name⦎ (caller : string) (seqasms, conc) : unit = (
let	val fs = list_union (op =$) (frees conc :: map frees seqasms);
in
	if all_different(map (fst o dest_var) fs)
	then ()
	else fail caller 30058 [fn () => two_the_same(map (fst o dest_var) fs)]
end);
end;
=TEX
Return two $\alpha$-convertible terms:
=SML
local
fun ⦏two_α_eq⦎ caller ((a :: x): TERM list) : unit = (
	if a term_mem x
	then fail caller 30004 [(fn () => string_of_term a),
		(fn () => string_of_term(find x (fn y => a ~=$ y)))]
	else two_α_eq caller x
) | two_α_eq caller _ = ();
=TEX
=SML
in
fun ⦏push_goal⦎ (goal as (seqasms,conc) : GOAL) : unit = (
let	val {main_goal_stack = main_goal_stack, undo_buffer = undo_buffer, ...} = !current;
	val side_effect = if length main_goal_stack = length undo_buffer
		then ()
		else error "push_goal" 30044 [];
	val side_effect = two_α_eq "push_goal" seqasms;
	val side_effect = two_same_name "push_goal" goal;
	val tm_goal = mk_term_form_goal goal
		handle complaint =>
		pass_on complaint "mk_term_form_goal" "push_goal";
	val lg = ([(top_label,tm_goal)],[]);
	val cg = Value top_label;
	val gst = asm_rule tm_goal;
	val new_gs = GS{labelling = lg, current_goal = cg,
		goal_state_thm = gst, mgst = false};
	val len_stack = 1+ length main_goal_stack;
	val opts = if len_stack = 1 then "" else "s";
in
	(set_ti_context_to_goal goal;
	current := {main_goal_stack = (new_gs :: main_goal_stack),
		undo_buffer = ([] :: undo_buffer), redo = []};
	qdiag_line(get_error_message 30001 [string_of_int len_stack, opts]);
	print_labelled_goal [];
	())
end);
fun ⦏set_goal⦎ (goal as (seqasms,conc) : GOAL) : unit = (
let	val {main_goal_stack = main_goal_stack, undo_buffer = undo_buffer,...} = !current;
	val side_effect = if length main_goal_stack = length undo_buffer
		then ()
		else error "set_goal" 30044 [];
	val side_effect = two_α_eq "set_goal" seqasms;
	val side_effect = two_same_name "set_goal" goal;
	val tm_goal = mk_term_form_goal goal
		handle complaint =>
		pass_on complaint "mk_term_form_goal" "set_goal";
	val lg = ([(top_label,tm_goal)],[]);
	val cg = Value top_label;
	val gst = asm_rule tm_goal;
	val new_gs = GS{labelling = lg, current_goal = cg,
		goal_state_thm = gst, mgst = false};
	val len_stack = length main_goal_stack;
	val opts = if len_stack < 2 then "" else "s";
	val (main_goal_stack',undo_buffer') = case main_goal_stack of
		[] => ([],[])
		| (a::x) => (x, tl undo_buffer);
in
	(set_ti_context_to_goal goal;
	current := {main_goal_stack = (new_gs :: main_goal_stack'),
		undo_buffer = ([] :: undo_buffer'), redo = []};
	qdiag_line(get_error_message 30001 [
		string_of_int (length(#main_goal_stack (!current))),
		opts]);
	print_labelled_goal [];
	())
end);
end;
=TEX
=SML
fun ⦏push_goal_state_thm⦎ (goal_state_thm : THM) : unit = (
let	val {main_goal_stack = main_goal_stack, undo_buffer = undo_buffer,...} = !current;
	val side_effect = if length main_goal_stack = length undo_buffer
		then ()
		else error "push_goal_state_thm" 30044 [];
	val sideeffect = if valid_thm goal_state_thm
		then ()
		else fail "push_goal_state_thm" 30055 [];
	val hys = asms goal_state_thm;
	val side_effect = map (fn x => mk_goal_from_term x
			handle complaint =>
			divert complaint "mk_goal_from_term" "push_goal_state_thm" 30005
			[fn () => string_of_thm goal_state_thm])
		hys;
	val new_main_goal = mk_goal_from_term (concl goal_state_thm)
		handle complaint =>
		divert complaint "mk_goal_from_term" "push_goal_state_thm" 30005
			[fn () => string_of_thm goal_state_thm];
	val side_effect = two_same_name "push_goal_state_thm" new_main_goal;
	val (cg,lg) = case hys of
		[] => (Nil,([],[]))
		| [h] => (Value top_label,
			([(top_label, h)],[]))
		| _ => (Value [1],
			((combine (map (fn x=>[x]) (interval 1 (length hys))) hys),
			[]));
	val new_gs = GS{labelling = lg, current_goal = cg,
		goal_state_thm = goal_state_thm, mgst = false};
	val len_stack = 1+ length main_goal_stack;
	val opts = if len_stack = 1 then "" else "s";
in
	(set_ti_context_to_label cg new_gs;
	current := {main_goal_stack = (new_gs :: main_goal_stack),
		undo_buffer = ([]:: undo_buffer), redo = []};
		qdiag_line(get_error_message 30001 [string_of_int len_stack, opts]);
	case hys of
	[] => qdiag_line(get_error_message 30048 [])
	| [_] => (qdiag_line(get_error_message 30047 []);
		print_labelled_goal [])
	| _ => (qdiag_line(get_error_message 30047 []);
		print_goals_labelled(map (fn x => [x]) (rev(interval 1 (length hys)))));
	())
end);
=TEX
\subsection{Applying Tactics}
Create a theorem whose conclusion is the conclusion of a goal,
which contains the goals assumptions, but in addition has
the goal in term form as an assumption.
Note that $all\_simple\_∀\_elim$ can cause renaming, and
 so we need to get $conc'$, which might occasionally be different to $conc$.

Notice how we have to avoid $all\_simple\_∀\_elim$ as that
will rename for duplicate names/different types in the
quantification list.
=SML
fun ⦏goal_rule⦎ (goal as (seqasms,conc) : GOAL) : THM = (
let	val tm_goal = mk_term_form_goal goal;
	val s1 = asm_rule tm_goal;
	val ∀lst = fst(strip_∀(concl s1));
	val s2 = list_simple_∀_elim ∀lst s1;
	val s3 = strip_⇒_rule s2;
	val conc' = snd(dest_app(concl s3));
	val s4 = simple_∀_elim conc' pp'ts_def;
	val s5 = ⇔_mp_rule s4 s3;
in
	s5
end);
=TEX
For the uses we expect of this function, any failure is a design error.
=SML
fun ⦏top_thm_rule⦎ (thm : THM) : THM = (
let	val s1 = all_simple_∀_elim thm;
	val s2 = strip_⇒_rule s1;
	val s3 = simple_∀_elim (snd(dest_app(concl s2))) pp'ts_def;
	val s4 = ⇔_mp_rule s3 s2;
in
	s4
end
handle (Fail _) => error "top_thm_rule" 30020 []
);
=TEX
If a tactic has introduced its own assumptions then we need
to make them kosher:
=SML
fun ⦏make_all_asms_term_form⦎ (expected_tfg : TERM list)
	(proper_asms : TERM list) (thm : THM) : THM = (
let	val (seqasms, _) = dest_thm thm;
	fun do_one (asm, thm) = (
		if (asm term_mem proper_asms) orelse
			(asm term_mem expected_tfg) orelse
			is_term_form_goal asm
		then thm
		else (let
			val tm = mk_term_form_goal (proper_asms,asm);
			val s1 = asm_rule tm;
			val s2 = top_thm_rule s1;
			val s3 = prove_asm_rule s2 thm
		in
			s3
		end)
	);
in
	fold do_one seqasms thm
end);
=TEX
Any failure from this function is a design error.
=SML
fun ⦏term_form_goal_rule⦎ (expected_tfg : TERM list)
	(seqasms : TERM list) (thm : THM) : THM = (
let	val s1 = simple_∀_elim (concl thm) pp'ts_rev_thm;
	val s2 = ⇔_mp_rule s1 thm;
	val s3 = make_all_asms_term_form expected_tfg seqasms s2;
	val s4 = fold (uncurry ⇒_intro) seqasms s3;
	val s5 = all_∀_intro s4;
in
	s5
end
handle (Fail _) => error "term_form_goal_rule" 30020 []
);
=TEX
The following returns a triplet: those members that are only
in $set1$, those that are in both, those that are only in $set2$.
Only $set1$ might have duplicates when the function is called,
and the duplicates will be propagated to the resulting triplet.
=SML
fun ⦏partition_by_overlap⦎ (set1 : TERM list) (set2 : TERM list) :
	((TERM list) * (TERM list) * (TERM list)) = (
let	fun aux acc1 acc2 acc3 (a :: x) = (
		if a term_mem set2
		then aux acc1 (a :: acc2) (acc3 term_less a) x
		else aux (a :: acc1) acc2 acc3 x
	) | aux acc1 acc2 acc3 [] = (rev acc1, rev acc2, acc3);
in
	aux [] [] set2 set1
end);
=TEX
The following adds the appropriate new labelling information
for any newly introduced goals, giving the user information about
duplicates, introduced and unnecessary subgoals.
Note that $generated$ will contain no duplicates.
=SML
fun ⦏add_new_goals⦎ (expected: TERM list)
	(generated : TERM list)
	(previous : TERM list)
	(old_label : LABEL)
	(old_goal : TERM)
	(labelled as (assoc,ach): LABELLED) : (LABEL OPT * LABELLED) = (
let	val (unnecessary,used,additional) = (
		partition_by_overlap expected generated
	);
=TEX
Note that $additional$ will contain no duplicates, nor
any members of $used$.
Declare the number of subgoals:
=SML
	val other_goals = used @ additional;
	
	val lother_goals = length other_goals;

	val sideeffect = if lother_goals = 1
		then qdiag_line(get_error_message 30037 ["1",""])
		else qdiag_line(get_error_message 30037 [string_of_int lother_goals,"s"]);
=TEX
We only want to note duplicates of pre-existing subgoals,
other than the goal being worked on: it is not a duplication
to recreate this goal as a new subgoal.
=SML
	val previous' = previous term_less old_goal;
=TEX
Then announce the unnecessary subgoals:
=SML
	val sideeffect = map (fn x =>
		(qdiag_line(get_error_message 30033 []);
		print_goal(mk_goal_from_term x)))
		unnecessary;
=TEX
Then put the new goals into the labelling:
=SML
	val labelled' = case other_goals of
		[] => achieve_in_labelled old_goal labelled
		| [ng] => replace_by_1_in_labelled old_goal ng labelled
		| _ => replace_by_many_in_labelled old_goal other_goals labelled;

	val new_label  = if lother_goals = 1
		then (fn x => old_label)
		else if lother_goals > 1
		then (fn x => old_label @ [x])
		else (fn x => error "add_new_goals" 30020 []);
=TEX
The following auxiliary declares those additional subgoals not requested
by the tactic, but which are present in the result.
=SML
	fun add_aux (a :: x) accm n = (
	let val new_lab = new_label n;
		val snew_lab = string_of_label new_lab;
	in	
	if a term_mem previous'
	then (let val other_labs = (labels_in_labelled a labelled) less new_lab;
		val other_labss = format_list string_of_label other_labs ", ";
		val opts = case other_labs of
			[] => error "add_new_goals" 30020 []
			| [_] => ""
			| _ => "s";
	in	
		(print_goal_with_label new_lab a;
		add_aux x (get_error_message 30030 [snew_lab, opts, other_labss] :: accm)
			(n-1)
		)
	end)
	else 	(print_goal_with_label new_lab a;
		add_aux x
			(if a ~=$ old_goal
			then (	get_error_message 30006 [snew_lab] ::
				get_error_message 30029 [snew_lab] ::
				accm)
			else (	get_error_message 30029 [snew_lab] ::
				accm))
			(n-1))
	end
	) | add_aux [] accm n = (accm, n);
=TEX
The following auxiliary declares those subgoals requested
by the tactic, except when unused.
=SML
	fun aux (a :: x) prev accm n = (
	let val new_lab = new_label n;
		val snew_lab = string_of_label new_lab;
	in
	(if a term_mem prev
	then (let val other_labs = (labels_in_labelled a labelled') less new_lab;
		val other_labss = format_list string_of_label other_labs ", ";
		val opts = case other_labs of
			[] => error "add_new_goals" 30020 []
			| [_] => ""
			| _ => "s";
	in	
		(print_goal_with_label new_lab a;
		aux x prev (get_error_message 30032 [snew_lab, opts, other_labss] :: accm)
			(n-1)
		)
	end)
	else (	print_goal_with_label new_lab a;
		aux x (a :: prev)
			(if a ~=$ old_goal
			then (get_error_message 30006 [snew_lab] ::
				accm)
			else accm)
			(n-1))
	)
	end
	) | aux [] _ accm _  = accm;
=TEX
Then give the additional subgoals:
=SML
	val (accm,index) = add_aux (rev additional) [] lother_goals;
=TEX
Now give the requested goals, making sure the first requested and used goal is presented last, with label ``label.1''.
=SML
	val accm' = aux (rev used) previous' accm index;
=TEX
Calculate the new current goal:
=SML
	val new_cg = (case lother_goals of
		0 => next_label old_label labelled'
		| 1 => Value old_label
		| _ => Value (new_label 1));
=TEX
Now present the accumulated information messages:
=SML
	val sideeffect = map qdiag_line accm';
=TEX
and return the new current goal label, and the new labelling.
=SML
in
	(new_cg,labelled')
end);
=TEX
The number of subgoals warning threshold for $apply\_tactic$:
=SML
local
	val ⦏tactic_subgoal_warning⦎ = ref 20;
	val _ = new_int_control {name = "tactic_subgoal_warning",
		control = tactic_subgoal_warning,
		default = (fn () => 20),
		check = (fn _ => true)}
in
=TEX
Now the important function: apply a tactic:
=SML
fun ⦏apply_tactic⦎ (tac : TACTIC) : unit = (
let	val {main_goal_stack = main_goal_stack,
		undo_buffer = undo_buffer,...} = !current;
	val current_goal_state as GS{labelling = labelling as (assoc,ach),
		current_goal = current_goal,
		goal_state_thm=goal_state_thm, mgst = mgst} = (case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "apply_tactic" 30007 []);
	val side_effect = if valid_thm goal_state_thm
		then ()
		else fail "apply_tactic" 30055 [];
	val cg = (case current_goal of
		Value lcg => lcg
		| Nil => fail "apply_tactic" 30007 []);
	val cg_term = (lookup_in_labelled "apply_tactic" cg labelling
			handle (Fail complaint) =>
			error "apply_tactic" 30020 []);
	val (seqasms,conc) = (mk_goal_from_term cg_term
		handle (Fail _) =>
		error "apply_tactic" 30020 []);
	val (sgs,proof) = tac (seqasms,conc);
	val dummy = if length sgs > (!tactic_subgoal_warning)
				andalso (!tactic_subgoal_warning) >= 0
			then warn "apply_tactic" 30018
				[ fn () => string_of_int(length sgs)]
			else ();
	val sgs_thms = map goal_rule sgs;
	val expected_sgs = map mk_term_form_goal sgs;
	val proof_thm = proof sgs_thms;
	val proof_thm' = term_form_goal_rule expected_sgs seqasms proof_thm;
	val super_conc = concl proof_thm';
	val sideeffect = (if super_conc ~=$ cg_term
		then ()
		else thm_fail "apply_tactic" 30008 [proof_thm]);
	val new_gst = prove_asm_rule proof_thm' goal_state_thm;
	val generated_sgs = asms proof_thm';
	val old_sgs = asms goal_state_thm;
	val (new_cg,new_lg) = add_new_goals expected_sgs
		generated_sgs old_sgs cg cg_term labelling
		handle ex as Fail msg => (
			divert ex "mk_goal_from_term" "apply_tactic" 30061
			[fn () => get_message_text msg]
		);
	val new_gs = GS{labelling = new_lg,
		current_goal = new_cg,
		goal_state_thm = new_gst,
		mgst = mgst};
	val side_effect = if gs_equal new_gs current_goal_state
		then qdiag_line(get_error_message 30034 [])
		else ();
in
	(set_ti_context_to_label new_cg new_gs;
	current := {main_goal_stack = new_gs :: tl main_goal_stack,
		undo_buffer = add_to_buffer current_goal_state undo_buffer,
		redo = []};
	if is_nil(generated_sgs)
	then (case new_cg of
		Nil => qdiag_line(get_error_message 30036 [])
		| Value v => (qdiag_line(get_error_message 30035 []);
			print_labelled_goal v))
	else ();
	())
end);
end; (* local ... *)
=TEX
And the alias:
=SML
val ⦏a⦎ = apply_tactic;
=TEX
\subsection{The Results of the Package}
=SML
fun ⦏pop_thm⦎ () : THM = (
let	val {main_goal_stack = main_goal_stack,undo_buffer=undo_buffer,...} = !current;
	val side_effect = if length main_goal_stack = length undo_buffer
		then ()
		else error "pop_thm" 30044 [];
	val current_goal_state as GS{goal_state_thm=goal_state_thm,mgst = mgst,...} =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "pop_thm" 30010 []);
	
	val sideeffect = if is_nil(asms goal_state_thm)
		then ()
		else fail "pop_thm" 30011 [];

	val res = top_thm_rule goal_state_thm;
	val new_mgs = tl main_goal_stack;
	val lnew_mgs = length new_mgs;
in
	((case lnew_mgs of
	0 => set_ti_context_to_empty()
	| _ => (let val GS{current_goal = cg,...} = hd new_mgs
		in
		set_ti_context_to_label cg (hd new_mgs)
		end));
	current := {main_goal_stack = new_mgs,
		undo_buffer = tl undo_buffer, redo = []};
	if mgst then qdiag_line(get_error_message 30024 []) else ();
	qdiag_line(get_error_message 30001 [
		string_of_int lnew_mgs,
		if lnew_mgs = 1 then "" else "s"]);
	if lnew_mgs > 0 then opt_print_current_goal() else ();
	res)
end);
=TEX
=SML
fun ⦏save_pop_thm⦎ (key : string) : THM = (
let	val {main_goal_stack = main_goal_stack,undo_buffer=undo_buffer,...} = !current;
	val side_effect = if length main_goal_stack = length undo_buffer
		then ()
		else error "save_pop_thm" 30044 [];
	val current_goal_state as GS{goal_state_thm=goal_state_thm,mgst = mgst,...} =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "save_pop_thm" 30010 []);
	
	val sideeffect = if is_nil(asms goal_state_thm)
		then ()
		else fail "save_pop_thm" 30011 [];

	val res = top_thm_rule goal_state_thm;
	val res' = save_thm(key,res)
		handle complaint =>
		pass_on complaint "save_thm" "save_pop_thm";

	val new_mgs = tl main_goal_stack;
	val lnew_mgs = length new_mgs;
in
	((case lnew_mgs of
	0 => set_ti_context_to_empty()
	| _ => (let val GS{current_goal = cg,...} = hd new_mgs
		in
		set_ti_context_to_label cg (hd new_mgs)
		end));
	current := {main_goal_stack = new_mgs,
		undo_buffer = tl undo_buffer,redo = []};
	if mgst then qdiag_line(get_error_message 30024 []) else ();
	qdiag_line(get_error_message 30001 [
		string_of_int lnew_mgs,
		if lnew_mgs = 1 then "" else "s"]);
	if lnew_mgs > 0 then opt_print_current_goal() else ();
	top_thm_rule goal_state_thm)
end);
=TEX
=SML
fun ⦏top_thm⦎ () : THM = (
let	val {main_goal_stack = main_goal_stack,...} = !current;
	val current_goal_state as GS{goal_state_thm=goal_state_thm,mgst = mgst,...} =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "top_thm" 30010 []);
	
	val sideeffect = if is_nil(asms goal_state_thm)
		then ()
		else fail "top_thm" 30011 [];

	val res = top_thm_rule goal_state_thm;
in
	(if mgst then qdiag_line(get_error_message 30024 []) else ();
	res)
end);
=TEX
=SML
fun ⦏top_goal_state_thm⦎ () : THM = (
let	val {main_goal_stack = main_goal_stack,...} = !current;
	val current_goal_state as GS{goal_state_thm=goal_state_thm,mgst = mgst,...} =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "top_goal_state_thm" 30010 []);
in
	(if mgst then qdiag_line(get_error_message 30024 []) else ();
	if is_nil(asms goal_state_thm) then qdiag_line(get_error_message 30038 []) else ();
	goal_state_thm)
end);
=TEX
=SML
local
	fun strip_n_⇒ 0 thm = thm
	| strip_n_⇒ n thm = strip_n_⇒ (n-1) (undisch_rule thm);
in
fun ⦏simplify_goal_state_thm⦎ (thm : THM) : THM = (
let	val hys = asms thm;
	val hgoals = map (fn x =>
		let	val (seqasms,conc) = mk_goal_from_term x;
			val bse = list_mk_⇒ (seqasms @ [conc]);
			val gl = list_mk_simple_∀(rev(frees bse),bse);
			val s1 = asm_rule gl;
			val s2 = all_simple_∀_elim s1;
			val s3 = strip_n_⇒ (length seqasms) s2;
			val s4 = term_form_goal_rule [gl] seqasms s3;
		in
			s4
		end)
		hys;
	val replace_hyps = fold (uncurry prove_asm_rule) (rev hgoals) thm;
	val mf_s1 = all_simple_∀_elim replace_hyps;
	val mf_s2 = strip_⇒_rule mf_s1;
	val mf_s3 = simple_∀_elim (snd(dest_app(concl mf_s2))) pp'ts_def
	val mf_s4 = ⇔_mp_rule mf_s3 mf_s2;
in
	mf_s4
end
handle complaint =>
list_divert complaint "simplify_goal_state_thm" [
	("mk_goal_from_term",30005,[fn () => string_of_thm thm]),
	("dest_app",30005,[fn () => string_of_thm thm]),
	("⇔_mp_rule",30005,[fn () => string_of_thm thm])]
);
end;
=TEX
=SML
fun ⦏drop_main_goal⦎ () : GOAL = (
let	val {main_goal_stack = main_goal_stack,undo_buffer=undo_buffer,...} = !current;
	val side_effect = if length main_goal_stack = length undo_buffer
		then ()
		else error "drop_main_goal" 30044 [];
	val GS{goal_state_thm = goal_state_thm,...} =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "drop_main_goal" 30010 []);
	
	val old_main_goal = mk_goal_from_term(concl goal_state_thm);
	val new_mgs = tl main_goal_stack;
	val lnew_mgs = length new_mgs;
in
	((case lnew_mgs of
	0 => set_ti_context_to_empty()
	| _ => (let val GS{current_goal = cg,...} = hd new_mgs
		in
		set_ti_context_to_label cg (hd new_mgs)
		end));
current := {main_goal_stack = new_mgs,
		undo_buffer = tl undo_buffer, redo = []};
	qdiag_line(get_error_message 30001 [
		string_of_int lnew_mgs,
		if lnew_mgs = 1 then "" else "s"]);
	if lnew_mgs > 0 then opt_print_current_goal() else ();
	old_main_goal)
end);
=TEX
\subsection{Undoing and Redoing}
=SML
fun ⦏undo⦎ (n : int) : unit = (
let	val {main_goal_stack = main_goal_stack,
		undo_buffer = undo_buffer,...} = !current;
	val current_gs =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "undo" 30010 []);
	val lub = length (hd undo_buffer);
	val sideeffect = if n <= 0
		then fail "undo" 30013 []
		else if n > lub
		then fail "undo" 30012 [(fn () => string_of_int n),
			(fn () => if n = 1 then "" else "s"),
			(fn () => string_of_int lub),
			(fn () => if lub = 1 then "y" else "ies")
			]
		else ();
	val new_gs as GS{current_goal = new_cg,...} = nth (n-1) (hd undo_buffer);
	val new_undo = (((hd undo_buffer) from n) :: tl undo_buffer);
	val new_redo = (current_gs :: (hd undo_buffer)) to (n-1);
in
	(set_ti_context_to_label new_cg new_gs;
	current := {main_goal_stack = new_gs :: tl main_goal_stack,
		undo_buffer = new_undo,
		redo = new_redo};
	(case new_cg of
		Nil => qdiag_line(get_error_message 30048 [])
		| Value v => (qdiag_line(get_error_message 30047 []);
			print_labelled_goal v));
	())
end);
=TEX
=SML
fun ⦏redo⦎ () : unit = (
let	val {main_goal_stack = main_goal_stack,
		undo_buffer = undo_buffer,redo = redo} = !current;
	val current_gs =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "undo" 30010 []);
	val lub = length undo_buffer;
	val sideeffect = if is_nil redo
		then fail "redo" 30014 []
		else  ();
	val new_states = redo @ [current_gs] @ hd undo_buffer;
	val new_gs as GS{current_goal = new_cg,...} = hd new_states;
	val new_undo = ((tl new_states) to (get_int_control "undo_buffer_length" -1)) :: tl undo_buffer;
	val new_redo = [];
in
	(set_ti_context_to_label new_cg new_gs;
	current := {main_goal_stack = new_gs :: tl main_goal_stack,
		undo_buffer = new_undo,
		redo = new_redo};
	(case new_cg of
		Nil => qdiag_line(get_error_message 30048 [])
		| Value v => (qdiag_line(get_error_message 30047 []);
			print_labelled_goal v));
	())
end);
=TEX
\subsection{Navigation}
=SML
fun ⦏set_labelled_goal⦎ (label : string) : unit = (
let	val nlabel = label_of_string label
		handle complaint =>
		divert complaint "label_of_string" "set_labelled_goal" 30016 [fn () => label];
	val {main_goal_stack = main_goal_stack,
		undo_buffer = undo_buffer,redo = redo} = !current;
	val current_gs =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "set_labelled_goal" 30010 []);
	val GS{labelling = labelling,
		current_goal = current_goal,
		goal_state_thm = goal_state_thm,mgst = mgst} = current_gs;
	val (seqasms,conc) = mk_goal_from_term(lookup_in_labelled
		"set_labelled_goal" nlabel labelling);
	val new_gs = GS{labelling = labelling,
		current_goal = Value nlabel,
		goal_state_thm = goal_state_thm,mgst = mgst};
	val new_undo = add_to_buffer current_gs undo_buffer;
	val new_redo = [];
in
	(set_ti_context_to_goal (seqasms,conc);
	current := {main_goal_stack = new_gs :: tl main_goal_stack,
		undo_buffer = new_undo,
		redo = new_redo};
	(qdiag_line(get_error_message 30047 []);
	print_labelled_goal nlabel);
	())
end);
=TEX
\subsection{Handling Goal States}
=SML
fun ⦏top_goal_state⦎ () : GOAL_STATE = (
let	val {main_goal_stack = main_goal_stack,
		undo_buffer = undo_buffer,redo = redo} = !current;
	val current_gs =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "top_goal_state" 30010 []);
in
	current_gs
end);
=TEX
We use $⇔\_t\_intro$ to see if we have an invalid theorem
(e.g. out of scope).
If so, we cannot catch the failure, but at least it happens before
the undo buffer is emptied.
=SML
fun ⦏push_goal_state⦎ (new_gs as GS{goal_state_thm = goal_state_thm,...}:
	GOAL_STATE) : unit = (
let	val {main_goal_stack = main_goal_stack,undo_buffer=undo_buffer,...} = !current;
	val side_effect = if valid_thm goal_state_thm
		then ()
		else fail "push_goal_state" 30055 [];
	val GS{current_goal = current_goal,...} = new_gs;
	val new_mgs = new_gs :: main_goal_stack;
	val lnew_mgs = length new_mgs;
in
	(set_ti_context_to_label current_goal new_gs;
	current := {main_goal_stack = new_mgs, undo_buffer = ([] :: undo_buffer), redo = []};
	qdiag_line(get_error_message 30001 [
		string_of_int lnew_mgs,
		if lnew_mgs = 1 then "" else "s"]);
	(case current_goal of
		Nil => qdiag_line(get_error_message 30048 [])
		| Value v => (qdiag_line(get_error_message 30047 []);
			print_labelled_goal v));
	())
end);
=TEX
\subsection{Information Requests}
=SML
fun ⦏top_main_goal⦎ () : GOAL = (
let	val {main_goal_stack = main_goal_stack,...} = !current;
	val GS{goal_state_thm = goal_state_thm,...} =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "top_main_goal" 30025 []);
in
	mk_goal_from_term(concl goal_state_thm)
end);
=TEX
=SML
fun ⦏top_goal⦎ () : GOAL = (
let	val {main_goal_stack = main_goal_stack,...} = !current;
	val GS{labelling = labelling,
		current_goal = current_goal,...} =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "top_goal" 30026 []);
	val cg = case current_goal of
		Value v => v
		| Nil => fail "top_goal" 30026 [];
	val cg_term = lookup_in_labelled "top_goal" cg labelling;
in
	mk_goal_from_term cg_term
end);
=TEX
=SML
fun ⦏top_current_label⦎ () : string = (
let	val {main_goal_stack = main_goal_stack,...} = !current;
	val GS{labelling = labelling,
		current_goal = current_goal,...} =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "top_current_label" 30026 []);
	val cg = case current_goal of
		Value v => v
		| Nil => fail "top_current_label" 30026 [];
in
	string_of_label cg
end);
=TEX
=SML
fun ⦏top_labelled_goal⦎ (label : string) : GOAL = (
let	val nlabel = label_of_string label
		handle complaint =>
		divert complaint "label_of_string" "top_labelled_goal" 30016 [fn () => label];
	val {main_goal_stack = main_goal_stack,...} = !current;
	val GS{labelling = labelling,...} =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "top_labelled_goal" 30026 []);
	val gterm = lookup_in_labelled "top_labelled_goal" nlabel labelling;
in
	 mk_goal_from_term gterm
end);
=TEX
=SML
fun ⦏get_asm⦎ ( n : int) : TERM = (
let	val {main_goal_stack = main_goal_stack,...} = !current;
	val GS{labelling = labelling,
		current_goal = current_goal,...} =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "get_asm" 30026 []);
	val cg = case current_goal of
		Value v => v
		| Nil => fail "get_asm" 30026 [];
	val cg_term = lookup_in_labelled "get_asm" cg labelling;
	val cg_term' = snd(strip_simple_∀ cg_term);
	val hys_plus_conc = (strip_⇒ cg_term');
	val sideeffect = if (n >= length hys_plus_conc) orelse (n < 1)
		then fail "get_asm" 30027 [fn () => string_of_int n]
		else ();
in
	nth (n-1) hys_plus_conc
end);
=TEX
=SML
local
	fun compact acc ((lab,gl) :: x) = (
	let	fun aux ((labs,tm) :: rest) = (
			if gl ~=$ tm
			then ((lab :: labs),tm) :: rest
			else (labs,tm) :: aux rest
		) | aux [] = [([lab],gl)];
	in
		compact (aux acc) x
	end
	) | compact acc [] = acc;
in
fun ⦏top_goals⦎ () : (string list * GOAL)list = (
let	val {main_goal_stack = main_goal_stack,...} = !current;
	val GS{labelling = labelling,...} =
		(case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "top_goals" 30010 []);
in
	map (fn (x,y) => (map string_of_label x,
			mk_goal_from_term y))
		(compact [] (fst labelling))
end);
end;
=TEX
=SML
fun ⦏print_goal_state⦎ (gs as GS{labelling = labelling,
	current_goal = current_goal,
	goal_state_thm = goal_state_thm,...}: GOAL_STATE) : unit = (
	qdiag_line(get_error_message 30049 []);
	print_goal (mk_goal_from_term(concl goal_state_thm));
	case current_goal of
	Nil => qdiag_line(get_error_message 30048 [])
	| Value v => (
		qdiag_line(get_error_message 30050 []);
		map (uncurry print_goal_with_label) (fst labelling);
		qdiag_line "";
		qdiag_line(get_error_message 30047 []);
		print_goal_with_label v (lookup_in_labelled "print_goal_state"
			v labelling)
	);
	()
);
=TEX
=SML
local
	fun label1 ((labs:LABEL list,tm) :: rest) ltm = (
		if tm ~=$ ltm
		then labs cup (label1 rest ltm)
		else label1 rest ltm
	) | label1 [] ltm = [];

	fun lab_distinct ((lab1 : LABEL),(lab2 : LABEL)) = (
	let	fun aux (a1 :: x1) (a2 :: x2) =
		(a1 <> a2) orelse
		aux x1 x2
		| aux _ _ = if lab1 = lab2
			then fail "modify_goal_state_thm" 30040
				[fn () => string_of_label lab1]
			else fail "modify_goal_state_thm" 30039
				[fn () => string_of_label lab1,
				fn () => string_of_label lab2];
	in
		aux lab1 lab2
	end);

	fun aux ((([]:LABEL list),(tm:TERM)),(sofar, ll)) = ((([[ll]:LABEL],tm)::sofar),ll+1)
	| aux ((lls_tm),(sofar, ll)) = ((lls_tm :: sofar),ll);
in
fun ⦏modify_goal_state_thm⦎ (ir : THM -> THM) (
	ulabs : (string list * GOAL)list) : unit = (
let	val ulabs' = (map (fn (ls,tm) =>
		(map label_of_string ls, mk_term_form_goal tm)) ulabs)
		handle complaint =>
		pass_on complaint "label_of_string" "modify_goal_state_thm";

	val {main_goal_stack = main_goal_stack,
		undo_buffer = undo_buffer,...} = !current;

	val current_goal_state as GS{labelling = labelling as (assoc,ach),
		current_goal = current_goal,
		goal_state_thm=goal_state_thm,mgst=mgst} = (case main_goal_stack of
		(a :: _) => a
		| [] =>  fail "apply_tactic" 30007 []);
	val side_effect = if valid_thm goal_state_thm
		then ()
		else fail "modify_goal_state_thm" 30055 [];

	val new_gst = ir goal_state_thm;
	val (hys,conc) = dest_thm new_gst;
	val sideeffect = if is_term_form_goal conc andalso
			all hys is_term_form_goal
		then ()
		else fail "modify_goal_state_thm" 30051
			[fn () => string_of_thm new_gst];
	val new_labelling1 = map (fn tm => (label1 ulabs' tm,tm)) hys;
	val labs_used = flat(map fst new_labelling1);
	val sideeffect = all_distinct lab_distinct labs_used;
	val last_label = fold (fn ((a::x),y) => if a > y
			then a
			else y
			| (_,y) => y)
			labs_used 0;
	val sideeffect = if (length hys > 1) andalso ([] mem labs_used)
		then fail "modify_goal_state_thm" 30039
				[fn () => "",
				fn () => "1"]
		else ();
	val new_labelling2 = fst(fold aux new_labelling1 ([],last_label+1));
	val new_labelling3:LABELLED =
		((flat (map (fn (labs,tm) =>
		map (fn l => (l,tm)) labs) new_labelling2)),[]);

	val new_cg = next_label [] new_labelling3;
	val changed_main_goal = not(concl goal_state_thm =$ concl new_gst);
	val new_gs = GS{labelling = new_labelling3,
		current_goal = new_cg,
		goal_state_thm = new_gst,
		mgst = changed_main_goal orelse mgst};
	val side_effect = if gs_equal new_gs current_goal_state
		then qdiag_line(get_error_message 30034 [])
		else ();
in
	(current := {main_goal_stack = new_gs :: tl main_goal_stack,
		undo_buffer = add_to_buffer current_goal_state undo_buffer,
		redo = []};
	if changed_main_goal
	then qdiag_line(get_error_message 30024 [])
	else ();
	(case new_cg of
		Nil => qdiag_line(get_error_message 30048 [])
		| Value v => (qdiag_line(get_error_message 30047 []);
			print_labelled_goal v));
	())
end);
end;
	
=TEX
\section{END OF THE STRUCTURE}
=SML
val _ = pop_pc();
end; (* of abstract data type *)
end; (* of structure SubgoalPackage *)
open SubgoalPackage;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}
=IGN
Statistics:

open Sort;
fun comp_stats (s1,n1) (s2,n2) = (
	if n1 = n2
	then string_order s1 s2
	else (n1 - n2)
);

sort comp_stats (get_stats ());



=IGN
********************************************************************************
dtd067.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  dtd067.doc  @(#) 92/06/01 1.8 dtd067.doc
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

\def\Title{Detailed Design of the Resolution Facilities}

\def\AbstractText{This document contains the detailed design of the resolution facilities in ICL HOL.}

\def\Reference{DS/FMU/IED/DTD067}

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
%% LaTeX2e port: \TPPtitle{Detailed Design of the Resolution Facilities}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD067}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.11 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 15:10:58 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.Blackburn & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D. Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design
%% LaTeX2e port: of the resolution facilities in ICL HOL.}
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
\item[Issue 1.1 (1992/02/17),1.2 (1992/02/24),1.3 (1992/02/28)]
First versions.
\item[Issue 1.4 (1992/03/11)]
Issued for experimental use.
\item [Issue 1.5 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.6 (1992/05/12) (12th May 1992)]
Changed theory required.
\item[Issue 1.7 (1992/05/14) (14 May 1992)] Use correct quotation symbols.
\item[Issue 1.8 (1992/06/01) (1st June 1992)]
Clarified possible enhancements.
\item [Issue 1.9 (1992/06/30) (30th June 1992)]
Moved some text from \cite{DS/FMU/IED/IMP067} into message database.
\item[Issue 1.11 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.12 (2002/10/17)] PPHol-specific updates for open source release
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
The addition of unit preference, equality reasoning and
skolemisation.
See section \ref{ENHANCE} for details.
\pagebreak
\section{GENERAL}
\subsection{Scope}
Tools providing resolution
are called for in \cite{DS/FMU/IED/HLD012}.
This document provides a detailed design for these tools.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains a detailed design for the
resolution facilities in ICL HOL.

\cite{DS/FMU/IED/DTD028} and \cite{DS/FMU/IED/WRK031} discuss
the tactics provided for proving theorems of the predicate calculus
using the subgoal package. These tactics are complete, in the
sense that they allow proof of any theorem of the predicate calculus,
however they do not constitute a fully automated proof procedure,
in particular user-guidance is always required when an existential
witness has to be supplied or when a universally quantified
assumptions has to be specialised.

In the Cambridge HOL system a similar (but less uniform) suite
of tactics is provided augmented by a so-called ``resolution''
tactic (the basic form being called $RES\_TAC$), which is in fact just a means of increasing the stock
of assumptions essentially by looking for pairs of assumptions of the
form $A[t]$ and $∀x⦁A[x]⇒B[x]$ and
using such a pair to add $B[t]$ to the stock of assumptions.

Experience indicates that many problems would be much easier
to solve if more powerful analogues of this ``resolution''
tactic were available. Desirable features would be:

\begin{itemize}
\item
reduced dependence on particular forms of assumptions, e.g.
an assumption of the form
$∀x⦁B[x]∨¬A[x]$
should be treated uniformly with
$∀x⦁A[x]⇒B[x]$;
\item
unification rather than just pattern matching (allowing particular
consequences of two universally quantified assumptions to be
drawn).
\end{itemize}

Both of these features are steps on the road to the provision
of a tactic which implements a complete proof procedure
for the predicate calculus using classical resolution or one of
its more recent derivatives (see \cite{Ramsay88} for a survey).
There is a large literature on such provers (some of which is
discussed in \cite{DS/FMU/IED/WRK010}). Perhaps the
biggest problem is to decide which of the many techniques to
choose, given that it is likely to take too long to implement
and compare different approaches exhaustively.

\subsubsection{Dependencies}
This document depends upon the provision of theory $pair$ and its ancestors,
as well as the paired abstraction inference rules, and the
simple tactics
of \cite{DS/FMU/IED/DTD027} and \cite{DS/FMU/IED/DTD028}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
\label{ENHANCE}
The addition of unit preference, equality reasoning and
skolemisation
are all thought likely to improve the utility of resolution,
and seem the next things to do.
Unit preference is a choice strategy that has preferential use of theorems
that essentially have only one disjunct (though perhaps more than one fragment).
Equality reasoning concerns building in knowledge of
the commutativity, transitivity and extensionality of equality.
Skolemisation is a means of addressing the following:
=GFT
push_goal([⌜∃x⦁P x⌝, ⌜∀y⦁¬P y⌝], ⌜F⌝);
a(basic_res_tac1 3 []);				(* No resolution occurs *)
a(all_asm_ante_tac THEN REPEAT strip_tac);	(* Introduces Skolem variable *)
a(basic_res_tac1 3 []);				(* Solves goal *)
=TEX
The approach to be taken will probably involve the resolution
process both introducing, and later eliminating a skolem
variable, rather than direct use of stripping.

Other ways of eliminating the need to try unifying two
fragments might speed matters up.
For instance a fragment classification by number of arguments to a non-instantiable function, or an indication that the number of arguments
can vary due to specialisation.

Further interface functions may be useful, such as a tactic
that mimics Cambridge HOL's $IMP\-\_RES\-\_TAC$.
This instance would be interpreted as the input theorem being the
set of support, the goals assumptions and (suitably negated) conclusion the ``other'' theorems.
\section{METHODS AND ISSUES}
\subsection{Tactics or Inference Rules?}
There are two apparent ways to implement the primitive facilities.
The first is as an inference rule which take as inputs
collections of theorems.
The second is as a tactic, which manipulates a collection of theorems
and the current assumptions, halting either on solving the goal,
or some other criteria.

The difference is between a uniform treatment
of assumptions and input theorems,
against a special treatment, both have their advantages.
Once the primitive form is done, the alternative can be
done in a derived form by pre- and postprocessing,
or using, e.g.
$tac\_proof$.
We choose an inference rule approach as uniformity between
assumption and theorem is considered more helpful than
the benefits of, say, the pre-existing $strip\_asm\_tac$
as the basis of a postprocessor,
in a system that would also handle multiple subgoals.
In particular $strip\_asm\_tac$ as a postprocessor of the results of each resolution would sometimes lead to case
splits on irrelevant results, causing important
work to be duplicated.
\subsection{Modes of Use}
One difficulty in designing resolution facilities is the
variety of different desired methods of use the facilities may have.
These differences can categorised as follows:

\paragraph{By what the input is}
The possibilities for a tactic-based method include:
\begin{enumerate}
\item
The current goals assumptions.
\item
The (stripped?) negation of the
current goal's conclusion.
This could be implemented as a derived facility,
which would also do any necessary ``Set of Support'' book-keeping (see below).
\item
Take some ``external'' theorems and work with both these and the current
assumptions and conclusion.
Note that we can type instantiate external theorems, but
not assumptions.
\end{enumerate}
For an inference rule method we are just interested in either
a single list of theorems, or two lists, one of which is the ``Set of Support''

\paragraph{By what ``fairness'' there is between the inputs}
We could treat all inputs equally when searching for successful resolvents, but it is probably
better to work using the ``Set of Support'' paradigm.
This states that resolution will only be attempted when at least one of the two resolvents
is in the set of support.
In such a paradigm it is usual for the results of a resolution
to be added into the set of support
(we shall assume this is so in the first attempt).
Since if the entire of the inputs is considered to be the initial
set of support this is the ``fair'' option, we will choose
to have various methods of adding items into the set of support,
and always use this paradigm.

Further possibilities for search strategies include ``weighting'' assumptions for interest, e.g. preferring those that contain particular symbols,
or choosing by number of disjuncts (in particular, one disjunct - called ``unit preference strategy'').
This will not be attempted in the first attempt at the primitive tool.

Even when a general search strategy has been determined, the precise algorithm will still need to be fixed (e.g. which of two members of the set of support are chosen first).
This is a much less problematical area, and will be ``built-in'' in the first attempt.

A more sophisticated approach could be to use a technique analogous to discrimination nets.
This has each input entered in turn, and the entry may indicate possible resolution attempts with earlier entries, based on the
similarity of form that discrimination nets can indicate
quite rapidly.
This requires more advanced nets than those of rewriting, as
ideally they should handle two-way matches (i.e. full unification),
and should understand the difference between ``fixed'' variables and specialisable ones.
Entry into the net could also be combined with fragmenting a term into subterms based on understood connectives.

\paragraph{By what is done with the results of resolution}
These could be:
\begin{enumerate}
\item
Added back into the assumption list or set of working theorems (and probably the set of support),
\item
Stripped into the assumption list by $strip\_asm\_tac$ (for the tactic approach), or other simplification,
\item
Filtered in some manner before further processing,
for instance by a user-supplied routine to eliminate known useless assumptions, or by various subsumption filters.
Such user-supplied filters could take the current assumption
list or working theorem set as one of their arguments, to aid with subsumption checking, etc.
Notice that subsumption filters can be of various degrees of
completeness, at differing evaluation costs.
\item
Remembered and used in further reasoning, but some or all discarded when the resolution halts.
This includes various ``solve or fail'' approaches.
This could be done via a postprocessing tidying function.
\end{enumerate}
All of the above can be encoded in a tactic (if that is the approach taken) that takes a list of theorems, and is applied to the current goal, if
we assume inference is not deferred.

\paragraph{By the actual method of attempting to resolve two objects}
These vary from pattern matching to two-way unification with domain knowledge.
This includes the possibility of doing Associative-Commutative
unification, or a special understanding of equality.
Only when handling theorems will this approach be
able to do type instantiation.
If we wish to treat some known operators equally,
we are likely to attempt to resolve the subterms that are
combined by the operators to create the assumption or theorems
conclusion.

\paragraph{By what optimisations are used, and where}
We have already mentioned subsumption in filtering the results
of resolution: we could also discard pre-existing assumptions or theorems that
are fully subsumed by others (newly added or pre-existing) - this is called backward subsumption.
Boyer and Moore's work also includes ideas on heuristics for discarding
irrelevant assumptions.
This can be encoded in the same tactic as handles the results
of the resolution, if tactic there be.

\paragraph{By what halts the resolution}
This includes running out of things to do, solving some goal, deriving false, or hitting
some limit, such as number of resolutions used to create a theorem, number of theorems created, or the size of assumption list.
In fact, we can reasonably assume that proving false or the goal causes the function to always grinds to halt, it is other limits that are of interest.
Thus, in our first attempt we will assume that the problem is set up with any goal negated and present in the inputs, so that
we are always working towards proving false.

\paragraph{By what simplifications are done to the input}
We could choose to normalise, strip or do some lesser
simplification to both the initial assumptions and initial theorems.
We might also discard some of the inputs as irrelevant immediately.
These should be implemented as preprocessors for the primitive resolution facilities.

A pair of possible heuristics, inspired by the ICL HOL approach to rewriting, are that
type instantiation will only be done in resolution to theorems with no
assumptions, and only outer universal quantifications will be
specialised.
This places a one-off burden on the preprocessing to
handle inner quantification, free variables, and useful assumptions.
This is a more reasonable burden than full normalisation,
and is less likely to spoil the recognition of the origin of the results (it is often difficult for a user to equate a fully normalised term with its original).
We will only adopt the second heuristic in our first attempt
to provide a practical inference rule and pair of tactics.

Future developments, if time permits, might involve investigating
using matrix methods (see, e.g. \cite{Wallen90}) to improve
performance and the provision of unification procedures adapted
to particular problem domains (e.g. AC unification which
has been implemented for Cambridge HOL see \cite{Slind91}).

\subsection{Immediacy of Inference}
Something that is mostly an implementation issue, but may be
visible in the design is the question of whether the
actual inference is done on the fly, or whether
a description of the required proof steps is built up, and
only executed at the end.
This is particularly important in the ``solve or fail'' modes of use.
An analogous question also has bearing when results are often thrown away as irrelevant, as if we can create them by an approach faster than doing the actual
inference this might have significant speed gains.

Being able to display the required inference steps may
please some users:
and deferring the inference by certain means would make this easier.
\section{PREAMBLE}
=DOC
signature ⦏Resolution⦎  = sig
=DESCRIBE
This is the signature of a structure providing Resolution
facilities to ICL HOL.
=ENDDOC
\section{UNIFICATION OF TERMS}
=TEX
The following provides a way of unifying two subterms in the context of
limitations on both type instantiation and term specialisation.
=DOC
val ⦏term_unify⦎ : Unification.SUBS -> (TYPE list) -> (TERM list) ->
	(TERM * TERM list * TYPE list) *
	(TERM * TERM list * TYPE list) ->
	((TYPE * TYPE) list * (TERM * TERM) list) *
	((TYPE * TYPE) list * (TERM * TERM) list);
=DESCRIBE
This is a method of unifying two subterms in the context of
limitations on both type instantiation and term specialisation.
The $SUBS$ argument is a ``scratchpad'' for the type unification function, based on $Unification.unify$.
The initial type list is a list of type variables to avoid in generating new names,
and the initial term list a list of term variables to likewise avoid.
The other two input arguments are each a tuple of:
a term to unify,
a list of variables in the term that may be specialised,
and a list of types for which instantiation is allowed.
If the two terms can be unified then the function returns two
tuples, referring to each of the two input tuples.
Each tuple is a list of type instantiations and a list of
term specialisations, which pair the original before type instantiation, and the result, type instantiated.
=FAILURE
3007	?0 is not a term variable
3019	?0 is not a type variable
67005	Cannot unify ?0 and ?1
67006	Cannot unify ?0 and ?1 as cannot specialise ?2
67012	Cannot unify ?0 and ?1 as would cause a loop
=FAILUREC
As as errors of $Unification.unify$.
=ENDDOC
As a design error:
=FAILURE
67013	DESIGN ERROR: Encountered mapping to self of ?0
=TEX
\section{FORWARD RESOLUTION}
\subsection{A Primitive Resolution Rule}
=DOC
val ⦏prim_res_rule⦎ :
	(THM list -> THM list -> ('a list * 'a list * 'a list * 'b)) -> (* preprocessor *)
	('a -> 'a -> 'c) -> (* the resolver function *)
	(('c * ('a list * 'a list * 'a list * 'b)) ->
		(('a list * 'a list * 'a list * 'b) * bool)) -> (* postprocessor *)
	('a list -> 'a list) -> (* next item to process *)
	('a list * 'a list * 'a list * 'b -> THM list) -> (* extract results *)
	THM list -> (* input set of support theorems *)
	THM list -> (* input other theorems *)
	THM list;   (* final outcome *)
=DESCRIBE
$prim\_res\_rule$ $prep$ $reso$ $postp$ $next$ $extract$ $limit$
$sos$ $rest$ works as follows:
\begin{itemize}
\item
If any of the input theorems have $⌜F⌝$ as a conclusion
then that theorem is returned as a singleton list.
\item
Evaluate $prep$ $sos$ $rest$, and set $(against,$ $tried,$ $toprocess,$ $dbdata)$ to this.
\item
Attempt resolutions, choosing the head of $toprocess$ against the head of $against$.
Commonly, the head of $toprocess$ should be the first fragment from the set of support,
$against$ is all the non-set of support fragments, plus the head of $toprocess$,
and $tried$ is empty.
\item
The resolver will usually return a list of theorems, and perhaps some further data.
When a resolution attempt returns a list of theorems, $res$,
(resolution failures should not occur, just $[]$),
evaluate $postp$ $(res,$ $(against,$ $tried,$ $toprocess,$ $dbdata))$ to
extract a new  $(against,$ $tried,$ $toprocess,$ $dbdata)$, and $halt$.
It is up to the postprocessor to move the head of $against$ either to $tried$ or just thrown away.
\item
If
$halt$ is true (e.g. have proved $... ⊢ F$),
or the $toprocess$ list is empty then return as a result of the call $extract$ $(against,$ $tried,$ $toprocess,$ $dbdata)$.
\item
If $halt$ is false, then continue with the new data.
If $against$ is $[]$ then the head of $toprocess$ is dropped, and the new list of things to process generated by $next$ $(tl$ $toprocess)$, the new head of this cons'd to $done$ and $against$ is set to $done$ reversed, and then $done$ set to [].
\end{itemize}
=FAILURE
67004	No resolution occurred
67010	Postprocessor corrupted processing
=ENDDOC
Notice the following about $prim\_res\_rule$:
\begin{itemize}
\item
The genericity $:'a$, $:'b$ and $:'c$ allows, e.g., the preprocessing to make one entry
per subterm of the theorem, and keep a list of actual theorems as well.
\item
The set of support strategy can be followed,
with the set of support being $toprocess$ and ``the rest''
being in $against$ and $done$.
\item
If the resolver is not symmetric
(the resulting lists has the same members, but perhaps different ordering for either way round of argument) then some valid resolution attempts may not be
be scheduled.
\end{itemize}

\subsection{A Basic Resolution Tool Kit}
The following provides one way of filling in the arguments
to the above function.
It lacks sophistication in some areas: e.g. in deferring
inference.
=DOC
type ⦏BASIC_RES_TYPE⦎ 	
	(* TERM * bool * (TERM * (TERM -> THM -> THM))list
	   * TYPE list * THM * TERM list * TYPE list * int
	   * FRAG_PRIORITY
	*);
type ⦏RES_DB_TYPE⦎ (* = BASIC_RES_TYPE list * BASIC_RES_TYPE list *
	BASIC_RES_TYPE list * THM list *);
=DESCRIBE
These are type abbreviation for the basic resolution tool
based on $prim\-\_res\-\_rule$.
The arguments to $BASIC\_RES\_TYPE$ are:
\begin{enumerate}
\item
The term is a subterm of the theorem argument(5),
reached through outer universal quantifications and
all propositional connectives.
\item
The bool is false if and only if the subterm occurs ``negatively'' in the conclusion of the theorem.
\item
This list states how to specialise the given term to
some other value in a theorem already specialised
by the preceding entries in the list, and appropriately type instantiated.
\item
The type list is the instantiable type variables of the subterm.
\item
The theorem is the source of the fragment.
\item
The term list is the term variables that may not be used
in unifying the fragment
\item
The next type list is the type variables that may not be used
in unifying the fragment
\item
The integer indicates the ``generation'', i.e. the number of resolutions involved
in creating the fragment (initial theorems are at 0).
\item
This argument indicates the priority given to taking this fragment
from the $toprocess$ list to use next.
\end{enumerate}

The arguments to $RES\_DB\_TYPE$:
\begin{enumerate}
\item
Items yet to be checked against ($against$).
\item
Items checked against, but to be rechecked against new items to check with ($done$).
\item
Items to check with ($toprocess$).
\item
Theorems used to derive current items ($dbdata$).
\end{enumerate}
=ENDDOC
=DOC
val ⦏basic_res_subsumption⦎ : THM -> THM -> int;
=DESCRIBE
This returns $1$ if the conclusion of the first theorem equals
the second's, or is
a less general form than the second
(i.e. could be produced only by specialising and type instantiating the second theorem).
It returns $2$ if the second theorem's conclusion
is a less general form than the first,
and otherwise returns $0$.
=ENDDOC
A more general redundancy test than $basic\-\_pre\-\_subsumption$ should be written when the other
basic mechanisms are in place,
as it is rather weak.
In particular noticing that one conclusion is the succedent or disjunct of
another would be helpful.
Another test would be for simple reordering of quantifiers.
The resolution process generating the newly inserted theorem could give hints here.
=DOC
val ⦏basic_res_pre⦎ : THM list -> THM list -> RES_DB_TYPE;
=DESCRIBE
This is the preprocessor for the basic resolution tool
based on $prim\-\_res\-\_rule$.
The first argument is the set of support theorems,
the second argument is the rest of the input theorems.
Each theorem will be fragmented, and each fragment
added to the appropriate list
(i.e. to the third list of the result if in the set of support,
and the first list if otherwise).
The final theorem list part of the result, $dbdata$, is just the appending of the first list of theorems to the second.
=ENDDOC
We could do, e.g., $basic\_res\_subsumption$ on each pair of theorems before adding any.
=DOC
val ⦏basic_resolve_rule⦎: TERM -> THM -> THM -> THM;
=DESCRIBE
$basic\_resolve\_rule$ $subterm$ $pos$ $neg$
attempts to resolve two theorems
that have a common subterm, $subterm$, occurring ``positively'' in $pos$
and ``negatively'' in $neg$.
=FRULE 1 Rule
basic_resolve_rule
subterm
├
Γ ⊢ P [subterm]
Δ ⊢ N [subterm]
├
simplify (Γ, Δ ⊢ P[F] ∨ N[T])
=TEX
Where $simplify$ carries out the simplifications in the predicate calculus where an argument is the constant $⌜T⌝$ or $⌜F⌝$,
plus a few others.
=FAILURE
3031	?0 is not of type ⓣBOOL⌝
67009	?0 is not a subterm of ?1
=ENDDOC
This is implemented via $∨\_elim$.
=DOC
val ⦏basic_res_resolver⦎ : Unification.SUBS -> int ->
	BASIC_RES_TYPE -> BASIC_RES_TYPE -> THM list * int;
=DESCRIBE
This is the resolver for the basic resolution tool
based on $prim\-\_res\-\_rule$.
Resolution seeks to find sufficient term specialisation
and type instantiation on both terms to make one of the two term fragments the negation of the other,
using $term\_unify$.
The resolution will not be attempted if the result
would involve more resolutions than the ``generations'' limit.
If this can be done then the two original theorems are
specialised and instantiated in the same manner and the term fragment cancelled by $basic\-\_resolve\-\_rule$,
and the result returned as a singleton list,
paired with the default generation of the result.
Prior to being returned, any allowed universal quantification
will be added back in.
In the basic resolution tool the generality of a list of theorems is unnecessary.

The $SUBS$ argument is a ``scratchpad'' for the type unifier.
The function keeps track of the number of resolutions
used to create the result.
=FAILURE
67001	Neither argument is in the set of support
67002	Cannot resolve the two arguments
67008	term_unify succeeded on ?0 and ?1 but failed to resolve ?2 and ?3
=FAILUREC
Message is a variant on 67002, included for diagnostic purposes.
It will be removed in a more stable product.
=ENDDOC
This uses the following message strings:
=FAILURE
67100	New theorem subsumed by another new one: ?0
67101	Previously added theorem subsumed: ?0
=TEX
The returned theorem could also be re-universally quantified,
either just by $all\_∀\_intro$, or more intelligently.
=DOC
val ⦏basic_res_post⦎ :
	(THM -> THM -> int) ->
	(THM list * int) * RES_DB_TYPE ->
	(RES_DB_TYPE * bool);
=DESCRIBE
This is the post processor for the basic resolution tool
based on $prim\-\_res\-\_rule$.
The results will be split into their respective conjuncts
(if any).
Then
$basic\_res\_post$ $subsum$ $((res,$ $gen),$ $data)$
will test each member of $res$, checking for the conclusion $T$ or $F$, and then against each member of the theorem list of $data$.
In checking one theorem against another
it will use $subsum$ - discarding the new theorem if the result is $1$,
and discarding (with tidying up of $data$)
the original if the result is $2$,
or keeping both (except for discards from further tests)
if the result is $0$, or any other value bar $1$ and $2$.
$gen$ is the default ``generation'' of the new theorems,
except that the fragments for each new theorem will have the minimum generation number of this default generation, and the generation of any theorem in $data$ it subsumes.
=ENDDOC
This uses the following message strings:
=FAILURE
67102	No subsumption for ?0
67103	New theorem: ?0 subsumes ?1
=TEX
The use of the generation of subsumed theorems ensures
that the set of theorems intended to be produced with generation up to
some limit includes all the possible theorems (except directly
subsumed ones), and possibly a few more.
For example, without this effect, if a theorem with generation $1$ is subsumed by one with generation $3$ and the limit is $4$, if a resolution existed between the first theorem and some other
with generation $2$ the result would not be included,
as though the resolution would be possible with the subsuming theorem, the resulting generation, $7$ would be too high for the limit.
=DOC
val ⦏basic_res_next_to_process⦎ : BASIC_RES_TYPE list ->
	BASIC_RES_TYPE list;
=DESCRIBE
This takes as the next fragment to process
the first fragment which comes from a theorem that subsumed
some pre-existing one,
and failing that
the next one on the list of fragments.
=ENDDOC
We first check for subsuming fragments to preserve, as far as possible, the order
of resolution which would occur without subsumption.
This couples with the subsuming fragments taking the generation of the theorems they subsume.
=ENDDOC
=DOC
val ⦏basic_res_extract⦎ : RES_DB_TYPE -> THM list;
=DESCRIBE
This is the extraction function for the basic resolution tool
based on $prim\-\_res\-\_rule$.
It does no more than return the fourth item of the $RES\_DB\_TYPE$ tuple.
=ENDDOC
Some one-off subsumption checks could be placed in this rule,
rather than $basic\_res\_post$.
\subsection{Derived Resolution Tools}
=DOC
val ⦏basic_res_rule⦎ : int -> THM list -> THM list ->
	THM list;
=DESCRIBE
$basic\_res\_rule$ $limit$ $sos$ $rest$ will
resolve the theorems in the set of support and the rest
against each other until only theorems with default generation past $limit$ can be
derived, or until $...⊢\ F$ is derived, or until no
further resolution can be done.
A input theorem's generation is $0$, and a theorem that is the result of
resolution has a default generation of $1$ plus the sum of the generations of the resolved theorems.
Its actual generation will be the minimum of its default
generation, and the generations of any previous theorems it subsumes.
In any resolution attempt at least one of the two theorems will belong to the set of support, or be derived from
an earlier resolution in the evaluation.
Resolution will be attempted on subterms reached through
outer universal quantification, and propositional
connectives, by specialising the outer quantifications,
and by type instantiation where necessary and allowed.
Duplicates and pure specialisations in the resulting list will be discarded.

If any of the input theorems have $⌜F⌝$ as a conclusion
then that theorem is returned as a singleton list.
=USES
On its own, or in combination with some canonicalisation
of the input theorems.
=FAILURE
67003	The limit, ?0, must be a positive integer
67004	No resolution occurred
=ENDDOC
The implementation of this function is primarily by combining
the previous bits.
Roughly:
=GFTSHOW Defn
fun basic_res_rule limit sos rest =
	prim_res_rule
		basic_res_pre
		(basic_res_resolver (new_subs 100) limit)
		(basic_res_post basic_res_subsumption)
		basic_res_next_to_process
		basic_res_extract
		sos
		rest;
=TEX
=DOC
val ⦏BASIC_RESOLUTION_T⦎ : int -> THM list -> (THM -> TACTIC) ->
	(THM -> TACTIC) -> TACTIC;
=DESCRIBE
$BASIC\_RESOLUTION\_T$ $limit$ $thms$ $thmtac1$ $thmtac2$ $(seqasms, conc)$
will first apply $thmtac1$ to the negated goal,
probably adding it into the assumption list in some manner.
The assumptions derived from this will become the set of support,
the pre-existing assumptions and the input $thms$ will be
 the rest of the theorems.
These theorems will be resolved against each other until only theorems with default generation past $limit$ can be
derived, or until $...⊢\ F$ is derived, or until no
further resolution can be done.
An assumption's or input theorem's generation is $0$, and a theorem that is the result of
resolution has a default generation of $1$ plus the sum of the generations of the resolved theorems.
Its actual generation will be the minimum of its default
generation, and the generations of any previous theorems it subsumes.
In any resolution attempt at least one of the two theorems will be assumed fragments from the stripped goal, or be derived from
an earlier resolution in the evaluation.
Duplicates and pure specialisations will be discarded.

Resolution will be attempted on subterms reached through
outer universal quantification, and propositional
connectives, by specialising the outer quantifications,
and by type instantiation on the input theorems $thms$ where necessary and possible.

The resulting list of theorems will have all the $thms$ removed,
all the theorems derived from stripping and negating the
goal,
and all the old assumptions removed.
$MAP\_EVERY$ $thmtac$ is then applied to the new theorems,
and then to the goal.
As a special case, $...⊢\ F$ is checked for, before any
further processing.
If present it will be used to prove the goal.
=USES
On its own, or in combination with some canonicalisation
of the input theorems.
=FAILURE
67003	The limit, ?0, must be a positive integer
67004	No resolution occurred
=ENDDOC
This is $basic\_res\_rule$ with some pre- and postprocessing.
=DOC
val ⦏BASIC_RESOLUTION_T1⦎ : int -> THM list -> (THM -> TACTIC) ->
	TACTIC;
=DESCRIBE
$BASIC\_RESOLUTION\_T1$ $limit$ $thms$ $thmtac$ $(seqasms, conc)$
will take the theorems gained by $asm\_rule$'ing the assumptions and $thms$ as inputs.
These theorems will be resolved against each other until only theorems with default generation past $limit$ can be
derived, or until $...⊢\ F$ is derived, or until no
further resolution can be done.
An assumption's or input theorem's generation is $0$, and a theorem that is the result of
resolution has a default generation of $1$ plus the sum of the generations of the resolved theorems.
Its actual generation will be the minimum of its default
generation, and the generations of any previous theorems it subsumes.
In any resolution attempt at least one of the two theorems will be from the original goals assumptions, or be derived from
an earlier resolution in the evaluation.
Duplicates and pure specialisations will be discarded.

Resolution will be attempted on subterms reached through
outer universal quantification, and propositional
connectives, by specialising the outer quantifications,
and by type instantiation on the input theorems $thms$ where necessary and possible.

The resulting list of theorems will have all the $thms$ removed,
and all the old assumptions removed.
$MAP\_EVERY$ $thmtac$ is then applied to the new theorems,
and then to the goal.
As a special case, $...⊢\ F$ is checked for, before any
further processing.
If present it will be used to prove the goal.
=USES
On its own, or in combination with some canonicalisation
of the input theorems.
=FAILURE
67003	The limit, ?0, must be a positive integer
67004	No resolution occurred
=ENDDOC
=DOC
val ⦏basic_res_tac⦎ : int -> THM list -> TACTIC;
=DESCRIBE
$basic\_res\_tac$ $limit$ $thms$ $(seqasms, conc)$
will first strip the negated goal into the assumption list.
This uses $strip\_tac$, except that the negation
is pushed through all the outer universals.
The assumptions derived from this will become the set of support,
the pre-existing assumptions and the input $thms$ will be
 the rest of the theorems.
These theorems will be resolved against each other until only theorems with default generation past $limit$ can be
derived, or until $...⊢\ F$ is derived, or until no
further resolution can be done.
An assumption's or input theorem's generation is $0$, and a theorem that is the result of
resolution has a default generation of $1$ plus the sum of the generations of the resolved theorems.
Its actual generation will be the minimum of its default
generation, and the generations of any previous theorems it subsumes.
In any resolution attempt at least one of the two theorems will be assumed fragments from the stripped goal, or be derived from
an earlier resolution in upon those fragments.
Duplicates and pure specialisations will be discarded.

Resolution will be attempted on subterms reached through
outer universal quantification, and propositional
connectives, by specialising the outer quantifications,
and by type instantiation on the input theorems $thms$ where necessary and possible.

The resulting list of theorems will have all the $thms$ removed,
all the theorems derived from stripping and negating the
goal removed,
and all the old assumptions removed.
$MAP\_EVERY$ $strip\_asm\_tac$ is then applied to the new theorems,
and then to the goal.
As a special case, $...⊢\ F$ is checked for, before any
further processing.
If present it will be used to prove the goal.
=USES
On its own, or in combination with some canonicalisation
of the input theorems.
=FAILURE
67003	The limit, ?0, must be a positive integer
67004	No resolution occurred
=ENDDOC
This is $basic\_res\_rule$ with some pre- and postprocessing.
=DOC
val ⦏basic_res_tac1⦎ : int -> THM list -> TACTIC;
=DESCRIBE
$basic\_res\_tac1$ $limit$ $thms$ $(seqasms,$ $conc)$
will take the theorems gained by $asm\-\_rule$'ing the assumptions and $thms$ as inputs.
These theorems will be resolved against each other until only theorems with default generation past $limit$ can be
derived, or until $...⊢\ F$ is derived, or until no
further resolution can be done.
An assumption's or input theorem's generation is $0$, and a theorem that is the result of
resolution has a default generation of $1$ plus the sum of the generations of the resolved theorems.
Its actual generation will be the minimum of its default
generation, and the generations of any previous theorems it subsumes.
In any resolution attempt at least one of the two theorems will be from the original goals assumptions, or be derived from
an earlier resolution in the evaluation.
Duplicates and pure specialisations will be discarded.

Resolution will be attempted on subterms reached through
outer universal quantification, and propositional
connectives, by specialising the outer quantifications,
and by type instantiation on the input theorems $thms$ where necessary and possible.

The resulting list of theorems will have all the $thms$ removed,
and all the old assumptions removed.
$MAP\_EVERY$ $strip\_asm\_tac$ is then applied to the new theorems,
and then to the goal.
As a special case, $...⊢\ F$ is checked for, before any
further processing.
If present it will be used to prove the goal.
=USES
On its own, or in combination with some canonicalisation
of the input theorems.
=FAILURE
67003	The limit, ?0, must be a positive integer
67004	No resolution occurred
=ENDDOC
This is $basic\_res\_rule$ with some pre- and postprocessing.
=DOC
val ⦏basic_res_tac2⦎ : int -> THM list -> TACTIC;
=DESCRIBE
$basic\_res\_tac2$ $limit$ $thms$ $(seqasms, conc)$
will first strip the negated goal into the assumption list.
This uses $strip\_tac$, except that the negation
is pushed through all the outer universals.
The assumptions derived from this will become the set of support,
the pre-existing assumptions and the input $thms$ will be
 the rest of the theorems.
These theorems will be resolved against each other until only theorems with default generation past $limit$ can be
derived, or until $...⊢\ F$ is derived, or until no
further resolution can be done.
An assumption's or input theorem's generation is $0$, and a theorem that is the result of
resolution has a default generation of $1$ plus the sum of the generations of the resolved theorems.
Its actual generation will be the minimum of its default
generation, and the generations of any previous theorems it subsumes.
In any resolution attempt at least one of the two theorems will be assumed fragments from the stripped goal, or be derived from
an earlier resolution in upon those fragments.
Duplicates and pure specialisations will be discarded.

Resolution will be attempted on subterms reached through
outer universal quantification, and propositional
connectives, by specialising the outer quantifications,
and by type instantiation on the input theorems $thms$ where necessary and possible.

The tactic will fail unless the resulting list of theorems contains $...⊢\ F$.
If present it will be used to prove the goal.
=FAILURE
67003	The limit, ?0, must be a positive integer
67004	No resolution occurred
67014	Failed to prove goal
=ENDDOC
=DOC
val ⦏basic_res_tac3⦎ : int -> THM list -> TACTIC;
=DESCRIBE
$basic\_res\_tac3$ $limit$ $thms$ $(seqasms,$ $conc)$
will take the theorems gained by $asm\-\_rule$'ing the assumptions and $thms$ as inputs.
These theorems will be resolved against each other until only theorems with default generation past $limit$ can be
derived, or until $...⊢\ F$ is derived, or until no
further resolution can be done.
An assumption's or input theorem's generation is $0$, and a theorem that is the result of
resolution has a default generation of $1$ plus the sum of the generations of the resolved theorems.
Its actual generation will be the minimum of its default
generation, and the generations of any previous theorems it subsumes.
In any resolution attempt at least one of the two theorems will be from the original goals assumptions, or be derived from
an earlier resolution in the evaluation.
Duplicates and pure specialisations will be discarded.

Resolution will be attempted on subterms reached through
outer universal quantification, and propositional
connectives, by specialising the outer quantifications,
and by type instantiation on the input theorems $thms$ where necessary and possible.

The tactic will fail unless the resulting list of theorems contains $...⊢\ F$.
If present it will be used to prove the goal.
=FAILURE
67003	The limit, ?0, must be a positive integer
67004	No resolution occurred
67014	Failed to prove goal
=ENDDOC
=DOC
val ⦏basic_res_tac4⦎ : int -> int list -> int list ->
	THM list -> THM list -> TACTIC;
=DESCRIBE
$basic\_res\_tac4$ $limit$ $sos$ $rest$ $sos\_thms$ $rest\_thms$ $(seqasms,$ $conc)$
will take the theorems gained by $asm\-\_rule$'ing the numbered assumptions and $thms$ as inputs.
The ``set of support'' theorems with be those
assumptions noted in the $sos$ and those theorems in $sos\_thms$,
and ``the rest'' will be those assumptions noted in the $rest$,
as well as $rest\_thms$.
These theorems will be resolved against each other until only theorems with default generation past $limit$ can be
derived, or until $...⊢\ F$ is derived, or until no
further resolution can be done.
An assumption's or  input theorem's generation is $0$, and a theorem that is the result of
resolution has a default generation of $1$ plus the sum of the generations of the resolved theorems.
Its actual generation will be the minimum of its default
generation, and the generations of any previous theorems it subsumes.
In any resolution attempt at least one of the two theorems will be from the set of support, or be derived from
an earlier resolution in the evaluation.
Duplicates and pure specialisations will be discarded.

Resolution will be attempted on subterms reached through
outer universal quantification, and propositional
connectives, by specialising the outer quantifications,
and by type instantiation on the input theorems $thms$ where necessary and possible.

The resulting list of theorems will have all the $thms$ removed,
and all the old assumptions removed.
$MAP\_EVERY$ $strip\_asm\_tac$ is then applied to the new theorems,
and then to the goal.
As a special case, $...⊢\ F$ is checked for, before any
further processing.
If present it will be used to prove the goal.
=USES
On its own, or in combination with some canonicalisation
of the input theorems.
=FAILURE
67003	The limit, ?0, must be a positive integer
67004	No resolution occurred
9303	the index ?0 is out of range
=ENDDOC
\subsection{Diagnostics}
This flag may be removed when resolution is more stable.
=DOC
(* resolution_diagnostics - boolean flag declared by new_flag *)
=DESCRIBE
This is by default false, but if set true then
the resolution mechanism will report the generation of
new, unsubsumed theorems, and whether these subsume
pre-existing theorems.
=USES
Provide the designer of the resolution functions
access to detailed diagnostics.
Not intended for use by others.
May be withdrawn.
=ENDDOC
\section{EPILOGUE}
=SML
end; (* of signature Resolution *)
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



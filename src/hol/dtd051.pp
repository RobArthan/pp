=IGN
********************************************************************************
dtd051.doc: this file is part of the PPHol system

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

\def\Title{Proof Contexts}

\def\AbstractText{This document gives the detailed design for providing proof contexts.}

\def\Reference{DS/FMU/IED/DTD051}

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
%% LaTeX2e port: \TPPtitle{Proof Contexts}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Proof Contexts}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD051}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.44 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/05/07 12:50:24 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{K.~Blackburn & WIN01\\R.D.Arthan & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives the detailed design for providing proof contexts.}
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
\item [Issue 1.1 (1991/10/24)]
First version.
\item [Issue 1.2 (1991/10/25)]
Try again.
\item [Issue 1.3 (1991/10/25)]
And again.
\item [Issue 1.4 (1991/11/04)]
Tidying up after doing implementation.
\item [Issue 1.5 (1991/11/19)]
Moved to using abstract data types.
\item [Issue 1.6 (1991/11/19)]
Gains equational context material.
\item [Issue 1.7 (1991/11/22)]
Added $get\_(e)pc\_cs\_∃\_rule$.
\item [Issue 1.8 (1991/12/06)]
Added existence prover parameterisation.

\item[Issue 1.9 (1992/01/20), \FormatDate{92/01/20} ] Updated to use new fonts.
\item [Issue 1.10 (1992/03/20)]
Changed to using a dictionary of proof contexts.
\item [Issue 1.11 (1992/03/23)]
Variation on a theme.
\item [Issue 1.12 (1992/03/25)]
Changes after comments on 1.11.
\item [Issue 1.13 (1992/03/26)]
Changes after RBJ comments.
\item [Issue 1.14 (1992/03/30)]
Changes after RBJ/RDA comments.
\item [Issue 1.15 (1992/04/10)]
Typo fixed.
\item [Issue 1.16 (1992/04/14) (13th April 1992)]
Changes due to CR0017.
\item [Issue 1.17 (1992/04/15) (15th April 1992)]
Change to $get\_stack\_pcs$, added $delete\_pc\_fields$.
\item [Issue 1.18 (1992/05/07) (7th May 1992)]
Act on CR0009.
\item [Issue 1.19 (1992/05/08) (8th May 1992)]
Reorganised after RBJ comments.
\item [Issue 1.20 (1992/05/12) (12th May 1992)]
Minor tinkering.
\item [Issue 1.22 (1992/05/26) (26th May 1992)]
Renamings from version 1.5 of DS/FMU/IED/WRK038.
\item [Issue 1.23 (1992/05/27) (27th May 1992)]
Corrected description.
\item [Issue 1.24 (1992/05/28) (28th May 1992)]
Added $prove\-\_tac$ and $prove\-\_∃\-\_tac$.
\item [Issue 1.25 (1992/05/29) (29th May 1992)]
And took them out again!
\item [Issue 1.26 (1992/06/04) (3rd June 1992)]
Improved design of $add\_?\_thms$.
\item [Issue 1.27 (1992/06/29) (29th June 1992)]
Added $PCS\_MERGE\_T$, etc.
\item [Issue 1.28 (1992/07/21) (21st July 1992)]
Typos and clarification
\item [Issue 1.29 (1992/08/07) (7th August 1992)]
Typos.
\item [Issue 1.30 (1992/08/20) (20th August 1992)]
Typos.
\item [Issue 1.31 (1992/12/01) (30th November 1992)]
Additional ``additional nets'' proof context field.
\item [Issue 1.32 (1992/12/14) (14th December 1992)]
Added $pending\_reset\_pc\_stack/evaluators$.
\item [Issue 1.33 (1993/01/06) (6th January 1993)]
Added coments on ordering of merging.
\item [Issue 1.34 (1993/01/07) (7th January 1993)]
Clarifying text.
\item [Issue 1.35 (1993/02/18),1.36 (1993/02/22) (22nd February 1993)]
$force\_delete\_theory$ (and trial run for it).
\item [Issue 1.37 (1999/02/11)]
Correction for SML'97.
\item[Issue 1.38 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.39 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.40 (2005/12/16)] The prefix for private interfaces is now $pp'$ rather than $icl'$.
\item[Issue 1.41 (2011/02/06)] Added matching modus ponens field and facilities for extending the current proof context.
\item[Issue 1.42 (2011/02/19)] $pr\_conv$ and $pr\_tac$ are now optional
fields and these and $mmp\_rule$ are now handled uniformly when proof contexts
are merged, by taking the merge of a list of optional values to be the last non-nil value.
\item[Issue 1.43 (2011/05/05), 1.44 (2011/05/07)] Added equation matcher field.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
The designer of this document needs to know which functions it may
give context for, and the type of the proof context details.
Thus if a new tool using context is added to the system then this document will need
modification.

In particular, the expected resolution tool will be parameterised in some manner yet to be decided,
and when introduced will require changes to this document
and its implementation.
\section{GENERAL}
\subsection{Scope}
This document contains a detailed design for the
provision of proof contexts.
This is called for in \cite{DS/FMU/IED/HLD009}.
The design is implemented in \cite{DS/FMU/IED/IMP051}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
A proof context is a setting of various
parameters of proof tools to support a particular mode of proof.
For instance, both $rewrite\_tac$ and $strip\_tac$
are proof tools that may be parameterised.
In particular, proof contexts will be later made available,
through the tools supplied here,
that supply a helpful environment to reason about Z,
or within a particular theory (e.g. set theory),
and alter the default environment.

An alternative approach to the one chosen is to take a
proof context to be a labeled list of functions of type $:unit\ ->\ unit$.
A proof context would then be ``set'' by applying each function in the proof context to $()$.
This has the advantage that new context-sensitive tools could be
introduced without a system rebuild.
However, one loses the ability to display even parts
of the context, or access to the data to which
an individual function could be set.
\subsubsection{Dependencies}
This document is dependent on \cite{DS/FMU/IED/IMP008}.
It also depends on knowledge of what context-sensitive tools it
needs to cover.
It further depends on being able to create at least dummy
values for the parameters of these functions.
\subsubsection{Deficiencies}
We fail to give the developer of a context-sensitive proof tool the ability to add an ``understanding'' of the new tool without
modifying this document and its implementation.
They will have to modify this document and its implementation and then rebuild the system
(an approach only available to someone supplied with the ability to do a system build), or provide their own proof context
tools, perhaps building upon the ones supplied here.

\subsubsection{Possible Enhancements}
Proof contexts are often associated with theories,
so it might be nice if the theory lister tells you the names
of those contexts associated with the theory listed.
Such a feature would probably require an interface in this document.
\subsubsection{Terminology}
An {\em equational context} is a list of conversions,
each paired with term index. It represents a context that states
how to
rewrite a term to result in an equational theorem,
guided by the outermost form of the term to be rewritten.
An equational context will be of type $EQN\_CXT$
(= $(TERM\ *\ CONV)list$).

A {\em proof context} holds the data used to provide context for selected proof tools.

\section{THE SIGNATURE}
=DOC
signature ⦏ProofContext⦎ = sig
=DESCRIBE
This provides the basic tools for handling equational and proof contexts.
To keep them short, the names in the structure are heavily abbreviated.
The abbreviations used are:

\begin{centering}

\begin{tabular}{| l | l |} \hline
pc(s) & proof context(s) \\
rw & rewriting \\
cs & constant specification \\
$∃$ & existential theorem prover \\
pr & $prove\_tac$ and related tools\\
sg & goal stripping \\
st & theorem stripping \\
cd & clausal definition \\
vs & variable structure \\
ad & application data \\
net & discrimination net \\
eqn\_cxt & equational context \\
nd & dictionary of discrimination nets (and sources)\\
canon(s) & theorem canonicalisation \\
mmp & matching mp rule \\
eqm & equation matcher \\ \hline
\end{tabular}
\end{centering}

~\\

=ENDDOC
\section{EQUATIONAL CONTEXTS}
=DOC
type ⦏EQN_CXT⦎;
=DESCRIBE
This is the type of equational contexts.
An equational context is a list of conversions,
each paired with term index. It represents a statement of
how to
rewrite a term to result in an equational theorem,
guided by the outermost form of the term to be rewritten,
which is matched against the term index of each conversion.
It is used to create a single conversion via $eqn\_cxt\_conv$ (q.v.).

A theorem may be converted into a member of
an equational context by $thm\_eqn\_cxt$.
A pre-existing conversion may be converted by determining
the term index that matches at least all terms that
the conversion must work on
(see $net\_enter$ for details), and pair it with the conversion.
=GFT
type EQN_CXT = (TERM * CONV) list;
=TEX
Note that equational contexts can be merged by appending.
An equational context may be transformed into a conversion
discrimination net by $make\_net$ or $list\_net\_enter$(q.v.).
=ENDDOC
=DOC
val ⦏thm_eqn_cxt⦎ : THM -> (TERM * CONV);
=DESCRIBE
This function is a simple form of equation matcher
for use by the rewriting tools. It transforms an equational theorem into
a representation of a first-order rewrite rule in a form
suitable for inclusion in an equational context ($EQN\_CXT$ q.v.)
=GFT
thm_eqn_cxt `Γ ⊢ ∀ x1 ... ⦁ LHS = RHS` →
	(LHS, simple_eq_match_conv1 `Γ ⊢ ∀ x1 ... ⦁ LHS = RHS`)
=TEX
The universal quantifiers must be over simple variables (not patterns).
=SEEALSO
$cthm\_eqn\_cxt$ which canonicalises
the theorem before transformation.
=FAILURE
7095	?0 is not of the form `Γ ⊢ ∀ x1 ... xn ⦁ u = v' where ⌜xi⌝ are variables
=ENDDOC
=DOC
val ⦏simple_ho_thm_eqn_cxt⦎ : THM -> (TERM * CONV);
=DESCRIBE
This function is an equation matcher for use by the rewriting tools
that uses higher-order matching. It transforms an equational theorem into
a representation of a higher-order rewrite rule in a form
suitable for inclusion in an equational context ($EQN\_CXT$ q.v.)
=GFT
thm_eqn_cxt `Γ ⊢ ∀ x1 ... ⦁ LHS = RHS` →
	(LHS', simple_eq_match_conv1 `Γ ⊢ ∀ x1 ... ⦁ LHS = RHS`)
=TEX
Here the pattern term $LHS'$ is derived from $LHS$ by replacing linear
patterns (see $simple\_ho\_match$) by variables of the same type.

The universal quantifiers must be over simple variables (not patterns)
and the higher-order matching is done using $simple\_ho\_match$.
=SEEALSO
$cthm\_eqn\_cxt$ which canonicalises
the theorem before transformation.
=FAILURE
7095	?0 is not of the form `Γ ⊢ ∀ x1 ... xn ⦁ u = v' where ⌜xi⌝ are variables
=ENDDOC
=DOC
val ⦏eqn_cxt_conv⦎ : EQN_CXT -> CONV;
=DESCRIBE
This function creates a single conversion from an equational
context.
This is done via $make\_net$ and $net\_lookup$(q.v.).
There is a $CHANGED\_C$ wrapped around each
conversion in the equational context.
=FAILURE
51005	Equational context gave no conversions that succeeded for ?0
=ENDDOC

\section{PROOF CONTEXTS}
\subsection{Discussion}
The goal of the following functions is:
\begin{enumerate}
\item
To give a naive user a simple command to change
the proof context.
This will change the individual context of all context-sensitive proof tools,
to provide the best context available for the style of work they are to then carry out.
The new context may be a merge of various supplied proof contexts.
\item
To give a more experienced user the ability to merge
together the effect of various proof contexts into the current proof context.
\item
To give the developer of, say, a new theory the means
to create a proof context suitable for reasoning in that theory.
\item
To allow a piece of proof automation to change the proof context,
do some work, and then revert to the previous context.
\item
To provide a single place where all context-sensitive tools look
for their contexts.
\end{enumerate}
We implement proof contexts by maintaining two data structures:
a database of proof contexts, in which a proof context is a record
in the database, and a particular part of the proof context is
a field of the proof context;
and a stack of proof contexts, which has the current proof context as the top record.
Proof contexts are pushed onto the stack from the database,
they have no existence apart from within these two structures.

A proof context has various fields, each field relating
to some single area of context for a context-sensitive
proof tool.
A proof context is created by $new\-\_pc$.
Its fields are populated by data that comes from other
proof contexts in the database (by $merge\-\_pc$ and
$merge\-\_pc\-\_fields$), and that is entered by
the proof context's creator.
A proof context in is in the middle of its creation may still be
pushed onto the proof context stack, but it may not be used
as the origin of data for a field of another proof context.
When a proof context is considered complete it is ``committed''
by $commit\-\_pc$, and it then becomes an
acceptable origin of data for other proof contexts.

Mechanisms keep track of the origin of data in each of a
proof context's fields by splitting it into subfields, to allow duplicated information to
be discarded when merging data from various proof contexts in a single field.
Each subfield is indexed by the proof context name from which it came.
This is also why we commit proof contexts, and why they may
only have data extracted for other proof contexts after their committal.
More than one proof context may be uncommitted at the same time.

The data a user might enter into a proof context
is not in the same form as context-sensitive applications accessing the proof context need to see:
there is an evaluation step in between.
We therefore must provide methods of evaluating the
user data to extract the application data.
As we cannot in all cases state this evaluation process
at the point of implementing this document
we provide the functions prefixed $pp'set\_eval\_???$ to allow
evaluation functions to be entered at a later date.
Uncommitted proof contexts are evaluated by the current
evaluation function when they are pushed onto the proof context stack,
committed contexts are evaluated at the point of committal
by the evaluation functions current at the time of committal
(saving the cost of multiple evaluations upon multiple pushes).
\subsection{Summary of Tools Supported and Provided}
The following sets of tools have context-sensitive  behaviour supported
by proof contexts:
=GFT
rewrite_tac and its cousins
strip_tac and its cousins
basic_prove_∃_conv and its users
prove_tac, prove_conv, prove_rule
forward_chain_rule and its associated tactics
=TEX
There is a further dictionary of discrimination nets, each dictionary entry holding a discrimination net of
items of type
=GFT
TERM -> THM
=TEX
These are to be used for additional proof context dependent tools.

The user data tools are:
=GFT
set_rw_eqn_cxt	get_rw_eqn_cxt		add_rw_thms
set_rw_canons		get_rw_canons
set_rw_eqm_rule		get_rw_eqm_rule
set_st_eqn_cxt		get_st_eqn_cxt		add_st_thms
set_sc_eqn_cxt		get_sc_eqn_cxt		add_sc_thms
set_cs_∃_convs	get_cs_∃_convs
set_∃_cd_thms		get_∃_cd_thms		add_∃_cd_thms
set_∃_vs_thms		get_∃_vs_thms
set_pr_tac		get_pr_tac
set_pr_conv		get_pr_conv
set_nd_entry		get_nd_entry
set_mmp_rule		get_mmp_rule
=TEX

In naming the interface functions we use the convention:
=GFT
<set|get|add>_<proof tool>_<modifier>
=TEX
The proof tools in the above are: $rw$ for rewriting,
$st$ for stripping theorems, $sg$ for stripping goals,
$cs$ for constant specifications,
$pr$ for $prove\_tac$ and cousins,
$∃$ for the existence prover $prove\-\_∃\-\_conv$
$mmp$ for forward chaining and any other tools that might need a matching modus ponens rule.
The net dictionary, $nd$, can be used for further proof tools.

$set$ and $get$ functions overwrite or access the database respectively.
$add$ functions add unprocessed theorems
into a proof context, using some form of automated processing.

The applications data tools are:
=GFT
pp'set_eval_ad_rw_net		current_ad_rw_net
pp'set_eval_ad_rw_canon		current_ad_rw_canon
pp'set_eval_ad_st_conv		current_ad_st_conv
pp'set_eval_ad_sc_conv		current_ad_sc_conv
pp'set_eval_ad_cs_∃_conv		current_ad_cs_∃_conv
pp'set_eval_ad_∃_cd_thms		current_ad_∃_cd_thms
pp'set_eval_ad_∃_vs_thms		current_ad_∃_vs_thms
pp'set_eval_ad_nd_net		current_ad_nd_net
current_ad_pr_tac
current_ad_pr_conv
current_ad_mmp_rule
current_ad_rw_eqm_rule
=TEX

In naming the applications data interface functions we use the convention:
=GFT
<pp'set_eval|current>_ad_<proof tool>_<modifier>
=TEX
The proof tools in the above are: $rw$ for rewriting,
$st$ for stripping theorems, $sg$ for stripping goals,
$cs$ for constant specifications,
and $∃$ for the existence prover $prove\-\_∃\-\_conv$.
$pp'set\_eval$
sets the method of evaluating the associated user data into application data
(note that there is no such function for fields $pr\_tac$ and $pr\_conv$)
and $current$ gives the current proof context's application data, if it is in scope, and otherwise error 51021.

Note that an application data field in an uncommitted proof context could be directly modified, to $v$ say,
by setting its evaluation function to
=INLINEFT
(fn _ => v)
=TEX
, committing the proof context,
and restoring the evaluation function to its previous value.
This might be a system builder's necessary trick,
it is certainly not a standard pattern of use.

To allow certain patterns of context changes, we have
a stack of proof contexts, with the current proof context at the top.
We provide applications with hooks to look into this current proof
context,
but no way to modify stacked proof contexts ``in place''.
In particular, if a proof context is stacked, then it
is in fact a copy that is stacked, so that later changes to the original do not affect the stack.

The database of proof contexts is initialised to contain
a single context with key ``initial'', which is also the initial current proof context
\subsection{Proof Context Database Functions}
=DOC
val ⦏new_pc⦎ : string -> unit;
=DESCRIBE
$new\_pc$ $new$
creates a new
record in the proof context database, with key $new$.
The fields of the proof context are set to default values.
A note will be made of the current theory,
and its current definition level at the time of
creation, and an error will be raised
if an attempt is made to push the new proof context (see $push\_pc$) when
that theory is not in scope, or when the definition level
has been recorded as deleted.
The definition level will be recorded as deleted if, e.g., some definition
or axiom that was in scope in the original theory has since been deleted.

One responsibility of the creator of a proof context is to ensure that the theorems used within, or created by, the new context are also
in scope: this is not automatically checked.
=FAILURE
51011	There is already a proof context with key ?0
=ENDDOC
=DOC
val ⦏delete_pc⦎ : string -> unit;
=DESCRIBE
This deletes a record from the proof context database.
The record with key ``initial'' may not be deleted.
=FAILURE
51010	There is no proof context with key ?0
51012	Initial proof context may not be deleted
=ENDDOC
=DOC
val ⦏commit_pc⦎ : string -> unit;
=DESCRIBE
This commits a record of the proof context database,
preventing further change, and allowing it to be used in
the creation of further records.
The context must be loadable at the point of committing
(i.e. was created at a point now in scope),
and after committal the proof context can only be loaded
at a point when the point of committal is in scope,
rather than the point of its initial creation (i.e. doing $new\_pc$).
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
=ENDDOC
=DOC
val ⦏get_pcs⦎ : unit -> (string * string) list;
=DESCRIBE
This lists the names of the proof contexts held in the proof context
database, and the theory that was current at their time of creation.
If the theory has since been deleted or if the definition level becomes deleted, e.g.
because an axiom or definition has been deleted,
then this will output
=INLINEFT
("context name","theory name (out of scope, deleted, or modified)")
=TEX
=SEEALSO
$get\_stack\_pcs$, $get\_current\_pc$.
=ENDDOC
=DOC
val ⦏merge_pcs⦎ : string list -> string -> unit;
=DESCRIBE
$merge\_pcs$ $keys$ $tokey$ takes a list of committed proof contexts named by $keys$,
and merges their fields into proof context $tokey$'s fields,
discarding duplicates.
For each field that has subfields the lists of subfields from each proof context are appended, discarding
subfields with duplicate keys,
and if a field is not divided into subfields, then the proof contexts fields are appended, discarding duplicates.
The $pr\_conv$, $pr\_tac$ and $mmp\_rule$ fields take the value of the
last proof context in the list that has the field set.

Failure to extract any proof context for merging will result in the
proof context $tokey$ being unchanged.
=SEEALSO
$merge\_pc\_fields$, $delete\_pc\_fields$
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
51017	Proof context ?0 has not been committed
=ENDDOC
=DOC
val ⦏merge_pc_fields⦎ : {context:string,fields:string list}list -> string -> unit;
=DESCRIBE
$merge\_pc\_fields$ $fields$ $tokey$
merges the fields noted for each committed proof context in $fields$ into proof context $tokey$'s fields,
discarding duplicates.
Merging for each field that has subfields the lists of subfields is appending the proof contexts fields, discarding
subfields with duplicate keys,
and if a field is not divided into subfields, then the proof contexts fields are appended, discarding duplicates.
Each of the $pr\_conv$, $pr\_tac$  and $mmp_rule$ fields
take the value from the last proof context whose
list of field names includes that field and which has the field set.

Failure to extract any proof context for merging will result in the
proof context $tokey$ being unchanged.

Valid field names are:
=GFT
"rw_eqn_cxt","rw_canons","st_eqn_cxt","sc_eqn_cxt",
"cs_∃_convs","∃_cd_thms","∃_vs_thms","pr_tac","pr_conv",
"nd_entries", "mmp_rule"
=TEX
=SEEALSO
$delete\_pc\_fields$ and $merge\_pcs$, which used together in a particular order can give the same functionality as this function.
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
51017	Proof context ?0 has not been committed
51019	There is no field called ?0
=ENDDOC
=DOC
val ⦏delete_pc_fields⦎ : string list -> string -> unit;
=DESCRIBE
$delete\_pc\_fields$ $fields$ $key$
empties
(sets to the value of proof context ``initial'') the named fields, $fields$ of the proof context with key $key$.
If any field is divided into subfields, this deletion includes deleting the subfields of the field gained from
merging in other proof contexts,
as well as the proof context's ``own'' subfield.

Valid field names are:
=GFT
"rw_eqn_cxt","rw_canons","st_eqn_cxt","sc_eqn_cxt",
"cs_∃_convs","∃_cd_thms","∃_vs_thms","pr_tac","pr_conv",
"nd_entries", "mmp_rule"
=TEX
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
51019	There is no field called ?0
=ENDDOC
Some function for generating the list of allowed field names
might be helpful.
\subsection{Proof Context Field Functions}
The following functions relate to individual fields
of proof contexts:
=DOC
val ⦏set_rw_eqn_cxt⦎ : EQN_CXT -> string -> unit;
val ⦏get_rw_eqn_cxt⦎ : string -> (EQN_CXT * string) list;
val ⦏add_rw_thms⦎ : THM list -> string -> unit;
=DESCRIBE
These functions provide the interface to the equational context for rewriting (see e.g. $rewrite\_tac$)
held in the user data of a proof context.
``setting'' overwrites the subfield whose key is the proof context's name,
``getting'' returns the entire field (which pairs data with
proof context names).
``adding'' processes its theorems by first canonicalising according to the current proof context's canonicalisation function, and then with $thm\_eqn\_cxt$ and
then adds them into the subfield whose key is the proof context's name.
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
=ENDDOC
=DOC
val ⦏pp'set_eval_ad_rw_net⦎ : (EQN_CXT -> CONV NET) -> unit;
val ⦏current_ad_rw_net⦎ : unit -> CONV NET;
=DESCRIBE
These functions provide the interface to the initial conversion net for rewriting (see e.g. $rewrite\_tac$)
held in the application data of a proof context.
The first sets the evaluator, the second extracts the field
in the current proof context.
=SEEALSO
$set\_rw\_eqn\_cxt$ for the associated user data.
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
=ENDDOC
=DOC
val ⦏set_rw_canons⦎ : (THM -> THM list) list ->
	string -> unit;
val ⦏get_rw_canons⦎ : string -> ((THM -> THM list) list * string) list;
=DESCRIBE
These functions provide the interface to the individual canonicalisation functions used to create the canonicalisation function applied to rewriting theorems (see e.g. $rewrite\_tac$)
held in the user data of a proof context.

``setting'' overwrites the subfield whose key is the proof context's name,
``getting'' returns the entire field (which pairs data with
proof context names).
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
=ENDDOC
=DOC
val ⦏pp'set_eval_ad_rw_canon⦎ : ((THM -> THM list) list -> (THM -> THM list))
	-> unit;
val ⦏current_ad_rw_canon⦎ : unit -> THM -> THM list;
=DESCRIBE
These functions provide the interface to the canonicalisation function applied to rewriting theorems (see e.g. $rewrite\_tac$)
held in the application data of a proof context.
The proof context is accessed after providing the theorem.
The first sets the evaluator, the second extracts the field
in the current proof context.
=SEEALSO
$set\_rw\_canons$ for the associated user data.
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
=ENDDOC
=DOC
val ⦏set_st_eqn_cxt⦎ : EQN_CXT -> string -> unit;
val ⦏get_st_eqn_cxt⦎ : string -> (EQN_CXT * string)list;
val ⦏add_st_thms⦎ : THM list -> string -> unit;
=DESCRIBE
These functions provide the interface to the equational context for stripping theorems into the
assumption list (see e.g. $strip\_tac$)
held in the user data of a proof context.
``setting'' overwrites the subfield whose key is the proof context's name,
``getting'' returns the entire field (which pairs data with
proof context names).
``adding'' processes its theorems  by first canonicalising according to the current proof context's canonicalisation function, and then with $thm\_eqn\_cxt$ and
then adds them into the subfield whose key is the proof context's name.
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
=ENDDOC
=DOC
val ⦏pp'set_eval_ad_st_conv⦎ : (EQN_CXT -> CONV) -> unit;
val ⦏current_ad_st_conv⦎ : unit -> CONV;
=DESCRIBE
These functions provide the interface to the conversion for stripping theorems into the
assumption list (see e.g. $strip\_tac$)
held in the application data of a proof context.
The proof context is accessed before provision of a term.
The first sets the evaluator, the second extracts the field
in the current proof context.
=SEEALSO
$set\_st\_conv$ for the associated user data.
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
=ENDDOC
=DOC
val ⦏set_sc_eqn_cxt⦎ : EQN_CXT -> string -> unit;
val ⦏get_sc_eqn_cxt⦎ : string -> (EQN_CXT * string) list;
val ⦏add_sc_thms⦎ : THM list -> string -> unit;
=DESCRIBE
These functions provide the interface to the equational context for stripping goal conclusions (see e.g. $strip\_tac$)
held in the user data of a proof context.
``setting'' overwrites the subfield whose key is the proof context's name,
``getting'' returns the entire field (which pairs data with
proof context names).
``adding'' processes its theorems by first canonicalising according to the current proof context's canonicalisation function, and then with $thm\_eqn\_cxt$ and
then adds them into the subfield whose key is the proof context's name.
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
=ENDDOC
=DOC
val ⦏pp'set_eval_ad_sc_conv⦎ : (EQN_CXT -> CONV) -> unit;
val ⦏current_ad_sc_conv⦎ : unit -> CONV;
=DESCRIBE
These functions provide the interface to the conversion for stripping goal conclusions (see e.g. $strip\_tac$)
held in the application data of a proof context.
The proof context is accessed before provision of a term.
The first sets the evaluator, the second extracts the field
in the current proof context.
=SEEALSO
$set\_sg\_conv$ for the associated user data.
=ENDDOC
=DOC
val ⦏set_nd_entry⦎ : string -> (TERM * (TERM -> THM))list -> string -> unit;
val ⦏get_nd_entry⦎ : string -> string ->
	((TERM * (TERM -> THM))list * string) list;
=DESCRIBE
These functions provide the interface to the
additional dictionary of sources for discrimination nets
held in the user data of a proof context.
The dictionary is actually a list of subfields of the proof context, indexed by source proof context name, each subfield being a dictionary in its own right.
You ``set'' a single dictionary entry of the subfield indexed
by the proof context's name
(creating a new entry if necessary).
You ``get'' the dictionaries for all the subfields.

=INLINEFT
set_nd_entry dict_key entry pc_name
=TEX
{} overwrites (or creates, if necessary) the proof context's name's subfield dictionary entry whose key is $dict\_key$
in the proof context $pc\_name$ with the value $entry$.

=INLINEFT
get_nd_entry dict_key pc_name
=TEX
{} returns the dictionary entries whose keys are $dict\_key$
from each of the subfields
in the proof context $pc\_name$,
paired with the source proof context name,
or an empty list if the entry is not present
in the dictionaries of any of the subfields of that proof context.
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
=ENDDOC
=DOC
val ⦏pp'set_eval_ad_nd_net⦎ :
	(string -> (TERM * (TERM ->  THM)) list ->
		(TERM ->  THM) NET) -> unit;
val ⦏current_ad_nd_net⦎ : string -> (TERM -> THM) NET;
=DESCRIBE
These functions provide the interface to the
additional dictionary of discrimination nets
held in the application data of a list of proof contexts.

The application data is generated by taking, for each key
in at least one of the dictionaries in the appropriate subfields of the proof context,
the appended lists of all the entries for that key in
any of the subfields of the proof context.
To this is applied the evaluator set by
$pp'set\-\_eval\-\_ad\-\_nd\-\_net$ first applied to the dictionary
key.
The result is used as an entry, using the same dictionary
key, in the resulting dictionary of nets.
The default evaluator will just use $make\_net$ on each list
of sources.

$current\-\_ad\-\_nd\-\_net$ $key$ returns the net
indexed by the key $key$ in the current proof context.
If no entry exists it returns the empty net $empty\_net$.
Note that the returned net can be viewed as something of type
$EQN\_CXT$, and made into a conversion by $eqn\-\_cxt\-\_conv$.
=USES
For extending the proof context mechanisms.
Though available to the end user, and indeed intended for use by the sophisticated user, the proof context mechanisms
(as opposed to proof contexts)
should be extended under ICL direction.
=SEEALSO
$set\_nd\_entry$ for the associated user data.
=ENDDOC
=DOC
val ⦏set_cs_∃_convs⦎ : (CONV list) ->
	string -> unit;
val ⦏get_cs_∃_convs⦎ : string ->
	(((CONV list) * string) list);
=DESCRIBE
These functions provide the interface to the
existence provers for constant specifications (see $const\_spec$)
held in the user data of a proof context.
Under the initial evaluator, the existence proving conversion supplied by $current\-\_cs\-\_∃\-\_conv$ will have each of the conversions
tried, in the reverse order of their entry,
being applied to the RHS of the result of the previous successful application, or the initial term to which the conversion was applied, until the RHS is $⌜T⌝$, or no conversions remain.
=GFT Example
If get_cs_∃_convs of the current proof context returns

[([conv1, conv2],"pc1"),([conv3, conv4],"pc2")]

Then current_ad_cs_∃_conv  will return

conv4 AND_OR_C conv3 AND_OR_C conv2 AND_OR_C conv1
=TEX

``setting'' overwrites the subfield whose key is the proof context's name,
``getting'' returns the entire field (which pairs data with
proof context names).
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
=ENDDOC
=DOC
val ⦏pp'set_eval_ad_cs_∃_convs⦎ : (CONV list -> CONV)
	 -> unit;
val ⦏current_ad_cs_∃_conv⦎ : unit -> CONV;
=DESCRIBE
These functions provide the interface to the
existence prover for constant specifications (see $const\_spec$)
held in the application data of a proof context.
The proof context is accessed before provision of a term.
The first sets the evaluator, the second extracts the field
in the current proof context.
=SEEALSO
$set\_cs\_∃\_rule$ for the associated user data.
=FAILURE
51015	No automated existence prover in the current proof context succeeds
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
=ENDDOC
=DOC
val ⦏set_∃_cd_thms⦎ : THM list -> string -> unit;
val ⦏get_∃_cd_thms⦎ : string -> THM list;
val ⦏add_∃_cd_thms⦎ : THM list -> string -> unit;
=DESCRIBE
These functions provide the interface to the
unevaluated
clausal definition theorems held for the existence prover
$prove\_∃\_conv$.
There are no subfields to this field, so
``setting'' overwrites the field with the proof context's name,
``getting'' returns the field.
``adding'' unions its theorem list with the proof contexts field.
=SEEALSO
See $evaluate\_∃\_cd\_thms$ for details upon the form
of the theorems.
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
=ENDDOC
=DOC
val ⦏pp'set_eval_ad_∃_cd_thms⦎ : (THM list ->
	(TERM list * int list * TYPE * (TERM list)list * THM) list) -> unit;
val ⦏current_ad_∃_cd_thms⦎ : unit ->
	(TERM list * int list * TYPE * (TERM list)list * THM) list;
=DESCRIBE
These functions provide the interface to the
clausal definition theorem information for the existence prover
$prove\_∃\_conv$.
See $evaluate\_∃\_cd\_thms$ for details upon the form
of the information.
The first sets the evaluator, the second extracts the field
in the current proof context.
=SEEALSO
$set\_∃\_cd\_thms$ for the associated user data.
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
=ENDDOC
=DOC
val ⦏set_∃_vs_thms⦎ : (string * (TERM list * THM)) list
 	-> string -> unit;
val ⦏get_∃_vs_thms⦎ : string -> (string * (TERM list * THM)) list;
=DESCRIBE
These functions provide the interface to the
variable structure information for the existence prover
$prove\_∃\_conv$.
An individual entry in the list gives a method of handling
an extended variable structure.
It consists of the name of the constructor;
a list of functions that extract each field of the constructor,
and a theorem that states
how the extraction functions extract from a data construction,
and that the data constructor may be applied to the extracted
values to regain the original value.
For instance, for pairs the information is:
=GFT
	(",",
	([⌜Fst⌝,⌜Snd⌝],
	`⊢ ∀ x y p ⦁
		Fst (x, y) = x ∧ Snd (x, y) = y ∧
		(Fst p, Snd p) = p)`))
=TEX
There are no subfields to this field, so
``setting'' overwrites the field with the proof context's name,
``getting'' returns the field.
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
=ENDDOC
=DOC
val ⦏pp'set_eval_ad_∃_vs_thms⦎ : ((string * (TERM list * THM)) list ->
	(string * (TERM list * THM)) list) -> unit;
val ⦏current_ad_∃_vs_thms⦎ : unit ->
	(string * (TERM list * THM)) list;
=DESCRIBE
These functions provide the interface to the application data
variable structure information for the existence prover
$prove\_∃\_conv$.
The first sets the evaluator, the second extracts the field
in the current proof context.
=SEEALSO
$set\_∃\_vs\_thms$ for user data.
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
=ENDDOC
=DOC
val ⦏set_pr_tac⦎ : (THM list -> TACTIC) -> string -> unit;
val ⦏get_pr_tac⦎ : string -> (THM list -> TACTIC);
val ⦏get_pr_tac1⦎ : string -> (THM list -> TACTIC) OPT;
=DESCRIBE
These functions provide the interface to the
proof contexts for
$prove\_tac$.
Note that setting overwrites all previous data in this field,
including from merged in proof contexts. If the field has not been set,
$get\_pr\_tac$ returns a function mapping any list of
theorems to $fail\_tac$ and $get\_pr\_tac1$ returns $Nil$.
Merged proof contexts take their value for this field from the last proof context in the list that has this field set.

When $asm\_prove\_tac$ is applied to its theorem list argument
the system will evaluate this by applying the value set by
$set\_pr\_tac$ for the current proof context
to that argument.
The provided values for $set\_pr\_tac$ can interpret their
theorem list arguments as they wish (e.g. as a set of rewrite theorems, or as theorems to resolve against) - no interpretation is forced upon this argument.

Note that when using these functions that the standard rewriting functions (obvious candidates for inclusion in
automatic proof) access the current
proof context at the point of being given their theorem list
argument.
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
=ENDDOC
=DOC
val ⦏current_ad_pr_tac⦎ : unit -> (THM list -> TACTIC) OPT;
=DESCRIBE
This function returns the application data of the current proof context
for
$prove\_tac$.
=SEEALSO
$set\_pr\_tac$ for user data.
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
=ENDDOC
=DOC
val ⦏set_pr_conv⦎ : (THM list -> CONV) -> string -> unit;
val ⦏get_pr_conv⦎ : string -> (THM list -> CONV);
val ⦏get_pr_conv1⦎ : string -> (THM list -> CONV) OPT;
=DESCRIBE
These functions provide the interface to the
proof contexts for
$prove\_conv$.
Note that setting overwrites all previous data in this field,
including from merged in proof contexts.
If the field has not been set, $get\_pr\_conv$ returns
a function mapping any list of theorems to $fail\_conv$
and $get\_pr_conv1$ returns $Nil$.
Merged proof contexts take their value for this field from the last proof context in the list that has the field set.

Note that when using these functions that the standard rewriting functions (obvious candidates for inclusion in
automatic proof) access the current
proof context at the point of being given their theorem list
argument.
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
=ENDDOC
=DOC
val ⦏current_ad_pr_conv⦎ : unit -> (THM list -> CONV) OPT;
=DESCRIBE
These functions returns the application data of the current proof context
to the
proof contexts for
$prove\_conv$.
=SEEALSO
$set\_pr\_conv$ for user data.
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
=ENDDOC
=DOC
val ⦏set_mmp_rule⦎ : (THM -> THM -> THM) -> string -> unit;
val ⦏get_mmp_rule⦎ : string -> (THM -> THM -> THM) OPT;
=DESCRIBE
These functions provide the interface to the
proof contexts for the matching modus ponens rule as used by tools such
as $forward\_chain\_rule$.
Note that setting overwrites all previous data in this field,
including from merged in proof contexts.
Merged proof contexts take their value for this field from the last proof context in the list that has the field set.


=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
=ENDDOC
=DOC
val ⦏current_ad_mmp_rule⦎ : unit -> (THM -> THM -> THM) OPT;
=DESCRIBE
This function returns the application data of the current proof context
for the matching modus ponens rule as used by tools such
as $forward\_chain\_rule$.
=SEEALSO
$set\_mmp\_rule$ for user data.
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
=ENDDOC

=DOC
val ⦏set_rw_eqm_rule⦎ : (THM -> TERM * CONV) -> string -> unit;
val ⦏get_rw_eqm_rule⦎ : string -> (THM -> TERM * CONV) OPT;
=DESCRIBE
These functions provide the interface to the
proof contexts for the equation matcher as used by the
rewriting tools.
Note that setting overwrites all previous data in this field,
including from merged in proof contexts.
Merged proof contexts take their value for this field from the last proof context in the list that has the field set.


=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51016	Proof context ?0 has been committed
=ENDDOC
=DOC
val ⦏current_ad_rw_eqm_rule⦎ : unit -> (THM -> TERM * CONV) OPT;
=DESCRIBE
This function returns the application data of the current proof context
for the equation matcher as used by the rewriting tools.
=SEEALSO
$set\_rw\_eqm\_rule$ for user data.
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
=ENDDOC
=TEX
\subsection{Proof Context Stack Functions}
We use a stack of (temporarily) superseded proof contexts to simplify the task
of ``change the context,
do some work, and then revert to the previous context'',
for this is an obvious approach.
=DOC
val ⦏get_stack_pcs⦎ : unit -> (string list * string) list;
=DESCRIBE
This lists the keys of the proof contexts held in the proof context
stack, and the theory that was current at their time of creation.
If a proof context is pushed onto the stack by, e.g. $push\_pc$, the ``keys'' will be the singleton list of the name of the source proof context.
If a proof context is pushed onto the stack by, e.g. $push\_merge\_pcs$, the ``keys'' will be the list of the names of the source proof contexts.
If the theory has since been deleted or if the definition level becomes deleted, e.g.
because an axiom or definition has been deleted,
then this will output
=GFT
(["context name"],"theory name (out of scope, deleted, or modified)")
=TEX
The head of the list returned is the current proof context, as also displayed
by $get\-\_current\-\_pc$.
=ENDDOC
=FAILURE
51018	?0 (out of scope, deleted, or modified)
=TEX
=DOC
val ⦏get_current_pc⦎ : unit -> (string list * string);
=DESCRIBE
Returns the key(s) of the entries from which the
current proof context was copied, and the theory in which the single
proof context was created.
If the theory has since been placed out of scope, deleted or if the definition level becomes deleted, e.g.
because an axiom or definition has been deleted,
then this will output
=GFT
(["context name"],"theory name (out of scope, deleted, or modified)")
=TEX
Note that the key may no longer access a proof context in the database identical to the current proof context.

Merged proof contexts upon the stack  (from $push\_merge\_pcs$ and  $set\_merge\_pcs$) will have the list of names of the constituent proof contexts, singleton contexts will have singleton lists.
=SEEALSO
$get\_stack\_pcs$
=ENDDOC
=DOC
val ⦏push_pc⦎ : string -> unit;
val ⦏set_pc⦎ : string -> unit;
=DESCRIBE
$push\_pc$ stacks the previous ``current'' proof context, and
and sets the current proof context of the system to the proof
context with the given key.
$set\_pc$ discards the previous ``current'' proof context, and
and sets the current proof context of the system to the proof
context with the given key.

The current proof context is accessed by the functions prefixed $current\_ad\_$, and by $get\-\_current\-\_pc$.
=SEEALSO
$pending\_push\_pc$, $pop\_pc$, $push\_merge\_pcs$, $set\_merge\_pcs$
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
=ENDDOC
=DOC
val ⦏pending_push_pc⦎ : string -> unit -> unit;
val ⦏pending_push_extend_pc⦎ : string -> unit -> unit;
=DESCRIBE
$pending\_push\_pc$ takes a snapshot of the named
proof context, and returns a function that, when applied
to $():unit$
stacks the previous ``current'' proof context, and
sets the current proof context of the system to this snapshot.

$pending\_push\_extend\_pc$ takes a snapshot of the result of merging the
named proof context with the current proof context and then behaves just
like $pending\_push\_merge\_pc$.

The proof context must be in scope both at the time of the snapshot,
and at the time of pushing on the stack.

This provides a method of being independent of changes to
uncommitted proof contexts, or proof context deletions.
=SEEALSO
$push\_pc$
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
=ENDDOC
=DOC
val ⦏push_merge_pcs⦎ : string list -> unit;
val ⦏set_merge_pcs⦎ : string list -> unit;
=DESCRIBE
$push\_merge\_pcs$ stacks the previous ``current'' proof context, and
and sets the current proof context of the system to the merge of the proof
contexts with the given keys.
$set\_merge\_pcs$ discards the previous ``current'' proof context, and
and sets the current proof context of the system to the merge of the proof
contexts with the given keys.
Merged proof contexts upon the stack will have $current\-\_ad\-\_names$ giving the list of names of the constituent proof contexts, singleton contexts will have singleton lists.
The proof contexts used need not have been committed.

The $pr\_conv$, $pr\_tac$ and $mmp\_rule$ fields take the value of the
last proof context in the list that has the field set.

The current proof context is accessed by the functions prefixed $current\_ad\_$, and by $get\-\_current\-\_pc$.
=SEEALSO
$pop\_pc$, $push\_pc$, $set\_pc$
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51020	Must be at least one key in list
=ENDDOC
=DOC
val ⦏push_extend_pc⦎ : string -> unit;
val ⦏set_extend_pc⦎ : string -> unit;
=DESCRIBE
$push\_extend\_pc$ stacks the previous ``current'' proof context, and
and then merges the proof
context with the given key into the current proof context.
$set\_extend\_pcs$ merges the proof
context with the given key into the current proof context
without changing the stack.

Merged proof contexts upon the stack will have $current\-\_ad\-\_names$ giving the list of names of the constituent proof contexts.
The proof context used need not have been committed.

The $pr\_conv$, $pr\_tac$ and $mpp\_rule$ fields take the value from the named proof context.

The current proof context is accessed by the functions prefixed $current\_ad\_$, and by $get\-\_current\-\_pc$.
=SEEALSO
$pop\_pc$, $push\_pc$, $set\_pc$
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51020	Must be at least one key in list
=ENDDOC
=DOC
val ⦏push_extend_pcs⦎ : string list -> unit;
val ⦏set_extend_pcs⦎ : string list -> unit;
=DESCRIBE
$push\_extend\_pcs$ stacks the previous ``current'' proof context, and
and then merges the proof
contexts with the given keys into the current proof context.
$set\_extend\_pcs$ merges the proof
contexts with the given keys into the previous current proof context
without changing the stack.

Merged proof contexts upon the stack will have $current\-\_ad\-\_names$ giving the list of names of the constituent proof contexts, singleton contexts will have singleton lists.
The proof contexts used need not have been committed.

The $pr\_conv$, $pr\_tac$ and $mmp\_rule$ fields take the value of the
last proof context in the list that has the field set.

The current proof context is accessed by the functions prefixed $current\_ad\_$, and by $get\-\_current\-\_pc$.
=SEEALSO
$pop\_pc$, $push\_merge_pcs$, $set\_merge_pcs$
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51020	Must be at least one key in list
=ENDDOC
=DOC
val ⦏pending_push_merge_pcs⦎ : string list -> unit -> unit;
val ⦏pending_push_extend_pcs⦎ : string list -> unit -> unit;
=DESCRIBE
$pending\_push\_merge\_pcs$ takes a snapshot of the result of merging the
named proof contexts, and returns a function that, when
applied to $()$
stacks the previous proof context, and
and sets the current proof context of the system to this snapshot.

$pending\_push\_extend\_pcs$ takes a snapshot of the result of merging the
named proof contexts with the current proof context and then behaves just
like $pending\_push\_merge\_pcs$.

Merged proof contexts upon the stack will have $current\-\_ad\-\_names$ giving the list of names of the constituent proof contexts, singleton contexts will have singleton lists.
The proof contexts used need not have been committed.
The $pr\_conv$, $pr\_tac$ and $mmp\_rule$ fields take the value of the
last proof context in the list that has the field set.

The proof context must be in scope both at the time of the snapshot,
and at the time of pushing on the stack.

This provides a method of being independent of changes to
uncommitted proof contexts, or proof context deletions.
=SEEALSO
$push\_merge\_pc$
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
51020	Must be at least one key in list
=ENDDOC
=DOC
val ⦏pop_pc⦎ : unit -> unit;
=DESCRIBE
This function unstacks the top of the proof context stack,
and sets the current proof context of the system to it.
There will always be a current proof context, though it may be the trivial ``initial'' proof context.

This function may make an out of scope proof context
the current proof context.
=SEEALSO
$push\_pc$, $set\_pc$, $push\_merge\_pcs$, $set\_merge\_pcs$
=FAILURE
51001	The proof context stack is empty
=ENDDOC
=DOC
val ⦏pending_reset_pc_database⦎ : unit -> unit -> unit;
=DESCRIBE
This function, applied to $()$ takes a snapshot of the
proof context database, and returns a function that,
if applied to $()$ will restore the proof context database
to the snapshot.

This function is particularly useful in initialising
child databases, and in conjunction with $pending\-\_reset\-\_pc\-\_stack$ and $pending\-\_reset\-\_pc\-\_evaluators$.

Note that a named proof context on the proof context stack is never
taken as more than an echo of the item with that name
(if any) of proof context database,
and this function in particular, though not alone, is responsible
for the possible differences.
=ENDDOC
=DOC
val ⦏pending_reset_pc_stack⦎ : unit -> unit -> unit;
=DESCRIBE
This function, applied to $()$ takes a snapshot of the
proof context stack, and returns a function that,
if applied to $()$ will restore the proof context stack
to the snapshot.
=USES
This function is particularly useful in initialising
child databases, and in conjunction with $pending\-\_reset\-\_pc\-\_database$ and $pending\-\_reset\-\_pc\-\_evaluators$.
=ENDDOC
=DOC
val ⦏pending_reset_pc_evaluators⦎ : unit -> unit -> unit;
=DESCRIBE
This function, applied to $()$ takes a snapshot of the
proof context evaluators (e.g. the
one set by $pp'set\-\_eval\-\_ad\-\_∃\-\_vs\-\_thms$ , and returns a function that,
if applied to $()$ will restore the proof context evaluators
to the snapshot.
=USES
This function is particularly useful in initialising
child databases, and in conjunction with $pending\-\_reset\-\_pc\-\_database$, and $pending\-\_reset\-\_pc\-\_stack$
=ENDDOC
=DOC
(* proof context key "⦏initial⦎" *)
=DESCRIBE
This is the initial proof context, formed with empty lists and other default values.
It thus has no default rewriting or stripping theorems.
The rewriting canonicalisation is the identity.
The automated existence prover fails on any input.
The matching modus ponens rule is
=INLINEFT
Nil
=TEX
.
=ENDDOC
\section{USING THE PROOF CONTEXTS}
=DOC
val ⦏PC_T⦎ : string -> TACTIC -> TACTIC;
val ⦏MERGE_PCS_T⦎ : string list -> TACTIC -> TACTIC;
=DESCRIBE
=INLINEFT
PC_T context tac
=TEX
{} will apply tactic $tac$ to a goal, and evaluate its proof, in the proof context with key $context$,
using at both times the named context as it is at the point of applying the tactic to a goal.
This is done via pushing and popping on the proof context stack.

$PCS\_MERGE\_T$ takes a list of proof contexts instead, merged
as if by, e.g. $push\_merge\_pcs$

Note that when using this functions that the standard rewriting functions (obvious candidates for this function) access the current
proof context at the point of being given their theorem list
argument: see $PC\_T1$ for a method of avoiding this.
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the errors of the tactic.
The previous proof context is restored, even if the tactic application or proof fails.
=ENDDOC
=DOC
val ⦏EXTEND_PC_T⦎ : string -> TACTIC -> TACTIC;
val ⦏EXTEND_PCS_T⦎ : string list -> TACTIC -> TACTIC;
=DESCRIBE
=INLINEFT
EXTEND_PC_T context tac
=TEX
{} will apply tactic $tac$ to a goal, and evaluate its proof, in the proof context obtained by merging the proof context with key $context$
into the current proof context.
The named context is used as it is at the point of applying the tactic to a goal.
The $pr\_tac$, $pr\_conv$ and $mpp\_rule$ fields are taken from the named proof context.
This is done via pushing and popping on the proof context stack.

$EXTEND\_PCS_T\_T$ takes a list of proof contexts instead, merged
as if by, e.g. $push\_extend\_pcs$

Note that when using this functions that the standard rewriting functions (obvious candidates for this function) access the current
proof context at the point of being given their theorem list
argument: see $EXTEND\_PC\_T1$ for a method of avoiding this.
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the errors of the tactic.
The previous proof context is restored, even if the tactic application or proof fails.
=ENDDOC
=DOC
val ⦏PC_C⦎ : string -> CONV -> CONV;
val ⦏MERGE_PCS_C⦎ : string list -> CONV -> CONV;
=DESCRIBE
=INLINEFT
PC_C context conv
=TEX
{} will apply conversion $conv$ to a term in the proof context with key $context$,
using the named context as it is at the point of applying the conversion to a term.
This is done via pushing and popping on the proof context stack.

$MERGE\_PCS\_C$ takes a list of proof contexts instead, merged
as if by, e.g. $push\_merge\_pcs$

Note that when using this functions that the standard rewriting conversions (obvious candidates for this function) access the current
proof context at the point of being given their theorem list
argument: see $PC\_C1$ for a method of avoiding this.
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the errors of the conversion.
The previous proof context is restored, even if the conversion fails.
=ENDDOC
=DOC
val ⦏EXTEND_PC_C⦎ : string -> CONV -> CONV;
val ⦏EXTEND_PCS_C⦎ : string list -> CONV -> CONV;
=DESCRIBE
=INLINEFT
EXTEND_PC_C context conv
=TEX
{} will apply conversion $conv$ to a term  in the proof context obtained by merging the proof context with key $context$
into the current proof context.
The named context is used as it is at the point of applying the conversion to a term.
The $pr\_tac$, $pr\_conv$ and $mpp\_rule$ fields are taken from the named proof context.
This is done via pushing and popping on the proof context stack.

$EXTEND\_PCS\_C$ takes a list of proof contexts instead, merged
as if by, e.g. $push\_extend\_pcs$

Note that when using this functions that the standard rewriting functions (obvious candidates for this function) access the current
proof context at the point of being given their theorem list
argument: see $EXTEND\_PC\_C1$ for a method of avoiding this.
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the errors of the conversion.
The previous proof context is restored, even if the conversion fails.
=ENDDOC
=DOC
val ⦏pc_rule⦎ : string -> ('a -> THM) -> ('a -> THM);
val ⦏merge_pcs_rule⦎ : string list -> ('a -> THM) -> ('a -> THM);
=DESCRIBE
=INLINEFT
pc_rule context rule
=TEX
{} will apply rule $rule$ to its argument in the proof context with key $context$,
using the named context as it is at the point of applying the rule to the argument.
This is done via pushing and popping on the proof context stack.

$merge\_pcs_rule$ takes a list of proof contexts instead, merged
as if by, e.g. $push\_merge\_pcs$

Note that when using this functions that the standard rewriting functions (obvious candidates for this function) access the current
proof context at the point of being given their theorem list
argument: see $pc\_rule1$ for a method of avoiding this.
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the errors of the rule.
The previous proof context is restored, even if the rule fails.
=ENDDOC
=DOC
val ⦏extend_pc_rule⦎ : string -> ('a -> THM) -> ('a -> THM);
val ⦏extend_pcs_rule⦎ : string list -> ('a -> THM) -> ('a -> THM);
=DESCRIBE
=INLINEFT
extend pc_rule context rule
=TEX
{} will apply rule $rule$ to its argument in the proof context obtained by merging the proof context with key $context$ into the current proof context.
The named context is used as it is at the point of applying the rule to the argument.
The $pr\_tac$, $pr\_conv$ and $mpp\_rule$ fields are taken from the named proof context.
This is done via pushing and popping on the proof context stack.

$extend\_pcs_rule$ takes a list of proof contexts instead, merged
as if by, e.g. $extend\_merge\_pcs$

Note that when using this functions that the standard rewriting functions (obvious candidates for this function) access the current
proof context at the point of being given their theorem list
argument: see $extend_pc\_rule1$ for a method of avoiding this.
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the errors of the rule.
The previous proof context is restored, even if the rule fails.
=ENDDOC
=DOC
val ⦏PC_T1⦎ : string -> ('a -> TACTIC) -> 'a -> TACTIC;
val ⦏MERGE_PCS_T1⦎ : string list -> ('a -> TACTIC) -> 'a -> TACTIC;
=DESCRIBE
=INLINEFT
PC_T1 context tac arg
=TEX
{} will apply tactic $tac$ $arg$ to a goal, and evaluate the proof, in the proof context with key $context$,
using at both times the named context as it is at the point of applying the tactic to a goal.
This is done via pushing and popping on the proof context stack.

$MERGE\_PCS\_T1$ takes a list of proof contexts instead, merged
as if by, e.g. $push\_merge\_pcs$.
=SEEALSO
$PC\_T$
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the errors of the tactic.
The previous proof context is restored, even if the tactic application or proof fails.
=ENDDOC
=DOC
val ⦏EXTEND_PC_T1⦎ : string -> ('a -> TACTIC) -> 'a -> TACTIC;
val ⦏EXTEND_PCS_T1⦎ : string list -> ('a -> TACTIC) -> 'a -> TACTIC;
=DESCRIBE
=INLINEFT
EXTEND_PC_T1 context tac arg
=TEX
{} will apply tactic $tac$ $arg$ to a goal, and evaluate the proof, in the proof context obtained by merging the proof context with key $context$ into the current proof context.
The named context is used as it is at the point of applying the rule to the argument.
The $pr\_tac$, $pr\_conv$ and $mpp\_rule$ fields are taken from the named proof context.
This is done via pushing and popping on the proof context stack.

$EXTEND\_PCS\_T1$ takes a list of proof contexts instead, merged
as if by, e.g. $push\_extend\_pcs$.
=SEEALSO
$PC\_T$
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the errors of the tactic.
The previous proof context is restored, even if the tactic application or proof fails.
=ENDDOC
=DOC
val ⦏PC_C1⦎ : string -> ('a -> CONV) -> 'a -> CONV;
val ⦏MERGE_PCS_C1⦎ : string list -> ('a -> CONV) -> 'a -> CONV;
=DESCRIBE
=INLINEFT
PC_C context conv arg
=TEX
{} will apply conversion $conv$ $arg$ in the proof context with key $context$,
using the named context as it is at the point of applying the conversion to a term.
This is done via pushing and popping on the proof context stack.

$MERGE\_PCS\_C1$ takes a list of proof contexts instead, merged
as if by, e.g. $push\_merge\_pcs$.
=SEEALSO
$PC\_C$
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the errors of the conversion.
The previous proof context is restored, even if the conversion fails.
=ENDDOC
=DOC
val ⦏EXTEND_PC_C1⦎ : string -> ('a -> CONV) -> 'a -> CONV;
val ⦏EXTEND_PCS_C1⦎ : string list -> ('a -> CONV) -> 'a -> CONV;
=DESCRIBE
=INLINEFT
EXTEND_PC_C context conv arg
=TEX
{} will apply conversion $conv$ $arg$ in the proof context obtained by merging the proof context with key $context$ into the current proof context.
The named context is used as it is at the point of applying the rule to the argument.
The $pr\_tac$, $pr\_conv$ and $mpp\_rule$ fields are taken from the named proof context.
This is done via pushing and popping on the proof context stack.

$EXTEND\_PCS\_C1$ takes a list of proof contexts instead, merged
as if by, e.g. $push\_extend\_pcs$.
=SEEALSO
$PC\_C$
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the errors of the conversion.
The previous proof context is restored, even if the conversion fails.
=ENDDOC
=DOC
val ⦏pc_rule1⦎ : string -> ('a -> 'b -> THM) -> 'a -> 'b -> THM;
val ⦏merge_pcs_rule1⦎ : string list -> ('a -> 'b -> THM) -> 'a -> 'b -> THM;
=DESCRIBE
=INLINEFT
pc_rule context rule arg1 arg2
=TEX
{} will apply rule $rule$ $arg1$ to $arg2$ in the proof context with key $context$,
using the named context as it is at the point of applying the rule to argument $arg2$.
This is done via pushing and popping on the proof context stack.

$merge\_pcs\_rule1$ takes a list of proof contexts instead, merged
as if by, e.g. $push\_merge\_pcs$.
=SEEALSO
$pc\_rule$
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the errors of the rule.
The previous proof context is restored, even if the rule fails.
=ENDDOC
=DOC
val ⦏extend_pc_rule1⦎ : string -> ('a -> 'b -> THM) -> 'a -> 'b -> THM;
val ⦏extend_pcs_rule1⦎ : string list -> ('a -> 'b -> THM) -> 'a -> 'b -> THM;
=DESCRIBE
=INLINEFT
extend_pc_rule1 context rule arg1 arg2
=TEX
{} will apply rule $rule$ $arg1$ to $arg2$ in the proof context obtained by merging the proof context with key $context$ into the current proof context.
The named context is used as it is at the point of applying the rule to the argument.
The $pr\_tac$, $pr\_conv$ and $mpp\_rule$ fields are taken from the named proof context.
This is done via pushing and popping on the proof context stack.

$extend\_pcs\_rule1$ takes a list of proof contexts instead, merged
as if by, e.g. $push\_extend\_pcs$.
=SEEALSO
$pc\_rule$
=FAILURE
51010	There is no proof context with key ?0
51014	Proof context ?0 was created in theory ?1 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the errors of the rule.
The previous proof context is restored, even if the rule fails.
=ENDDOC
=DOC
val ⦏asm_prove_tac⦎ : THM list -> TACTIC;
=DESCRIBE
This tactic is an automatic proof procedure appropriate to the
current proof context.

At the point of applying this tactic to its theorems it will
access the current setting of proof context field $pr\_tac$,
apply it to the theorem list immediately, and then to the goal when available
(i.e. the result is partially evaluated with only the list of theorems).
=FRULE 2 Tactic
asm_prove_tac
thms
├
{ Γ } t
├
current_ad_pr_tac () thms ({ Γ }, t)
=TEX
=SEEALSO
$PC\_T1$ to defer accessing the proof context until application to the goal;
$prove\_tac$ for the form that does not react to the presence of assumptions.
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the proof context setting.
=ENDDOC
=DOC
val ⦏prove_conv⦎ : THM list -> CONV;
=DESCRIBE
This conversion is an automatic proof procedure appropriate to the
current proof context.

At the point of applying this conversion to its theorems it will
access the current setting of proof context field $pr\_conv$,
applying the result to the theorem list immediately, and then to the term when available
(i.e. the result is partially evaluated with only the list of theorems).
=FRULE 1 Conversion
prove_conv
thms ⌜t⌝
├
├
current_ad_pr_conv () thms ⌜t⌝
=TEX
=SEEALSO
$PC\_C1$ to defer accessing the proof context until application to the term.
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the proof context setting.
=ENDDOC
=DOC
val ⦏prove_rule⦎ : THM list -> TERM -> THM;
=DESCRIBE
This rule is an automatic proof procedure appropriate to the
current proof context.

At the point of applying this rule to its theorem list it will
access the current setting of proof context field $pr\_conv$,
apply it to the theorem list immediately, and then to the term when available
(i.e. the result is partially evaluated with only the list of theorems),
and then, if the resulting theorem is $`⊢ term'\ ⇔\ T`$
(with no assumptions) where $term$ is $α$-convertible to $term'$, then
apply $⇔\_t\_elim$, and otherwise fail.
=FRULE 1 Rule
prove_rule
thms ⌜tm⌝
├
├
⊢ tm
=TEX
=SEEALSO
$pc\_rule1$ to defer accessing the proof context until application to the term.
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
51022	Result of applying conversion to ?0, which was ?1,
	not of form: `⊢ input ⇔ T`
=FAILUREC
and as the proof context setting.
=ENDDOC
=DOC
val ⦏asm_prove_∃_tac⦎ : TACTIC;
=DESCRIBE
This tactic is an automatic proof procedure for existential proofs,
appropriate to the current proof context.

At the point of applying this tactic to a goal it will
access the current setting of proof context field $prove\_∃$,
apply it to the goal using $conv\_tac$.
=FRULE 2 Tactic
asm_prove_∃_tac
thms
├
{ Γ } t
├
conv_tac (current_ad_cs_∃_conv ())
	 ({ Γ }, t)
=TEX
=SEEALSO
$prove\_∃\_tac$ that does not react to any assumptions that
are present.
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the proof context setting.
=ENDDOC
=DOC
val ⦏prove_∃_conv⦎ : CONV;
=DESCRIBE
This conversion is an automatic proof procedure for existential proofs,
appropriate to the current proof context.

At the point of applying this conversion to a term it will
access the current setting of proof context field $cs\_∃\_conv$,
apply it to the theorem list, and then to the term.

The resulting theorem is not checked as having its L.H.S.
being the input term.
=FRULE 1 Conversion
prove_∃_conv
⌜t⌝
├
├
current_ad_cs_∃_conv () ⌜t⌝
=TEX
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
=FAILUREC
and as the proof context setting.
=ENDDOC
=DOC
val ⦏prove_∃_rule⦎ : TERM -> THM;
=DESCRIBE
This rule is an automatic proof procedure for existential proofs,
appropriate to the current proof context.

At the point of applying this rule to a term $term$ it will
access the current setting of proof context field $cs\_∃\_conv$,
apply it to the term,
and then, if the resulting theorem is $`⊢ term'\ ⇔\ T`$
(with no assumptions) where $term$ is $α$-convertible to $term'$, then
apply $⇔\_t\_elim$, and otherwise fail.
=FRULE 1 Rule
prove_∃_rule
⌜tm⌝
├
├
⊢ tm
=TEX
=FAILURE
51021	The current proof context was created in theory ?0 at a
	point now either not in scope, deleted or modified
51022	Result of applying conversion to ?0, which was ?1,
	not of form: `⊢ input ⇔ T`
=FAILUREC
and as the proof context setting.
=ENDDOC
\subsection{Pruning the Theory Hierarchy}
=DOC
val ⦏force_delete_theory⦎ : string -> unit;
=DESCRIBE
$force\_delete\_theory$ $thy$ attempts to delete theory $thy$
and all its descendants.
If $thy$ is in scope, then the function will change
the current theory to the first theory that it can in the list returned by
=INLINEFT
get_parents thy;
=TEX
{} (there may be none, in which case the function fails).
It will then determine whether $thy$ and its descendants
can all be deleted: in particular it checks that none of them are
locked (see $lock\_theory$)
or are a read-only ancestor.

The function indicates:
\begin{itemize}
\item
whether the current theory has been deleted, and if so
states the new current theory,
\item
the list of theories that have been deleted
(unless this is just the requested theory, and is also not the current theory).
\end{itemize}

Further, all proof contexts created in now deleted theories
will also be deleted
(but the current proof context will remain unchanged).
=FAILURE
51002	Cannot open any of the parent theories, ?0, of the named theory, ?1
51003	Will not be able to delete theories ?0, so no deletions made
51004	Unexpectedly unable to delete any of ?0
51006	Cannot open the parent theory, ?0, of the named theory, ?1
51007	Will not be able to delete theory ?0, so no deletions made
51008	Named theory, ?0, has no parents
=FAILUREC
Error 51004 will be raised by $error$ rather than $fail$,
as it shouldn't happen.
=ENDDOC
The following provide diagnostic output for the above:
=FAILURE
51009	This has deleted ?0.
	This includes deleting the current theory, ?1,
	making ?2 the current theory.
51013	This has deleted ?0
=TEX
\section{END OF THE SIGNATURE}
=SML
end; (* signature of ProofContext *)
=TEX
\section{TEST POLICY}
The functions in this document should be tested as described in
\cite{DS/FMU/IED/PLN008}.
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



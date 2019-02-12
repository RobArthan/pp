=IGN
********************************************************************************
imp008.doc: this file is part of the PPHol system

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

\def\Title{Release 1 ICL HOL: Implementation for Nets}

\def\AbstractText{This document gives a detailed design for the net tools in ICL HOL. These allow the rapid selection of a subset of values, based on a term's form.}

\def\Reference{DS/FMU/IED/DTD008}

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
%% LaTeX2e port: \TPPtitle{Release 1 ICL HOL: Implementation for Nets}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Release 1 ICL HOL \cr Implementation for Nets}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD008}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.10 $
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2002/10/17 16:20:01 $ %
%% LaTeX2e port: }}  %% Mandatory field
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: \TPPauthor{K.~Blackburn & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document gives a detailed design for the net tools in ICL HOL.
%% LaTeX2e port: These allow the rapid selection of a subset of values, based
%% LaTeX2e port: on a term's form.}
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
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
%% LaTeX2e port: \end{centering}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

\setcounter{section}{-1}
\pagebreak
\section{Document Control}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item [Issue 1.1 (1991/03/05)]
First version.
\item [Issue 1.2 (1991/04/16)]
Changed in line with issue 1.9 of \cite{DS/FMU/IED/DTD003}.
\item [Issue 1.3 (1991/06/27)]
Tweaked performance of $follow$.
\item [Issue 1.4 (1991/07/29)]
Changed as result of changes caused by IR0016.
\item [Issue 1.5 (1991/08/15)]
Renamings of functions containing the name atom $simple$,
and renaming of $aconv$.
Changes in response to ID0030.
\item [Issue 1.6 (1991/10/30)]
Renamed various functions in preparation for the structure
to be opened during the system build.
\item [Issue 1.6 (1991/10/30)]
Updates for SML'97.

\item[Issue 1.7, \FormatDate{92/01/20} ] Updated to use new fonts.
\item[Issue 1.8, (1999/02/11)] Updates for SML '97.
\item[Issue 1.9 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.10 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 1.11 (2013/11/24)] Added {\em net\_flatten}.
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
This document contains an implementation of nets.
These are required to implement efficient rewriting, but have
other applications as well.
The design is in \cite{DS/FMU/IED/DTD008}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation for the
net tools in Release 001 of ICL HOL.
These tools are concerned with the rapid choice of
a subset of a set of values based on a term's structure.
They will be used in implementing efficient rewriting utilities,
by selecting various rewriting conversions from an ``equational context'' (see \cite{DS/FMU/IED/DTD028}, based on
the term to which the conversion will be applied.
They will also be applicable anywhere else that efficient choice of functions based on terms is useful.

\subsubsection{Dependencies}
Loading this document is dependent on \cite{DS/FMU/IED/DTD008}.
\subsubsection{Algorithms}
The tools have been derived from the
Cambridge HOL code by reverse engineering. The reference
given there for the algorithm is the book `Artificial Intelligence
Programming' \cite{Charniak87}.

\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
The entry in a $MkNet$'s list for $TCvar$ is always going to be looked for it the list is looked at all.
This suggests either a merged search, or a specific ``slot'' for
its value, if present.

The ordering of values given by $net\_lookup$ has only one specified constraint, upon values with the same index term.
Additional specified ordering could be gained by extra processing, should that be required.
\section{THE NET TOOLS}
=SML
structure ⦏NetTools⦎ : NetTools = struct
=TEX
The algorithms below exploit the permission to err by
ignoring types and variable structure. If one
does this a term corresponds to a rather simple tree
in which all internal nodes have either one or two
children (corresponding to abstractions and combinations
respectively). We may think of these trees as having
nodes labelled by values of the following type $TERM\_CLASS$.
=SML
datatype ⦏TERM_CLASS⦎ = ⦏TCvar⦎ | ⦏TCconst⦎ of string | ⦏TCapp⦎ | ⦏TCsimpleλ⦎;
=TEX
The function $classify$ gives the $TERM\_CLASS$
corresponding to a destroyed term.
=SML
fun ⦏classify⦎ ((App _): DEST_SIMPLE_TERM) : TERM_CLASS = TCapp
| classify (Const (n,t)) = TCconst n
| classify (Var _) = TCvar
| classify (Simpleλ _) = TCsimpleλ;
=TEX
Nets will have the following type.  A net is an $n$-ary
tree with edges labelled by values of type
$TERM\_CLASS$ and with leaves (tips) labelled with lists
of values of type $'a$. We will arrange things so that
for each internal node the labels on the edges leading
from that node are pairwise distinct (i.e. thinking
of this type as a disjoint union, the first summand
can be thought of as a partial function from $TERM\_CLASS$
to $'a\,NET$).
=SML
datatype 'a ⦏NET⦎ = ⦏MkNet⦎ of (TERM_CLASS * 'a NET) list |
	⦏MkTip⦎ of ('a list);
=SML
=TEX
We take as the empty net the tree with an internal node
and no edges (rather than the tree with one tip labelled
with an empty list).
=SML
val ⦏empty_net⦎ : 'a NET = MkNet [];
=TEX
Given an edge label and an internal node of a net
$get\_edge$ returns the subtree hanging from the edge
with that label. There will be at most one such edge
given the above remarks on our use of the net data type.
If there is no such edge the empty net is returned.
The function should never be applied to a tip of a net.
=SML
fun ⦏get_edge⦎ class (MkNet clnets) = (
	case lassoc5 clnets class of
		Value net => net
	|	Nil => empty_net
) | get_edge _ (MkTip _) = error "NetTools" 8001 [];
=TEX
Given a leaf, $get\_tips$ returns its label,
given an internal node it returns empty.
In the use of this function in $update$ below,
the latter situation arises when the first entry
with a particular index term is made, the former
if subsequent entries with that same index (modulo
types and variable structure) are made.
=SML
fun ⦏get_tips⦎ (MkTip tips) = tips
|   get_tips (MkNet _) = [];
=TEX
Given a term and a net, the function
$follow$ below returns a list
of nets. The concatenation of the labels of the tips
in this list is the list of entries in the net with
index terms which match the given term.

To understand the algorithm it may be helpful to
invent some terminology. Let us say that the {\em primary
list} of a term is the list of values of type
$TERM\_CLASS$ we encounter by recursively applying
$classify$ to the sub-terms of the term ignoring
the operators of combinations. Let us say that the
{\em secondary list} is the list of terms which we
ignored when we constructed the primary list taken
in the reverse of the order in which we encountered them.
Thus, for example, ``$λx⦁f(g\,x)$'' has primary list
$[TCsimpleλ$, $TCapp$, $TCapp$, $TCvar]$ and secondary list
$[$``$g$'', ``$f$''].

In essence,
the idea is that $follow$ steers a path through
the net guided by the primary list of the term and
finds a new net at the end of this path.
If the secondary list is empty, then the tips of
the new net are the values we want.
If not then the process is repeated, essentially
using the first element of the secondary list and the
new net as arguments for a recursive call of $follow$
to produce another net to be used as an argument to
another recursive call of $follow$  together with
the second element of the secondary list, if any.

The actual coding of $follow$ is more straightforward,
or at least shorter,
than the above description might suggest.
Since we are looking for entries whose indexing terms
match the argument up to variable instantiation,
$follow$ actually returns a list of nets.
We also use $dest\_simple\_term$ to directly classify terms and get the
sub-components of interest, rather than using $classify$.

By our positioning of $varnet$ we will return values matching structures befores values matching variables at any particular level.
This is not noted in the specification of nets, as the precise rules for ordering are not simple, and it seems inappropriate to rely on them.
This way round pays a small extra cost over matching variables first, and then structures, and could be reversed.

The following could be perhaps speeded up by merging the search for $TCvar$ and the actual term structure constructor.
=SML
fun ⦏is_empty⦎ ((MkNet []):'a NET) : bool = true
|   is_empty _ = false;
local
	fun flat_map f (a :: x) bs = f a @ flat_map f x bs
	| flat_map f [] bs = [bs];
in
fun ⦏follow⦎ (tm: TERM) (net: 'a NET) : ('a NET) list = (
	let	val varnet = get_edge TCvar net;
		val othernets = (
		case (dest_simple_term tm) of
			Var _ => [varnet]
		|	Const(n, _) => [get_edge (TCconst n) net, varnet]
		|	Simpleλ(_, body) => (
			follow body (get_edge TCsimpleλ net) @ [varnet]
		) |	App(rand, rator) => (
			flat_map (follow rand) (follow rator (get_edge TCapp net)) varnet
			));
	in	othernets drop is_empty
	end
);
end;
=TEX
=IGN
The following gives an alternative to the above, which gives
variable matches first:
fun ⦏follow⦎ (tm: TERM) (net: 'a NET) : ('a NET) list = (
	let	val varnet = get_edge TCvar net;
		val othernets = (
		case (dest_simple_term tm) of
			Var _ => nil
		|	Const(n, _) => [get_edge (TCconst n) net]
		|	Simpleλ(_, body) => follow body (get_edge TCsimpleλ net)
		|	App(rand, rator) => flat(map(follow rand)(follow rator (get_edge TCapp net)))
			);
	in	(varnet :: othernets) drop is_empty
	end
);
=TEX
The remaining problem is that of constructing nets in
such a way that $follow$ will have the desired effect.
The function $update$ is used to add an entry to a net.
Its algorithm is perhaps best understood by considering
the ideas of the primary and secondary lists of a term
discussed above. The parameter $deferred$ of update
is used to remember successive entries of the secondary
list as combinations are encountered, during a process which
can be thought of as setting up a net which can be used
to map the primary list of a term to a net which can be
used to map the secondary list of the term to the desired
value ($elem:\ 'a$). The latter net is built by the recursive
call of $update$ in $exec\_deferred$ made when the end of
the primary list has been encountered.

Note that given our representation for an empty net
$update$ is never required to make an entry in a net
of the form $MkTip\,X$.

By the first clause of $exec\_deferred$ the value associated with last entered instance of a pattern will be returned first.
This is according to specification.
=SML
fun ⦏update⦎ (elem:'a) (deferred: TERM list) (tm: TERM)
		((net as (MkNet clnets)):'a NET) : 'a NET= (
	let
		fun exec_deferred deferred net = (
			case deferred of
				[] => MkTip(elem :: get_tips net)
			|	(h :: t) => (update elem t h net)
		);
	val dtm = dest_simple_term tm;
	val class = classify dtm;
	val child = get_edge class net;
	val newchild = (
		case dtm of
			Var _ => exec_deferred deferred child
		|	Const _ => exec_deferred deferred child
		|	App(rand, rator) => update elem (rand :: deferred) rator child
		|	Simpleλ (_, body) => update elem deferred body child)
	in	MkNet(clnets overwrite (class, newchild))
	end
) | update _ _ _ (MkTip _) = error "NetTools" 8002 [];
=TEX
The remaining external interfaces to this structure are now
easily defined in terms of $follow$ and $update$.

$net\_enter$ simply applies $update$ with the an empty second
argument.
=SML
fun ⦏net_enter⦎ ((tm, elem): TERM * 'a) (net: 'a NET) : 'a NET = update elem [] tm net;
=TEX
Two obvious derivatives of $net\_enter$:
=SML
fun ⦏list_net_enter⦎ (tas : (TERM * 'a) list): 'a NET -> 'a NET = fold (uncurry net_enter) tas;
fun make_net (ta : (TERM * 'a) list) : 'a NET = (
	fold (uncurry net_enter) ta empty_net
);
=TEX
$net\_lookup$ applies $follow$ then concatenates the labels
on any tips (got by $get\_tips$) which appear in the resulting list of nets.
=SML
fun ⦏net_lookup⦎ (net: 'a NET) (tm: TERM) : 'a list = (
	flat(map get_tips (follow tm net))
);
=TEX
=SML
fun ⦏net_flatten⦎ (net : 'a NET) : 'a list = (
	let	fun aux acc (MkTip elems) = flat (elems::acc)
		|   aux acc (MkNet clnets) = flat (map (aux acc o snd) clnets);
	in	aux [] net
	end
);
=TEX
\section{END OF THE STRUCTURE}
=SML
end; (* structure of NetTools *)
open NetTools;
=TEX
\section{TEST POLICY}
The functions in this document should be tested as described in
\cite{DS/FMU/IED/PLN008}.

\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}




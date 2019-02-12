=IGN
********************************************************************************
imp074.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
%  $Id: imp074.doc,v 1.8 2002/10/17 15:10:58 rda Exp rda $ ℤ
=TEX
%%%%% YOU MAY WANT TO CHANGE POINT SIZE IN THE FOLLOWING:
\documentclass[a4paper,11pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\makeindex

%%%%% YOU WILL WANT TO CHANGE THE FOLLOWING TO SUIT YOU AND YOUR DOCUMENT:

\def\Title{ Implementation for the Theory of Sequences }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document creates the theory ``seq''.}
\end{center}}

\def\Reference{DS/FMU/IED/IMP074}

\def\Author{R.B.Jones}

\def\EMail{{\tt rbj@rbjones.com}}

\def\Phone{Via +44 7947 030 682}


%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge \Title } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}
\begin{centering}



\end{centering}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{\VCVersion}
\def\Date{\FormatDate{\VCDate}}

%%%%% NOW BEGIN THE DOCUMENT AND MAKE THE FRONT PAGE

%% LaTeX2e PORT \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e PORT \ftlinepenalty=9999
%% LaTeX2e PORT \makeindex
%% LaTeX2e PORT \TPPproject{FST PROJECT}  %% Mandatory field
%% LaTeX2e PORT \TPPtitle{Implementation for the Theory of Sequences}  %% Mandatory field
%% LaTeX2e PORT \def\TPPheadtitle{Implementation for the Theory \cr
%% LaTeX2e PORT of Sequences}
%% LaTeX2e PORT \TPPref{DS/FMU/IED/IMP074}  %% Mandatory field
%% LaTeX2e PORT \def\SCCSversion{$Revision: 1.8 $
%% LaTeX2e PORT }
%% LaTeX2e PORT \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e PORT \TPPdate{\FormatDate{$Date: 2002/10/17 15:10:58 $ %
%% LaTeX2e PORT }}  %% Mandatory field
%% LaTeX2e PORT \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e PORT \TPPtype{SML Literate Script}
%% LaTeX2e PORT \TPPkeywords{}
%% LaTeX2e PORT \TPPauthor{R.B.Jones & WIN01}  %% Mandatory field
%% LaTeX2e PORT %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e PORT \TPPauthorisation{R.D.Arthan & FST Team Leader}
%% LaTeX2e PORT \TPPabstract{This document creates the theory ``seq''.}
%% LaTeX2e PORT \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e PORT 	    Project Library
%% LaTeX2e PORT }}
%% LaTeX2e PORT %\TPPclass{CLASSIFICATION}
%% LaTeX2e PORT %\def\TPPheadlhs{}
%% LaTeX2e PORT %\def\TPPheadcentre{}
%% LaTeX2e PORT %def\TPPheadrhs{}
%% LaTeX2e PORT %\def\TPPfootlhs{}
%% LaTeX2e PORT %\def\TPPfootcentre{}
%% LaTeX2e PORT %\def\TPPfootrhs{}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

%% LaTeX2e PORT \makeTPPfrontpage
%% LaTeX2e PORT \vfill
%% LaTeX2e PORT \begin{centering}
%% LaTeX2e PORT 
%% LaTeX2e PORT \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
%% LaTeX2e PORT 
%% LaTeX2e PORT \end{centering}
%% LaTeX2e PORT \pagebreak

\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item[Issues 1.1 (1992/05/11)--1.6 (1992/06/17)]

Initial drafts.

\item[Issue 1.7 (2002/10/16)]

Fixed {\LaTeX} errors.

\item[Issue 1.8 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.9 (2002/10/17)] PPHol-specific updates for open source release
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}

\section{GENERAL}
\subsection{Scope}
This document contains an implementation of the theory of finite sets similar to that presented in section 4.5. of \cite{spivey88}.
The design is in \cite{DS/FMU/IED/DTD074}.

\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation of the theory of finite sets.
\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD073}.
\subsubsection{Deficiencies}
None known.
\subsubsection{Possible Enhancements}
None known.
\section{THE THEORY ``seq''}
=SML
structure ⦏SeqTheory⦎ : SeqTheory = struct
val _ = open_theory "seq";
val _ = push_pc "hol";
=SML
val ⦏elems_def⦎ = get_defn"-""Elems";
val ⦏distinct_def⦎ = get_defn"-""Distinct";
val ⦏lists_def⦎ =  get_defn"-""Lists";
val ⦏lists⋎1_def⦎ =  get_defn"-""Lists⋎1";
val ⦏inj_lists_def⦎ =  get_defn"-""InjLists";
val ⦏nth_def⦎ =  get_defn"-""Nth";
val ⦏dot_dot_def⦎ =  get_defn"-""..";
val ⦏list_rel_def⦎ =  get_defn"-""ListRel";
val ⦏rel_list_def⦎ =  get_defn"-""RelList";
val ⦏⁀_def⦎ = append_def;
val ⦏head_def⦎ = hd_def;
val ⦏last_def⦎ =  get_defn"-""Last";
val ⦏front_def⦎ =  get_defn"-""Front";
val ⦏↾_def⦎ = get_defn"-""↾";
val ⦏tail_def⦎ = tl_def;
val ⦏enumerate_def⦎ = get_defn"-""Enumerate";
val ⦏squash_def⦎ = get_defn"-""Squash";
val ⦏extract_def⦎ = get_defn"-""Extract";
val ⦏prefix_def⦎ = get_defn"-""Prefix";
val ⦏suffix_def⦎ = get_defn"-""Suffix";
val ⦏in_def⦎ = get_defn"-""In";
val ⦏flat_def⦎ = get_defn"-""Flat";
=TEX
See \cite{spivey89} section 4.5.
\subsection{Derived Definitions}
\subsection{End of Theory ``seq''}
\section{CONVERSIONS}
\section{PROOF CONTEXTS}
The extensional context is good for proving results involving the operators introduced in this theory.
=GFT
val pos_bits =
	[(⌜x ∈ $SetComp y⌝, ∈_comp_conv),
	(⌜x ∈ $Insert y z⌝, ∈_enum_set_conv)] @
	(cthm_eqn_cxt initial_rw_canon ∈_in_clauses) @
	(cthm_eqn_cxt initial_rw_canon sets_ext_clauses);
val neg_bits = map (mk_¬ ** RAND_C) pos_bits;
val new_bits = pos_bits @ neg_bits;
val rw_eqn_cxt =
	(⌜x ∈ $SetComp y⌝, ∈_comp_conv) ::
	(⌜x ∈ $Insert y z⌝, ∈_enum_set_conv) ::
	(flat(map (cthm_eqn_cxt initial_rw_canon) [∈_in_clauses,sets_ext_clauses]));
val dummy = (delete_pc "sets_ext" handle ? => ());
val dummy = new_pc "sets_ext";
val dummy = merge_pcs ["pair"] "sets_ext";
val dummy = ((set_st_eqn_cxt new_bits "sets_ext");
		(set_sg_eqn_cxt new_bits "sets_ext");
		(set_rw_eqn_cxt rw_eqn_cxt "sets_ext"));
=TEX
The algebraic context is for more general use where obvious simplifications are required.
=GFT
val pos_bits =
	[(⌜x ∈ $SetComp y⌝, ∈_comp_conv),
	(⌜x ∈ $Insert y z⌝, ∈_enum_set_conv)] @
	(cthm_eqn_cxt initial_rw_canon ∈_in_clauses);
val neg_strips = map (mk_¬ ** RAND_C) pos_bits;
val new_strips = pos_bits @ neg_strips;
val new_rw =
	(⌜x ∈ $SetComp y⌝, ∈_comp_conv) ::
	(⌜x ∈ $Insert y z⌝, ∈_enum_set_conv) ::
	(flat(map (cthm_eqn_cxt initial_rw_canon)
	[complement_clauses, ∪_clauses, ∩_clauses, set_dif_clauses,
	⊆_clauses, ⊂_clauses, ⋃_clauses, ⋂_clauses, ℙ_clauses]));
val dummy = (delete_pc "sets_alg" handle ? => ());
val dummy = new_pc "sets_alg";
val dummy = merge_pcs ["pair"] "sets_alg";
val dummy = ((set_st_eqn_cxt new_strips "sets_alg");
		(set_sg_eqn_cxt new_strips "sets_alg");
		(set_rw_eqn_cxt new_rw "sets_alg"));
=TEX
=GFT
(*
val _ = pop_pc();
val _ = open_theory "sum";
val _ = (new_theory"hol";
		new_parent"one";
		new_parent"sets") handle ? => ();
*)
=SML
end; (* of structure SeqTheory *)
open SeqTheory;
=TEX
\newpage
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}




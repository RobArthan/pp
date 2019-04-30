=IGN
********************************************************************************
imp052.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp052.doc ℤ $Date: 2010/04/01 17:25:13 $ $Revision: 1.31 $ $RCSfile: imp052.doc,v $
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

\def\Title{Implementation of Z Individual Semantic Constants}

\def\AbstractText{This document contains the implementation of the Z primitive constants in the theory ``Z'' of the Z Proof Support Subsystem.}

\def\Reference{DS/FMU/IED/IMP052}

\def\Author{G.M. Prout, D.J. King}


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
%% LaTeX2e port: \TPPtitle{Implementation of Z Individual Semantic Constants}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Implementation of Z Individual Semantic Constants \cr in the Theory ``Z''}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP052}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.31 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2010/04/01 17:25:13 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: %\TPPauthor{G.M.Prout&WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{G.M.~Prout&WIN01\\D.J.~King&WIN01 }
%% LaTeX2e port: \TPPauthorisation{R.B.Jones & Project Manager}
%% LaTeX2e port: \TPPabstract{This document contains the implementation of the Z primitive constants in the theory ``Z'' of the Z Proof Support Subsystem.}
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
\section{DOCUMENT CONTROL}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item [Issue 1.1 (1991/12/09)]
First draft version.
\item [Issue 1.2 (1992/01/30)]
Changes made in step with \cite{DS/FMU/IED/DTD052}.
\item [Issue 1.4 (1992/06/09)]
Changed to new fonts
\item [Issue 1.20 (1992/08/20) (20th August 1992)]
Removed a spurious $end$.
\item [Issue 1.22 (1992/10/15) (12th October 1992)]
Added $⊆$.
\item [Issue 1.23 (1992/10/19) (12th October 1992)]
Corrected $⊆$.
\item [Issue 1.24 (1992/12/03) (3rd December 1992)]
Added $BOOL$.
\item[Issue 1.25 (1992/12/10) (10th December 1992)]
\item[Issue 1.26 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.27 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.28 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.29 (2005/09/06)] Support for let-expressions.
\item[Issue 1.30 (2010/04/01)] BOOL and CHAR are now renamed as 𝔹 and 𝕊.
\item[Issue 1.31 (2010/04/01)] Added $z'empty\_binding\_labelled\_product\_spec$ in support of empty schemas.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
%\subsection{Changes Forecast}
\section{GENERAL}
\subsection{Scope}
This document contains an implementation of the
Z primitive constants in the theory ``Z'' of
the Z Proof Support System (see \cite{DS/FMU/IED/HLD015}).
This is called for in \cite{DS/FMU/IED/HLD017}.
The design is in \cite{DS/FMU/IED/DTD052}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
This document contains an implementation of the
Z primitive constants in the theory ``Z'' of
the Z Proof Support System.
\subsubsection{Dependencies}
This document takes its signature from \cite{DS/FMU/IED/DTD052},
and also requires the theory ``hol''.
\subsubsection{Deficiencies}
None known.
\subsection{Design of the Theory ``Z''}
\section{THE THEORY  ``z\_language''}
=SML
structure ⦏ZLanguage⦎ : ZLanguage = struct

val side = open_theory"z_language";
val side = push_pc"hol";

val ⦏z_totality_def⦎ = get_spec ⌜Totality⌝;
val ⦏z_u_def⦎ = get_spec ⌜$"z'𝕌"⌝;
val ⦏z'schema_dec_def⦎ = get_spec ⌜Z'SchemaDec⌝;
val ⦏z'dec_def⦎ = get_spec ⌜Z'Dec⌝;
val ⦏z'decl_def⦎ = get_spec ⌜Z'Decl⌝;
val ⦏z'ℙ_def⦎ = get_spec ⌜$"Z'ℙ"⌝;
val ⦏z'∀_def⦎ = get_spec ⌜$"Z'∀"⌝;
val ⦏z'∀_body_def⦎ = get_spec ⌜$"Z'∀Body"⌝;
val ⦏z'∃_def⦎ = get_spec ⌜$"Z'∃"⌝;
val ⦏z'∃_body_def⦎ = get_spec ⌜$"Z'∃Body"⌝;
val ⦏z'setd_def⦎ = get_spec ⌜Z'Setd⌝;
val ⦏z'num_list_def⦎ = get_spec ⌜Z'NumList⌝;
val ⦏z'⟨⟩_def⦎ = get_spec ⌜$"Z'⟨⟩"⌝;
val ⦏Z'μ_consistent_thm⦎ = (push_consistency_goal ⌜$"Z'μ"⌝;
	a(∃_tac ⌜λ set ⦁ (ε y ⦁ set = {y})⌝);
	a(strip_tac THEN rewrite_tac[]);
	a(lemma_tac⌜∀ y ⦁ {x}={y}⇔ x=y⌝);
	(* *** Goal "1" *** *)
	a(rewrite_tac[sets_ext_clauses]);
	a(REPEAT strip_tac THEN_LIST [
		POP_ASM_T (accept_tac o eq_sym_rule o (rewrite_rule[]) o (∀_elim⌜y⌝)),
		asm_rewrite_tac[],asm_rewrite_tac[]]);
	(* *** Goal "2" *** *)
	a(POP_ASM_T rewrite_thm_tac);
	a(rewrite_tac[eq_sym_rule (rewrite_rule[](list_∀_elim[⌜λy⦁x=y⌝,⌜x⌝]ε_axiom))]);
	save_consistency_thm ⌜$"Z'μ"⌝ (pop_thm())
	);
val ⦏z'μ_def⦎ = get_spec ⌜$"Z'μ"⌝;
val ⦏z'app_def⦎ = get_spec ⌜Z'App⌝;
val ⦏z'empty_binding_def⦎ = get_spec ⌜$"Z'Mk_S[]"⌝;
val ⦏z'empty_binding_labelled_product_spec⦎ = (
	push_goal ([], ⌜∀ t ⦁ $"Z'Mk_S[]" = t⌝);
	a ∀_tac;
	a (rewrite_tac [z'empty_binding_def]);
	a (strip_asm_tac (
		pure_rewrite_rule [one_def] (
			∀_elim ⌜t : $"Z'S[]"⌝ (∧_right_elim (get_spec ⌜$"Z'Abs_S[]"⌝))
		)
	));
	a (eq_sym_nth_asm_tac 1);
	save_pop_thm "z'empty_binding_labelled_product_spec"
);
val ⦏z'θ_def⦎ = get_spec ⌜$"Z'θ"⌝;
val ⦏z'schema_pred_def⦎ = get_spec ⌜Z'SchemaPred⌝;
val ⦏z'¬⋎s_def⦎ = get_spec ⌜$"Z'¬⋎s"⌝;
val ⦏z_char_def⦎ = get_spec ⌜$"z'𝕊"⌝;
val ⦏z_bool_def⦎ = get_spec ⌜$"z'𝔹"⌝;
val ⦏z'string_def⦎ = get_spec ⌜$"Z'String"⌝;
val ⦏z'let_def⦎ = get_spec ⌜$"Z'Let"⌝;
val ⦏z'abb_def_def⦎ = get_spec ⌜$"Z'AbbDef"⌝;
val ⦏z'sch_box_def⦎ = get_spec ⌜$"Z'SchBox"⌝;
val ⦏z'ax_des_def⦎ = get_spec ⌜$"Z'AxDes"⌝;
val ⦏z'given_set_def⦎ = get_spec ⌜$"Z'GivenSet"⌝;
val ⦏z'free_type_def_def⦎ = get_spec ⌜$"Z'FreeTypeDef"⌝;
val ⦏z'constraint_def⦎ = get_spec ⌜$"Z'Constraint"⌝;
val _ = (push_consistency_goal ⌜$"z'_ ⊆ _"⌝;
	a(∃_tac ⌜λ xx ⦁ {st|$"Z'T[2]1" st ∈ ℙ ($"Z'T[1]1" xx) ∧
		$"Z'T[2]2" st ∈ ℙ ($"Z'T[1]1" xx) ∧
		∀ x⦁ x ∈ $"Z'T[1]1" xx ⇒ x ∈ $"Z'T[2]1" st ⇒ x ∈ $"Z'T[2]2" st}⌝);
	a(rewrite_tac[get_spec ⌜$"Z'T[1]1"⌝]);
	save_consistency_thm ⌜$"z'_ ⊆ _"⌝ (pop_thm()));

val ⦏z_⊆_def⦎ = get_spec ⌜$"z'_ ⊆ _"⌝;

val side = pop_pc();
=TEX

\section{END OF THEORY ``Z''}
=SML
end; (* of structure ZLanguage *)
open ZLanguage;
=TEX
\newpage
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



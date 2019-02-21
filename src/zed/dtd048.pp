=IGN
********************************************************************************
dtd048.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% dtd048.doc ℤ $Date: 2006/01/25 17:19:11 $ $Revision: 1.26 $ $RCSfile: dtd048.doc,v $
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

\def\Title{Detailed Design for Support for Z Types and Terms}

\def\AbstractText{}

\def\Reference{DS/FMU/IED/DTD048}

\def\Author{G.T. Scullard, D.J.King}


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
%% LaTeX2e port: \TPPproject{FST Project}  %% Mandatory field
%% LaTeX2e port: %\TPPvolume{}
%% LaTeX2e port: %\TPPpart{}
%% LaTeX2e port: \TPPtitle{Detailed Design for Support for Z Types and Terms}  %% Mandatory field
%% LaTeX2e port: \def\TPPheadtitle{Detailed Design for Support for Z Types and Terms}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD048}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.26 $ %
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2006/01/25 17:19:11 $ %
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{}
%% LaTeX2e port: %\TPPauthor{G.T.Scullard & MAN05}  %% Mandatory field
%% LaTeX2e port: \TPPauthors{G.T.Scullard & MAN05\\D.J.King&WIN01}
%% LaTeX2e port: \TPPauthorisation{R.B.Jones & Project Manager}
%% LaTeX2e port: \TPPabstract{}
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
\section{Document Control}
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}
\item [Issue 1.1 (1991/09/10) to 1.12 (1992/07/16)]
First draft versions.
\item [Issue 1.13 (1992/07/17),1.14 (1992/07/29) (July 16th 1992)]
Added support for schema renaming.
\item [Issue 1.16 (1992/07/31) (31st July 1992)]
Removed all the text cribbed from \cite{DS/FMU/IED/ZED002} and
added many functions which should have been in the signature.
\item[Issue 1.18 (1992/12/10)  (10th December 1992)]
Global rename from wrk038.doc issue 1.9.
\item[Issue 1.19 (1995/11/16),1.20 (1995/11/17)]
Added $z\_sig\_order$.
\item[Issue 1.21 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.22 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.23 (2005/09/08)] Added error message for {\em unbind\_gvar\_name}.
\item[Issue 1.24 (2006/01/12)] {\em unpack\_ident} redesigned so that only trailing decoration counts and to drop the check on the first part of the name (which is faster and nicer if the user is using non-standard identifiers with embedded decoration characters).
\item[Issue 1.25 (2006/01/25)] Now support decoration on fancyfix identifiers.
\item[Issue 1.26 (2006/01/25)] The name of the decoration operator is now based on the stem {\em decor} throughout, rather than {\em decor} in some places and {\em dec} in others.
\item[Issue 1.27 (2010/04/01)] Added error message for {\em bind\_ptype}.
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
This document provides a detailed design for a set of support functions for the construction of HOL representations of Z types and terms.
The functions defined here are intended for use in \cite{DS/FMU/IED/DTD047}, the user accessible type and term constructors.
This document is called for in \cite{DS/FMU/IED/HLD017}; the corresponding implementation document is \cite{DS/FMU/IED/IMP048}.
\subsection{Introduction}
\subsubsection{Purpose and Background}
\subsubsection{Dependencies}
The functions in this document are dependent on the Release 1 HOL System.
\subsubsection{Deficiencies}
\section{ERROR REPORTING}
For performance reasons, the arguments of the various constructors below are not checked for well-formedness or suitability and
it will therefore be possible, indeed easy, to construct terms which are not legal in our extended Z syntax.
Such terms will be identified by the pretty printer \cite{DS/FMU/IED/DTD064} and will normally, though not necessarily, be errors.
Of course, where the term construction fails due to some error detected in the underlying HOL or ML, it is intercepted and reported as helpfully as possible.
\section{INFIX DIRECTIVES}
A Standard ML $infix$ command must be given at the `top level'.
Thus we give the commands here for those functions declared in the following signatures.
=SML
=TEX
\section{SIGNATURE}
=DOC
signature ⦏ZTypesAndTermsSupport⦎ = sig
=DESCRIBE
The Z Abstract Machine support functions are packaged into this signature.
=ENDDOC

\subsubsection{Packing and Unpacking Functions}

=DOC
val ⦏unpack_ident⦎ : string -> (string * string);
val ⦏pack_ident⦎ : string * string -> string;
=DESCRIBE
$unpack\_ident$ splits a string representing an IDENT into its WORD and DECOR parts.
It takes the DECOR part of a string to be the longest trailing substring consisting of decoration characters.
The IDENT part of the name may contain embedded decoration characters.

$pack\_ident$ is simply string concatenation.

=ENDDOC

=DOC
val ⦏mem'⦎ : (string * TYPE) * (string * TYPE) list -> bool
val ⦏drop'⦎ : (string * TYPE) list * (string * TYPE -> bool) ->
(string * TYPE) list
val ⦏grab'⦎ : (string * TYPE) list * (string * TYPE) -> (string * TYPE) list
val ⦏cup'⦎ : (string * TYPE) list * (string * TYPE) list ->
(string * TYPE) list
val ⦏diff'⦎ : (string * TYPE) list * (string * TYPE) list ->
(string * TYPE) list
=DESCRIBE
=FAILURE
=ENDDOC
=DOC
val ⦏z_sig_order⦎ : string -> string -> int
=DESCRIBE
$z\_sig\_order$ defines the order to be used when the signature variables of a Z binding or schema are sorted into canonical order (using $Sort.sort$, q.v.).
It has the property that decorating the signature variables does not change their order.
=ENDDOC

=DOC
val ⦏idsetseq⦎ : string list -> string list
val ⦏flatpack⦎ : string list -> string
=DESCRIBE
=ENDDOC


=DOC
val ⦏val_set_ident⦎ : string list -> string
val ⦏itymfunseq⦎ : (string * TYPE)list -> TYPE list
=DESCRIBE
=ENDDOC

=DOC
val ⦏number⦎ : int -> string
val ⦏val_numeral⦎ : string -> int
=DESCRIBE
=ENDDOC

=DOC
val ⦏split_on_bar⦎ :string -> string * string
=DESCRIBE
=ENDDOC

\subsection{Bindings and Tuples}

\subsubsection{Binding Types}

=DOC
val ⦏bind_tname⦎ : string list -> string
val ⦏bind_type⦎ : (string * TYPE) list -> TYPE
=DESCRIBE
Makes a Z binding type from the supplied component to type map.
=EXAMPLE
bind_type [("a",tya),("b",tyb)] = ⓣ(tya,tyb)Z'S[a,b]⌝
=ENDDOC

\subsubsection{Tuple Types}

=DOC
val ⦏tuple_tname⦎ : TYPE list -> string
val ⦏tuple_type⦎ : TYPE list -> TYPE
=DESCRIBE
Makes a Z tuple type from the supplied type list.
=EXAMPLE
tuple_type [tya,tyb] = ⌜:(tya,tyb)Z'T[2]⌝
=ENDDOC

\subsubsection{Binding Constructors}

=DOC
val ⦏bind_cname⦎ : string list -> string
val ⦏bind_ctype⦎ : (string * TYPE) list -> TYPE
val ⦏bind_cterm⦎ : (string * TYPE) list -> TERM
=DESCRIBE
Makes a Z binding constructor from the supplied component to type map.
=EXAMPLE
bind_cterm [("a",tya),("b",tyb)] = ⌜Z'Mk_S[a,b] : tya → tyb → (tya,tyb)Z'S[a,b]⌝
=ENDDOC

\subsubsection{Tuple Constructors}

=DOC
val ⦏tuple_cname⦎ : TYPE list -> string
val ⦏tuple_ctype⦎ : TYPE list -> TYPE
val ⦏tuple_cterm⦎ : TYPE list -> TERM
=DESCRIBE
Makes a Z tuple constructor from the supplied type list.
=EXAMPLE
tuple_cterm [tya,tyb] = ⌜Z'Mk_T[2] : tya → tyb → (tya,tyb)Z'T[2]⌝
=ENDDOC

\subsubsection{Binding Projections}

=DOC
val ⦏bind_pname⦎ : string list -> string -> string
val ⦏bind_ptype⦎ : (string * TYPE) list -> string -> TYPE
val ⦏bind_pterm⦎ : (string * TYPE) list -> string -> TERM
=DESCRIBE
Makes a Z binding projection function for the supplied component to type map; the component to be projected is supplied as the second argument.
=EXAMPLE
bind_pterm [("a",tya),("b",tyb)] "a" = ⌜Z'S[a,b]a : (tya,tyb)Z'S[a,b] → tya⌝
=FAILURE
48004	Binding selector must be the name of a component in the binding
=ENDDOC

\subsubsection{Tuple Projections}
=DOC
val ⦏tuple_pname⦎ : TYPE list -> int -> string
val ⦏tuple_ptype⦎ : TYPE list -> int -> TYPE
val ⦏tuple_pterm⦎ : TYPE list -> int -> TERM
=DESCRIBE
Makes a Z tuple projection function for the supplied
list of types; the component to be projected is supplied
as the second argument.
=EXAMPLE
tuple_pterm [tya,tyb] 1 = ⌜Z'S[2]1 : (tya,tyb)Z'T[2] → tya⌝
=FAILURE
48003	Tuple selector must be within the arity of the tuple
=ENDDOC

\subsection{Schemas}

\subsubsection{Schema Types}

=DOC
val ⦏schema_type⦎ : (string * TYPE) list -> TYPE
=DESCRIBE
Makes a Z schema type from the supplied component to type map.
=EXAMPLE
schema_type [("a",tya),("b",tyb)] = ⌜:((tya,tyb)Z'S[a,b])SET⌝
=ENDDOC

\subsubsection{Schema Negation}

=DOC
val ⦏bind_¬_type⦎ : (string * TYPE) list -> TYPE
val ⦏bind_¬_term⦎ : (string * TYPE) list -> TERM
=DESCRIBE
Makes the Z schema negation constructor from the supplied component to type map.
=EXAMPLE
bind_¬_term [("a",tya),("b",tyb)] = ⌜Z'¬⋎s : ((tya,tyb)Z'S[a,b])SET
					→ ((tya,tyb)Z'S[a,b])SET⌝
=ENDDOC

\subsubsection{Schema Precondition}

=DOC
val ⦏bind_pre_name⦎ : string list -> string
val ⦏bind_pre_type⦎ : (string * TYPE) list -> TYPE
val ⦏bind_pre_term⦎ : (string * TYPE) list -> TERM
=DESCRIBE
Makes the Z schema precondition constructor from the supplied component to type map.
=EXAMPLE
bind_pre_term [("a'",tya),("b",tyb)] = ⌜Z'Pre⋎s[a',b] : ((tya,tyb)Z'S[a',b])SET
					→ ((tyb)Z'S[b])SET⌝
=ENDDOC

\subsubsection{Simple Dyadic Schema Operations}

=DOC
val ⦏bind_dysc_name⦎ : string -> string list -> string list -> string
val ⦏bind_dysc_type⦎ : (string * TYPE) list -> (string * TYPE) list -> TYPE
val ⦏bind_dysc_term⦎ : string -> (string * TYPE) list -> (string * TYPE) list
				-> TERM
=DESCRIBE
=ENDDOC


=DOC
val ⦏bind_∧_term⦎ : (string * TYPE) list -> (string * TYPE) list -> TERM;
=DESCRIBE
Makes the Z schema conjunction constructor from the supplied component to type maps.
=EXAMPLE
bind_∧_term [("a",tya),("b",tyb)] [("b",tyb),("c",tyc)] =
	⌜Z'∧⋎s[a,b][b,c] : (((tya, tyb)Z'S[a,b])SET → ((tyb, tyc)Z'S[b,c])SET
					→ ((tya, tyb, tyc)Z'S[a,b,c])SET)⌝
=ENDDOC

=DOC
val ⦏bind_∨_term⦎ : (string * TYPE) list -> (string * TYPE) list -> TERM;
=DESCRIBE
Makes the Z schema disjunction constructor from the supplied component to type maps.
=EXAMPLE
bind_∨_term [("a",tya),("b",tyb)] [("b",tyb),("c",tyc)] =
	⌜Z'∨⋎s[a,b][b,c] : (((tya, tyb)Z'S[a,b])SET → ((tyb, tyc)Z'S[b,c])SET
					→ ((tya, tyb, tyc)Z'S[a,b,c])SET)⌝
=ENDDOC

=DOC
val ⦏bind_⇒_term⦎ : (string * TYPE) list -> (string * TYPE) list -> TERM;
=DESCRIBE
Makes the Z schema implication constructor from the supplied component to type maps.
=EXAMPLE
bind_⇒_term [("a",tya),("b",tyb)] [("b",tyb),("c",tyc)] =
	⌜Z'⇒⋎s[a,b][b,c] : (((tya, tyb)Z'S[a,b])SET → ((tyb, tyc)Z'S[b,c])SET
					→ ((tya, tyb, tyc)Z'S[a,b,c])SET)⌝
=ENDDOC

=DOC
val ⦏bind_⇔_term⦎ : (string * TYPE) list -> (string * TYPE) list -> TERM;
=DESCRIBE
Makes the Z schema equivalence constructor from the supplied component to type maps.
=EXAMPLE
bind_⇔_term [("a",tya),("b",tyb)] [("b",tyb),("c",tyc)] =
	⌜Z'⇔⋎s[a,b][b,c] : (((tya, tyb)Z'S[a,b])SET → ((tyb, tyc)Z'S[b,c])SET
					→ ((tya, tyb, tyc)Z'S[a,b,c])SET)⌝
=ENDDOC

\subsubsection{Schema Projection}

=DOC
val ⦏bind_↾_name⦎ : string list -> string list -> string
val ⦏bind_↾_type⦎ : (string * TYPE) list -> (string * TYPE) list -> TYPE
val ⦏bind_↾_term⦎ : (string * TYPE) list -> (string * TYPE) list -> TERM
=DESCRIBE
Makes the Z schema projection constructor from the supplied component to type maps.
=EXAMPLE
bind_↾_term [("a",tya),("b",tyb)] [("b",tyb),("c",tyc)] =
	⌜Z'↾⋎s[a,b][b,c] : (((tya, tyb)Z'S[a,b])SET → ((tyb, tyc)Z'S[b,c])SET
					→ ((tyb, tyc)Z'S[b,c])SET)⌝
=ENDDOC

\subsubsection{Schema Hiding}

=DOC
val ⦏bind_hide_name⦎ : string list -> string list -> string
val ⦏bind_hide_type⦎ : (string * TYPE) list -> string list -> TYPE
val ⦏bind_hide_term⦎ : (string * TYPE) list -> string list -> TERM
=DESCRIBE
Makes the Z schema hiding constructor from the supplied component to type map; the components to be hidden are supplied as the second argument.
=EXAMPLE
bind_hide_term [("a",tya),("b",tyb)] ["a"] =
	⌜Z'Hide⋎s[a,b][a] : (((tya, tyb)Z'S[a,b])SET → ((tyb)Z'S[b])SET)⌝
=ENDDOC

\subsubsection{Decoration}

=DOC
val ⦏bind_decor_name⦎ : string list -> string -> string
val ⦏bind_decor_type⦎ : (string * TYPE) list -> string -> TYPE
val ⦏bind_decor_term⦎ : (string * TYPE) list -> string -> TERM
=DESCRIBE
Makes the Z schema systematic decoration constructor from the supplied component to type map; the decoration is supplied as the second argument.
=EXAMPLE
bind_decor_term [("a",tya),("b",tyb)] "'" =
	⌜Z'Decor⋎s[a,b]['] : ((tya, tyb)Z'S[a,b])SET → ((tya, tyb)Z'S[a',b'])SET)⌝
=ENDDOC

\subsubsection{Delta}

=DOC
val ⦏bind_Δ_name⦎ : string list -> string
val ⦏bind_Δ_type⦎ : (string * TYPE) list -> TYPE
val ⦏bind_Δ_term⦎ : (string * TYPE) list -> TERM
=DESCRIBE
=ENDDOC

\subsubsection{Xi}

=DOC
val ⦏bind_Ξ_name⦎ : string list -> string
val ⦏bind_Ξ_type⦎ : (string * TYPE) list -> TYPE
val ⦏bind_Ξ_term⦎ : (string * TYPE) list -> TERM;
=DESCRIBE
=ENDDOC

\subsubsection{Schema Composition}

=DOC
val ⦏bind_⨾_name⦎ : string list -> string list -> string
val ⦏bind_⨾_type⦎ : (string * TYPE) list -> (string * TYPE) list -> TYPE
val ⦏bind_⨾_term⦎ : (string * TYPE) list -> (string * TYPE) list -> TERM
=DESCRIBE
Makes the Z schema composition constructor from the supplied component to type maps.
=EXAMPLE
bind_scomp_term [("a",tya),("b'",tyb)] [("b",tyb),("c'",tyc)] =
	⌜Z'⨾⋎s[a,b'][b,c'] : (((tya, tyb)Z'S[a,b'])SET → ((tyb, tyc)Z'S[b,c'])SET
					→ ((tya, tyc)Z'S[a,c'])SET)⌝
=ENDDOC

\subsubsection{Global Variables}

=DOC
val ⦏bind_gvar_name⦎ : string -> string;
val ⦏bind_gvar_term⦎ : (string * TYPE) -> TERM;
val ⦏unbind_gvar_name⦎ : string -> string;
val ⦏unbind_gvar_term⦎ : TERM -> (string * TYPE);
=DESCRIBE
Construction and destruction of Z global variables names.
=EXAMPLE
bind_gvar_term ("a",tya) = ⌜z'a : tya⌝
=FAILURE
48012	?0 is not a valid Z global variable name
=ENDDOC


\subsubsection{Renaming}

=DOC
val ⦏bind_rename_name⦎ : string list -> (string * string) list -> string
val ⦏bind_rename_type⦎ : (string * TYPE) list -> (string * string) list -> TYPE
val ⦏bind_rename_term⦎ : (string * TYPE) list -> (string * string) list -> TERM
=DESCRIBE
=FAILURE
48011	Unable to form constant name: identifier names not legal Z?
=ENDDOC
\subsection{Variable Binding Constructs}


\subsubsection{Group 1 packs}

=DOC
val ⦏g1_bind_sig⦎ :(string * TYPE) list
val ⦏g1_bind_cterm⦎ : TERM
val ⦏g1_bind_type⦎ : TYPE
=DESCRIBE
=FAILURE
48002	?0 and ?1 must both be of type ⌜:BOOL⌝
=ENDDOC

\subsubsection{Group 2 packs}

=DOC
val ⦏g2_bind_sig⦎ : TYPE -> (string * TYPE) list
val ⦏g2_bind_cterm⦎ : TYPE -> TERM
val ⦏g2_bind_type⦎ : TYPE -> TYPE
=DESCRIBE
=FAILURE
48002	?0 and ?1 must both be of type ⌜:BOOL⌝
=ENDDOC

\subsubsection{Group 3 packs}

=DOC
val ⦏g3_bind_sig⦎ : TYPE -> TYPE -> (string * TYPE) list
val ⦏g3_bind_cterm⦎ : TYPE -> TYPE -> TERM
val ⦏g3_bind_type⦎ : TYPE -> TYPE -> TYPE
=DESCRIBE
=FAILURE
48002	?0 and ?1 must both be of type ⌜:BOOL⌝
=ENDDOC

\subsubsection{Bindings yielding Schema Expressions}

\subsubsection{Schemas}

=DOC
val ⦏schema_bname⦎ : string list -> string
val ⦏schema_btype⦎ : (string * TYPE) list -> TYPE
val ⦏schema_bterm⦎ : (string * TYPE) list -> TERM;
=DESCRIBE
Makes the Z schema constructor from the supplied component to type map.
=EXAMPLE
schema_bterm [("a",tya),("b",tyb)] = ⌜Z'⋎s[a,b] : ((tya → tyb → (BOOL, BOOL)Z'S[d,p])
					→ ((tya, tyb)Z'S[a,b])SET)⌝
=ENDDOC

\subsubsection{Schema Existential Quantification}

=DOC
val ⦏∃⋎s_bname⦎ : string list -> string list -> string
val ⦏∃⋎s_btype⦎ : (string * TYPE) list -> (string * TYPE) list -> TYPE
val ⦏∃⋎s_bterm⦎ : (string * TYPE) list -> (string * TYPE) list -> TERM
=DESCRIBE
Makes the Z schema existential quantification constructor from the supplied component to type maps.
=EXAMPLE
∃⋎s_bterm [("a",tya),("b",tyb)][("c",tyc),("d",tyd)] =
	⌜Z'∃⋎s[a,b][c,d] : ((tya → tyb → (BOOL,BOOL)Z'S[d,p])
		→ ((tya,tyb,tyc,tyd)Z'S[a,b,c,d])SET → ((tyc,tyd)Z'S[c,d])SET)⌝
=ENDDOC

\subsubsection{Schema Unique Existential Quantification}
=DOC
val ⦏∃⋎1⋎s_bname⦎ : string list -> string list -> string
val ⦏∃⋎1⋎s_btype⦎ : (string * TYPE) list -> (string * TYPE) list -> TYPE
val ⦏∃⋎1⋎s_bterm⦎ : (string * TYPE) list -> (string * TYPE) list -> TERM
=DESCRIBE
Makes the Z schema unique existential quantification constructor from the supplied component to type maps.
=EXAMPLE
∃⋎1⋎s_bterm [("a",tya),("b",tyb)][("c",tyc),("d",tyd)] =
	⌜Z'∃⋎1⋎s[a,b][c,d] : ((tya → tyb → (BOOL,BOOL)Z'S[d,p])
		→ ((tya,tyb,tyc,tyd)Z'S[a,b,c,d])SET → ((tyc,tyd)Z'S[c,d])SET)⌝
=ENDDOC

\subsubsection{Schema Universal Quantification}

=DOC
val ⦏∀⋎s_bname⦎ : string list -> string list ->string
val ⦏∀⋎s_btype⦎ : (string * TYPE) list -> (string * TYPE) list -> TYPE
val ⦏∀⋎s_bterm⦎ : (string * TYPE) list -> (string * TYPE) list -> TERM
=DESCRIBE
Makes the Z schema universal quantification constructor from the supplied component to type maps.
=EXAMPLE
∀⋎s_bterm [("a",tya),("b",tyb)][("c",tyc),("d",tyd)] =
	⌜Z'∀⋎s[a,b][c,d] : ((tya → tyb → (BOOL,BOOL)Z'S[d,p])
		→ ((tya,tyb,tyc,tyd)Z'S[a,b,c,d])SET → ((tyc,tyd)Z'S[c,d])SET)⌝
=ENDDOC

\subsubsection{Unique Existential Quantification}

=DOC
val ⦏∃⋎1_bname⦎ : string list -> string
val ⦏∃⋎1_btype⦎ : (string * TYPE) list -> TYPE
val ⦏∃⋎1_bterm⦎ : (string * TYPE) list -> TERM
=DESCRIBE
Makes the Z unique existential quantification constructor from the supplied component to type map.
=EXAMPLE
∃⋎1_bterm [("a",tya),("b",tyb)] =
	⌜Z'∃⋎1[2] : ((tya → tyb → (BOOL,BOOL,BOOL)Z'S[d,p,v]) → BOOL)⌝
=ENDDOC
\subsubsection{Set Abstraction}

=DOC
val ⦏seta_bname⦎ : string list -> string
val ⦏seta_btype⦎ : (string * TYPE) list -> TYPE -> TYPE
val ⦏seta_bterm⦎ : (string * TYPE) list -> TYPE -> TERM
=DESCRIBE
Makes the Z set comprehension constructor from the supplied component to type map.
The type of the members of the resulting set is supplied as the second argument.
=EXAMPLE
seta_bterm [("a",tya),("b",tyb)] tyv =
	⌜Z'Seta[2] : ((tya → tyb → (BOOL,BOOL,tyv)Z'S[d,p,v]) → (tyv)SET)⌝
=ENDDOC

\subsubsection{Lambda Abstraction}

=DOC
val ⦏λ_bname⦎ : string list -> string
val ⦏λ_btype⦎ : (string * TYPE) list -> TYPE -> TYPE -> TYPE
val ⦏λ_bterm⦎ : (string * TYPE) list -> TYPE -> TYPE -> TERM
=DESCRIBE
Makes the Z lambda abstraction constructor from the supplied component to type map.
The types of the domain (characteristic tuple) and range of the resulting function are supplied as the second and third arguments respectively.
=EXAMPLE
λ_bterm [("a",tya),("b",tyb)] tyt tyv =
	⌜Z'λ[2] : ((tya → tyb → (BOOL,BOOL,tyt,tyv)Z'S[d,p,t,v])
		→ ((tyt,tyv)Z'T2)SET)⌝
=ENDDOC

\subsubsection{Cartesian Products}

=DOC
val ⦏prod_cname⦎ : TYPE list -> string
val ⦏prod_ctype⦎ : TYPE list -> TYPE
val ⦏prod_cterm⦎ : TYPE list -> TERM
=DESCRIBE
Makes a Z cartesian product constructor from the supplied type list.
=EXAMPLE
prod_cterm [tya,tyb] = ⌜Z'×[2] : ((tya)SET,(tyb)SET)Z'T[2] → ((tya,tyb)Z'T[2])SET⌝
=ENDDOC

\subsubsection{Definite Description}

=DOC
val ⦏μ_bname⦎ : string list -> string
val ⦏μ_btype⦎ : (string * TYPE) list -> TYPE -> TYPE
val ⦏μ_bterm⦎ : (string * TYPE) list -> TYPE -> TERM
=DESCRIBE
Makes the Z definite description constructor from the supplied component to type map.
The type of the result is supplied as the second argument.
=EXAMPLE
μ_bterm [("a",tya),("b",tyb)] tyv =
	⌜Z'μ[2] : ((tya → tyb → (BOOL,BOOL,tyv)Z'S[d,p,v]) → tyv)⌝
=ENDDOC

\subsection{Computing the Abstractions}

=DOC
val ⦏schema_abs⦎ : (string * TYPE) list -> TERM -> TERM
=DESCRIBE
=ENDDOC

\subsubsection{Group 1 Abstractions}

=DOC
val ⦏g1_abs⦎ : TERM * TERM * (string * TYPE) list -> TERM;
=DESCRIBE
=FAILURE
48002	?0 and ?1 must both be of type ⌜:BOOL⌝
=ENDDOC

\subsubsection{Group 2 Abstractions}
=DOC
val ⦏g2_∃⦎ : TERM * TERM * TERM * (string * TYPE) list -> TERM
val ⦏g2_∀⦎ : TERM * TERM * TERM * (string * TYPE) list -> TERM
=DESCRIBE
=ENDDOC

=DOC
val ⦏g2_abs⦎ : TERM * TERM * TERM * (string * TYPE) list -> TERM;
=DESCRIBE
=FAILURE
48002	?0 and ?1 must both be of type ⌜:BOOL⌝
=ENDDOC

\subsubsection{Group 3 Abstractions}

=DOC
val ⦏g3_abs⦎ : TERM * TERM * TERM * TERM * (string * TYPE) list -> TERM;
=DESCRIBE
=FAILURE
48002	?0 and ?1 must both be of type ⌜:BOOL⌝
=ENDDOC
\subsection{Predicate Quantification}

\subsubsection{Existential Quantification}

=DOC
val ⦏∃_bname⦎ : string
val ⦏∃_bterm⦎ : TERM
val ⦏∃body_bterm⦎ : TERM
=DESCRIBE
The Z existential quantification constructors.
=ENDDOC


\subsubsection{Universal Quantification}

=DOC
val ⦏∀_bname⦎ : string
val ⦏∀_bterm⦎ : TERM
val ⦏∀body_bterm⦎ : TERM
=DESCRIBE
The Z universal quantification constructors.
=ENDDOC

\subsubsection{Computing the Abstractions}

=DOC
val ⦏schema_∃⦎ : (string * TYPE) list -> TERM -> TERM
val ⦏schema_∀⦎ : (string * TYPE) list -> TERM -> TERM
=DESCRIBE
=ENDDOC

\section{END OF SIGNATURE}
=SML
end (* end of ZTypesAndTermsSupport signature *);
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}



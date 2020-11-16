=IGN
********************************************************************************
imp060.doc: this file is part of the PPZed system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp060.doc   ℤ $Date: 2008/02/10 15:28:07 $ $Revision: 1.38 $ $RCSfile: imp060.doc,v $
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

\def\Title{Implementation of the Z Lexical Analyser}

\def\AbstractText{This document contains the implementation of the lexical analyser for HOL/Z.}

\def\Reference{DS/FMU/IED/IMP060}

\def\Author{D.J. King}


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
%% LaTeX2e port: \TPPtitle{Implementation of the Z Lexical Analyser}  %% Mandatory field
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP060}  %% Mandatory field
%% LaTeX2e port: \def\SCCSversion{$Revision: 1.38 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSversion}  %% Mandatory field
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2008/02/10 15:28:07 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPstatus{Draft}			%% Mandatory field
%% LaTeX2e port: \TPPtype{Specification}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{D.J.~King & WIN01}  %% Mandatory field
%% LaTeX2e port: %\TPPauthors{Name 1&location 1\\Name 2&location 2\\Name 3&location 3}
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the implementation of
%% LaTeX2e port: the lexical analyser for HOL/Z.}
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

\item[Issue 1.5 (1992/04/16), \FormatDate{92/03/19} ] Initial Draft.

\item[Issue 1.6 (1992/04/30), \FormatDate{92/04/30} ] Changed punctuation tables
according to new version of \cite{DS/FMU/IED/DEF007}.

\item[Issue 1.7 (1992/06/10), \FormatDate{92/04/30} ] Changed punctuation tables
according to version 1.5 of \cite{DS/FMU/IED/DEF007}.

\item[Issue 1.8 (1992/06/12), \FormatDate{92/06/12%
} ] Removed fixity handling, which is now done in \cite{DS/FMU/IED/DTD079}.
\item[Issue 1.13 (1992/11/18), \FormatDate{92/11/18%
} ] Corrected bug in macro treatment and did quick fix to make all Z additional
symbols known to the reader/writer.
\item[Issue 1.14 (1992/12/03), \FormatDate{92/12/03%
}] Added entry for $<<$ and $>>$ to table of additional symbols.
\item[Issue 1.15 (1993/07/09)] Additional symbols now moved to DS/FMU/IED/IMP005.
\item[Issue 1.16 (1999/03/07)] Port to SML/NJ.
\item[Issue 1.17 (2002/01/23)] Support for left associative operators.
\item[Issue 1.18 (2002/03/11)] R0071: multiple underscores now allowed in identifiers.
\item[Issue 1.19 (2002/05/23)] Adjacent $Lex.Text$ items are now generated in the input from $get\_HOL\_any$.

\item[Issue 1.20 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.21 (2002/10/17)] PPZed-specific updates for open source release
\item[Issue 1.22 (2003/07/23)] Corrected handling of subscripted symbols given as macros.
\item[Issue 1.23 (2003/07/29)] Multi-character subscripts now allowd.
\item[Issue 1.24 (2004/01/19)] The Z universal set is now called 𝕌.
\item[Issue 1.25 (2005/09/09)] New forms of stub in templates. Dollar escape can now be used to introduce arbitrary identifiers.
\item[Issue 1.26 (2005/09/10)] `,,' now available as a synonym for `...'.
\item[Issue 1.27 (2005/09/13)] Option to require distinguishing subscripts on all schema operations.
\item[Issue 1.28 (2006/01/24), 1.29 (2006/01/25)] Tidier design of the \$-feature.
\item[Issue 1.30 (2006/04/20)] Added support for floating point literals
\item[Issue 1.31 (2006/04/28)] Fixed handling of subscripted digits.
\item[Issue 1.32 (2006/06/16)] Made it work with SML/NJ again.
\item[Issue 1.33 (2006/07/19)] New blackboard bold characters are now defined as punctuation.
\item[Issue 1.34 (2006/08/08)] Downgraded error 60004 to a fail to help the pretty-printer out.
\item[Issue 1.35 (2006/12/02)] An exponent can now be indicated with ``e'' or ``E''.
\item[Issue 1.36 (2007/05/28)] Bag brackets are now punctuation.
\item[Issue 1.37 (2007/08/03)] Improved support for dollar-quoted identifiers.
\item[Issue 1.38 (2008/02/10)] Alphanumeric identifiers may now begin and end with underscores.
\item[Issue 1.39 (2011/07/16)] Added ``=='' as an alias of ``≜''.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported PPZed to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}
\subsection{Changes Forecast}
None.
\section{GENERAL}
\subsection{Scope}
This document contains the implementation
of the lexical analyser for HOL/Z meeting the detailed design
given in \cite{DS/FMU/IED/DTD060}.
\subsection{Introduction}
\subsection{Purpose and Background}
See \cite{DS/FMU/IED/DTD060}.
\subsection{Dependencies}
This implementation depends on the definition of the
type $TERM$ defined in \cite{DS/FMU/IED/DTD003}.
\subsection{Interface}
The structure $ZLex$ is constrained by the signature
$ZLex$ defined in \cite{DS/FMU/IED/DTD060}.
\subsection{Algorithms}
The algorithms used in this implementation are based
upon the a finite automaton lexical analyser. Unrecognised
inputs are handled by using the exception $Unrecognised$ to
control the program flow.
\subsection{Possible Enhancements}
None.
\subsection{Deficiencies}
None known.

\section{PREAMBLE}
=SML
structure ZLex : ZLex = struct
	open Lex;
=TEX
\section{DATA TYPES}
\subsection{Interface with Parser}
\subsubsection{Identifiers and Literals}
=SML
datatype ⦏Z_TOKEN⦎	=
		⦏ZTAqTm⦎ of TERM
	|	⦏ZTId⦎ of string
	|	⦏ZTDecor⦎ of string
	|	⦏ZTChar⦎ of string
	|	⦏ZTString⦎ of string
	|	⦏ZTNumber⦎ of INTEGER
	|	⦏ZTFloat⦎ of INTEGER * INTEGER * INTEGER
=TEX
\subsubsection{Paragraph Separators}
The following constructors correspond to paragraph
forming tokens:
=SML
	|	⦏ZTAx⦎
	|	⦏ZTSch⦎
	|	⦏ZTEnd⦎
	|	⦏ZTIs⦎
	|	⦏ZTSt⦎
	|	⦏ZTBar⦎
	|	⦏ZTAmpersand⦎
=TEX
\subsubsection{Lambda and Mu}
=SML
	|	⦏ZTλ⦎
	|	⦏ZTμ⦎
=TEX
\subsubsection{Logic Symbols}
=SML
	|	⦏ZT∀⦎ of bool
	|	⦏ZT∃⦎ of bool
	|	⦏ZT∃⋎1⦎ of bool
	|	⦏ZT¬⦎ of bool
	|	⦏ZT∧⦎ of bool
	|	⦏ZT∨⦎ of bool
	|	⦏ZT⇔⦎ of bool
	|	⦏ZT⇒⦎ of bool
=TEX
\subsubsection{Schema Operations}
=SML
	|	⦏ZTPre⦎
	|	⦏ZTΔ⦎
	|	⦏ZTΞ⦎
	|	⦏ZTPipe⦎
	|	⦏ZT↾⦎
	|	⦏ZT⨾⦎
=TEX
\subsubsection{Punctuation and Reserved Identifiers}
=SML
	|	⦏ZTLet⦎
	|	⦏ZTFun⦎
	|	⦏ZTGen⦎
	|	⦏ZTRel⦎
	|	⦏ZTLeftAssoc⦎
	|	⦏ZTRightAssoc⦎
	|	⦏ZTLbrace⦎
	|	⦏ZTRbrace⦎
	|	⦏ZTLbrack⦎
	|	⦏ZTRbrack⦎
	|	⦏ZTLsqbrack⦎
	|	⦏ZTRsqbrack⦎
	|	⦏ZT⟨⦎
	|	⦏ZT⟩⦎
	|	⦏ZTComma⦎
	|	⦏ZTDots⦎
	|	⦏ZTDot⦎
	|	⦏ZTSlash⦎
	|	⦏ZTBSlash⦎
	|	⦏ZTFreeTyDef⦎
	|	⦏ZTColon⦎
	|	⦏ZTSemi⦎
	|	⦏ZTUnderScore⦎
	|	⦏ZTUnderScoreQuery⦎
	|	⦏ZTUnderScoreExclam⦎
	|	⦏ZTVert⦎
	|	⦏ZTConjecture⦎
	|	⦏ZT≜⦎
	|	⦏ZT⦁⦎
	|	⦏ZT×⦎
	|	⦏ZTθ⦎
	|	⦏ZTEos⦎;

=TEX
\section{THE LEXICAL ANALYSER}
=TEX
\subsection{Local Type Definitions}
The main lexical analysis algorithm is exception-driven
using the following local exception:
=SML
exception ⦏Unrecognised⦎;
=TEX
A state, $LEX\_STATE$, is used by most of the lexical analysis
functions. The state is in two parts: first, the characters not yet tokenised,
actually a list of strings of single characters produced by exploding
the input text; second, the token immediately preceeding the first
part.  The token may not be recognised (yet) so the token part of the
state carries a success indicator.  On entry to an analysis function
the state will be ``$(chars, (Unknown, \hbox{``''}))$''.
=SML
datatype ⦏SUCCESS⦎ = ⦏Known⦎ of string | ⦏Unknown⦎;


type ⦏LEX_STATE⦎  = (string list) * SUCCESS;
=TEX
\subsection{Utilities}
$collect$ adds the first character of the untokenised input text into the current token.
=SML
fun ⦏collect⦎ ( cstk : LEX_STATE ) : LEX_STATE = (
	case cstk of
		(c :: cs, Known s) => (cs, Known(s ^ c))
	|	(c :: cs, Unknown) => (cs, Known c)
	|	_ => error "Z Lexical Analyser" 60003 [fn()=>"collect"]
);
=TEX
We need various character classifying functions.
=SML
fun mk_lex_dict dict (symbols : string list) : bool E_DICT = (
let	fun aux dict (sym::rest) =
		aux (e_enter sym true dict) rest
	  | aux dict [] = dict;
in
	aux dict symbols
end);
=TEX
=TEX
=SML
val ⦏ord0⦎	= ord "0";
val ⦏ord9⦎	= ord "9";
val ⦏orda⦎	= ord "a";
val ⦏ordA⦎	= ord "A";
val ⦏ordz⦎	= ord "z";
val ⦏ordZ⦎	= ord "Z";
=TEX
=SML
fun ⦏is_digit⦎  (d : string) = (
	let	val ordd = ord d
	in	(ordd >= ord0) andalso (ordd <= ord9)
	end
);
=TEX
=SML
fun ⦏is_alpha⦎  (c : string) = (
	let	val ordc = ord c
	in		((ordc >= orda) andalso (ordc <= ordz))
		orelse	((ordc >= ordA) andalso (ordc <= ordZ))
	end
);
=TEX
=SML
fun ⦏is_alnum⦎  (c : string) = (
	is_alpha c orelse is_digit c
);
=TEX
=SML
val ⦏decor⦎ : string list =
=TEX
=SMLLITERAL
	["'", "!", "?"];
=TEX
=SML
fun ⦏is_decor⦎ c = contains decor c;
=TEX
=SML
fun ⦏is_undersc⦎ c = c = "_";
=TEX
=SML
fun ⦏is_query⦎ c = c = "?";
=TEX
=SML
fun ⦏is_exclam⦎ c = c = "!";
=TEX
=SML
val ⦏invalid_symbol⦎ : string list =
=TEX
=SMLLITERAL
	["⋎", "↘", "⋏"];
=TEX
=SML
fun ⦏is_invalid_symbol⦎ c = contains invalid_symbol c;
=TEX
=SML
val ⦏superscriptor⦎ : string list =
=TEX
=SML
	["↗", "↕"];
=TEX
=SML
fun ⦏is_superscriptor⦎ c = contains superscriptor c;
=TEX
=SML
fun ⦏is_subscriptor⦎ c =
=SMLLITERAL
	(c = "⋎");
=TEX
=SML
val ⦏punctuation⦎ : string list =
	[",", ";", ":", "⦁", "(", ")", "[", "]", "{", "}", "⟨", "⟩",
	 "⟦", "⟧", "≜", "𝔹", "ℂ", "𝔽", "ℕ", "ℙ", "ℚ", "ℝ", "𝕊",
	"𝕌", "ℤ",  "|", "─", "═"];
=TEX
The following multi-character symbol(s) need special treatment.
=SML
val ⦏ext_symbol⦎ : string list =
	["?⊢", "::=", ",,"];
=TEX
=SML
val ⦏punctuation_dict⦎ = mk_lex_dict initial_e_dict punctuation;
fun ⦏is_punctuation⦎ c = (e_lookup c punctuation_dict = Value true);
=TEX
=SML
val ⦏greek⦎ : string list =
	["α", "β", "γ", "δ", "ε", "ζ", "η", "θ", "ι", "κ",
	"λ", "μ", "ν", "ξ", "π","ρ", "σ", "τ", "υ", "φ",
	"χ", "ψ", "ω", "Γ", "Δ", "Θ", "Λ", "Ξ", "Π",
	"Σ", "Υ", "Φ", "Ψ", "Ω"];
=TEX
=SML
val ⦏greek_dict⦎ = mk_lex_dict initial_e_dict greek;
fun ⦏is_greek⦎ c = (e_lookup c greek_dict = Value true);
=TEX
=SML
fun ⦏is_space⦎ c = c <= " ";
=TEX
=SML
 fun ⦏skip_space⦎ (st as (cs as (c :: more), tk) : LEX_STATE) : LEX_STATE = (
	if is_space c
	then skip_space (more, tk)
	else st
) | skip_space (st as ([], _)) = st;
=TEX
=SMLPLAIN
fun ⦏is_macro⦎ (c : string) = c = "%%";
=TEX
=SML
fun ⦏is_symbol⦎ c = (
	not (is_space c) andalso
	not (is_alnum c) andalso
	not (is_punctuation c) andalso
	not (is_undersc c) andalso
	not (is_decor c) andalso
	not (is_greek c) andalso
	not (is_macro c) andalso
	not (is_invalid_symbol c)
	);
=TEX
$next$ is used to apply a classifier function such as $is\_digit$
to the first character in the input part of a state. It returns false
if the input part is empty.
=SML
fun ⦏next⦎ (test : string -> bool) ((c :: _, _) : LEX_STATE) = test c
|   next _ ([], _) = false;
=TEX
When a lexeme
has been recognised, the following function is used to classify the result.

=SML
fun ⦏classify⦎ (what : string) : Z_TOKEN = (
	case what of
		"λ" => ZTλ
	|	"μ" => ZTμ

	|	"∀" => ZT∀ false
	|	"∃" => ZT∃ false
	|	"∃⋎1" => ZT∃⋎1 false

	|	"¬" => ZT¬ false
	|	"pre" => ZTPre
	|	"Δ" => ZTΔ
	|	"Ξ" => ZTΞ

	|	">>" => ZTPipe
	|	"↾⋎s" => ZT↾
	|	"⨾⋎s" => ZT⨾
	|	"∧" => ZT∧ false
	|	"∨" => ZT∨ false
	|	"⇔" => ZT⇔ false
	|	"⇒" => ZT⇒ false

	|	"let" => ZTLet

	|	"&" => ZTAmpersand
	|	"{" => ZTLbrace
	|	"}" => ZTRbrace
	|	"(" => ZTLbrack
	|	")" => ZTRbrack
	|	"[" => ZTLsqbrack
	|	"]" => ZTRsqbrack
	|	"⟨" => ZT⟨
	|	"⟩" => ZT⟩
	|	"," => ZTComma
	|	"_" => ZTUnderScore
	|	"_?" => ZTUnderScoreQuery
	|	"_!" => ZTUnderScoreExclam
	|	"..." => ZTDots
	|	",," => ZTDots
	|	"." => ZTDot
	|	"/" => ZTSlash
	|	"\\⋎s" => ZTBSlash
	|	"::=" => ZTFreeTyDef
	|	":" => ZTColon
	|	";" => ZTSemi
	|	"|" => ZTVert
	|	"?⊢" => ZTConjecture
	|	"==" => ZT≜
	|	"≜" => ZT≜
	|	"⦁" => ZT⦁
	|	"×" => ZT×
	|	"θ" => ZTθ
	|	"─" => ZTIs
	|	"═" => ZTBar

	|	"∀⋎s" => ZT∀ true
	|	"∃⋎s" => ZT∃ true
	|	"∃⋎1⋎s" => ZT∃⋎1 true
	|	"¬⋎s" => ZT¬ true
	|	"∧⋎s" => ZT∧ true
	|	"∨⋎s" => ZT∨ true
	|	"⇔⋎s" => ZT⇔ true
	|	"⇒⋎s" => ZT⇒ true

	|	_ => ZTId what
);
=TEX
\subsection{Recognition of Punctuation}
$rec\_punctuation$ returns an appropriately updated state if the input
begins with a punctuation, if not it raises $Unrecognised$.
=SML
local
	val ext_pl = map explode ext_symbol;
in
fun ⦏rec_ext_symbol⦎  (st as (cl, k) : LEX_STATE) : LEX_STATE = (
let	fun aux res _ [] = (res, true)
	  | aux res (c1::rest1) (c2::rest2) = (
		if c1 = c2 then aux (res@[c1]) rest1 rest2
		else (res, false)
	) | aux res [] _ = (res, false);

	fun aux1 cl (cs::rest) = (
	let	val (res, flag) = aux [] cl cs;
	in
		if flag then res
		else aux1 cl rest
	end)
	  | aux1 cl [] = [];

	fun subtr [] cl = cl
	  | subtr (c1::rest1) (c2::rest2) =
		subtr rest1 rest2
	  | subtr cl [] = [];

	val r = case aux1 cl ext_pl of
		[] => raise Unrecognised
		|other => other;
	val r' = implode r;
	val cl' = subtr r cl;

in
	case k of
	Unknown => (cl', Known r')
	|Known s => (cl', Known (s^r'))
end);
end (* of local ... in ... *);
=TEX
=SML
fun ⦏rec_punctuation⦎  (st : LEX_STATE) : LEX_STATE = (
	if next is_punctuation st
	then collect st
	else raise Unrecognised
);
=TEX
\subsection{Recognition of an Alphabetic Character}
=SML
fun ⦏rec_alpha⦎ (st : LEX_STATE) : LEX_STATE = (
	if next is_alpha st
	then collect st
	else raise Unrecognised
);
=TEX
\subsection{Recognition of an Alphanumeric Character}
=SML
fun ⦏rec_alnum⦎ (st : LEX_STATE) : LEX_STATE = (
	if next is_alpha st orelse next is_digit st
	then collect st
	else raise Unrecognised
);
=TEX
\subsection{Recognition of a Greek Letter}
=SML
fun ⦏rec_greek⦎ (st : LEX_STATE) : LEX_STATE = (
	if next is_greek st
	then collect st
	else raise Unrecognised
);
=TEX
\subsection{Recognition of a Superscripting Character}
=SML
fun ⦏rec_subscriptor⦎ (st : LEX_STATE) : LEX_STATE = (
	if next is_subscriptor st
	then collect st
	else raise Unrecognised
);
=TEX
\subsection{Recognition of Underscore}
=SML
fun ⦏rec_undersc⦎ (st : LEX_STATE) : LEX_STATE = (
	if next is_undersc st
	then collect st
	else raise Unrecognised
);
=TEX
\subsection{Recognition of Stubs}
=SML
fun ⦏rec_stub⦎ (st : LEX_STATE) : LEX_STATE = (
	if	next is_undersc st
	then	let val st' = collect st;
		in	if	next is_query st'
			orelse	next is_exclam st'
			then	collect st'
			else	st'
		end
	else	raise Unrecognised
);
=TEX
\subsection{Recognition of Alphanumeric Sequences}
$rec\_alnum$ returns an appropriately updated state if the input
is alphanumeric; if not it raises $Unrecognised$.
=SML
fun ⦏rec_alnumseq⦎ (st : LEX_STATE) : LEX_STATE = (
	let	fun aux st = (
			if next is_alnum st
			then aux (collect st)
			else st
		);
	in	if next is_alnum st
		then aux (collect st)
		else raise Unrecognised
	end
);
=TEX
\subsection{Recognition of Symbolic Sequences}
Recognition of symbolic sequences is more complicated than that for
terminators or identifiers since we have to pick off keyword symbols
as well as single characters --- $rec\_keyword$ does this.
=SML
fun ⦏rec_keyword⦎ (st : LEX_STATE) : LEX_STATE = (
	let	fun aux (([], _) : LEX_STATE) = (
			fail "Z Lexical Analyser" 60004 []
		) | aux st = (
			if next is_macro st
			then (collect st)
			else aux (collect st)
		);
	in	if next is_macro st
		then aux (collect st)
		else raise Unrecognised
	end
);
=TEX
$rec\_symbol$ uses $rec\_keyword$ to recognise a symbolic sequence:
=SML
fun  ⦏rec_symbol⦎ (st : LEX_STATE) : LEX_STATE = (
	rec_ext_symbol st
	handle Unrecognised => (
		if next is_symbol st
		then	let	val st' = (collect st)
			in	(rec_symbol st') handle Unrecognised => st'
			end
		else	if next is_macro st
			then	let	val st' = rec_keyword st
				in	(rec_symbol st') handle Unrecognised => st'
				end
			else	raise Unrecognised)
);
=TEX
\subsection{Recognition of Integer and Floating Point Literals}
=SML
fun ⦏is_point⦎ ("." : string) = true
|   is_point _ = false;
=TEX
=SML
fun ⦏is_e⦎ ("e" : string) = true
|   is_e "E" = true
|   is_e _ = false;
=TEX
=SML
fun ⦏is_minus⦎ ("~" : string) = true
|   is_minus _ = false;
=TEX
=SML
fun ⦏do_number⦎ (st : LEX_STATE as (ch::_, _)) : (string * (string * string OPT) OPT) * LEX_STATE = (
let
	fun in_exp acc (st as (ch::more, _)) = (
		if	next is_digit st
		then	in_exp (ch :: acc) (collect st)
		else	(Value(implode(rev acc)), st)
	) | in_exp acc st = (Value(implode(rev acc)), st);
	fun exp_sign (st as (ch::more, _)) = (
		if	next is_minus st
		then	let	val st1 = collect st;
			in	if	next is_digit st1
				then	in_exp ["~"] st1
				else	(Nil, st)
			end
		else if	next is_digit st
		then	in_exp [ch] (collect st)
		else	(Nil, st)
	) | exp_sign st = (Nil, st);
	fun exp_e st = (
		if	next is_e st
		then	let	val st1 = collect st;
			in	case exp_sign st1 of
					r as (Value _, _) => r
				| _ =>	(Nil, st)
			end
		else	(Nil, st)
	);
	fun after_point acc (st as (ch::more, _)) = (
		if	next is_digit st
		then	after_point (ch :: acc) (collect st)
		else	let	val (r, st1) = exp_e st;
			in	(Value(implode(rev acc), r), st1)
			end
	) | after_point acc st = (Value(implode(rev acc), Nil), st);
	fun before_point acc  (st as (ch::more, _)) = (
		if	next is_digit st
		then	before_point (ch::acc) (collect st)
		else if	next is_point st
		then	let	val st1 = collect st;
			in	if	next is_digit st1
				then	let	val (r, st2) = after_point [] st1;
					in	((implode(rev acc), r), st2)
					end
				else	((implode(rev acc), Nil), st)
			end
		else	((implode(rev acc), Nil), st)
	) | before_point acc st = ((implode(rev acc), Nil), st);
in
	if next is_digit st
	then before_point [ch] (collect st)
	else raise Unrecognised
end
) | do_number _ = raise Unrecognised;
=TEX
=SML
val ⦏rec_number⦎ : LEX_STATE -> LEX_STATE = snd o do_number;
=TEX
=SML
fun ⦏classify_number⦎ (s : string) : Z_TOKEN OPT = (
	((case fst(do_number(explode s, Unknown)) of
		(i, Nil) => Value(ZTNumber(natural_of_string i))
	|	(b, Value(a, Nil)) => Value(ZTFloat(natural_of_string (b^a), integer_of_int(size a), zero))
	|	(b, Value(a, Value e)) => Value(ZTFloat(natural_of_string (b^a), integer_of_int(size a), integer_of_string e))
	) handle Fail _ => Nil) handle Unrecognised => Nil
);
=TEX
\subsection{Recognition of Identifiers}
To recognise identifiers we first need auxiliaries to recognise the
atomic pieces of identifiers (viz. alphanumeric sequences and
symbolic sequences)

=TEX
The following recognises an alphanumeric identifier.
Note that a single underscore does not comprise an alphanumeric identifier.
=SML
fun ⦏rec_alphanumerics⦎ (st : LEX_STATE) : LEX_STATE = (
let	fun aux1 st = (
		let	val st1 = rec_alnum st
				handle Unrecognised => rec_undersc st;
		in	aux1 st1
		end	handle Unrecognised => st
	);
	fun aux2 st = (
		aux1(rec_alpha st
			handle Unrecognised => rec_undersc st)
	);
in	case aux2 st of
		(_, Unknown) => raise Unrecognised
	|	st2 as (chs, Known s) => (
			if	s = ""
			orelse	s = "_"
			then	raise Unrecognised
			else	st2
	)
end);
=TEX
=SML
=TEX
The following recognises a subscript mode.
=SML
=TEX
=SML
fun ⦏rec_subscript⦎ (st : LEX_STATE) : LEX_STATE = (
let	fun aux2 st =
		if next is_digit st
		then aux2 (collect st)
		else st;
	fun aux1 st = (
		if next is_superscriptor st
		then fail "Z Lexical Analyser" 60007 []
		else if next is_macro st
		then rec_keyword st
		else if next is_alpha st
		orelse next is_undersc st
		then rec_alphanumerics st
		else if next is_digit st
		then aux2 (collect st)
		else case st of
			([], _) => raise Unrecognised
			|st => collect st
	);
	val (st1, flag1) = (rec_subscriptor st, true)
		handle Unrecognised => (st, false);
in
	if flag1 then aux1 st1
	else raise Unrecognised
end);
=TEX
The following recognises a (possibly empty) sequence of
subscripted characters.
=SML
fun ⦏rec_subscripteseq⦎ (st : LEX_STATE) : LEX_STATE = (
let	val (st1, flag1) = (rec_subscript st, true)
			handle Unrecognised => (st, false);
in
	if flag1 then rec_subscripteseq st1
	else st1
end);
=TEX
The following recognises a (possibly empty) sequence of
symbols (excluding the subscript symbol).
=SML
fun ⦏rec_symboleseq⦎ (st : LEX_STATE) : LEX_STATE = (
let	val (st1, flag1) = (rec_symbol st, true)
		handle Unrecognised => (st, false);
in
	if flag1 then rec_symboleseq st1
	else st1
end);
=TEX
=SML
fun ⦏rec_greek_id⦎ (st : LEX_STATE) : LEX_STATE = (
let	val (st1, flag1) = (rec_greek st, true)
			handle Unrecognised => (st, false);
	val st2 = rec_subscripteseq st1;
in
	if flag1 then st2
	else raise Unrecognised
end);
=TEX
=SML
fun ⦏rec_symbol_id⦎ (st : LEX_STATE) : LEX_STATE = (
let	val (st1, flag1) = (rec_symbol st, true)
			handle Unrecognised => (st, false);
	val st2 = rec_symboleseq st1;
	val st3 = rec_subscripteseq st2;
in
	if flag1 then st3
	else raise Unrecognised
end);
=TEX
=SML
fun ⦏rec_punc_id⦎ (st : LEX_STATE) : LEX_STATE = (
let	val (st1, flag1) = (rec_punctuation st, true)
			handle Unrecognised => (st, false);
	val (st2, flag2) = (rec_subscript st1, true)
			handle Unrecognised => (st1, false);
	val st3 = rec_subscripteseq st2;
in
	if flag1 andalso flag2 then st3
	else raise Unrecognised
end);
=TEX
=SML
fun ⦏rec_alphanumeric_id⦎ (st : LEX_STATE) : LEX_STATE = (
let	val st1 = rec_alphanumerics st;
	val st2 = rec_subscripteseq st1;
in	st2
end);
=TEX
The following recognises a valid Z identifier.
=SML
fun ⦏rec_identifier⦎ (st as ("."::more, r): LEX_STATE) : LEX_STATE = (
	let	fun aux2 acc [] = rev acc
		|   aux2 acc (chs as ("."::_)) = rev acc @ " "::chs
		|   aux2 acc (chs as (ch::more)) = (
			if	is_digit ch
			then	aux2 (ch::acc) more
			else	rev (ch::acc) @ more
		);
		fun aux1 acc [] = rev acc
		|   aux1 acc (chs as (ch::more)) = (
			if	is_space ch
			then	aux1 (ch::acc) more
			else if	is_digit ch
			then	aux2 (ch::acc) more
			else	rev (ch::acc) @ more
		);
	in	if	next is_digit (more, r)
		orelse	next is_space (more, r)
		then	rec_symbol_id(aux1 ["."] more, r)
		else	rec_symbol_id st
	end
) | ⦏rec_identifier⦎ st = (
	rec_symbol_id st
	handle Unrecognised =>
		rec_alphanumeric_id st
		handle Unrecognised =>
			rec_greek_id st
			handle Unrecognised =>
				rec_punc_id st
);
=TEX
\subsection{Recognition of Decoration}
=SML
fun ⦏is_decoration⦎ s = all (explode s) (fn s'=> is_decor s');
=TEX
=SML
fun ⦏rec_decor⦎ (st : LEX_STATE) : LEX_STATE = (
let	fun aux st =
		if next is_decor st
		then aux (collect st)
		else st;
in
	if next is_decor st
	then aux (collect st)
	else raise Unrecognised
end);
=TEX

\subsection{Recognition of Lexemes}
Function $rec\_ns\_lexeme$ picks off the next non-space lexeme from the input
using the other recognisers.
It raises $Unrecognised$ if the input is exhausted.
=SML
fun ⦏rec_ns_lexeme⦎ (st : LEX_STATE) : LEX_STATE = (
	rec_identifier st
		handle Unrecognised => (rec_punctuation st
		handle Unrecognised => (rec_number st
		handle Unrecognised => (rec_decor st
		handle Unrecognised => (rec_stub st
		handle Unrecognised =>
			fail "Z Lexical Analyser" 60008 []))))
);
=TEX
\subsection{Lexical Analyser for Strings}
$lex\_string$ converts an input string into a list of tokens.
=SML
fun ⦏lex_string⦎ (ip : string list) : Z_TOKEN list = (
	case skip_space (ip, Unknown) of
	([], _) => []
	|other => (
		case skip_space(rec_ns_lexeme other) of

		st' as (ip', Known s) => (
			case (classify s) of
			ZTId s' => (
				if is_decoration s'
				then (ZTDecor s')::lex_string ip'
				else case classify_number s' of
					Value zt => zt :: lex_string ip'
				|	Nil => (ZTId s')::lex_string ip'
			)| other => other :: lex_string ip'
		)|st' as (ip', Unknown) => (
			error
			"Z Lexical Analyser"
			60003
			[fn()=>	"Unrecognised input" ^ implode ip]
		)
		)
);
=TEX
\subsection{The Function $z\_lex$}
This is the lexical analyser function, visible via
the signature $ZLex$.
=SML
fun ⦏z_lex⦎ (ip : INPUT list) : Z_TOKEN list = (
	case ip of
		Text t :: (more1 as (String s::more2)) => (
			if	t = ""
			then	z_lex more1
			else if	String.sub(t, size t - 1) <> #"$"
			then	lex_string (explode t)
				@ z_lex more1
			else	lex_string (explode (substring(t, 0, size t - 1)))
				@ [ZTId (mk_dollar_quoted_string s)] @ z_lex more2
	) |	Text t :: more => (
			lex_string (explode t) @ z_lex more
	) |	String s :: more => (
			ZTString s :: z_lex more
	) |	Char s :: more => (
			if size s = 1
			then ZTChar s :: z_lex more
			else fail "Z Lexical Analyser" 60005  [fn () => s]
	) |	Type ty :: more => (
			fail "Z Lexical Analyser" 60003 [fn()=>"Unexpected antiquoted type"]
	) |	Term tm :: more => (
			ZTAqTm tm :: z_lex more
=SMLLITERAL
	) |	Separator s :: more => (
			case s of
			"├" => ZTSt::z_lex more
			|"─" => ZTIs::z_lex more
			|"═" => ZTBar::z_lex more
			|_ => error "Z Lexical Analyser" 60003 [fn()=>"Unknown Separator "^s]
=SML
	) |	Lex.Error n :: more => (fail "Z Lexical Analyser" 60006 [fn () => string_of_int n]
	) |	[] => [ZTEos]
);
=TEX
\section{EPILOGUE}

=SML
end; (* of structure Lex *)
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex
\end{document}

=IGN


ⓩa⌝;
ⓩa_3_4_4⌝;
ⓩabc_3⌝;
ⓩabc_3_a⌝;
ⓩabc⋎1⌝;
ⓩabc⋎1⋎s⌝;
ⓩabc⋎1x⋎s⌝;
ⓩ∀⋎α x⦁x''+ z⋎k * α?=45⌝;
ⓩa''+1⌝;
ⓩ∧⋎s⌝;
\section{FAILURES}

ⓩabc_3_⌝;
ⓩabc__3⌝;
ⓩ3_a⌝;
ⓩabc⋎↗x↕⌝;
ⓩ⋎⌝;
ⓩ↗⌝;
ⓩ↘⌝;
ⓩ↕⌝;
ⓩ⦂⌝;
ⓩ⨾⌝;
ⓩ⊢⌝;
ⓩℙ⌝;
ⓩ(⌝;
ⓩ((q = ⓜx⌝.2))⌝;

fun z s = ZLex.z_lex [Lex.Text s];

z ".1  ";
ⓩ⌜ⓩ(x, y)⌝⌝.1⌝;

rec_identifier (explode ".1)) ", Unknown);

■

=IGN
********************************************************************************
imp110.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp005.doc ℤ $Date: 2011/07/22 16:13:47 $ $Revision: 2.57 $ $RCSfile: imp110.doc,v $

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

\def\Title{File and Terminal Reader Writer}

\def\AbstractText{This document contains the reading and writing functions that form the outermost level of user interface for Release 1 of ICL HOL. These functions are concerned with the differentiation of the various languages (initially Standard ML and HOL), and the extensions to support pretty characters in Standard ML identifiers and in strings.}

\def\Reference{DS/FMU/IED/IMP005}

\def\Author{A.J. Hammon}


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
%% LaTeX2e port: % imp005.doc ℤ $Date: 2011/07/22 16:13:47 $ $Revision: 2.57 $ $RCSfile: imp110.doc,v $
%% LaTeX2e port: \documentstyle[11pt,TQ,hol1]{article}
%% LaTeX2e port: 
%% LaTeX2e port: \TPPtitle{File and Terminal Reader Writer}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP005}
%% LaTeX2e port: \def\SCCSissue{$Revision: 2.57 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSissue}
%% LaTeX2e port: 
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2011/07/22 16:13:47 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPproject{FST PROJECT}
%% LaTeX2e port: 
%% LaTeX2e port: =IGN
%% LaTeX2e port: 
%% LaTeX2e port: Commands to process this document in various ways.
%% LaTeX2e port: 
%% LaTeX2e port: make -f rel001.mkf imp005.dvi
%% LaTeX2e port: doctex imp005
%% LaTeX2e port: texdvi imp005
%% LaTeX2e port: bibtex imp005
%% LaTeX2e port: doctex imp005 ; texdvi imp005
%% LaTeX2e port: doctex imp005 ; texdvi imp005 ; bibtex imp005
%% LaTeX2e port: dvipage imp005 &
%% LaTeX2e port: 
%% LaTeX2e port: dviselect 31:   imp005.dvi | pstex -
%% LaTeX2e port: dviselect 16:30 imp005.dvi | pstex -
%% LaTeX2e port: dviselect  1:15 imp005.dvi | pstex -
%% LaTeX2e port: 
%% LaTeX2e port: 
%% LaTeX2e port: docsml imp005
%% LaTeX2e port: PolyML.use "imp005.sml";
%% LaTeX2e port: 
%% LaTeX2e port: abandon_reader_writer();
%% LaTeX2e port: 
%% LaTeX2e port: poly -r sun4hol.db
%% LaTeX2e port: poly -r /hat/projects/ied/rel001/sun4hol.db
%% LaTeX2e port: 
%% LaTeX2e port: 
%% LaTeX2e port: lasp -s imp005.doc > zz1
%% LaTeX2e port: lasp -s -u imp005.OKwords imp005.doc > zz1
%% LaTeX2e port: 
%% LaTeX2e port: =TEX
%% LaTeX2e port: \TPPproject{FST PROJECT}
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{SML Literate Script}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{A.J. Hammon & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the reading and writing functions
%% LaTeX2e port: 	that form the outermost level of user interface for Release~1
%% LaTeX2e port: 	of ICL~HOL.  These functions are concerned with the
%% LaTeX2e port: 	differentiation of the various languages (initially Standard~ML
%% LaTeX2e port: 	and HOL), and the extensions to support pretty characters in
%% LaTeX2e port: 	Standard~ML identifiers and in strings.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	Library
%% LaTeX2e port: }}
%% LaTeX2e port: 
%% LaTeX2e port: %\ftlinepenalty=9999
%% LaTeX2e port: \makeindex
%% LaTeX2e port: 
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: 
%% LaTeX2e port: \makeatletter
%% LaTeX2e port: 
\catcode`\_=\active
\def\_{\kern.06em\vbox{\hrule height.1ex width.3em}\hskip0.1em\relax}
%% LaTeX2e port: \makeatother
%% LaTeX2e port: 
%% LaTeX2e port: 
\def\Compiler{C{\tiny OMPILER}}
%% LaTeX2e port: 
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: 
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
%% LaTeX2e port: 
%% LaTeX2e port: \vfill
%% LaTeX2e port: \begin{center}
%% LaTeX2e port: \bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
%% LaTeX2e port: \end{center}

\begin{document}

\headsep=0mm
\FrontPage
\headsep=10mm

\setcounter{section}{-1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{DOCUMENT CONTROL}

%********************************************************************

\subsection{Contents List}
\tableofcontents
% \listoftables

%********************************************************************

\subsection{Document Cross References}

\bibliographystyle{fmu}
\bibliography{fmu}

%********************************************************************

\subsection{Changes History}

\begin{description}

\item[Issues 1.1 (1991/02/01) to 1.15 (1991/09/12) ] Initial drafts.

\item[13 September 1991, issue 2.1 ] First approved issue.

\item[20 January 1992, issue 2.2 ] Incorporate change of character set.

\item[28 January 1992, issue 2.3 ] Correction to character push back
	mechanism which could put characters in the wrong order.
	Add brackets to the inserted text for the start and end
	characters of named text.

\item [Issue 2.4 (1992/02/03), 3 February 1992 ]
	Added $diag\_$ material.

\item [Issue 2.5 (1992/02/06), 6 February 1992 ]
	Changed occurrence of $Lex.error$ to be $Lex.Error$ when
	constructing the string to be compiled. Also undid change re:
	brackets in issue 2.3, and made the fat turnstile, (pretty
	character -- BT), character generate a $Lex.Separator$ sequence.

\item [Issue 2.6 (1992/02/25), 21 February 1992 ]
	Removed code which prints error message 5521: ``Exception+
	?0 handled by use_terminal''.

\item[Issue 2.7 (1992/03/27), 27 March 1992 ]
	Fix missing percent in handling of percent keywords which
	have no extended character when they are used in HOL text.

\item[Issue 2.8 (1992/04/13), 13 April 1992 ]
	Fix loss of text in mal-formed keywords used in strings
		processed by function $translate_for_output$.
	{}
	Makes prompts user alterable control strings.
	Make $use\-\_terminal$ force a prompt if called when it is
		already active.

\item [Issue 2.9 (1992/04/14), 13th April 1992 ] Changes due to CR0017.

\item [Issue 2.10 (1992/05/15), 15 April 1992 ]
	Make the treatment of `{\tt Q}' characters consistent in
		uses, thus convert them to/from four-{\tt Q}'s
		in strings.

\item[Issues 2.11 (1992/06/01)-2.14 (1992/08/19)]
	Avoid using $PolyML.makestring$. {}
	Change keywords used for general quotations.
	Improve handler for $Io$ exception.


\item[Issue 2.15 (1993/07/09)]
	Added additional symbols as documented in \cite{DS/FMU/IED/DEF007}.

\item[Issue 2.16 (1993/07/12)]
	Remedied omission of `infty'.

\item[Issue 2.18 (1994/03/17)]
	Fixed bug which meant that specific readers were only recognised
	if the extended character rather than the keyword was used.

\item[Issue 2.19 (1996/02/28)]
	Changed to cope with version 3.0.1 of PolyML. Particular changes are:
	that Ctrl-D is no longer appropriate as an end of file marker - reading
	the empty string is the proper marker;
	that extended characters may not be sent to PolyML.compiler.

\item[Issues 2.20 (1996/03/19), 2.21 (1996/03/21), 2.22 (1996/03/22), 2.23 (1996/03/25)]
	Handling of Q's and percentage signs firmed up in $translate\_for\_output$.
\item[Issues 2.24 (1999/02/06)--2.27 (1999/03/13)]
	Port to NJML. The treatment of prompts is not as good as with Poly/ML.
	This could perhaps be fixed with more work. At present a ``secondary''
	or ``continuation'' prompt is not supported.

	The treatment of exceptions is tolerable but far from ideal.
\item[Issues 2.28 (1999/04/27),2.29 (1999/04/27)]
	lseq/rseq now supported as preferred synonyms for lchevron/rchevron.
\item[Issue 2.30 (2000/11/20)]
 	Added new symbols (real numbers, reverse implication, superset, strict
 	superset, and the full calligraphic alphabet).

\item[Issue 2.31 (2001/07/16)]
 	{\it get\_ML\_outermost} now returns a function that delivers characters
	to the compiler in small chunks. This seems to be much faster on large
	terms and paragraphs.
\item[Issues 2.32 (2001/12/02), 2.33 (2001/12/02)]
	Port back to Poly/ML.
\item[Issue 2.34 (2002/05/23)] To circumvent compiler inefficiencies with very long strings,
$Lex.Text$ items are now produced for each line of input in $get\_HOL\_any$.
\item[Issue 2.35 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.36 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 2.37 (2002/12/16)] Exposed the exception that $use_file$ and $use_terminal$ raise.
\item[Issue 2.38 (2004/01/19)] 𝕌 now has a pretty character.
\item[Issue 2.39 (2004/11/08), 2.40 (2004/11/10)] {\it use\_file} now handles `Q' in file names intuitively.
\item[Issue 2.41 (2005/05/12)] Added missing keyword for ``$\surd$''.
\item[Issue 2.42 (2005/09/09)] Added 𝔹 and 𝕊.
\item[Issue 2.43 (2005/09/16)] Added ℂ.
\item[Issue 2.44 (2005/12/06)] Added ↿ and ⊖.
\item[Issue 2.45 (2006/01/02)] Added ℚ.
\item[Issue 2.46 (2006/01/12)] Added ∘.
\item[Issue 2.47 (2006/08/09)] Added function to give the value of the {\em use\_extended\_chars} flag.
\item[Issues 2.48 (2008/02/03)--2.50 (2008/02/09)] Poly/ML 5.1 port.
\item[Issue 2.51 (2008/02/26)] Language name may now be attached to the left Quine corner with the ``down'' character.
\item[Issues 2.52 (2009/02/15), 2.53 (2009/02/15)] Now preserves newlines at the beginning of a named reader quotation (as it always
has for specific reader quotations).
\item[Issue 2.54 (2009/03/06)] Simplified {\em READER_ENV} type.
\item[Issue 2.55 (2009/03/22)] Experimental new idempotent encoding scheme for keywords allowing
the \verb"%Q%" keyword to be dropped.
`Q's are no longer treated specially in strings.
\item[Issue 2.56 (2009/03/24)] Backed out new encoding scheme pending more deisgn thinking.
\item[Issue 2.57 (2011/07/22)] Added the underlining brackets.
\item[Issue 2.58 (2011/08/07)] Added unary minus symbol for ISO Z visual compatibility.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2015/03/21]
First working version with support for UTF-8 input and output.
\item[2015/03/26]
Factored out common functions into Reader/Writer.
Added {\it use\_utf8\_string}.

\item[2015/04/17]
Ported to Lemma 1 document template.
\item[2019/08/25]
(\it find\_name} now constructs a PRETTY_NAME for any unicode hex literal even if not in te dictionary (but does not insert it), instead of failing if the literal does not match anything in the dictinary.
\item[2019/09/29]
Change the initial and default values of the flags {\it input\_in\_utf8} and {output\_in\_utf8} to be true if the value of shell variable PPCHARSET is "utf8" and otherwise false (at the time the default is re-instated).
\item[2019/09/29]
Change the initial and default values of the flags {\it input\_in\_utf8} and {output\_in\_utf8} to be false if the value of shell variable PPCHARSET is "ext" and otherwise true (at the time the default is re-instated).
%%%% END OF CHANGES HISTORY %%%%
\end{description}

%********************************************************************


\subsection{Changes Forecast} \label{ChangesForecast}

\begin{enumerate}

\item Properly install $use\-\_terminal$ as the outermost reader writer of
	the system.  This will include producing proper handling of the
	routines $PolyML.quit$ and $PolyML.commit$ together with the
	implicit calling of $PolyML.commit$ at end of input.

\item Consider removing the bracket handling routines in the basic
S	reader writer, they were needed for the HOL~88 style of anti
	quotation but seem unnecessary with the style now provided
	here.  However, how does the error recovery cope when there is
	less knowledge of the language structure?

\item The character class classification codes which (e.g.{}) test if a
	character is alphanumeric might be optimised to reduce the
	number of comparisons.

\end{enumerate}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newpage
\section{GENERAL}

%********************************************************************

\subsection{Scope}

This document contains the reading and writing routines for Release~1 of
the ICL HOL system, their detailed design is in~\cite{DS/FMU/IED/DTD005}.

%********************************************************************

\subsection{Introduction}

%--------------------------------------------------------------------

\subsubsection{Purpose and Background}

Two groups of routines are required.  First for the reading and writing
routines to support the extended character set and the embedded
languages described in~\cite{DS/FMU/IED/DEF002}.  Second, the routines
to allow new languages to be supported by the reader writer.

%--------------------------------------------------------------------

\subsubsection{Dependencies}

The implementation of this module is dependent upon the PolyML
compiler, in particular upon the routine $PolyML.compiler$ which gives
access to the compiler's read-evaluate-print loop.

The parser interface and the reader writer are mutually dependent.  The
reader writer in its macro processing role generates text that uses
items declared by the lexical analyser~\cite{ds/fmu/ied/dtd015}.  This
is further discussed in section~\ref{DatatypeForParserInterface} below.

%--------------------------------------------------------------------

%\subsubsection{Interface}

%A brief explanation of the external
%interface presented by the document.
%If the document is part of a prototyping exercise
%and contains one or more Standard ML structures
%then the signatures for these structures should go
%in this section if they are not given in a separate design document.

%--------------------------------------------------------------------

%\subsubsection{Algorithms}

%Introductory observations on any special
%algorithms or techniques used in the document.
%(This section is intended to augment, rather than
%substitute for, detailed discussion of particular
%functions in the rest of the document).
%This should contain references to books or
%external papers, if any, which a maintainer would need
%to read to understand the code.

%--------------------------------------------------------------------

%\subsubsection{Possible Enhancements}

%A discussion of ways the facilities
%offered by the document might be improved, e.g. an indication
%of possible performance bottle-necks.

%--------------------------------------------------------------------

%\subsubsection{Deficiencies}

%An indication of any shortcomings in the
%facilities offered by the document.

%--------------------------------------------------------------------

\subsubsection{Terminology}

The word `\Compiler' is used to denote the part of a Standard~ML system
that lexically analyses, parses, evaluates and formats for output
Standard~ML text.  The routine $PolyML.compiler$ is an example of a
`\Compiler'.

The `basic reader writer' supports reading and writing Standard~ML,
plus the interfaces to allow additional languages to be embedded.  It
is contained within structure $ReaderWriter$.

The `reader writer' includes the `basic reader writer' plus the reading
and writing functions for other languages which have been added via the
embedding interface in structure $ReaderWriterSupport$.

%--------------------------------------------------------------------

% \subsection{Deviations From Definition Document \protect{\cite{DS/FMU/IED/DEF002}}}

% Some changes are necessary to the ideas proposed
% in~\cite[issue~1.1]{DS/FMU/IED/DEF002}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newpage
\section{PRELUDE}

%********************************************************************

\subsection{Start of Basic Reader Writer}

The reader writer structure, $ReaderWriter$, contains only those values
that are required at top level, it is opened at the end of this file.
All of the reader writer routines are actually declared in the support
structure, $ReaderWriterSupport$, some of them are bound to names in
the reader writer structure.

=SMLPLAIN SML
structure ⦏ReaderWriterSupport⦎ : ReaderWriterSupport = struct
=TEX

%********************************************************************

\subsection{Integers and Strings}

The string representation of integers is needed in various places.
This is mainly to do with Standard~ML strings where some characters are
denoted by their decimal code in three digits, preceded by a
backslash.  Function $string_of_int3$ gives a three character with
leading zeros representation of small positive numbers.

=SMLPLAIN SML
fun ⦏string_of_int3⦎ (n:int) : string = (
	let
		val str = if n < 0 then "-****" else string_of_int n
	in
		case size str
		of 0 => "000"
		| 1 => "00" ^ str
		| 2 => "0" ^ str
		| 3 => str
		| x => fail "string_of_int3" 5040
			[fn () => string_of_int n]
	end
);
=TEX

Some strings are built up and passed on to $PolyML.compiler$, these
must be valid Standard~ML strings.  Function $to_ML_string$ converts
any string into a valid string.

=SMLPLAIN SML
fun ⦏to_ML_string⦎ (str:string) : string = (
let
	fun	aux (ch as " ") = ch
	|	aux (ch as "\n") = ch
	|	aux (ch as "\t") = ch
	|	aux ch = (
			if (ord ch >= 32 andalso ord ch <= 126)
			then ch
			else "\\" ^ (string_of_int3(ord ch)))
in
	implode(map aux (explode str))
end);
=TEX

A simple test for space characters.

=SMLPLAIN SML
fun ⦏is_white⦎ (str:string) : bool = (
		str = " "
	orelse	str = "\n"
	orelse	str = "\t"
	orelse	str = "\^L"
);
=TEX

%********************************************************************

\subsection{Warning Messages} \label{WarningMessages}

Based on the ideas in~\cite{DS/FMU/IED/DTD002}
and~\cite{DS/FMU/IED/IMP002}, these functions have the same set of
arguments as functions $error$ and $fail$, their purpose is to output the
warning message and then allow the calling function to continue.  It is
definitely not the $warn$ function discussed
in~\cite{DS/FMU/IED/DTD002} which prompts the user about continuing or
stopping.  This function provides a commentary on events as they
happen, it is intended to provide messages (1)~during the build and
extension of the tables of symbols, and (2)~messages about faults in
the users input which are detected by the reader writer.

=SMLPLAIN SML
fun ⦏local_warn⦎ (area : string) (id : int) (inserters : (unit -> string) list) : unit = (
	raw_diag_string(get_error_message 5531
		[string_of_int id, area, get_error_message id (map (fn f => f())inserters)]
	)
);
=TEX

=SMLPLAIN SML
fun ⦏local_error⦎ (area : string) (id : int) (inserters : (unit -> string) list) : unit = (
	raw_diag_string(get_error_message 5532
		[string_of_int id, area, get_error_message id (map (fn f => f())inserters)]
	)
);
=TEX

Details of warnings and errors are added to the generated text.

=SMLPLAIN SML
fun ⦏add_error_code⦎ (err_no:int, prev:string list) : string list = (
	" ERROR__" ^ (string_of_int err_no) ^ " " :: prev
);
=TEX

=SMLPLAIN SML
fun	⦏add_error_codes⦎ (nil:int list, prev:string list) : string list =
		prev
|	add_error_codes (err_nos, prev) = (
		fold add_error_code err_nos prev
);
=TEX

Some error messages require part of the left hand context of where they
are detected.

=SMLPLAIN SML
fun ⦏prev_context⦎ (num:int) (prev:string list) : string = (
let
	val part1 = rev(prev to num);
	val part2 =	if length prev > num
			then	" ... " :: part1
			else	part1
in
	implode part2
end
);
=TEX

%********************************************************************

\subsection{Reader Environment} \label{DeclareReaderEnv}

A record structure is used to contain the environment used when
reading, this is primarily the character reading functions to
accommodate the various sources of Standard~ML text discussed in
section~\ref{IclHolInterface}.  The record is properly described in
section~\ref{ReaderEnvironment}, but its definition is presented here
to enable its use within the table of pretty characters, in particular
its use within the datatype $NAME_CLASS$ of
section~\ref{DeclareNameClass}.

=SMLPLAIN SML
type ⦏READER_ENV⦎ = {
	⦏advance⦎			: unit -> string,
	⦏look_at_next⦎			: unit -> string,
	⦏push_back⦎			: string -> unit
};
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{PRETTY CHARACTERS}

The system supports pretty characters in the source documents and on
the printed output.  There are more characters available for output
than can be contained in the eight bit character set that is
available.  The additional pretty characters may be input by using a
keyword approach where the keywords are enclosed by percent
`{\tt\%}' characters.  Details of all of the keywords and the actual
pretty characters are included in a structure for use by other parts of
the reader writer.

To allow for the inclusion of other languages the structure is
extensible.  It is initialised with the characters and keywords to
support Standard~ML extended to allow pretty characters in identifiers
and strings.

=SMLPLAIN SML
structure ⦏PrettyNames⦎ = struct
=TEX

%********************************************************************

\subsection{Data Held for Pretty Characters}
\label{DataHeldForPrettyCharacters}

The class of each symbol is recorded.  Type $Simple$ is for those that
may be part of identifiers.  Type $Invalid$ are those that are always
invalid when found by the reader, these include the symbols understood
by the document processing programs~\cite{DS/FMU/IED/USR001} for
surrounding formal text which does not require processing by this
reader writer.  Type $Ignore$ is for symbols which are to be completely
ignored.

More complex types are needed for embedding other languages.  Symbols of
type $Starting$ and $Ending$ are used (as their name suggests) to start
and complete sections of embedded text, the strings are included as the
first and last characters in the generated text.  Type $Middle$ is used within
a section of embedded text.  Type $Starting$ gives the reader function
for the embedded language, it will perform a recursive descent analysis
(as described in section~\ref{ReaderWriter}) of the
next characters input.

\label{DeclareNameClass}

=SMLPLAIN SML
datatype ⦏NAME_CLASS⦎
	=	⦏Simple⦎
	|	⦏Ignore⦎
	|	⦏Invalid⦎
	|	⦏Starting⦎	of (READER_ENV -> (string * bool) -> string -> bool ->
					string list -> string list) * string
	|	⦏Middle⦎	of string
	|	⦏Ending⦎	of string
	;
=TEX

For each distinct symbol a tuple is held.  It contains: a list of the
alternative names for the symbol, with the preferred name at head; the
pretty character, if any; and, the class of the name i.e., where and
how it is used.

=SMLPLAIN SML
type ⦏PRETTY_NAME⦎ = ( string list * string OPT * NAME_CLASS );
=TEX

%********************************************************************

\subsection{Pretty Character Dictionary}
\label{PrettyCharacterDictionary}

The purpose of this data structure is to capture all of the names of
the symbols together with their pretty characters and attributes.  The
intention is that this table is fairly easy to understand and modify,
that the information about each symbol is given only once --- although
the generated data structure may replicate information.

A simple linear search through the table would be slow so the names and
characters are configured as efficient dictionaries, their contents
are provided later.

The dictionaries themselves are accessed only via insertion and
inspection functions.

=SMLPLAIN SML
local (* for add_new_symbols, find_name and find_char *)

val ⦏name_dict⦎	: PRETTY_NAME E_DICT ref = ref initial_e_dict;
val ⦏char_dict⦎		: PRETTY_NAME E_DICT ref = ref initial_e_dict;
=TEX

To insert values into these dictionaries the following routines are
provided.

Some of the entries for pretty characters are temporary, we do
not yet have the proper set of pretty characters.  To direct attention
to the characters which are not correctly handled details will be
obtained by examining the above list whilst the list produced remains
non-empty some characters need attention.
=TEX
We simulate the effect of the user adding the Unicode keyword form for each pretty character
using the following function.
It does no harm if the user actually does add the Unicode keyword form as well.
=SML
fun ⦏char_of_unicode_keyword⦎ (s : string) : (bool * string) OPT = (
	if	size s <> 7
	orelse	String.sub (s, 0) <> #"x"
	then	Nil
	else	case Unicode.fromString(substring(s, 1, 6)) of
			NONE => Nil
		|	SOME cp =>
				if	cp <= 0wx7f
				then	Nil
				else	case basic_unicode_to_pp cp of
						Value c => Value(true, (chr o SML97BasisLibrary.Char.ord) c)
					|	Nil => Value(false, s) 
);
=TEX
=SMLPLAIN SML
in (* local for add_new_symbols, find_name and find_char *)

fun ⦏add_new_symbols⦎ (pnl:PRETTY_NAME list) : unit = (
let
	fun add_name(pcd as (names, _, _) : PRETTY_NAME,
			dict : PRETTY_NAME E_DICT
			) : PRETTY_NAME E_DICT = (
	let
		fun ok_kw("Q"::"Q"::_) = false
		| ok_kw(_::t) = ok_kw t
		| ok_kw nil = true;

		fun aux(name, dict) = (
			if ok_kw(explode name)
			then (	(e_extend name pcd dict)
				handle E => divert E "e_extend" "add_new_symbols"
					5103 [fn () => name])
			else	(local_warn "add_new_symbols" 5100 [fn () => name]; dict)
		)
	in
		case names
		of nil => (local_warn "add_new_symbols" 5101 nil; dict)
		| _ => fold aux names dict
	end);

	fun add_char((_, Nil, _) : PRETTY_NAME, dict : PRETTY_NAME E_DICT
			) : PRETTY_NAME E_DICT = dict
	|   add_char(pcd as (names, Value ch, _), dict) = (
		if size ch = 1 andalso (ord ch > 127 orelse ch = "Q")
		then (
			(e_extend ch pcd dict)
			handle E => divert E "e_extend" "add_new_symbols"
				5104 [fn () => ch])
		else (	local_warn "add_new_symbols" 5102
				[fn () => ch, fn () =>
					"[" ^ format_list Combinators.I names ", " ^ "]"];
			dict)
	);

	val new_names = fold add_name pnl (!name_dict);
	val new_chars = fold add_char pnl (!char_dict);
in
	name_dict := new_names;
	char_dict := new_chars
end);
=TEX
=SMLPLAIN SML

fun ⦏find_char⦎ (char:string) : PRETTY_NAME OPT = (
	e_lookup char (!char_dict)
);


fun ⦏find_name⦎ (name:string) : PRETTY_NAME OPT = (
	case e_lookup name (!name_dict) of
		pn as Value _ => pn
	|	Nil => case char_of_unicode_keyword name of
				Value (true, c) => find_char c
			|	Value (false, s) => Value ([s], Nil, Simple)
			|	Nil => Nil
);

end  (*  of local for add_new_symbols, find_name and find_char *);
=TEX

%********************************************************************

\subsection{Symbol Comparison}

Two symbols may be compared to see if they represent the same symbol.
The actual test is that the extended character fields are the same and
that the list of keywords are the same.

=SMLPLAIN SML
local
	fun find s = case find_char s of Nil => find_name s | x => x;
in
fun ⦏is_same_symbol⦎ (s1 : string, s2 : string) : bool = (
	s1 = s2
	orelse
		case (find s1, find s2)
		of (Value (s1names, s1char, _), Value (s2names, s2char, _)) =>
			s1names = s2names andalso s1char = s2char
		| _ => false
)
end;
=TEX

%********************************************************************

\subsection{Initial Set of Symbols}

The basic set of symbols are those available for all languages,
including Standard~ML, they are the Greek letters, the mathematical
symbols and a few specials used in forming identifiers.

=SMLPLAIN SML
local (* for raw_symbol_names *)

val ⦏raw_symbol_names⦎ : PRETTY_NAME list = [
=TEX

The first group of symbols are for the Greek letters.


{\ftlinepenalty=9999
=SMLLITERAL
	([	"Delta"],	Value "Δ",			Simple),
	([	"Gamma"],	Value "Γ",			Simple),
	([	"Lambda"],	Value "Λ",			Simple),
	([	"Omega"],	Value "Ω",			Simple),
	([	"Phi"],		Value "Φ",			Simple),
	([	"Pi"],		Value "Π",			Simple),
	([	"Psi"],		Value "Ψ",			Simple),
	([	"Sigma"],	Value "Σ",			Simple),
	([	"Theta"],	Value "Θ",			Simple),
	([	"Upsilon"],	Value "Υ",			Simple),
	([	"Xi"],		Value "Ξ",			Simple),
	([	"alpha"],	Value "α",			Simple),
	([	"beta"],	Value "β",			Simple),
	([	"chi"],		Value "χ",			Simple),
	([	"delta"],	Value "δ",			Simple),
	([	"select",
		"epsilon"],	Value "ε",			Simple),
	([	"eta"],		Value "η",			Simple),
	([	"gamma"],	Value "γ",			Simple),
	([	"iota"],		Value "ι",			Simple),
	([	"kappa"],	Value "κ",			Simple),
	([	"fn",
		"lambda"],	Value "λ",			Simple),
	([	"mu"],		Value "μ",			Simple),
	([	"nu"],		Value "ν",			Simple),
	([	"omega"],	Value "ω",			Simple),
	([	"phi"],		Value "φ",			Simple),
	([	"pi"],		Value "π",			Simple),
	([	"psi"],		Value "ψ",			Simple),
	([	"rho"],		Value "ρ",			Simple),
	([	"sigma"],	Value "σ",			Simple),
	([	"tau"],		Value "τ",			Simple),
	([	"theta"],	Value "θ",			Simple),
	([	"upsilon"],	Value "υ",			Simple),
	([	"xi"],		Value "ξ",			Simple),
	([	"zeta"],	Value "ζ",			Simple),
=TEX
}

Calligraphic alphabet.

{\ftlinepenalty=9999
=SMLLITERAL
	([	"calA"],	Nil,				Simple),
	([	"calB"],	Nil,				Simple),
	([	"calC"],	Nil,				Simple),
	([	"calD"],	Nil,				Simple),
	([	"calE"],	Nil,				Simple),
	([	"calF"],	Nil,				Simple),
	([	"calG"],	Nil,				Simple),
	([	"calH"],	Nil,				Simple),
	([	"calI"],		Nil,				Simple),
	([	"calJ"],	Nil,				Simple),
	([	"calK"],	Nil,				Simple),
	([	"calL"],	Nil,				Simple),
	([	"calM"],	Nil,				Simple),
	([	"calN"],	Nil,				Simple),
	([	"calO"],	Nil,				Simple),
	([	"calP"],	Nil,				Simple),
	([	"calQ"],	Nil,				Simple),
	([	"calR"],	Nil,				Simple),
	([	"calS"],	Nil,				Simple),
	([	"calT"],	Nil,				Simple),
	([	"calU"],	Nil,				Simple),
	([	"calV"],	Nil,				Simple),
	([	"calW"],	Nil,				Simple),
	([	"calX"],	Nil,				Simple),
	([	"calY"],	Nil,				Simple),
	([	"calZ"],	Nil,				Simple),
=TEX
}


Blackboard bold alphabet.

{\ftlinepenalty=9999
=SMLLITERAL
	([	"bbA"],	Nil,				Simple),
	([	"boolean",
		"bbB"],	Value "𝔹",				Simple),
	([	"complex",
		"bbC"],	Value "ℂ",				Simple),
	([	"bbD"],	Nil,				Simple),
	([	"bbE"],	Nil,				Simple),
	([	"fset",
		"bbF"],	Value "𝔽",			Simple),
	([	"bbG"],	Nil,				Simple),
	([	"bbH"],	Nil,				Simple),
	([	"bbI"],	Nil,				Simple),
	([	"bbJ"],	Nil,				Simple),
	([	"bbK"],	Nil,				Simple),
	([	"bbL"],	Nil,				Simple),
	([	"bbM"],	Nil,				Simple),
	([	"nat",
		"bbN"],	Value "ℕ",			Simple),
	([	"bbO"],	Nil,				Simple),
	([	"pset",
		"bbP"],	Value "ℙ",			Simple),
	([	"rat",
		"bbQ"],	Value "ℚ",			Simple),
	([	"real",
		"bbR"],	Value "ℝ",			Simple),
	([	"symbol",
		"bbS"],	Value "𝕊",				Simple),
	([	"bbT"],	Nil,				Simple),
	([	"bbU",
		"u"],	Value "𝕌",				Simple),
	([	"bbV"],	Nil,				Simple),
	([	"bbW"],	Nil,				Simple),
	([	"bbX"],	Nil,				Simple),
	([	"bbY"],	Nil,				Simple),
	([	"int",
		"bbZ"],	Value "ℤ",			Simple),
=TEX
}


Maths symbols.

{\ftlinepenalty=9999
=SMLLITERAL
	([	"spot",
		"=>"],		Value "⦁",			Simple),
	([	"and"],		Value "∧",			Simple),
	([	"bagunion"],	Value "⊎",			Simple),
	([	"bigcolon"],	Value "⦂",			Simple),
	([	"bij"],		Value "⤖",			Simple),
	([	"bottom"],	Value "⊥",			Simple),
	([	"cat"],		Value "⁀",			Simple),
	([	"def"],		Value "≜",			Simple),
	([	"dintersect"],	Value "⋂",			Simple),
	([	"dres"],	Value "◁",			Simple),
	([	"dsub"],	Value "⩤",			Simple),
	([	"dunion"],	Value "⋃",			Simple),
	([	"emptyset"],	Value "∅",			Simple),
	([	"equiv"],	Value "⇔",			Simple),
	([	"exists"],	Value "∃",			Simple),
	([	"extract"],	Value "↿",			Simple),
	([	"fcomp",
		"circ"],	Value "∘",			Simple),
	([	"ffun"],	Value "⇻",			Simple),
	([	"filter"],	Value "↾",			Simple),
	([	"finj"],		Value "⤕",			Simple),
	([	"forall"],	Value "∀",			Simple),
	([	"fun"],		Value "→",			Simple),
	([	"geq"],		Value "≥",			Simple),
	([	"implies"],	Value "⇒",			Simple),
	([	"Leftarrow"],	Value "⇐",			Simple),
	([	"inj"],		Value "↣",			Simple),
	([	"intersect"],	Value "∩",			Simple),
	([	"lbag"],		Value "⟦",			Simple),
	([	"leq"],		Value "≤",			Simple),
	([	"lrelimg"],	Value "⦇",			Simple),
	([	"lseq",
		"lchevron"],		Value "⟨",			Simple),
	([	"map"],	Value "↦",			Simple),
	([	"mem"],	Value "∈",			Simple),
	([	"neq"],		Value "≠",			Simple),
	([	"not"],		Value "¬",			Simple),
	([	"notmem"],	Value "∉",			Simple),
	([	"or"],		Value "∨",			Simple),
	([	"overwrite"],	Value "⊕",			Simple),
	([	"pfun"],	Value "⇸",			Simple),
	([	"pinj"],	Value "⤔",			Simple),
	([	"psubset"],	Value "⊂",			Simple),
 	([	"psupset"],	Value "⊃",			Simple),
	([	"psurj"],	Value "⤀",			Simple),
	([	"rbag"],	Value "⟧",			Simple),
	([	"rcomp"],	Value "⨾",			Simple),
	([	"rel"],		Value "↔",			Simple),
	([	"rrelimg"],	Value "⦈",			Simple),
	([	"rres"],		Value "▷",			Simple),
	([	"rseq",
		"rchevron"],	Value "⟩",			Simple),
	([	"rsub"],	Value "⩥",			Simple),
	([	"subset"],	Value "⊆",			Simple),
 	([	"supset"],	Value "⊇",			Simple),
	([	"surj"],	Value "↠",			Simple),
	([	"symdiff"],	Value "⊖",			Simple),
	([	"thm"],		Value "⊢",			Simple),
	([	"union"],	Value "∪",			Simple),
	([	"uminus"],	Value "﹣",			Simple),
	([	"x"],		Value "×",			Simple),
=TEX
}

The letter ``{\tt Q}'' is specially treated in several places.  The
writer, via function $translate_for_output$, converts unexpected letter
``{\tt Q}''s into uses of the keyword ``{\tt \%Q\%}'', see
section~\ref{WriterFunction}. For output the string ``{\tt \%Q\%}'' should
be ``{\tt \%\%\%Q\%\%\%}'', but for input Q is a keyword, as below.

=SMLLITERAL
	([	"Q"],	Value "Q",			Simple),
=TEX

Some symbols are just ignored.

=SMLLITERAL
	([	"BH"],	Value "─",			Ignore),
	([	"BHH"],	Value "═",			Ignore),
	([	"BV"],	Value "│",			Ignore),
=TEX

Several symbols are provided for use with identifiers.

=SMLLITERAL
	([	"down"],	Value "⋎",			Simple),
	([	"up"],		Value "⋏",			Simple),

	([	"uptext"],		Value "↗",			Simple),
	([	"dntext"],		Value "↘",			Simple),
	([	"cantext"],		Value "↕",			Simple),

	([	"ulbegin"],		Value "⨽",			Simple),
	([	"ulend"],		Value "⨼",			Simple),

	([	"SX"],		Value "⦏",			Ignore),
	([	"EX"],		Value "⦎",			Ignore)
]
=TEX

Add the symbols into the dictionary.

=SMLPLAIN SML
in (* local for raw_symbol_names *)

val _ = add_new_symbols raw_symbol_names;

end (* of local for raw_symbol_names *);
end (* of structure PrettyNames *);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{READER WRITER}
\label{ReaderWriter}

The task of the reader and writer is to read text presented to the
system, determining which parts are Standard~ML and which are in
an embedded language such as HOL.
Both may include pretty characters and keywords denoting pretty
characters or other symbols.  The Standard~ML text is modified
according to the nature of the pretty characters.

The basis of the reader writer is a recursive descent parser that
understands part of the structure of Standard~ML, similarly the readers for
embedded languages need to understand part of the structure of their language.
At first sight this seems overkill, but it is required so that (for
example) string literals and comments can be properly
delimited.  Both Standard~ML and HOL may include any character within
string literals and comments, thus the reader must recognise the
context of use of all characters, it must therefore understand a
considerable part of both languages.

The rules for the code of the recursive descent parser are as follows.
The main recursive function take as an argument the characters parsed
and processed already, i.e., the characters to the left of the item to
be matched by the called routine, this is called the ``left hand
context''.  The most recently read character is
the first character of the item handled by the called routine.  This
character is passed as an argument to some routines.  A routine is only
called when it is appropriate.  When called the routine must read all
the characters that are part of the input item it handles.  If the
parse is successful it returns with the new left hand
context.  If unsuccessful it calls $fail$ to report the
error.  On both types of exit the first unread character is the
character that does not belong to the text already parsed.

For efficiency reasons the characters parsed and processed already are
held as a list of strings with the most recently parsed item at the
head of the list.  (A first attempt at the type of this argument might
be a single string with text added to the right, however, string
concatenation is thought to be inefficient.)  To create the string
passed to the \Compiler{} the function ``$fn\;A=> implode(rev\;A)$''
is applied to the list.

%********************************************************************

\subsection{Recursive Descent Parser}

%--------------------------------------------------------------------

\subsubsection{Reader Environment}
\label{ReaderEnvironment}

Routines are required for reading characters, for giving a one
character lookahead, and for ``unreading'' characters (i.e., returning
characters to the input stream so they will be read again).  These
routines are considered to be the ``readers environment''.

At all stages during parsing the work can be seen as follows.  Of the
input text there is the ``portion already read'', the ``current
character'' and the ``unread portion''.  The ``portion already read''
will have been recorded (after some modifications) in $prev$, the
left hand context, which is
one of the arguments of many of the parsing routines.  The
``current-character'' will be under processing by one of the recursive
descent functions.  The first character of the ``unread-portion'' is
called the next character.  At may stages there will be no current
character, it will have been fully processed and added into the
left hand context.

Function $advance$ is used when the caller has properly dealt with the
current character, it reads a character and returns its value.
Function $look_at_next$ does a one character lookahead and returns the
value of that next character.  Function $skip_and_look_at_next$
combines the above, it reads one character and discards its value, it
then does a one character lookahead and returns the value of that next
character.
=SML
fun ⦏skip_and_look_at_next⦎
	(env : READER_ENV)
	((): unit) : string = (
	let	val _ = #advance env ();
	in	#look_at_next env ()
	end
);
=TEX
After end of file all the reading routines return the character control-D, decimal
code~4, whenever called.  For resilience of the code during testing the
routines signal a fault if they return an excessive number of control-D
characters, this is shown in section~\ref{ExcessiveControlDs}.

Function $push_back$ adds its argument to the ``unread portion'' of the
input text.
Note the order of pushing back the characters: the rightmost character is
pushed back first so that the string will be read again in the correct
order.

The routines are placed in a record which is passed through the various
routines of the lexical analyser.  The record, with the Standard~ML
type name $READER_ENV$, is declared in section~\ref{DeclareReaderEnv}.

Associated with the reader functions is the exception $TooManyReadEmpties$
which is raised when the parser has read the end of the file and
has passed the end of file character at least 100 times to the \Compiler.
Raising this exception signifies that the PolyML.conmpiler function has failed
to stop reading on being given an empty string (it may try more than once),
and probably a Design Error.

=SMLPLAIN SML
exception ⦏TooManyReadEmpties⦎;
=TEX

%--------------------------------------------------------------------

\subsubsection{Comments}

Comments are skipped over.  Comments are sequences of characters within
which the comment braces `{\tt (*}' and `{\tt *)}' are properly
balanced.  This routine is entered when the opening round bracket of
the comment has been read, the opening asterisk is the first unread
character.
The entire comment is skipped leaving the first character after the
comment as the first unread character.

Standard~ML comments separate items, see~\cite[section~2.5]{Milner90},
thus the caller of $skip_comment$ must arrange to replace the comment
with an suitable separation.

=SMLPLAIN SML
fun ⦏skip_comment⦎ (R:READER_ENV) : unit = (
let
	fun aux (skip:bool) (depth:int) : unit = (
		if skip then (#advance R (); ()) else ();
		case #look_at_next R ()
		of "(" =>	if skip_and_look_at_next R () = "*"
				then	aux true (depth+1)
				else	aux false depth
		|  "*" =>	if skip_and_look_at_next R () = ")"
				then
					(#advance R ();
					if depth = 1
					then	()
					else	aux false (depth-1))
				else	aux false depth
		|  "" =>	fail "skip_comment" 5001 nil
		|  _   =>	aux true depth
	)
in
	aux true 1
end);
=TEX

%--------------------------------------------------------------------

\subsubsection{Percent Keywords}

Gather the characters of a percent keyword.  On entry the opening
`{\tt\%}' is the next character.  The returned tuple contains the
following values.

\begin{itemize}

\item The characters of the keyword, without the enclosing percents.

\item The additional information found from looking up the keyword, or
	$Nil$ for an unknown or empty keyword.

\item A flag set true for a keyword with a closing percent sign, which
	will have been read.

\end{itemize}

Note that for an input of two adjacent percent signs this routine
returns the value ``$("", false, true)$''.

This routine is a little different to the others in that it needs to do
a multi-character look-ahead to gather the whole name to know how to
treat the name and the enclosing `{\tt\%}' characters, whereas the rest
of the system only needs one-character look-ahead.

=SMLPLAIN SML
fun ⦏is_special_char⦎ ch = (
	contains ["!", "&", "$", "#", "+", "-", "/", ":", "<", "=", ">",
		"?", "@", "\\", "~", "'", "^", "|", "*"] ch
);
=TEX

=SMLPLAIN SML
fun ⦏get_percent_name⦎ (R:READER_ENV)
		: (string * PrettyNames.PRETTY_NAME OPT * bool) = (
	let
		fun is_alphanumeric ch = (
				(ch >= "a" andalso ch <= "z")
			orelse	(ch >= "A" andalso ch <= "Z")
			orelse	(ch >= "0" andalso ch <= "9")
		);

		fun collect_alphanumeric next = (
			if is_alphanumeric next
			then	next ^ (collect_alphanumeric(skip_and_look_at_next R ()))
			else	""
		);

		fun collect_specials next = (
			if is_special_char next
			then	next ^ (collect_specials(skip_and_look_at_next R ()))
			else	""
		);

		val next = skip_and_look_at_next R ();

		val name =
			case collect_alphanumeric next
			of ""	=> collect_specials next
			| n	=> n;

		val is_closed =
			if #look_at_next R () = "%"
			then	(#advance R (); true)
			else	false
	in
		(name, PrettyNames.find_name name, is_closed)
	end
);
=TEX

%--------------------------------------------------------------------

\subsubsection{Reading Logical Characters}

In some parts of the reader writer we are interested in reading the
next ``logical'' character rather than the next real character of the
input.  By ``logical'' we mean that percent keywords have been read and
their status found, similarly the status of extended characters is
found.  Function $read_symbol$ achieves this task.  It returns a value
of type $SYMBOL$.

Note that function $read_symbol$ actually reads the symbol, it is thus
not appropriate for those cases where lookahead is needed --- although
a combination of $read_symbol$ and $push_back$ (see
section~\ref{DeclareReaderEnv}) may be used.  For example, function
$get_ML_any$ uses closing brackets to indicate the completion of the
text it should gather, it leaves the closing bracket unread so that its
caller may read the bracket.

=SMLPLAIN SML
datatype ⦏SYMBOL⦎
	=	⦏SymCharacter⦎	of	string
	|	⦏SymWhite⦎		of	string list
	|	⦏SymKnown⦎		of	string
						* bool (* true => keyword *)
						* PrettyNames.PRETTY_NAME
	|	⦏SymUnknownKw⦎	of	string
						* bool (* true => has closing percent *)
	|	⦏SymUnknownChar⦎	of	string
	|	⦏SymDoublePercent⦎
	|	⦏SymEndOfInput⦎
	;
=TEX

The meanings of the constructors of this type are as follows.

\begin{description}
\def\ITEM#1{\item[$#1$ ]}

\ITEM{SymWhite} One or more formatting characters, these are in the
	reverse order that they occured in the source file.

\ITEM{SymKnown} An extended character or a keyword has been recognised
	in the pretty character tables.  The string holds the character
	or the keyword without its enclosing percent signs.  The bool
	is true for a keyword, false for an extended character.  The
	final value is the entry in the pretty character tables.

\ITEM{SymUnknownKw} A keyword that is not known, or has no closing
	percent sign, has been read.  The bool is true if a closing
	percent sign was found.

\ITEM{SymUnknownChar} An extended character that is not known in the
	pretty character tables was found.

\ITEM{SymDoublePercent} Two adjacent percent signs were found.

\ITEM{SymCharacter} A single character that is not covered by the above
	was found.  The character value is less than decimal~128.
\ITEM{SymEndOfInput} End of Input seen.

\end{description}

=SMLPLAIN SML
fun ⦏read_symbol⦎ (R:READER_ENV) : SYMBOL = (
let
	fun formatters next =
	let
		fun aux prev next =
			if is_white next
			then	aux (next::prev) (skip_and_look_at_next R ())
			else	prev;
	in
		SymWhite(aux nil next)
	end;

	val next = #look_at_next R ()
in
	if next = "%"
	then
			(	case get_percent_name R
				of (kw, Value info, true) => SymKnown(kw, true, info)
				| (kw, Value info, false) => SymUnknownKw(kw, false)
				| ("", Nil, true) => SymDoublePercent
				| (kw, Nil, is_closed) => SymUnknownKw(kw, is_closed)
			)
	else	if is_white next
		then	formatters next
		else if next =""
		     then SymEndOfInput
		     else let
				val ch = #advance R ();
				val ord_ch = ord ch
			in
				if ord_ch > 127
				then	case PrettyNames.find_char ch
					of Value info => SymKnown(ch, false, info)
					|  Nil	=> SymUnknownChar ch
				else
					SymCharacter ch
			end
end);
=TEX

The textual form of a symbol is wanted for some purposes.

=SMLPLAIN SML
fun	⦏expand_symbol⦎((SymCharacter ch):SYMBOL) : string	= ch
|	expand_symbol(SymWhite wh)				= implode(rev wh)
|	expand_symbol(SymKnown(sym, true, info))		= "%" ^ sym ^ "%"
|	expand_symbol(SymKnown(sym, false, info))		= sym
|	expand_symbol(SymUnknownKw(sym, true))		= "%" ^ sym ^ "%"
|	expand_symbol(SymUnknownKw(sym, false))		= "%" ^ sym
|	expand_symbol(SymUnknownChar ch)			= ch
|	expand_symbol(SymDoublePercent)			= "%%"
|	expand_symbol(SymEndOfInput)				= ""
;
=TEX

%--------------------------------------------------------------------

\subsubsection{Strings}

Strings start and finish with a `~{\tt"}~' and contain a
mixture of characters and escape sequences.  Some escape sequences are
used in formatting the source text, others denote particular
characters.  Most of the understanding and validating of strings, and
in particular the escape sequences, can be left to the \Compiler, here
the concern is finding the end of the string, and converting pretty
characters into a form acceptable to the \Compiler.  In finding the end
of the string the escape sequence that allows strings to be laid out
neatly must be recognised.  The strings \verb*|"ab\"c\   \de\\f"| and
\verb*|"ab\"cde\\f"| are the same, as are the strings \verb*|"ab\  \"|
and \verb*|"ab"|, they only differ by the use of the formatting
characters.  Note the \verb*|\"| in the second example which must not
be interpreted as an escaped double quote.

Within a string an escape followed by one or more formatting characters
and another escape may be ignored.  Non formatting characters are not
allowed.  The full set of allowed characters is implementation
dependent, but includes, quoting from~\cite[section~2.1]{Milner90},
``$\ldots$ at least space, tab, newline and formfeed.''  These four
characters will be skipped by the lexical analyser here, any other
characters will be passed on to the \Compiler, as if they were escaped
formatting characters.

Local function $skip_format_chars$ is first entered with a formatting
character as the first unread character, it reads characters until a
closing escape character which it reads leaving the next character as
the first character after the whole escape sequence.  Any other
characters found between the escape characters are retained for
processing by the \Compiler which may consider some characters above the
minimum set of four as formatting characters.

On entry to $handle_escape$ the opening escape character has been read,
but not the character being escaped.

A variation on strings allows single left-hand primes~(~{\tt`}~) to
enclose the body of the string.  The escape conventions are altered,
swapping the interpretations of the single~(~{\tt`}~) and
double~(~{\tt"}~) prime characters.  Function $get_primed_string$ deals
with these strings.

=SMLPLAIN SML
local (* for get_ML_string and get_primed_string *)

fun ⦏handle_escape⦎ (ML_string:bool) (R:READER_ENV) : string = (
let
	fun skip_format_chars (prev:string) : string = (
		case skip_and_look_at_next R ()
		of "\\"		=> (#advance R (); prev)
		|  ""		=> prev
		|  s		=> skip_format_chars (
			if is_white s
			then	prev
			else	prev ^ s)
	);

	val next = #look_at_next R ()
in
	if is_white next
	then
		case skip_format_chars ""
		of	""	=> ""
		|	x	=> ("\\ " ^ x ^ " \\")
	else if next = "`"  andalso not ML_string
	then
		#advance R ()
	else
		("\\" ^ (#advance R ()))
end);
=TEX

Most of the work of gathering strings is just reading and concatenating
the characters, they are of five classes: end of string, end of file,
pretty, escaped
and others.  Function $string_body$ is first called with
the first character of the string being the first unread character.

There are several places in the Standard~ML code where double quotes or
brackets are used within strings, in some of them the quotes or
brackets do not balance.  Whilst this is the intended Standard~ML code
it confuses some other processes, particularly the quote and bracket
matching code in editors, and the mechanisms used to display double
quotes on paper.  To avoid these problems Standard~ML comments
containing the `missing' characters are added, these comments are in a
standard form, ``{\tt(*=}x{\tt=*)}'' where ``x'' is the missing
characters.  The first example of one of these comments is a
missing double quote in function $string_body$.

An end of file found in the string indicates that there is no more
input available, and so an immediate exit (via function $fail$) is
taken.  All other errors detected in strings are reported as found (via
function $local_error$) and have their numbers passed back to the
caller.

=SMLPLAIN SML
fun ⦏string_body⦎ (ML_string:bool) (R:READER_ENV) (prev:string list, preverrs:int list)
			: (string list * int list) = (
	case read_symbol R
	of SymCharacter ch => (
		case ch
		of "\"" =>	(*="=*)
				if ML_string
				then	("\"" (*="=*) :: prev, preverrs)
				else	string_body ML_string R
						("\\\"" (*="=*) :: prev, preverrs)
		| "`" =>	if ML_string
				then	string_body ML_string R ("`"::prev, preverrs)
				else	("\"" (*="=*) :: prev, preverrs)
		|  "\\"	=>	string_body ML_string R
					((handle_escape ML_string R) :: prev, preverrs)
		|  "Q" =>	string_body ML_string R ("QQQQ"::prev, preverrs)
		|  _ =>		string_body ML_string R (ch::prev, preverrs)
		)
	| SymEndOfInput => fail "string_body" 5002 nil
	| SymDoublePercent => string_body ML_string R ("%" :: prev, preverrs)
	| SymWhite wh => (	if contains wh "\n"
				then
					(	local_error "string_body" 5014 [fn () =>
							prev_context 20 prev];
						((if ML_string
						then "5014\"" (*="=*)
						else "5014'") :: prev, 5014 :: preverrs)
					)
				else
					string_body ML_string R (wh@prev, preverrs))
	| SymKnown(_, _, info) =>
				string_body ML_string R ((
					case info
					of (_, Value ch, _) => "\\" ^ string_of_int3(ord ch)
					| (names,_,Simple) => "%" ^ (hd names) ^ "%"
				) :: prev, preverrs)
	| SymUnknownKw(sym, _) => (
				local_error "string_body" 5003 [fn () => sym, fn () =>
					prev_context 20 prev];
				string_body ML_string R  (" 5003 " :: prev, 5003 :: preverrs))
	| SymUnknownChar ch =>
				string_body ML_string R
					(("\\" ^ string_of_int3(ord ch))::prev, preverrs)
);
=TEX

The result from $string_body$ is a sequence of mainly one-character
strings, it seems appropriate to convert it to one long string at this
stage rather than retaining the space overhead until the whole input
text is formed.  Functions $get_\ldots_string$ are called with the opening
string quote having been read.

=SMLPLAIN SML
fun ⦏get_any_string⦎ (ML_string:bool) (R:READER_ENV) (prev:string list)
		: string list * int list = (
let
	val (str, errs) = string_body ML_string R (["\"" (*="=*)], nil)
in
	([implode(rev str)] @ prev, errs)
end);

in (* local for get_ML_string and get_primed_string *)

fun ⦏get_ML_string⦎ (R:READER_ENV) (prev:string list) : string list * int list =
	get_any_string true R prev;

fun ⦏get_primed_string⦎ (R:READER_ENV) (prev:string list) : string list * int list =
	get_any_string false R prev;

end (* of local for get_ML_string and get_primed_string *);
=TEX

%--------------------------------------------------------------------

\subsubsection{Bracketed Text}

Gathering bracketed text is required in many languages.  The basic idea
of these routines is to gather some bracketed text.  The value returned
comprises both brackets plus all the text they enclose, or if the
opening bracket was a start-of-comment then return nothing (i.e., an
empty list).

Text enclosed by round brackets may be comment or nested Standard~ML text.
The opening round bracket has been read, so the next character indicates
how to process the bracket.

Gathering nested text enclosed by braces (i.e., by the characters
`\verb|( ) { } [ ]|') uses a general routine for bracketed text.

=SMLPLAIN SML
fun ⦏get_round_braces⦎ (get : READER_ENV -> string list -> string list)
		(R:READER_ENV) (prev:string list) : string list = (
	if #look_at_next R () = "*"
	then
		(skip_comment R; " " :: prev)
	else
		get_braces get R prev "(" ")"
)

and ⦏get_box_braces⦎ (get : READER_ENV -> string list -> string list)
		(R:READER_ENV) (prev:string list) : string list = (
	get_braces get R prev "[" "]"
)

and ⦏get_curly_braces⦎ (get : READER_ENV -> string list -> string list)
		(R:READER_ENV) (prev:string list) : string list = (
	get_braces get R prev "{" "}"
)
=TEX

In the general routine for gathering bracketed text the next character
is the first character within the bracketed expression.  The opening
bracket for the expression is $first$, the closing bracket should be
$term$.  This routine differs from the general rules for the recursive
descent in that it does not pass $prev$ to the routines it calls, this
is needed to allow the detection of terminating braces, when the call
of $get$ will return an empty list.

An unexpected type of closing brace is reported\footnote{The error
message might be deleted in the future.} with a error message, and
then added to the returned string, leaving the real error reporting to
the \Compiler.

=SMLPLAIN SML
and ⦏get_braces⦎ (get : READER_ENV -> string list -> string list)
		(R:READER_ENV) (prev1:string list) (first:string) (term:string) : string list = (
let
	fun more prev2 = (
		case get R nil
		of nil =>	let
					val next = #look_at_next R ()
				in
					if next = term
					then	(#advance R ()) :: prev2
					else if next = ""
					then	prev2
					else (	local_error "get_braces" 5008 [
							fn () => next, fn () => first];
						(if contains ["]", "}", ")"] next
						then [#advance R ()]
						else nil) @ (add_error_code(5008, prev2)))
				end
		| [""] =>	(#advance R ()) :: prev2
		| new =>	more(new @ prev2)
	)
in
	(more [first]) @ prev1
end);
=TEX

%--------------------------------------------------------------------

\subsubsection{Main Parser Function}

Function $get_ML_any$ is the main parser function.  It reads upto the
first semi colon `{\tt;}', closing bracket or ending keyword and then
returns the text read.  A semi colon will be read and added to the
returned text, a closing bracket or ending keyword is left unread for
the calling routine.  The syntax
error where too many closing bracket are presented must be resolved by
the outermost routine that calls this function.  The
routines that handle text which may include semi colons, essentially
those dealing with brackets, should repeatedly call $get_ML_any$ until
the appropriate end of text is found.

Some characters are used to indicate that $get_ML_any$ should return to
its caller leaving that character unread, so that the caller may
examine it further.  Most characters are actually read by this routine,
or by those it calls.  This distinction leads to the nesting of the
case expressions below.

{\ftlinepenalty=9999
=SMLPLAIN SML
fun ⦏get_ML_any⦎ (R:READER_ENV) (prev:string list) : string list= (
let
	open PrettyNames;

	fun	do_keyword _ (names,_,Simple) p =
			if (hd names = "Q")
			then get_ML_any R ("Q"::p)
			else get_ML_any R ("QQ"^(hd names)^"QQ"::p)
	|	do_keyword k (_,_,(Starting(proc, str))) p = proc R k str true p
	|	do_keyword _ (_,_,Middle str) p = get_ML_any R (str :: p)
	|	do_keyword (k, is_keyword) (_,_,Ending _) p =
			(#push_back R (if is_keyword then "%" ^ k ^ "%" else k); p)
	|	do_keyword _ (_,_,Ignore) p = get_ML_any R p
	|	do_keyword (k, is_keyword) (names,_,Invalid) p = (
			local_error "get_ML_any" 5007
				[fn () => if is_keyword then "%" ^ k ^ "%" else k];
			get_ML_any R (add_error_code(5007, p)));

	val next = #look_at_next R ()
in
	case next
	of (*=(=*)	")"	=>	prev
	|  (*=[=*)	"]"	=>	prev
	|  (*={=*)	"}"	=>	prev
	|  		""	=>	prev
	| 		_ => (
		case read_symbol R
		of	SymCharacter ch => (
				case ch
				of "("	=>	(*=)=*) get_ML_any R
						(get_round_braces get_ML_any R prev)
				|  "["	=>	(*=]=*) get_ML_any R
						(get_box_braces get_ML_any R prev)
				|  "{"	=>	(*=}=*) get_ML_any R
						(get_curly_braces get_ML_any R prev)
				|  ";"	=>	ch :: prev
				|  "\""	=>	let (*="=*)
							val (prevB, errnos) =
								get_ML_string R prev;
							val prevC = add_error_codes(errnos, prevB)
						in
							get_ML_any R prevC
						end
				|  "Q"	=>	get_ML_any R ("QQQQ" :: prev)
				| _ =>		get_ML_any R (ch :: prev)
			)
		|	SymEndOfInput => prev (* shouldn't see this??? *)
		|	SymWhite _ => get_ML_any R (" " :: prev)
		|	SymDoublePercent => get_ML_any R ("%%" :: prev)
		|	SymKnown(sym, is_keyword, info) =>
				do_keyword (sym, is_keyword) info prev
		|	SymUnknownKw(sym, _) => (
				local_error "get_ML_any" 5003 [fn () => sym, fn () =>
					prev_context 20 prev];
				get_ML_any R (add_error_code(5003, prev))
			)
		|	SymUnknownChar ch => (
				local_error "get_ML_any" 5005 [fn () => next,
					fn () => string_of_int(ord ch),
					fn () => prev_context 20 prev];
				get_ML_any R (add_error_code(5005, prev))
			)
	)
end);
=TEX
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{LANGUAGE NESTING}

The reader writer is extensible in that support for other languages may be
added, the first such extension being for the HOL language.  Other
languages are allowed by embedding them within Standard~ML text
surrounded by certain percent-keywords or extended characters.

A ``HOL quotation'' is a HOL term written in the language defined by
the ICL HOL grammar~\cite{DS/FMU/IED/DEF001} and which is enclosed in
the HOL term delimiting symbols (which are ``{\tt\%<\%}'' and
``{\tt\%>\%}'' or their extended character equivalents).  Similarly one
may have ``Z quotations'', ``Standard~ML quotations'' and so on.  (ML
quotations are known as ``anti quotations'' in HOL~88.)
These quotations have their own starting symbols, all finish with
the~``{\tt\%>\%}'' symbol.

The word ``language'' is used in a general sense in this document.
Each set of enclosing symbols is considered to surround a different
language although in practice the same language recogniser may be used
for several set of enclosing symbols.  For example, the language of HOL
terms may be used in term quotations and in three forms of HOL
definition, namely axiomatic, infix axiomatic and schema definitions.

Quotations may be included as parts of other quotations to any level of
nesting.  The style for nesting is common across all supported
languages, this style should be seen as a requirement upon any future
embedded languages.

All quotations yield values which are either HOL types or HOL terms,
any particular quotation yields one of them.  Thus they may be used
only in contexts where such values are allowed.  From the macro
processing model of how quotations are processed each quotation is
converted into a Standard~ML expression (of a Standard~ML-type that is
either a HOL-type or a HOL-term).  Nesting of quotations means,
therefore, nesting of Standard~ML expressions which will be processed
by a Standard~ML compiler.  Text of languages other than Standard~ML is
passed as string arguments to a recogniser for that language, it
returns a value which is a HOL-type or a HOL-term.

Some forms of nested language quotation are intended to be used at the
Standard~ML top level (i.e., to be called as a Standard~ML $topdec$),
their task is achieved by side effects, perhaps to declare a HOL
constant.  These languages are of two forms.  Firstly those where a
single character indicates the start of the quotation.  Secondly where
a start character is followed by a name.  A~Z~schema declaration is an
example of the first, a HOL constant of the second.

These forms of quotation are identified as follows.

\begin{description}

\item[General quotations ] are like the HOL terms, these are enclosed
	in the~``{\tt\%<\%}'' and~``{\tt\%>\%}'' or similar for other
	languages.

\item[Specific quotations ] are used at top level, they have a single
	character to introduce and another to complete them.

\item[Named quotations ] commence with the~`\StartFormal' character
	immediately followed by the language name, they finish with the
	~`\EndFormal' character.

\end{description}

%********************************************************************

\subsection{General Quotations}

In all languages the two keywords `{\tt\%<\%}' and `{\tt\%>\%}' (and
the corresponding extended characters) are used to denote embedding of
text from another language.  The BNF syntax,
see~\cite{ds/fmu/ied/pln009}, is as follows.

=GFTSHOW BNF
quotation	=	'⌜', [ language_code ], quoted_text, '⌝';

language_code	=	'↘', name, '↕'
		|	':' ;
=TEX

Where:

\begin{description}

\item[$name$ ] is a identifier in the extended Standard~ML.

\item[$white_space$ ] is a space or a tab character.

\item[$quoted_text$ ] is text in the named language.

\end{description}

The $name$ identifies the quoted language.  The default quotation is of
a HOL term, which may also be indicated by a name of ``{\tt HOL}''.
The colon form is equivalent to using the name ``{\tt HOL:}''.
=IGN
The extended character for keyword `{\tt\%cantext\%}' is
included as part of the name held in the database and thus there is
no explicit test for these characters.  Rather the extended character
is added by function $add_general_reader$ however, this character
must be removed when the name is passed on to the reader function.
=TEX

Convention.  Languages which yield HOL types should have a colon
as the last character of their name.

Note that including any space or tab characters before the
$language_code$ will cause the default interpretation, as a HOL term.

%********************************************************************

\subsection{Specific Quotations}

Another form of quotation is used when the language text is enclosed by
single symbols.  For example a HOL axiomatic definition is enclosed by
the keywords ``{\tt\%SFT\%HOLAX}'' and ``{\tt\%EFT\%}''.

%********************************************************************

\subsection{Named Quotations}

Named quotations commence with the~`\StartFormal' character
immediately followed by the language name, they finish with the
~`\EndFormal' character.

%********************************************************************

\subsection{Supporting Other Languages}

A goal when producing reader writers for embedded languages (indeed, a
goal for the whole reader writer) is to make the reading as simple as
possible, deferring as much as possible to the lexical analyser and
parser for the particular language.  There are several simplifications
that can be made, and which are made in the HOL reader writer that
follows.

\begin{itemize}

\item Defer error detection and reporting as much as possible, leave it
	to the lexical analyser or parser for the embedded language.
	In this context there are many errors that the basic reader
	writer is in a position to detect, but it passes them through to
	the \Compiler{} knowing that the \Compiler{} will detect and
	report them.

\item Treat brackets in the same way as other symbols.  This means
	allowing badly balanced brackets in the embedded text since the
	parser will detect them.

\item Use the functions provided in the basic reader writer, for
	example to read and get information about percent keywords, and
	to discard comment text.

\item Treat character literals as strings, letting the lexical analyser
	or parser complain if they are not exactly one character long.

\item Treat all quotation starting and ending symbols as having equal
	precedance, thus each ending symbol closes the innermost active
	quotation.  Then require the embedded language's lexical
	analyser and parser to check that the correct ending symbol is
	used.

\end{itemize}

Extensions are added in several pieces.

\begin{enumerate}

\item \label{ExtParser} A recursive descent parser for the new language, which {\em
	must\/} conform to the conventions given in the preceding
	sections, and particularly section~\ref{ReaderWriter}.  This
	means it must also use the same reading functions which are
	given in sections~\ref{DeclareReaderEnv}
	and~\ref{ReaderEnvironment}.   It may use any of the existing
	parsing functions, for example those dealing with comments and
	strings.

\item Additions to the name and character dictionaries, $name_dict$
	and $char_dict$, to show how the languages special symbols are
	treated.  These extensions include the symbols that start and
	end sections of text of the new language.

\item Additions to the dictionaries relating language names or
	starting symbols to reading functions.

\item \label{RWRoutine} A routine, but not part of this document, that
	performs the proper lexical analysis, parsing and any other
	processing required for the new language.

\end{enumerate}

%********************************************************************

\subsection{Datatype for Parser Interface}
\label{DatatypeForParserInterface}

Considered as an imperative program, the output of the reader portion
of the reader writer is a string of characters that are presented to a
Standard~ML \Compiler.  In this context the text of any embedded
language must be converted into Standard~ML, a convenient form would be
a Standard~ML string preceded by a call of the routine produced for
item~\ref{RWRoutine} listed above.  To allow embedded text to contain
quotations the input to
the parsing routine is actually a list of values of the following
datatype.  Note that the actual declaration is made by the lexical
analyser~\cite{ds/fmu/ied/dtd015}.  This declaration might be viewed
as the task of the $ReaderWriterSupport$ structure.  It is not needed
by anything in the reader writer, but arguably it should be defined
here since it represents part of the general interface between the
reader writer and the lexical analysers.  However, the datatype cannot be
declared until the Standard~ML types $TYPE$ and $TERM$ are declared, these require
a large portion of the ICL HOL system to be available and they are not
declared until after the reader writer is declared.

The exact form and usage of this declaration is determined by three
parts of the ICL HOL system: the HOL lexical
analyser~\cite{ds/fmu/ied/dtd015}; the symbol definitions passed to
$add_new_symbols$ in section~\ref{PrettyCharactersForHOL} below; and,
the code in the functions that generate text containing uses of the
declaration.

=GFT SML
structure ⦏Lex⦎ = struct
	...
	datatype ⦏INPUT⦎
		=	⦏Text⦎		of string
		|	⦏String⦎		of string
		|	⦏Char⦎		of string
		|	⦏Type⦎		of TYPE
		|	⦏Term⦎		of TERM
		|	⦏Error⦎		of int
			;
	...
end;
=TEX

%\newpage

The various constructors are used as follows.

{\def\ITEM#1{\item[$#1$ ] }
\begin{description}

\ITEM{Lex.Text} Text of the new language, text that needs to be
	lexically analysed, parsed, etc.  This text excludes strings
	and character literals.

\ITEM{Lex.String} Character strings of the embedded language,
	these are strings as defined in~\cite[section~2.1]{Milner90}.
	These need to be recognised
	by the reader writer to prevent the wrong interpretation of
	characters within them.  Since the reader writer has identified
	them it seems appropriate to reduce the work of later stages of
	the languages analysis by keeping them
	as distinguished parts of the input text.

\ITEM{Lex.Char} As $Lex.String$ but these strings are introduced by the
	single left-hand prime~(~{\tt`}~) characters.  The name
	`$Lex.Char$' derives from the HOL use of this, namely for
	character literals --- the HOL recogniser has the task of
	validating the number of characters passed.

\ITEM{Lex.Term} A Standard~ML expression that yields a HOL
	term.  This value is produced by a term anti quotation within
	HOL text.  Note that the value given here is any Standard~ML
	expression --- it must yield the correct Standard~ML type or an
	error will be reported by the \Compiler{} --- which may contain
	embedded text of another language which will be another list of
	this datatype, which may contain another anti quotation, and so
	on.

\ITEM{Lex.Type} As $Lex.Term$, but for HOL types.

\ITEM{Lex.Error} Used to indicate the approximate site of detection of
	an error (whose code is also passed) in the object language
	text.

\end{description}}

The reader writer assumes a simple balancing of the starting and ending
symbols (from the constructors $PrettyNames.Starting$ and
$PrettyNames.Ending$), it does not attempt to check that the correct
symbols are used to start and end an embedded text.  The routines for
the called language are expected to check for the correct matching.  To
assist with this check the interface to the embedded language is a
tuple comprising the actual opening symbol, the list described above
and the actual closing symbol; its Standard~ML type is:
`$(string\;*\;string\;*\;(Lex.INPUT\;list)\;*\;string)$' \ The
order of these elements of the tuple reflects the order they are
read and processed by the imperative aspects of the reader writer.

The parsing routines return strings containing these constructors as
follows.  Note that these rules are built into the code of the
basic reader writer.

\begin{itemize}

\item All routines assume that they are entered when the string
	``\verb|Lex.Text "|'' has recently been output, other
	characters may also have been output, but the closing double
	quote has not.

\item Any routine that wants a constructor other than
	``\verb|Lex.Text|'' must close the current string, produce
	its own value, and start a new ``\verb|Lex.Text|', together
	with the necessary list element separators.

\end{itemize}

%********************************************************************

\subsection{Generated Standard~ML}

A call from an ML context will yield the equivalent of

=GFT SML
( recogniser ( "starting symbol", "language name", quoted_text, "closing symbol" ))
=TEX

Where:

\begin{description}

\item[$recogniser$ ] is derived from the language name, it has a
	result type of either HOL-term or HOL-type.

\item[$start_symbol$ ] is the symbol that introduced the quoted text,
	a string.

\item[$quoted_text$ ] is derived from the quoted text, it is a list
	comprising strings and quotations.

\item[$closing_symbol$ ] is the symbol that completed the quoted text,
	a string.

\end{description}

A call from a non-ML context will have the above passed as an argument
to either $Lex.Type$ or $Lex.Term$ depending on the way the language
name was introduced to the reader writer.

A language name that is not recognised will be processed in the same
way, but the name used for $recogniser$ above will be that of a
function that reports an error.  The reason for processing the text is
to allow the whole of the erroneous input text to be skipped over, thus
providing some measure of error recovery.

%********************************************************************

\subsection{Readers For Particular Languages}

All readers that may be called by the basic reader writer have a type
given by $READER_FUNCTION$, their string list argument is the left hand
context of their call, this value must be returned.  Any new text
assembled by the reader is added to the head of this list so that when
it is reversed and then imploded (via the Standard~ML function ``$fn
A=> implode(rev A)$'') the result is in the correct order.  This
function is always called with a left hand context requiring a
Standard~ML value, in other word, the text that the reader function
produces should be a Standard~ML expression.  The type of that
expression is either a HOL type or a HOL term if the text may be
written as a quotation embedded in another language, this is the case
when the reader is installed by $add_general_reader$. {} For readers
installed by $add_specific_reader$ and $add_named_reader$ the
expression may be of any type,
but is usually of type unit, as it will normally be used as a
Standard~ML topdec.

=SMLPLAIN SML
type ⦏READER_FUNCTION⦎
	= READER_ENV
	-> (string * bool)	(* Starting symbol *)
	-> string		(* Language name *)
	-> string		(* Opening text *)
	-> string list		(* Left hand context *)
	-> string list;
=TEX

A simple reader function is required for skipping over text when an
unknown language has been requested.

=SMLPLAIN SML
fun ⦏skipping_reader⦎ (R:READER_ENV) (start:string, is_keyword:bool)
		(lang_name:string) (opening:string)
		(prevA:string list) : string list = (
let
	open PrettyNames;

	fun read (depth:int) (prev_errs:int list) : int list = (
		case read_symbol R
		of	SymCharacter ch => (
				 read depth prev_errs
			)
		|	SymEndOfInput => fail "ReaderWriter" 5030 []
		|	SymWhite _ => read depth prev_errs
		|	SymKnown(_, _, (_, _, info)) => (
				case info
				of Starting _ => read (depth+1) prev_errs
				| Ending _ =>
					if depth = 1
					then prev_errs
					else read (depth-1) prev_errs
				| _ => read depth prev_errs
			)
		|	SymUnknownKw(sym, _) => (
				local_error "ReaderWriter" 5004 [fn () => sym];
				read depth (5004::prev_errs))
		|	SymUnknownChar ch => (
				local_error "ReaderWriter" 5006 [fn () => ch,
					fn () => string_of_int(ord ch)];
				read depth (5006::prev_errs))
		|	SymDoublePercent => read depth prev_errs
	);

	val errs = read 1 nil
in
	(local_error "ReaderWriter" 5010
		[fn () => if is_keyword then "%" ^ start ^ "%" else start,
		fn () => lang_name];
	add_error_codes(5010::errs, prevA))
end
);
=TEX

%********************************************************************

\subsection{Reader Function Database}

Various sets of reader functions are held.  A general reader handles
embedded language text introduced by a ``{\tt\%<\%}'' or the
corresponding extended character, which may be followed by the name of
the particular language, it defaults to the HOL term language.  A
specific reader handles language text introduced by a single
keyword or extended character and where the closing character denotes
the end of the extended Standard~ML topdec.
A named reader is like a specific reader but the opening symbol is
followed by the language name.  All reader names are the full language
name which includes the introductory keyword or character in a
canonical form which is determined by the `$add_\ldots$' and
`$look_up_\ldots$' functions.

=SMLPLAIN SML
local (* for holding reader names *)

val ⦏general_reader⦎ : (READER_FUNCTION * string) S_DICT ref = ref initial_s_dict;

val ⦏specific_reader⦎ : (READER_FUNCTION * string) S_DICT ref = ref initial_s_dict;

val ⦏named_reader⦎ : (READER_FUNCTION * string) S_DICT ref = ref initial_s_dict;
=TEX

The canonical form of name for a reader function has two parts
separated by a single space character.  The first part is the
introductory character or keyword, the second part is the language
code.  Within the canonical name extended characters are held if
available, if not then the first keyword is used.  For names which are
made with a single character or keyword the separating space is
omitted.  Language codes are restricted to be alphanumeric with an
optional final colon, this is only checked on adding the name, there is
no need to check on looking up the name because a bad name will not be
found.

=SMLPLAIN SML
fun is_alphanumeric ch = (
		(ch >= "a" andalso ch <= "z")
	orelse	(ch >= "A" andalso ch <= "Z")
	orelse	(ch >= "0" andalso ch <= "9")
);

fun is_ok_name_list nil = true
| is_ok_name_list (":"::nil) = true
| is_ok_name_list (h::t) = is_alphanumeric h andalso is_ok_name_list t;

fun is_ok_name n = is_ok_name_list(explode n);
=TEX

=SMLPLAIN SML
fun ⦏canon⦎(name1 : string, name2 : string) : string OPT = (
let
	val n1_opt =	case PrettyNames.find_char name1
			of Nil => PrettyNames.find_name name1
			| x => x;

	val n1 =	case n1_opt
			of Value(_, n as Value _, _) => n
			| Value(kw:: _, _, _) => Value ("%" ^ kw ^ "%")
			| _ => Nil;
in
	case (n1, name2)
	of(Nil, _) => Nil
	| (nn as Value n, "") => nn
	| (Value n1, n2) => Value(n1 ^ n2)
end
);

in
=TEX

=GFTSHOW BNF
	'⌜', '↘', name, '↕'
or
	'⌜', '↘', name, '↕'

=TEX

=SMLPLAIN SML
fun ⦏add_general_reader⦎ (name1:string, name2:string, constructor:string,
		reader:READER_FUNCTION) : unit = (
	case (is_ok_name name2, canon(name1, name2))
	of (true, Value name) =>
		((general_reader := s_extend name (reader, constructor) (!general_reader))
		handle E => divert E "s_extend" "add_general_reader" 5033 [fn () => name])
	| _ =>
		(local_warn "add_general_reader" 5035 [fn () => name1, fn () => name2])
);

fun ⦏look_up_general_reader⦎ (name1: string, name2: string)
		: (READER_FUNCTION * string) OPT = (
	case canon(name1, name2)
	of Value name => s_lookup name (!general_reader)
	| Nil => Nil
);
=TEX

=SMLPLAIN SML
fun ⦏add_specific_reader⦎ (name1:string, constructor:string,
		reader:READER_FUNCTION) : unit = (
	case canon(name1, "")
	of Value name =>
		((specific_reader := s_extend name (reader, constructor) (!specific_reader))
		handle E => divert E "s_extend" "add_specific_reader" 5033 [fn () => name])
	| _ =>
		(local_warn "add_specific_reader" 5034 [fn () => name1])
);

fun ⦏look_up_specific_reader⦎ (name:string) : (READER_FUNCTION * string) OPT = (
	case canon(name, "")
	of Value name => s_lookup name (!specific_reader)
	| Nil => Nil
);
=TEX

=SMLPLAIN SML
fun ⦏add_named_reader⦎ (name1:string, name2:string, constructor:string,
		reader:READER_FUNCTION) : unit = (
	case (is_ok_name name2, canon(name1, name2))
	of (true, Value name) =>
		((named_reader := s_extend name (reader, constructor) (!named_reader))
		handle E => divert E "s_extend" "add_named_reader" 5033 [fn () => name])
	| _ =>
		(local_warn "add_named_reader" 5035 [fn () => name1, fn () => name2])
);

fun ⦏look_up_named_reader⦎ (name1:string, name2:string)
		: (READER_FUNCTION * string) OPT = (
	case canon(name1, name2)
	of Value name => s_lookup name (!named_reader)
	| Nil => Nil
);

end (* of local for holding reader names *);
=TEX

%********************************************************************

\subsection{General Quotation}

Function $get_language_name$ here returns the name of the
language and a valid-name flag.

{\ftlinepenalty=9999
=SMLPLAIN SML
local (* for function general_quotation *)

fun ⦏get_language_name⦎ (R:READER_ENV) : (string * bool) = (
let
	open PrettyNames;

	fun get_name (prev:string list) : string list = (
		case read_symbol R
		of	SymWhite _ => prev
		|	SymCharacter ch => get_name (ch :: prev)
		|	SymEndOfInput => fail  "ReaderWriter" 5031 []
		|	sym as SymKnown(_, _, (_, _, Starting _)) =>
				(#push_back R (expand_symbol sym); prev)
		|	sym as SymKnown(_, _, (_, _, Ending _)) =>
				(#push_back R (expand_symbol sym); prev)
		|	sym as SymKnown(_, _, (_, _, Middle _)) =>
				(#push_back R (expand_symbol sym); prev)
		|	SymKnown(_, _, ("cantext"::_, Value ch, _)) => ch :: prev
		|	SymKnown(_, _, (_, Value ch, _)) => get_name (ch :: prev)
		|	SymKnown(_, _, (names, _, _)) => get_name ((hd names) :: prev)
		|	SymUnknownKw(sym, _) => (
				local_error "ReaderWriter" 5004 [fn () => sym];
				["_ERROR_"]
			)
		|	SymUnknownChar ch => (
				local_error "ReaderWriter" 5006 [fn () => ch,
					fn () => string_of_int(ord ch)];
				["_ERROR_"]
			)
		|	SymDoublePercent => get_name ("%" :: prev)
	);

	val next = #look_at_next R ()
in
	if next = "%" orelse ord next > 127
	then
		case read_symbol R of
			SymKnown(sym, _, ("down"::_, _, _)) => (
				(implode(rev (get_name [])), true)
			)
		|	SymKnown(sym, _, ("dntext"::_, _, _)) => (
				case get_name []
=SMLLITERAL
				of "↕" :: name => (implode(rev name), true)
=SML
				| name => (implode(rev name), false)
			)
		|	sym => (#push_back R (expand_symbol sym); ("", true))
	else if next = ":"
	then
		(#advance R (); (":", true))
	else
		("", true)
end
);
=TEX
}

On entry the opening quotation symbol (keyword or character, passed in
$start$) has been read, the first character after the symbol is the
first unread character.  The calling context is indicated by $in_ML$
where $true$ denotes the quotation occurs in extended Standard~ML,
$false$ denotes the quotation is from an object language.  The
information about the opening quotation symbol is given as info.

=SMLPLAIN SML
in (* local for function general_quotation *)

fun ⦏general_quotation⦎ (R:READER_ENV) (start as (start_str, _):string * bool)
		(opening:string) (in_ML:bool)
		(prevA:string list)
		: string list = (
let
	val (lang_name, valid) = get_language_name R;

	val (reader, constructor) =
			case	if valid
				then look_up_general_reader (start_str, lang_name)
				else Nil
			of Nil => (
				local_error  "general_quotation" 5011 nil;
				(skipping_reader, ""))
			| Value x => x;

	val (completion, prevB) =
		if in_ML
		then ("", prevA)
		else (", Lex.Text\"", to_ML_string constructor :: "\", " :: prevA);
in
	completion :: (reader R start lang_name opening prevB)
end
);

end (* of local for function general_quotation *);
=TEX

%********************************************************************

\subsection{Specific Quotation}

=SMLPLAIN SML
fun ⦏specific_quotation⦎ (R:READER_ENV) (start:string, is_keyword:bool)
		(opening:string) (in_ML:bool) (prevA:string list)
		: string list = (
let
	val (reader, constructor) =
			case look_up_specific_reader start
			of Nil => (
				local_error  "specific_quotation" 5011 nil;
				(skipping_reader, ""))
			| Value x => x;

	val (completion, prevB) =
		if in_ML
		then ("", prevA)
		else (", Lex.Text\"", to_ML_string constructor :: "\", " :: prevA);
in
	completion :: (reader R (start, is_keyword) "" opening prevB)
end
);
=TEX

%********************************************************************

\subsection{Named Quotation}

{\ftlinepenalty=9999
=SMLPLAIN SML
local (* for function named_quotation *)

fun ⦏get_language_name⦎ (R:READER_ENV) : string = (
let
	open PrettyNames;

	fun skip_to_newline ("\n" :: chs) = #push_back R (implode chs)
	|   skip_to_newline (_ :: chs) = skip_to_newline chs
	|   skip_to_newline [] = ();

	fun done sym = (#push_back R (expand_symbol sym));

	fun get_name (prev:string list) : string list = (
		case read_symbol R
		of	SymWhite chs => (skip_to_newline (rev chs); prev)
		|	SymCharacter ch => get_name (ch :: prev)
		|	SymEndOfInput => fail  "ReaderWriter" 5031 []
		|	sym as SymKnown(_, _, (_, _, Starting _)) => (done sym; prev)
		|	sym as SymKnown(_, _, (_, _, Ending _)) => (done sym; prev)
		|	sym as SymKnown(_, _, (_, _, Middle _)) => (done sym; prev)
		|	sym as SymKnown(_, _, (_, _, Ignore)) => (done sym; prev)
		|	SymKnown(_, _, (_, Value ch, _)) => get_name (ch :: prev)
		|	SymKnown(_, _, (names, _, _)) => get_name ((hd names) :: prev)
		|	SymUnknownKw(sym, _) => (
				local_error "ReaderWriter" 5004 [fn () => sym];
				["_ERROR_"]
			)
		|	SymUnknownChar ch => (
				local_error "ReaderWriter" 5006 [fn () => ch,
					fn () => string_of_int(ord ch)];
				["_ERROR_"]
			)
		|	SymDoublePercent => get_name ("%" :: prev)
	);
in
	implode(rev(get_name nil))
end
);
=TEX
}

On entry the opening quotation symbol (keyword or character, passed in
$start$) has been read, the first character after the symbol is the
first unread character.  The calling context is indicated by $in_ML$
where $true$ denotes the quotation occurs in extended Standard~ML,
$false$ denotes the quotation is from an object language.  The
information about the opening quotation symbol is given as info.

=SMLPLAIN SML
in (* local for function named_quotation *)

fun ⦏named_quotation⦎ (R:READER_ENV) (start as (start_str, _):string * bool)
		(opening:string) (in_ML:bool)
		(prevA:string list)
	 		: string list = (
let
	val lang_name = get_language_name R;

	val (reader, constructor) =
			case look_up_named_reader (start_str, lang_name)
			of Nil => (
				local_error  "named_quotation" 5011 nil;
				(skipping_reader, ""))
			| Value x => x;

	val (completion, prevB) =
		if in_ML
		then ("", prevA)
		else (", Lex.Text\"", to_ML_string constructor :: "\", " :: prevA);
in
	completion :: (reader R start lang_name opening prevB)
end
);

end (* of local for function named_quotation *);
=TEX

%********************************************************************

\subsection{Quotation Symbols}

Having written the quotation functions they can now be used to
declare the quotation characters.

=SMLLITERAL
val _ = let open PrettyNames in add_new_symbols [
	([	"<"],		Value "⌜",		Starting(general_quotation, "")),
	([	"SML"],		Value "ⓜ",		Starting(specific_quotation, "")),
	([	"<:"],		Value "ⓣ",		Starting(specific_quotation, "")),
	([	">"],		Value "⌝",			Ending ""),

	([	"SFT"],		Value "Ⓢ",		Starting(named_quotation, "")),
	([	"EFT"],		Value "■",			Ending "")
] end;
=TEX

%********************************************************************

\subsection{Reader for Standard~ML}

Standard~ML may be quoted in other languages, the reading functions
have been given earlier in this document, but they need an entry point
of the correct type to be introduced to function $general_quotation$,
and they need the correct wrapping when included in other languages.

In common with other quoted languages a string of the following form is
generated.

=GFT SML
( recogniser ( "starting symbol", "language name", quoted_text, "closing symbol" ))
=TEX

In this case function $ReaderWriterSupport.SML_recogniser$ is the
$recogniser$, it just checks the validity of the three strings and
returns the value of the $quoted_text$.

=SMLPLAIN SML
fun ⦏SML_recogniser⦎ (start:string, lang:string, value:'a, finish:string) : 'a = (
	if	PrettyNames.is_same_symbol(start, "<")
	andalso	PrettyNames.is_same_symbol(finish, ">")
	andalso	(lang = "SML" orelse lang = "SML:")
	then
		value
	else if	PrettyNames.is_same_symbol(start, "SML")
	andalso	PrettyNames.is_same_symbol(finish, ">")
	andalso	lang = ""
	then
		value
	else
		fail "SML_recogniser" 5050 [fn () => start, fn () => lang, fn () => finish]
);
=TEX

Function $SML_reader$ gathers the actual text.  Function $get_ML_any$
is called in a loop because its task is to read text up to but not
including certain delimiters.  In this case we must read text up to and
including the next $Ending$ symbol.  All other characters must be read
and added to the output list.

=SMLPLAIN SML
fun ⦏SML_reader⦎ (R:READER_ENV) (start:string, is_keyword:bool)
		(lang:string) (opening:string) (prevA:string list) : string list = (
let
	open PrettyNames;

	val prevB =
		opening ::
		"\", " :: (*="=*)
		to_ML_string lang ::
		"\", \"" ::
		to_ML_string start ::
		"(\"" (*=")=*) ::
		"ReaderWriterSupport.SML_recogniser" ::
		"(" ::
		prevA;

	fun read prevC = (
		case get_ML_any R nil
		of nil => (	case read_symbol R
				of	SymEndOfInput =>
						fail "SML_reader" 5032 nil
				|	SymKnown(sym, _, (_, _, Ending str)) =>
						(*=[((=*)	"\"))" ::
						to_ML_string sym ::
						", \"" :: str :: prevC
				|	SymWhite _ => read (" " :: prevC)
				|	sym => read ((expand_symbol sym) :: prevC)
			)
		| ""::nil =>	fail "SML_reader" 5032 nil
		| x =>		read (x @ prevC)
	);
in
	read prevB
end
);
=TEX

=SMLLITERAL
val _ = add_general_reader("⌜", "SML", "Lex.Term", SML_reader);
val _ = add_general_reader("⌜", "SML:", "Lex.Type", SML_reader);

val _ = add_specific_reader("ⓜ", "Lex.Term", SML_reader);
=TEX

%********************************************************************

\subsection{Exception for $use_file$ and $use_string$}
=TEX
$use_string$ and $use_file$ raise the following exception if they have
successfully printed out an exception.
=SML
exception Stop;
=TEX
\subsection{Completion of Basic Reader Writer}

That ends the support structure.

=SMLPLAIN SML
end (* of structure ReaderWriterSupport *);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{READER WRITER}

=SMLPLAIN SML
structure ⦏ReaderWriter⦎ : ReaderWriter = struct

open ReaderWriterSupport;
=TEX

During development the capability to abandon this reader writer system
and return to the PolyML default reader and writer is needed.  This is
achieved by providing a local exception that is handled appropriately,
together with a function to raise it.  This facility may be withdrawn
for the proper release.  Calling this function from within $use\-\_file$ or
$use\-\_string$ is allowed, the exception will be propagated out as far as
possible.

=SMLPLAIN SML
exception ⦏AbandonReaderWriter⦎;
val ⦏abandoning⦎ : bool ref = ref false;
val ⦏use_terminal_is_active⦎ : bool ref = ref false;

fun ⦏abandon_reader_writer⦎ () : unit = (
	use_terminal_is_active := false;
	abandoning := true;
	raise AbandonReaderWriter
);
=TEX

%********************************************************************

\subsection{Diagnostics}

Several control flags are provided in this structure for debugging
purposes.  These flags are used throughout the rest of the structure.
The flags are implemented as `bits' in an integer;
This section defines all of the debugging flags used by the reader
writer.

=SMLPLAIN SML
val ⦏RWtext_read⦎ : bool ref = ref false;		(* 2 ^^ 0 = 1 *)
val ⦏RWphrases_read⦎ : bool ref = ref false;		(* 2 ^^ 1 = 2 *)
val ⦏RWchars_read⦎ : bool ref = ref false;		(* 2 ^^ 2 = 4 *)
val ⦏RWchars_written⦎ : bool ref = ref false;		(* 2 ^^ 3 = 8 *)
val ⦏RWwriter_convert⦎ : bool ref = ref false;		(* 2 ^^ 4 = 16 *)

val ⦏RW_diagnostics⦎ : int ref = ref 0;

fun ⦏check_diagnostics⦎(flags:int) : bool = (
let
	val flags2 = flags div 2;
	val flags4 = flags2 div 2;
	val flags8 = flags4 div 2;
	val flags16 = flags8 div 2;
	fun odd n = (n mod 2) <> 0;
in
	if flags >= 0
	then (
		RWtext_read := odd flags;
		RWphrases_read := odd flags2;
		RWchars_read := odd flags4;
		RWchars_written := odd flags8;
		RWwriter_convert := odd flags16;
		true)
	else
		false
end
);

val _ =
new_int_control {name = "⦏RW_diagnostics⦎", control = RW_diagnostics,
	default = fn () => 0, check = check_diagnostics};
=TEX

=IGN

%--------------------------------------------------------------------

It is useful to have the commands to set and clear these flags easily available.

set_int_control("RW_diagnostics", 0);
set_int_control("RW_diagnostics", 1);
set_int_control("RW_diagnostics", 2);
set_int_control("RW_diagnostics", 4);
set_int_control("RW_diagnostics", 8);
set_int_control("RW_diagnostics", 16);

%--------------------------------------------------------------------

=SMLPLAIN SML
fun ⦏logit⦎ (flag:bool ref) (proc:string) (str:string) : string = (
	if !flag
	then
		(output(std_out, proc ^ "   " ^ (string_of_int(size str)) ^ "  <" ^
			(	case str of "\n" => "\\n"
				| "" => "<\"\">"
				| x => x) ^ ">\n");
		str)
	else
		str
);

fun ⦏logit_list⦎ (flag:bool ref) (proc:string) (str:string list) : string list = (
	if !flag
	then	let	fun f s = "(" ^ string_of_int (size s) ^ ", " ^ s ^ ")";
			fun g ss = "[" ^ format_list f ss ", " ^ "]"
		in	(output(std_out, proc ^ "  " ^ g str ^ "\n"); str)
		end
	else
		str
);
=TEX

%********************************************************************

\subsection{Outermost Levels of Reader Writer}

This routine is called by $PolyML.compiler$ to read the next part of
the input text.  It adopts a simple approach to text that $get_ML_any$
cannot parse properly, it passes the first symbol that did not parse
on to its caller.  Consider an unmatched closing bracket which
$get_ML_any$ cannot parse and so returns an empty string, the bracket
is read here and returned for the caller to deal with, probably by
issuing an error message.

The case analysis on the result of $read_symbol$ below is complete, but
we expect that most branches will never be taken as function
$get_ML_any$ will have fully handled the characters.  For example, the
$SymUnknown\ldots$ clauses should have already been reported as faults
and thus have been read past.

Text that parsed successfully here must be converted in the correct
order into a single string.

We arbitarily decide that if more than 100 empty strings have been sent then
something is badly wrong.

PolyML.compiler cannot take extended characters, and certain parts of the
Reader Writer leave them present (in particular brackets for grammars).
Thus we apply $to\_ML\_string$ to the results of $get\_ML\_outermost$.
=SMLPLAIN SML
local (* for get_ML_outermost *)

val ⦏sent_eof⦎ = ref false;
val ⦏empty_lines_sent⦎ = ref 0;

fun ⦏get_ML⦎ (R:READER_ENV) = (
	case get_ML_any R nil
	of nil =>	(
		case read_symbol R
		of	SymEndOfInput =>
				if !sent_eof
				then (empty_lines_sent := !empty_lines_sent + 1;
					if !empty_lines_sent > 100
					then raise TooManyReadEmpties
					else nil)
				else (sent_eof := true;
					empty_lines_sent := 0;
					nil)
		|	sym => (sent_eof := false; [expand_symbol sym])
		)
	| ""::nil =>	if !sent_eof
				then	(empty_lines_sent := !empty_lines_sent + 1;
					if !empty_lines_sent > 100
					then raise TooManyReadEmpties
					else nil)
				else	(sent_eof := true;
					empty_lines_sent := 0;
					[#advance R ()])
	| x =>			(sent_eof := false; rev x)
);
	val ord_nl = ord "\n" and ord_tab = ord "\t"
	and ord_ff = ord "\^L";
=TEX

=SMLPLAIN SML
in (* local for get_ML_outermost *)

fun ⦏get_ML_outermost⦎ (R:READER_ENV) : unit -> string = (
	let
		fun get_ML_and_log () = (
			let	val what_got = get_ML R;
			in
				logit_list RWphrases_read "get_ML_outermost" what_got;
				(if	!RWtext_read
				then	(logit RWtext_read "get_ML_outermost"
						(implode what_got); ())
				else	());
				what_got
			end
		);
		val text_read_list = ref (get_ML_and_log ());
		fun get () = (
			case !text_read_list of
				[] => (
					case get_ML_and_log () of
						[] => ""
					|	some => (text_read_list := some; get())
			) |	""::more => (text_read_list := more; get())
			|	str::more => (text_read_list := more; str)
		);
	in	get
	end
)

end (* of local for get_ML_outermost *);
=TEX

When reading from a terminal the string returned by $get_ML_outermost$
will start with a space character.  It comes from the newline character
which (along with any sequence of white space characters) is turned
into a single space.  This character could be removed from the string
passed back to $PolyML.compiler$ but doing so is not easy, and in any
case $PolyML.compiler$ skips over it without any problem.  There are
other places in the string that could be optimised (e.g., spaces before
and after brackets) but again, $PolyML.compiler$ skips over them more
efficiently than this routine could remove them.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{COMPILER INTERFACE}

%********************************************************************

\subsection{PolyML Interface}

The routine $PolyML.compiler$ is the interface to the
read-evaluate-print loop of the PolyML system, it is a \Compiler{}
and has the signature:

=GFT SML
PolyML.compiler : (unit -> string) * (string -> unit) -> unit -> unit
=TEX

Calling this routine invokes the read-evaluate-print loop to process
one outermost level item (e.g., a declaration or an expression) which
is called a {\em topdec\/} in \cite{Milner90}.  When a {\em topdec\/}
is fully processed (i.e., a response is printed) the routine exits.
The first argument is called whenever the \Compiler{} requires more
input, the routine should return a string containing the text read.
The second argument is an output function, invoked by the \Compiler{}
for output messages.  The third argument is provided to delay execution
of the read-evaluate-print loop.

Routine $PolyML.compiler$ is recursive in the sense that a file
included by the above example routine may include other files by
calling $use\-\_file$.  Whilst reading the innermost included file a stack
trace would show the following items:

\begin{itemize}

	\item Normal read-evaluate-print loop.
	\item Call of $PolyML.compiler$
	\item Call of $use_file_loop$
	\item Call of $use\-\_file$.
	\item Normal read-evaluate-print loop.
	\item Call of $PolyML.compiler$
	\item Call of $use_file_loop$
	\item Call of $use\-\_file$.
	\item Normal read-evaluate-print loop.
	\item Outermost levels of PolyML system.

\end{itemize}

End of file is indicated to the $PolyML.compiler$ with the control-D
character, this is not actually read from the file, it must be
generated by the reader function.  Observation of $PolyML.compiler$
suggests that the control-D character forces the \Compiler{} to parse
the preceding text as a complete {\em topdec,} but otherwise ignore the
character.  After fully processing a {\em topdec\/} the
$PolyML.compiler$ returns or raises an exception, just as it does for
any other {\em topdec.} As $PolyML.compiler$ is called in a loop to
allow for many {\em topdec\/}s the end of file processing must break
out of the loop, but first it should cause the parsing of any text just
read, this allows the \Compiler{} to produce error messages for files
which have incomplete {\em topdec\/}s, e.g., a file that ends with
`{\tt let val x}' or a string without a closing double quote.
get_ML_outermost reader

An example followed here, but is now hopelessly out of date.

The interface to ICL HOL provided by this document uses the
$PolyML.compiler$ interface the
capabilities for handling pretty characters and producing prompts for
interactive input are provided by using more complex $reader$ and
$writer$ functions.

%********************************************************************

\subsection{ICL HOL Interface}
\label{IclHolInterface}

Four input sources are required for ICL HOL.

\begin{enumerate}

\item The console for normal interactive use.

\item Piped input for non-interactive use.

\item Included files.

\item Strings built by Standard~ML functions.

\end{enumerate}

The first two are alternatives, either the system is being run
interactively or input is being piped (in the UNIX sense) into the
system.  Both of these modes may request input of further Standard~ML
and HOL from another file.  The final input type allows Standard~ML
functions to create a string to be interpreted as Standard~ML or HOL
text.

\bigskip

To present these interfaces three main routines are identified.

\begin{description}

\item[$use\-\_terminal : unit -> unit$ ] which is the outermost routine of
	the lexical part of ICL HOL.  This routine is invoked at system
	startup and should remain in control at all times.  This
	routine is the primary interface to the ICL HOL system, it
	should replace the default outermost routine of PolyML.  Some
	investigation and experimentation\footnote{Which has not, at the
	time of writing, been completed.} is
	required to find a way of doing this.  Having this as the
	outermost routine means that it is started automatically when
	PolyML is started, also that breaking in with a control-C and
	entering ``{\tt f}'' (i.e., raising an exception to exit from
	the active Standard~ML and return to the top level) reverts to
	this routine.

\item[$use_file : string -> unit$ ] causes the named file to be read in
	a manner analogous to the routine $PolyML.use : string ->
	unit$ of PolyML.  The text read will be interpreted as
	Standard~ML and HOL the same as it had been entered at the
	outermost level.

\item[$use_string : string -> unit$ ] causes the contents of the string
	to be interpreted as Standard~ML and HOL the same as it had
	been entered at the outermost level or read from a file.

\end{description}

%********************************************************************

\subsection{Introduction To Reader Functions}

From experimentation with PolyML it seems that text in an included file
must be complete, i.e., capable of interpretation as a top level item.
Unclosed bracketing forms cause error messages.  For example,
unclosed comments, brackets, strings, {\tt let}-clauses and {\tt
local}-clauses all provoke an error message.  This behaviour should be
followed by the routines presented in this document.

The three routines named above ($use\-\_terminal$, $use\-\_file$ and $use\-\_string$)
will be written in a similar style, but with different reader and
writer functions.  Each function will set up its input stream, and then
invoke $PolyML.compiler$ naming the appropriate reader and writer.  All
of the reader functions will call $get_ML_outermost$ to read some text,
this text will be returned to the \Compiler.  The reader functions must
set up the input streams so that the various routines in structure $R$
above are provided.
To check whether the input stream is exhausted each of the loops calls its reader function once. If the result is an empty string then the stream is exhausted,
and the loop should end.
If not, the string is pushed back, and $PolyML.compiler$ called (which may call the reader many times).


There are three areas that add complexity to the reading functions.
First, keeping track of line and character numbers within the source
text, to provide information for error messages.  Second, providing a
mechanism to track faults in the parser where it loops looking at a
character without actually reading it --- for example (an actual fault
found in early testing) a pretty character was found by $get_ML_any$
but the character was not actually read (i.e., $\#advance\;R\;();$ was
not called) and so on the next call of $get_ML_any$ the same character
was found, and again, and again.  Third, providing diagnostic output
about the characters read.

\label{ExcessiveControlDs}
To stop the reader looping without reading new characters a counter is
maintained of the number of times each character is passed to the
parsing functions, a failure is reported when this exceeds a threshold
value.  This threshold must be at least 3 since a character may be
examined by one of the bracketed text functions
then looked at by $get_ML_any$ and then
advanced over.  Longer sequences may be possible but have not (yet!)
been identified.

=SMLPLAIN SML
val max_copies_of_char_sent = 30;
=TEX

%********************************************************************

\subsection{Writer Function}
\label{WriterFunction}

A common writer function is used by all three reader writers, its most
complex tasks are to recognise ASCII keywords and convert them to their
equivalent pretty characters and to recognise the numeric values of
pretty characters in strings and print the correct character.  The
conversions are as follows.  A keyword is a sequence of alphanumerics enclosed in ``{\tt QQ}''
characters, e.g., ``$\pi$'' is encoded as ``{\tt QQpiQQ}''.
If a decoding is available then replace the
whole keyword with the corresponding pretty character.  If no pretty
character is available then replace the enclosing ``{\tt QQ}'' characters with
single ``{\tt\%}'' characters.  To preserve ``{\tt Q}''s in the original
text the string ``{\tt QQQQ}'' is considered to be the keyword whose
representation is a single ``{\tt Q}''.
In no cases are an isolated ``{\tt Q}'' or ``{\tt QQQ}'' valid as part
of a keyword, they indicate that user code has produced a string
containing these letters.  Such isolated ``{\tt Q}''s are converted
into uses of the keyword `{\tt \%Q\%}' so that the text may be read
back in and have the same meaning.  An opening ``{\tt
QQ}'' with a non-alphanumeric before the closing ``{\tt QQ}'' is
treated in the same manner.

Keywords enclosed by percent signs are converted to the corresponding
pretty character if one is available.


The user can ask for the keyword form for non-ASCII symbols to be
used rather than the extended character set. This results in purely
ASCII output and is useful in contexts where the {\Product} extended
character set or UTF-8 will not be displayed properly. 
The flag controlling this is defined here.

=SML
val ⦏use_extended_chars⦎ = ref true;
val _ = new_flag {name = "use_extended_chars",  control = use_extended_chars,
			check = fun_true, default = fn () => true};
=TEX
=SML
fun ⦏get_use_extended_chars_flag⦎ (():unit) : bool = (
	!use_extended_chars
);
=TEX

The user can ask for non-ASCII symbols to be translated into UTF-8.
=SML
local
	val use_utf8 = fn () => if ExtendedIO.get_env "PPCHARSET" = "ext" then false else true;
in
	val ⦏output_in_utf8⦎ = ref (use_utf8());
	val _ = new_flag {name = "output_in_utf8",  control = output_in_utf8,
			check = fun_true, default = use_utf8};
end;
=TEX

The user can selectively disable support for some Unicode code points:
=SML
val ⦏unsupported_unicode_glyphs⦎ : UNICODE list ref = ref [];
val ⦏set_unsupported_unicode_glyphs⦎ : UNICODE list -> UNICODE list = (fn cps =>
	let	fun check cp = (
			if	cp <= 0wx7f
			then	fail "set_unsupported_unicode_glyphs" 5542
						[fn () => Unicode.toString cp]
			else if basic_unicode_to_pp cp = Nil
			then	fail "set_unsupported_unicode_glyphs" 5543
						[fn () => Unicode.toString cp]
			else	()
		);
		val _ = app check cps;
		val old = !unsupported_unicode_glyphs;
	in	unsupported_unicode_glyphs := cps;
		old
	end
);
=TEX
=SML
fun ⦏translate_unsupported⦎ (cp : UNICODE) : UNICODE list = (
	if	cp mem !unsupported_unicode_glyphs
	then	(map (Unicode.fromInt o ord) o explode o unicode_to_keyword) cp
	else	[cp]
);
=TEX
=SML
val  ⦏char_to_utf8⦎ : string -> string =
	implode o
	map unicode_to_utf8 o
	flat o map translate_unsupported o
	map pp_to_unicode o SML97BasisLibrary.String.explode;
=TEX
A keyword whose name has the form {\tt x}{\it HHHHHH} where {\it HHHHHH} stands for a string
of upper-case hexadecimal digits is translated into UTF-8 as the Unicode code point
with numeric value given by {\it HHHHHH} (provided this value is greater than 0x7F and less
than the maximum valid Unicode code point).
=SML
val  ⦏keyword_to_utf8⦎ : string -> string OPT = (fn kw =>
	let	fun is_uc_hexit c = ("0" <= c andalso c <= "9") orelse ("A" <= c andalso c <= "F");
	in	if	size kw = 7
		andalso	substring(kw, 0, 1) = "x"
		andalso	all (tl(explode kw)) is_uc_hexit
		then	case Unicode.fromString (substring(kw, 1, 6)) of
				SOME v => (
					if	0wx7f < v andalso v <= max_code_point
					then	Value (unicode_to_utf8 v)
					else	Nil
				) | _ => Nil (* not possible *)
		else	Nil
	end
);

=TEX
From observation of $PolyML.compiler$ it seems that no identifier or
string is split over two or more calls of the writer function,
therefore no memory is required\footnote{This may need to be
reconsidered after further experience of the use of $PolyML.compiler$
is obtained.} between invocations of the writer to deal with partial
identifiers or partial strings.

Function $translate_for_output$ does the work needed by the writer.
Translation is not always required,

Local values within $translate_for_output$ are as follows:

\begin{center}
\begin{tabular}{rp{4in}}
aux&Main recursion point of $translate_for_output$, examines the
	head of the string to be output, and selects an appropriate action.\\
aux_str&Sub function of $aux$ for handling Standard~ML string literals.\\
aux_kw&Sub function of $aux$ and $aux_str$ for completing their actions
	after handling percent `{\tt\%}' enclosed keywords.\\
get_kw&Get a keyword enclosed in double `{\tt Q}'s.\\
get_pc&Get a keyword enclosed percent `{\tt\%}' characters.\\
string_of_kw&Convert a keyword to its percent `{\tt\%}' enclosed form.\\
string_of_extended_char&Convert an extended character to its
	percent `{\tt\%}' enclosed form.\\
pQp, pQppQp, pQppQppQp&To avoid conflicts with SCCS keywords.\\
\end{tabular}
\end{center}

{\ftlinepenalty=9999
=SMLPLAIN SML
fun ⦏translate_for_output⦎ (s : string) : string = (
let
	val ord_0 = ord "0";
=TEX
$get\_kw$ must only return true as its second argument if
it has been given a recognisable keyword followed by two Qs.
When it returns false its first argument contains no percents, nor double Qs.
=SMLPLAIN SML
	fun get_kw (prev, nil) = (prev, false, nil)
	|   get_kw (prev, rest as ("Q"::"Q"::t)) = (
		case PrettyNames.find_name prev of
		Value _ => (prev, true, t)
		| Nil => (prev, false, rest)
	) |  get_kw (prev, h::t) = (	if	(h >= "A" andalso h <= "Z")
					orelse	(h >= "a" andalso h <= "z")
					orelse	(h >= "0" andalso h <= "9")
					then	get_kw(prev ^ h, t)
					else	(prev, false, h::t));
=TEX
$get\_pc$ must only return true as its second argument if
it has been given a recognisable keyword followed by a percent.
When it returns false its first argument contains no percents (but maybe
double Qs).
If the string ``{\tt \%Q\%}'' is seen then it must be output as
``{\tt \%\%\%Q\%\%\%}'', i.e. Q is not a keyword here.
=SMLPLAIN SML
	fun get_pc (prev, nil) = (prev, false, nil)
	|   get_pc ("", rest as ("%"::t)) = ("", false, rest)
	|   get_pc (prev, rest as ("%"::t)) = (
		if (prev = "Q") orelse is_Nil (PrettyNames.find_name prev)
		then (prev, false, rest)
		else (prev, true, t)
	)|   get_pc (prev, h::t) = (	if	(h >= "A" andalso h <= "Z")
					orelse	(h >= "a" andalso h <= "z")
					orelse	(h >= "0" andalso h <= "9")
					orelse	(is_special_char h)
					then	get_pc(prev ^ h, t)
					else	(prev, false, h::t));

	fun string_of_kw kw = (
		if !use_extended_chars
		then	case PrettyNames.find_name kw
			of Value(_, Value ch, _) => (
				if not (!output_in_utf8) then ch else char_to_utf8 ch
			) | _ => (
				if not (!output_in_utf8) then "%" ^ kw ^ "%"
				else	case keyword_to_utf8 kw of
						Value s => s
					|	Nil => "%" ^ kw ^ "%"
			)
		else	"%" ^ kw ^ "%"
	);

	fun string_of_extended_char ch =
		if !use_extended_chars orelse ord ch < 128
		then	if not (!output_in_utf8) then ch else char_to_utf8 ch
		else	case	PrettyNames.find_char ch
			of Value(kw::_, _, _)	=> "%" ^ kw ^ "%"
			| _			=> ch;

=TEX
Because the first argument of the $false$ response of $aux\_kw$ may contain double Qs we cannot
rely on $get\_pcs$ processing to have spotted other simplifications, so
we discard the first and third argument.
=SMLPLAIN SML
	fun aux_kw x_aux tail = (
		case	get_pc ("", tail)
		of (_, false, _) => "%":: "%":: (x_aux tail)
		| (kw, true, tail1) => (string_of_kw kw) :: (x_aux tail1));

	val pQp = "%" ^ "Q" ^ "%";
	val pQppQp = pQp ^ pQp;
	val pQppQppQp = pQp ^ pQp ^ pQp;

=TEX
Because the first argument of the $false$ response of $get\_kw$
cannot contain percents or double Qs we can safely just output
this first argument.
=SMLPLAIN SML
	fun aux nil = []
	|   aux ("Q"::"Q"::"Q"::"Q"::t) = "Q"::(aux t)
	|   aux (f as "Q"::"Q"::rest) = (
		case	get_kw ("", rest)
		of (badkw, false, t) => pQppQp :: (aux ((explode badkw) @ t))
		|  (kw, true, t) => (string_of_kw kw) :: (aux t))
	|   aux (f as "Q"::t) = pQp :: (aux t)
	|   aux ((h as "\"")::t) = h::(aux_str t)  (*="=*)
	|   aux ("%"::t) = aux_kw aux t
	|   aux (h::t) = (string_of_extended_char h)::(aux t)

	and aux_str nil = []
	|   aux_str ("\""::t) = "\""::(aux t)
	|   aux_str ("%"::t) = aux_kw aux_str t
	|   aux_str ("Q"::"Q"::"Q"::"Q"::t) = "Q"::(aux_str t)
	|   aux_str ("Q"::t) = pQp :: (aux_str t)
	|   aux_str ("\\"::d1::d2::d3::t) = (
		if		(d1 >= "0" andalso d1 <= "9")
		andalso	(d2 >= "0" andalso d2 <= "9")
		andalso	(d3 >= "0" andalso d3 <= "9")
		then
			let
				val dd1 = ord d1 - ord_0;
				val dd2 = ord d2 - ord_0;
				val dd3 = ord d3 - ord_0;
				val ch = (dd1 * 10 + dd2) * 10 + dd3;
				val chr_ch = chr ch;
				val rep_str =
					if ch > 127
					then	string_of_extended_char chr_ch
					else	implode["\\", d1, d2, d3];
			in
				rep_str::(aux_str t)
			end
		else
			"\\"::d1::(aux_str(d2::d3::t)))
	|   aux_str(h::t) = (string_of_extended_char h)::(aux_str t);
in
	implode(aux(explode s))
end);
=IGN
val pc = chr(ord("%"));
val Q = chr(ord("Q"));
translate_for_output ("ab" ^ pc ^ "de" ^ Q ^ Q ^"delta"^ Q ^ Q);
translate_for_output ( "de" ^ Q ^ Q ^"delta"^ Q ^ Q);
=TEX
}

=SMLPLAIN SML
fun ⦏writer⦎ (s : string) : string = (
let
	val chars = logit RWchars_written "translate_for_output" s;
in
	if	!RWwriter_convert
	then	chars
	else	translate_for_output chars
end);
=TEX

%********************************************************************

\subsection{Input Pushback}

The pushed back input stream is a list of single characters, it should
not contain any empty strings or control-Ds.  Either of these may be
wrongly interpreted as end of input.

=SMLPLAIN SML
fun ⦏screen_for_push_back⦎ (chars:string) (prev:string list) : string list = (
let
	fun aux (""::t) prevA = aux t prevA
	| aux (h::t) prevA = aux t (h::prevA)
	| aux nil prevA = prevA
in
	aux (rev(explode chars)) prev
end);
=TEX

%********************************************************************
\subsection{Common Utilities for $useXXX$ functions}

We are not using the exception handler feature in the compatibility module
yet:
=SMLPLAIN SML
fun ⦏handler⦎ (ex : exn) : unit = (
	raise ex
);
=TEX
=SML
fun ⦏my_string_of_exn⦎ (ex : exn) : string = (
	case ex of
		Fail msg => get_message msg
	|	Error msg => get_message msg
	|	ex => string_of_exn ex
);
=TEX

The user can ask for the input stream to be treated as UTF-8.
=SML
local
	val use_utf8 = fn () => if ExtendedIO.get_env "PPCHARSET" = "ext" then false else true;
in
	val ⦏input_in_utf8⦎ = ref (use_utf8 ());
	val _ = new_flag {name = "input_in_utf8",  control = input_in_utf8,
			check = fun_true, default = use_utf8};
end;
=TEX
The following function inputs more characters from an input stream.
If we are not processing a UTF-8 input stream, one character is input.
If we are processing a UTF-8 input stream, we input one Unicode code point
from the stream and convert it into the ProofPower representation (which
will either be a single character or a keyword representing a code point that
has no ProofPower single character equivalent).
If invalid UTF-8 is encountered it raises an exception.
Caller may choose to catch this exception and try again with the rest of the stream.
The strings in the list returned each comprise exactly one character:
end of stream is signalled by an empty list.
=SML
fun ⦏input_next⦎ (caller : string, msg : int, file : string, line : int)
		(istrm : instream) : string list = (
	let	fun aux () = (
			if	(not o !) input_in_utf8
			then	case input(istrm, 1) of
					"" => []
				|	ch => [ch]
			else	(case utf8_input istrm of
					Nil => []
				|	Value cp => (
						(explode o unicode_to_pp) cp
				)) handle Fail _ => fail caller msg [fn () => file,
								fn () => string_of_int line]
		);
	in	aux ()
	end		
);
=TEX
=SML
fun ⦏input_to_end_of_line⦎ (caller : string, msg : int, file : string, line : int)
	(istrm : instream) : string = (
	let	val input_chars = input_next (caller, msg, file, line);
		fun aux acc () = (
			case input_chars istrm of
				[] => (implode o rev o flat) acc
			|	cs as ["\n"] => (implode o rev o flat) (cs :: acc)
			|	cs => aux (cs::acc) ()
		);
	in	aux [] ()
	end
);
=SML

=TEX
\subsection{Reading From a File -- {\tt use_file}}

Reading from a file is normally stopped at the first failure noted
within the file, this can be altered to cause the whole file to be
processed.

=SMLPLAIN SML
val use_file_non_stop_mode = ref false;
val _ =
new_flag {name = "⦏use_file_non_stop_mode⦎",  control=use_file_non_stop_mode,
	check = fun_true, default=fn () => false};
=TEX
$raw_use_file$ does the work. We then set-up the portability module
to use it and make $use_file$ point to the portability module's use function.
This means that the portability modules record of loaded files will
be maintained.
{\ftlinepenalty=9999
=SMLPLAIN SML
fun ⦏raw_use_file⦎ (user_file:string) : unit = (
let
	val (cur_in, file) =	(open_in user_file, user_file)
			handle Io _ => let val f = user_file ^ ".ML" in (open_in f,  f) end
			handle Io _ => let val f = user_file ^ ".sml" in (open_in f,  f) end
			handle Io _ => fail "use_file" 5009 [fn () => user_file]
			;
	val line_number = ref 1;
	val copies_of_char_sent = ref 0;
	exception Read_too_often of string;

	val read_ahead : string list ref = ref nil;

	val input_chars = input_next ("use_file", 5541, file, !line_number);

	fun read_char () : string = (
		case !read_ahead of
			[] =>	(
				case input_chars cur_in of
					[] => ""
				|	h :: t => (read_ahead := t; h)
		) |	h :: t => (read_ahead := t; h)
	);

	fun look_ahead_char () : string = (
		let	val ch = read_char ();
		in	read_ahead := (ch :: !read_ahead);
			ch
		end
	);

	fun ⦏f_advance⦎ () : string = (
		case read_char()
		of "" =>	if !copies_of_char_sent > max_copies_of_char_sent
				then	raise Read_too_often "<\"\">"
				else	(copies_of_char_sent := (!copies_of_char_sent + 1);
					logit RWchars_read "f_advance              " "")
		|  "\n" => (	copies_of_char_sent := 0;
				line_number := !line_number + 1 ;
				logit RWchars_read "f_advance              " "\n")
		|  ch => (	copies_of_char_sent := 0;
				logit RWchars_read "f_advance              " ch)
	);

	fun ⦏f_look_at_next⦎ () = (
		case look_ahead_char()
		of "" =>	if !copies_of_char_sent > max_copies_of_char_sent
				then	raise Read_too_often "<\"\">"
				else	(copies_of_char_sent := (!copies_of_char_sent + 1);
					logit RWchars_read "f_look_at_next         " "")
		|  ch =>	if !copies_of_char_sent > max_copies_of_char_sent
				then	raise Read_too_often ch
				else	(copies_of_char_sent := (!copies_of_char_sent + 1);
					logit RWchars_read "f_look_at_next         " ch)
	);

	fun ⦏f_push_back⦎ ("":string) : unit = ()
	| f_push_back (chars:string) : unit = (
		logit RWchars_read "f_push_back            " chars;
		read_ahead := screen_for_push_back chars (!read_ahead)
	);


	val reader = {	advance = f_advance,
			look_at_next = f_look_at_next,
			push_back = f_push_back} : READER_ENV;

	fun ⦏use_file_loop⦎ () : unit = (
		if look_ahead_char() <> ""
		then (PPCompiler.compile2 (cur_in,
			get_ML_outermost reader, writer, handler);
			use_file_loop()
			)
		else PPCompiler.compile2 (cur_in, (fn _ => ""), writer, handler)
	);
in
	while (
	 (use_file_loop (); false)
		handle Read_too_often ch => (
			raw_diag_string(get_error_message 5501
				[ch, file, string_of_int (!line_number)]);
			close_in cur_in;
			raise Stop)
		| ex =>
			if !use_file_non_stop_mode
			then (
				raw_diag_string(get_error_message 5502 [my_string_of_exn ex,
					string_of_int (!line_number)]);
				true)
			else (
				raw_diag_string(get_error_message 5503
					[my_string_of_exn ex, file, string_of_int (!line_number)]);
				close_in cur_in;
				raise Stop)
	) do ( (* nothing *) )
	;
	(* Only reach here after reading end-of-file *)
	close_in cur_in
end);
val _ = PPBuild.pp'set_use raw_use_file;
val ⦏use_file⦎ : string -> unit = PPBuild.pp'use o translate_for_output;
val ⦏use_file1⦎ : string -> unit = PPBuild.pp'use;
=TEX
}

%********************************************************************

\subsection{Reading From a String -- {\tt use_string}}

{\ftlinepenalty=9999
=SMLPLAIN SML
fun ⦏use_string⦎ (str:string) : unit = (
let
	val cur_str = ref(explode str);
	val char_number = ref 1;
	val copies_of_char_sent = ref 0;
	exception Read_too_often of string;

	fun ⦏s_advance⦎ () : string = (
		case !cur_str
		of nil =>	if !copies_of_char_sent > max_copies_of_char_sent
				then	raise Read_too_often "<\"\">"
				else	(copies_of_char_sent := (!copies_of_char_sent + 1);
					logit RWchars_read "s_advance              " "")
		|  ch::t =>	(copies_of_char_sent := 0;
				char_number := !char_number + 1;
				cur_str := t;
				logit RWchars_read "s_advance              " ch)
	);

	fun ⦏s_look_at_next⦎ () = (
		case !cur_str
		of nil =>	if !copies_of_char_sent > max_copies_of_char_sent
				then	raise Read_too_often "<\"\">"
				else	(copies_of_char_sent := (!copies_of_char_sent + 1);
					logit RWchars_read "s_look_at_next         " "")
		|  ch::_ =>	if !copies_of_char_sent > max_copies_of_char_sent
				then	raise Read_too_often ch
				else	(copies_of_char_sent := (!copies_of_char_sent + 1);
					logit RWchars_read "s_look_at_next         " ch)
	);

	fun ⦏s_push_back⦎ ("":string) : unit = ()
	| s_push_back (chars:string) : unit = (
		logit RWchars_read "s_push_back            " chars;
		cur_str := screen_for_push_back chars (!cur_str)
	);

	val reader = {	advance = s_advance,
			look_at_next = s_look_at_next,
			push_back = s_push_back} : READER_ENV;

	fun ⦏use_string_loop⦎ () : unit = (
		if !cur_str <> nil
		then (PPCompiler.compile1 ("<use_string>",
				get_ML_outermost reader, writer,
					handler);
			use_string_loop()
		)
		else	(PPCompiler.compile1 ("<use_string>",
				(fn _ => ""), writer, handler))
	);
in
	use_string_loop ()
		handle Read_too_often ch => (
			raw_diag_string(get_error_message 5511
				[ch, string_of_int (!char_number)]);
			raise Read_too_often ch)
		| ex => (
			raw_diag_string(get_error_message 5512 [my_string_of_exn ex, string_of_int (!char_number)]);
			raise Stop)
	(* Only reach here after reading end-of-string *)
end);
=TEX
}
=SML
val ⦏use_utf8_string⦎ : string -> unit = 
	use_string o implode o map unicode_to_pp o utf8_string_to_unicode;
=TEX
%********************************************************************

\subsection{Reading from a Terminal -- {\tt use_terminal}}

It only makes sense to have one invocation of $use\-\_terminal$, by
contrast calls to function $use\-\_file$ may be nested, one file may
include another.  This means that the basic reading functions (i.e.,
the `$f_\ldots$' functions) need to be declared within $use\-\_file$ so
that they and any file related data items, such as the stream and the
lookahead buffer, are local to that invocation.  Calls of function
$use\-\_string$ may be nested with calls of $use\-\_file$. {} With
$use\-\_terminal$ only one invocation is allowed because of the handling of
the read ahead and the type ahead buffers.
Most of the local data and functions for $use\-\_terminal$ are declared
outside the function making the text of $use\-\_terminal$ itself smaller
than either $use\-\_file$ of $use\-\_string$, although the function and its support
is larger.

Prompts are required when the system wants the user to enter some
	characters.  Input is line based, the operating system provides
	line editing and only passes the characters when an end-of-line
	character is typed.  Second and later lines of a {\em topdec\/}
	should have a different prompt to the first.  To distinguish
	this reader from the PolyML default reader the prompts have a
	colon `:' added.  A prompt is required when the previously read
	character is a new line.

These prompts may be redefined by the user.  Prompts must be normal ASCII
printing characters except `{\tt Q}' and `{\tt \%}'.

=SMLPLAIN SML
local (* for use_terminal, ask_at_terminal and reset_use_terminal *)

val ord_sp	= ord " ";
val ord_Q	= ord "Q";
val ord_pc	= ord "%";

fun check_prompt(pr:string) : bool = (
let
	fun aux ch = (
	let
		val chord = ord ch
	in
		not(		chord < ord_sp
			orelse	chord > 126
			orelse	chord = ord_Q
			orelse	chord = ord_pc)
	end
	);

	fun check(nil) = true
	| check(h::t) = (aux h) andalso (check t)
	;
in
	check(explode pr)
end
);
=TEX

=SMLPLAIN SML
val prompt1_default = ":) ";

val prompt1 : string ref = ref prompt1_default;
val _ =
new_string_control{name="prompt1", control=prompt1,
	default = fn() => prompt1_default, check = check_prompt};
=POLYML
val prompt2_default = ":# ";
val prompt2 : string ref = ref prompt2_default;
val _ =
new_string_control{name="prompt2", control=prompt2,
	default = fn() => prompt2_default, check = check_prompt};
=TEX


=SMLPLAIN SML
	val cur_prompt : string ref = ref(!prompt1);

	val prompt_for_more : bool ref = ref true;
	fun issue_prompt() : unit = (
		if !prompt_for_more
		then	(output(std_out, !cur_prompt); ExtendedIO.flush_out std_out)
		else	()
	);
=TEX

All exceptions should be fielded by the reader, they should be
	reported to standard output, then the next {\em topdec\/}
	solicited.

Counting of times a character is used should take place just as
	in the other readers, to reduce the chances of run-away
	recursion of the parsing routines.

=SMLPLAIN SML
	val copies_of_char_sent = ref 0;
	exception Read_too_often of string;
=TEX

The lookahead buffer holds characters which have actually been read,
they are held until required by the parser.  The head of the list holds
the next character to be read, pushed back characters are added to the
head.

=SMLPLAIN SML
	val read_ahead : string list ref = ref nil;
=TEX

Reading of characters is mainly handled by one routine which deals
with prompting as required.  The second-line of a {\em topdec\/} is
considered to have started only after a character other than a new line
has been read.
Characters are also read by function $ask_at_terminal$ which empties
the terminal type ahead buffer into the look ahead buffer.

=SMLPLAIN SML
local
	val input_chars = input_next ("use_terminal", 5540, "", 0);
	fun read_next_character () = (
		issue_prompt();
		case input_chars std_in of
			[] => (prompt_for_more := true; "")
		|	h :: t => (
				read_ahead := t;
				prompt_for_more := h = "\n";
=POLYML
				if (not o !) prompt_for_more
				then	(cur_prompt := !prompt2; h)
				else
=SML
					h
		)
	);
in
	fun read_char () : string = (
		case !read_ahead of 
			[] => read_next_character()
		|	h :: t => (read_ahead := t; h)
	);

	fun look_ahead_char () : string = (
		case !read_ahead of
			[] =>	let	val ch = read_next_character();
				in	read_ahead := ch :: !read_ahead;
					ch
				end
		|	h :: _ =>	h
	);
end;
=TEX

=SMLPLAIN SML
	fun ⦏t_push_back⦎ ("":string) : unit = ()
	| t_push_back (chars:string) : unit = (
		logit RWchars_read "t_push_back            " chars;
		read_ahead := screen_for_push_back chars (!read_ahead)
	);
=TEX

The functions passed in a $READER_ENV$ record are very similar\footnote{We
could take advantage of the routine $read_next_character$ to centralise
the character counting in a future release of this document.} to those
of the other readers apart from the end-of-file handling not being
needed.

=SMLPLAIN SML
	fun ⦏t_advance⦎ () : string = (
		copies_of_char_sent := 0;
		logit RWchars_read "t_advance              " (read_char ())
	);
=TEX

Note the call on $t_advance$ before raising $Read_too_often$ in
$t_look_at_next$, this is
to force a way past the offending character.

=SMLPLAIN SML
	fun ⦏t_look_at_next⦎ () = (
	let
		val ch = look_ahead_char()
	in
		if !copies_of_char_sent > max_copies_of_char_sent
		then	(t_advance(); raise Read_too_often ch)
		else	(copies_of_char_sent := (!copies_of_char_sent + 1);
			logit RWchars_read "t_look_at_next         " ch)
	end);

	val reader = {	advance = t_advance,
			look_at_next = t_look_at_next,
			push_back = t_push_back} : READER_ENV;
=TEX

Most exceptions should be handled by the \Compiler{} loop which reports
them and then continues.  Exception $TooManyReadEmpties$ is
raised in response to end-of-file (control-D) characters being passed
to the parsing functions, the response is\footnote{Should probably also
	do a $PolyML.commit$ here to follow the practice of PolyML
	itself.  Unfortunately if we did then the first action on
	starting with such a database is to resume this function after
	the commit, which means that the quit is performed.  This leads
	to a PolyML database which quits immediately after it is
	started.  Some more investigation is required in this area.}
to call $PolyML.quit$.  Exception $Read_too_often$ denotes
a coding fault in the processing of the users input.  Exception
$AbandonReaderWriter$ indicates the users desire to abandon this reader
writer package.  All other exceptions are just reported.  Note that in
many, perhaps all, cases $PolyML.compiler$ will catch the exception, report it, and
raise an exception whose name is not available (presumably it is
declared local to the PolyML system).  This means that there needs to be
a check for abandoning in the ``others'' clause of the match for
exceptions below.

In the following the function $recoverable$ examines any exception while processing the input stream, makes a report to the use and decides whether processing should continue.
These exceptions (may, depending on the compiler) occur as a result of keyboard interrupt.
Thus ``processing'' here must cover looking ahead at the first character to check whether the input stream is empty.
For many years the code below ``worked'' without handling exceptions at that point, but it does not work with Poly/ML 5.1.
{\ftlinepenalty=9999
=SMLPLAIN SML
in (* local for use_terminal, ask_at_terminal and reset_use_terminal *)

fun ⦏use_terminal⦎ () : unit = (
let
	fun ⦏recoverable⦎ (ex : exn) : bool = (
		case ex of
			TooManyReadEmpties => (
			raw_diag_string(get_error_message 5523 nil);
			PPCompiler.exit 0;
			false
		) |	Fail x => (
			raw_diag_string(get_error_message 5522
				["Fail", get_message x]);
			true
		) |	Error x => (
			raw_diag_string(get_error_message 5522
				["Error", get_message x]);
			true
		) |	AbandonReaderWriter => (
			raw_diag_string(get_error_message 5525 []);
			false
		) |	Read_too_often ch => (
			raw_diag_string(get_error_message 5524 [ch]);
			true
		) |	ex => (
			if !abandoning
			then (
				raw_diag_string(get_error_message 5525 []);
				false)
			else (
				raw_diag_string(get_error_message 5526
			[my_string_of_exn ex]);
				true)
		)
	);

	fun ⦏use_term_loop⦎ () : unit = (
		if	(if look_ahead_char() <> ""
			then (	PPCompiler.compile1 (
					"<use_terminal>",
					get_ML_outermost reader,
					writer,
					handler);
				true	)
			else (	raw_diag_string(get_error_message 5523 []);
				PPCompiler.exit 0;
				false	))
			handle ex => recoverable ex
		then	( (* go round again for some more ... *)
			cur_prompt := !prompt1;
			use_term_loop ())
		else	() (* i.e. return to caller of use_terminal *)
	);
in
	if !use_terminal_is_active
	then
		(
			cur_prompt := !prompt1;
			prompt_for_more := true
		)
	else
		(
			use_terminal_is_active := true;
			abandoning := false;
			cur_prompt := !prompt1;
			prompt_for_more := true;
			use_term_loop ();

			use_terminal_is_active := false
		)
end);
=IGN
Alternatively:
			output(std_out, "End of input to use_terminal.  Commit and quit.\n");
			PolyML.commit();
=TEX
}

The PolyML input output system has a `type ahead' buffer which is normally
invisible, however when questions are to be asked of the user at the terminal
the type ahead buffer must be emptied before reading the users answer.
Failing to empty the buffer may mean the wrong text being taken as the
answer.

Recording the contents of the type ahead buffer is only performed
on terminals, do nothing for other type of input.

=SMLPLAIN SML
fun ⦏ask_at_terminal⦎ (prompt:string) : string = (
let
	fun read_terminal_type_ahead_buffer  () : unit = (
	let
		val input_chars = input_next ("ask_at_terminal", 5540, "", 1);
		fun aux prev_ch = (
			if ExtendedIO.can_input(std_in, 1)
			then	aux((input_chars std_in) @ prev_ch)
			else	prev_ch
		);
		val typed_ahead = aux [];
	in
		case typed_ahead of
			last ::_ => prompt_for_more := last = "\n"
		| _ => ();
		read_ahead := !read_ahead @ (rev typed_ahead)
	end
	);
	val input_reply = input_to_end_of_line ("ask_at_terminal", 5540, "", 1);
in
	if  !use_terminal_is_active
	then	if ExtendedIO.is_term_in std_in
		then
			(	read_terminal_type_ahead_buffer();
				output(std_out, prompt);
				ExtendedIO.flush_out std_out;
				input_reply std_in
			)
		else	fail "ask_at_terminal" 5013 []
	else	fail "ask_at_terminal" 5012 []

end) (* of ask_at_terminal *);
=TEX
=SMLPLAIN SML
fun ⦏reset_use_terminal⦎ () : unit = (
	read_ahead := [];
	use_terminal_is_active := false;
	abandoning := false
);

end (* of local for use_terminal, ask_at_terminal and reset_use_terminal *);
=TEX

%********************************************************************
\subsection{Translating Output Functions}
=SMLPLAIN SML
val ⦏diag_string⦎: string -> unit = raw_diag_string o translate_for_output;
val ⦏list_diag_string⦎ : string list -> unit = list_raw_diag_string o map translate_for_output;
val ⦏diag_line⦎ : string -> unit = raw_diag_line o translate_for_output;
=TEX

\subsection{Completion of Basic Reader Writer}

=SMLPLAIN SML
end (* of structure ReaderWriter *);

open ReaderWriter;
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{HOL READER WRITER}

=SMLPLAIN SML
structure ⦏HOLReaderWriter⦎ : HOLReaderWriter = struct

open ReaderWriterSupport;
=TEX

%********************************************************************

\subsection{Warning Messages}

Faults detected in the embedded text are reported via $local_error$ as
they occur, they are also noted in the generated output using these
two functions.

=SMLPLAIN SML
fun ⦏lex_error_code⦎ (id : int, prev:string list) : string list = (
	", Lex.Text\"" :: (*="=*)
	"Lex.Error " ^ (string_of_int id) ::
	"\", " :: (*="=*)
	prev
);

fun	⦏lex_error_codes⦎ (nil : int list, prev:string list) : string list =
		prev
|	lex_error_codes (errnos, prev) =
		fold lex_error_code errnos prev
;
=TEX

%********************************************************************

\subsection{Recursive HOL Parser}

Brackets within HOL text need only be examined to see if they relate to
comments, all the other forms of bracket can simple be passed on for
the HOL lexical analyser and parser to deal with.

{\ftlinepenalty=9999
=SMLPLAIN SML
fun ⦏get_HOL_any⦎ (R:READER_ENV) (prevA:string list) : string list= (
let
	open PrettyNames;

	fun	do_keyword _ (_,Value ch,Simple) p =
			get_HOL_any R ((to_ML_string ch) :: p)
	|	do_keyword _ (names,Nil,Simple) p =
			get_HOL_any R ("%" ^ (hd names) ^ "%" :: p)
	|	do_keyword k (info as (_,_, (Starting(proc, str)))) p =
			get_HOL_any R (proc R k str false p)
	|	do_keyword _ (_,_,Middle str) p =
			get_HOL_any R (str :: p)
	|	do_keyword (k, _) (_,ch_opt,Ending str) p =
			((*=[(("=*)	"\"))" :: to_ML_string k ::
				"\"], \"" :: to_ML_string str :: p)
	|	do_keyword _ (_,_,Ignore) p =
			get_HOL_any R p
	|	do_keyword (k, is_keyword) (names,_,Invalid) p = (
			local_error "get_HOL_any" 5007
				[fn () => if is_keyword then "%" ^ k ^ "%" else k];
			get_HOL_any R (lex_error_code(5007, p)));

	fun do_string ML_string = (
		let	val (read_string, ol_name) =
				if ML_string
				then	(get_ML_string, "Lex.String")
				else	(get_primed_string, "Lex.Char");
			val (str, errnos) = read_string R (ol_name :: "\", " :: prevA); (*="=*)
			val text_so_far = ", Lex.Text\"" (*="=*) :: str;
		in
			get_HOL_any R (lex_error_codes(errnos, text_so_far))
		end
	);

	val next = #look_at_next R ()
in
	case read_symbol R
	of	SymCharacter ch => (
			case ch
			of "("	=>	(	if #look_at_next R () = "*"
						then
							(skip_comment R;
							get_HOL_any R (" " :: prevA))
						else
							get_HOL_any R ( "(" ::  prevA))
			|  "\""	=>	do_string true (*="=*)
			|  "`"	=>	do_string false
			|  "Q"	=>	get_HOL_any R ("QQQQ" :: prevA)
			|  "\\"	=>	get_HOL_any R ("\\\\" :: prevA)
			|  _ => 	get_HOL_any R (ch :: prevA)
		)
	|	SymEndOfInput => prevA
	|	SymWhite chs =>  (
			if	contains chs "\n"
			then	get_HOL_any R ("\", Lex.Text\""  :: (" " :: prevA))
			else	get_HOL_any R (" " :: prevA))
	|	SymKnown(sym, is_keyword, info) => do_keyword (sym, is_keyword) info prevA
	|	SymDoublePercent => get_HOL_any R ("%%" :: prevA)
	|	SymUnknownKw(sym, is_closed) => (
			local_error "get_HOL_any" 5003 [fn () => sym, fn () =>
							implode(rev(" ... " :: (prevA to 20)))];
			get_HOL_any R (lex_error_code(5003, prevA))
		)
	|	SymUnknownChar ch => (
			local_error "get_HOL_any" 5005
						[fn () => ch,
						fn () => string_of_int(ord ch),
						fn () => implode(" ... " :: (rev(prevA to 20)))];
				get_HOL_any R (lex_error_code(5005, prevA))
		)
end);
=TEX
}

%********************************************************************

\subsection{Outer Level of the HOL Reader}

HOL text is to be read, the opening symbol and language name are
given.  Produce Standard~ML text as follows to add onto the left
hand context.

=GFT SML
( recogniser ( "starting symbol", "language name", quoted_text, "closing symbol" ))
=TEX

When the $add_semi$ argument is true then add, additionaly, a semi-colon
to indicate the end of an outermost Standard~ML expression.

Where the $quoted_text$ is a list of values of type $Lex.INPUT$, see
section\ref{DatatypeForParserInterface}.  Function $HOL_reader$ is
responsible for building the opening part of the Standard~ML text,
function $get_HOL_any$ reads and assembles the quoted text (i.e., the
body of the quotation) and the closing text.

=SMLPLAIN SML
fun ⦏HOL_reader⦎ (recogniser:string) (add_semi:bool)
		(R:READER_ENV) (start:string, is_keyword:bool)
		(lang:string) (opening:string) (prevA:string list) : string list = (
let
	val prevB =
		opening ::
		"\", [Lex.Text\"" ::
		to_ML_string lang ::
		"\", \"" ::
		to_ML_string start ::
		"(\"" (*=")=*) ::
		recogniser ::
		"("  (*=")=*) ::
		prevA;

	val read_text = get_HOL_any R prevB;
in
	if add_semi
	then
		";" :: read_text
	else
		read_text
end
);
=TEX

HOL labelled products are similar to the general HOL text, but have an
extra name at their start, this name is completed by an end of line.
On entry the first character of the name is the first unread
character.  The name field extends to the end of the current input
line.

{\ftlinepenalty=9999
=SMLPLAIN SML
fun ⦏HOL_lab_prod_reader⦎ (R:READER_ENV) (start:string, is_keyword:bool)
		(lang:string) (opening:string) (prevA:string list) : string list = (
let
	exception NoName of (SYMBOL * string list);

	fun get_name prevN = (
		case read_symbol R
		of SymCharacter ch => get_name (ch::prevN)
		| SymEndOfInput => fail "HOL_lab_prod_reader" 5002 nil
		| SymDoublePercent => get_name ("%" :: prevN)
		| SymWhite wh =>	if contains wh "\n"
					then
						prevN
					else	if	is_nil prevN
						then	get_name prevN
						else	get_name(" "::prevN)
		| sym as SymKnown(_, _, info) =>
					get_name(
						(case info
						of (_, _, PrettyNames.Ignore) => ""
						| (_, Value ch, _) => ch
						| (name::_,_,Simple) => "%" ^ name ^ "%"
						| _ => raise NoName (sym, prevN)
						) :: prevN)
		| sym => raise NoName (sym, prevN)
	);

	val (lp_name, lp_errors) = (
		(implode(rev(get_name nil)), nil)
		handle NoName (s, p) => (
			local_warn "HOL_lab_prod" 5036 [fn () =>
				implode(rev((expand_symbol s) :: p))];
			("", [5036])
		)
	);

	val prevB = add_error_codes(lp_errors,
			"HOL_lab_prod_recogniser" ::
			"(" ::
			prevA
	);

	val prevC =
		opening ::
		"\", [Lex.Text\"" ::
		to_ML_string lp_name ::
		"\", \"" ::
		to_ML_string lang ::
		"\", \"" ::
		to_ML_string start ::
		"(\"" (*=")=*) ::
		prevB;
in
	";" :: (get_HOL_any R prevC)
end
);
=TEX
}

%********************************************************************

\subsection{Installing the HOL Reader}

=SMLPLAIN SML
val ⦏HOL_term_reader⦎ = HOL_reader "HOL_term_recogniser" false;
val ⦏HOL_type_reader⦎ = HOL_reader "HOL_type_recogniser" false;
=TEX

=SMLLITERAL
val _ = add_general_reader("⌜", "", "Lex.Term", HOL_term_reader);
val _ = add_general_reader("⌜", "HOL", "Lex.Term", HOL_term_reader);
val _ = add_general_reader("⌜", "HOL:", "Lex.Type", HOL_type_reader);
val _ = add_general_reader("⌜", ":", "Lex.Type", HOL_type_reader);

val _ = add_specific_reader("ⓣ", "Lex.Type", HOL_type_reader);
=TEX


%********************************************************************

\subsection{Pretty Characters for HOL} \label{PrettyCharactersForHOL}

Box drawing, first the symbols that start a box.  Note that many
of these symbols have no interpretation in HOL or Standard~ML.
The Standard~ML comments below that contain only a string quote
`~{\tt"}~' are present to make the number of such quotes even
on each line.

The bracketing conventions used within HOL text need explaining.
Simple HOL text used as term or type expressions is not bracketed.  The
definitional HOL texts include brackets, these are generally used in a
style where the user enters the five components: {\em start,
definitions, where, predicate} and {\em finish.}  The {\em start,
where} and {\em finish\/} are the symbols defined below.  The users
input is translated to give a HOL term comprising the pair ``({\em
definitions\/}),~({\em predicate\/})'' which is used as the argument of
a Standard~ML function to achieve the definition.

=SMLPLAIN SML
local
open PrettyNames;

in
val _ = add_new_symbols [
=TEX

Box drawing, symbols used within boxes.

=SMLLITERAL
	([	"BT"],		Value "├",
			Middle ("\", Lex.Separator\"" ^
			ReaderWriterSupport.to_ML_string"├" ^ "\", Lex.Text\""))
]
end (* of local *);
=TEX

Now the specific reading functions for the languages are introduced.

=SMLLITERAL
val _ = add_named_reader("Ⓢ", "HOLCONST",	"NONE",
			HOL_reader "HOL_const_recogniser" true);
val _ = add_named_reader("Ⓢ", "HOLLABPROD",	"NONE",
			HOL_lab_prod_reader);
=TEX

%********************************************************************
\subsection{HOL Reader Writer --- Completion}

=SMLPLAIN SML
end (* of structure HOLReaderWriter *);
=TEX

\section{ADDITIONAL SYMBOLS}
The following are called for Z in \cite{DS/FMU/IED/DEF007}
and are also made available for HOL.
The list was generated by taking all the
sievekeyword file entries with simple in them, then trying to
add each one as a new symbol and discarding those for which this fails.
=SML
val _ = map (fn n =>
	ReaderWriterSupport.PrettyNames.add_new_symbols
		[([n], Nil, ReaderWriterSupport.PrettyNames.Simple)])
["Box", "Diamond", "Im", "Join", "Longleftarrow",
   "Longleftrightarrow", "Longrightarrow", "Re", "Uparrow",
   "Updownarrow", "aleph", "approx", "asymp", "bigcirc", "bigodot",
   "bigoplus", "bigotimes", "bigsqcup", "bigtriangledown", "bigtriangleup",
   "biguplus", "bigvee", "bigwedge", "bowtie", "cdot",
   "clubsuit", "cong", "coprod", "dagger", "dashv", "ddagger", "diamond",
   "diamondsuit", "div", "doteq", "downarrow", "ell", "flat", "gg", "hbar",
   "heartsuit", "hookleftarrow", "hookrightarrow", "identical", "imath",
   "infty", "integral", "jmath", "leadsto", "leftarrow", "leftharpoondown",
   "leftharpoonup", "lhd", "ll", "longleftarrow", "longleftrightarrow",
   "longmapsto", "longrightarrow", "mho", "models", "mp", "nabla",
   "natural", "nearrow", "ni", "nwarrow", "odot", "oint", "ominus", "oslash",
   "otimes", "parallel", "partial", "pm", "prec", "preceq", "prod", "propto",
   "rhd", "rightharpoondown", "rightharpoonup",
   "rightleftharpoons", "searrow", "setminus", "sharp", "simeq",
   "smile", "spadesuit", "sqcap", "sqcup", "sqsubset", "sqsubseteq", "star",
   "succ", "succeq", "sum", "surd", "swarrow", "top", "triangleleft",
   "triangleright", "unlhd", "unrhd", "uparrow", "updownarrow", "wp", "wr",
   "<<", ">>"];
=TEX

Note: The $sqsubseteq$ and $identical$ keywords need to be associated with special characters in PP V0.5 and later. They will therefore need to be moved out of the above list and added to the reader-writer in an appropriate way together with there printable characters.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************************************************************
%--------------------------------------------------------------------

\newpage

\makeatletter
\def\refstepcounter#1{\stepcounter{#1}\global\edef\@currentlabel{\csname
	p@#1\endcsname\csname the#1\endcsname}}
\makeatother

\twocolumn[\section{INDEX}] \label{Index}

\footnotesize
\printindex

\onecolumn

\end{document}


=IGN
********************************************************************************
dtd110.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% dtd005.doc ℤ $Date: 2008/02/09 16:58:52 $ $Revision: 2.20 $ $RCSfile: dtd110.doc,v $

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

\def\AbstractText{This document contains the detailed design for the reading and writing functions that form the outermost level of user interface for Release 1 of ICL HOL. These functions are concerned with the differentiation of the various languages (initially Standard ML and HOL), and the extensions to support extended characters in Standard ML identifiers and in strings.}

\def\Reference{DS/FMU/IED/DTD005}

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
%% LaTeX2e port: % dtd005.doc ℤ $Date: 2008/02/09 16:58:52 $ $Revision: 2.20 $ $RCSfile: dtd110.doc,v $
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ]{article}
%% LaTeX2e port: 
%% LaTeX2e port: \TPPtitle{File and Terminal Reader Writer}
%% LaTeX2e port: \TPPref{DS/FMU/IED/DTD005}
%% LaTeX2e port: \def\SCCSissue{$Revision: 2.20 $%
%% LaTeX2e port: }
%% LaTeX2e port: \TPPissue{\SCCSissue}
%% LaTeX2e port: 
%% LaTeX2e port: \TPPdate{\FormatDate{$Date: 2008/02/09 16:58:52 $%
%% LaTeX2e port: }}
%% LaTeX2e port: \TPPproject{FST Project}
%% LaTeX2e port: 
%% LaTeX2e port: =IGN
%% LaTeX2e port: 
%% LaTeX2e port: Commands to process this document in various ways.
%% LaTeX2e port: 
%% LaTeX2e port: doctex dtd005
%% LaTeX2e port: texdvi dtd005
%% LaTeX2e port: bibtex dtd005
%% LaTeX2e port: doctex dtd005 ; texdvi dtd005
%% LaTeX2e port: doctex dtd005 ; texdvi dtd005 ; bibtex dtd005
%% LaTeX2e port: pstex dtd005
%% LaTeX2e port: 
%% LaTeX2e port: lasp -s dtd005.doc > zz1
%% LaTeX2e port: lasp -s -u dtd005.OKwords dtd005.doc > zz1
%% LaTeX2e port: 
%% LaTeX2e port: =TEX
%% LaTeX2e port: %\TPPstatus{Approved}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Standard}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthor{A.J. Hammon & WIN01}  %% Mandatory field
%% LaTeX2e port: \TPPauthorisation{R.D.~Arthan & FST Team Leader}
%% LaTeX2e port: \TPPabstract{This document contains the detailed design for the reading
%% LaTeX2e port: 	and writing functions that form the outermost level of user
%% LaTeX2e port: 	interface for Release~1 of ICL~HOL.  These functions are
%% LaTeX2e port: 	concerned with the differentiation of the various languages
%% LaTeX2e port: 	(initially Standard~ML and HOL), and the extensions to support
%% LaTeX2e port: 	extended characters in Standard~ML identifiers and in strings.}
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
\catcode`\_=\active
\def\_{\kern.06em\vbox{\hrule height.1ex width.3em}\hskip0.1em\relax}
%% LaTeX2e port: 
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: 
%% LaTeX2e port: \begin{document}
%% LaTeX2e port: \makeTPPfrontpage
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
\subsection{Contents List}
\tableofcontents
\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}
\begin{description}

\item [Issues 1.1 (1991/02/01) to 1.7 (1991/08/14) ] Initial drafts.

\item[22 August 1991, issue 2.1 ] First approved issue.

\item[20 January 1992, issue 2.2 ]
	Change to use new fonts.
	Addition of named quotations.
	Add $is_same_symbol$ function.

\item[28 January 1992, issue 2.3 ] New argument to function $HOL_reader$.

\item[21 February 1992, issue 2.4 ]
Removed error message 5521:
``Exception+ ?0 handled by use\-_terminal''.

\item[Issue 2.6 (1992/04/13)]
	Add details of prompt control strings.
	Clarify purpose of error code 5040.
	Clarify the scope of module and integration tests.

\item [13 April 1992, issue 2.7 ] Changes due to CR0017.

\item[Issue 2.9 (1992/08/13)]
	Change keywords used for general quotations.
	Add error 5009.
\item[Issue 2.10 (1996/01/29)]
	Removed a reference from a document box.
\item [Issue 2.11 (1996/02/28)]
	Reflecting changes to cope with PolyML 3.0.1.
\item [Issue 2.12 (1999/02/06),2.13 (2002/10/17)]
	Updates for NJML port.

\item[Issue 2.13 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 2.14 (2002/10/17)] PPHol-specific updates for open source release
\item[Issue 2.15 (2002/12/16)] Exposed the exception that $use\_file$ and $use\_terminal$ raise.
\item[Issue 2.16 (2004/11/08)] $use\_file$ now handles `Q' in files names nicely.
\item[Issue 2.17 (2004/11/10)] Added $use\_file1$ which is like the old $use\_file$.
\item[Issue 2.18 (2006/08/09)] Added function to give the value of the {\em use\_extended\_chars} flag.
\item[Issues 2.19 (2008/02/03), 2.20 (2008/02/09)] Port to Poly/ML 5.1.
\item[Issue 2.20 (2008/02/09)] Simplified $READER\_ENV$ type.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2015/03/21]
First working version with support for UTF-8 input and output.
\item[2015/03/22]
Added documentation for the new flags.
\item[2015/03/26]
Factored out common functions into Reader/Writer.
Added {\it use\_utf8\_string}.
\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}

%********************************************************************

\subsection{Changes Forecast}

Some of the text in this document and in the
implementation~\cite{DS/FMU/IED/IMP005} is more appropriate to the
system builder's guide~\cite{DS/FMU/IED/USR008} and should be
moved into that document.  When that happens the descriptions in the
reference manual entries should be rewritten to refer to the system
builder's guide.

Make $add_new_symbols$ errors 5100, 5101 and 5102 abandon the whole
operation.  This cannot be done until the extended character set is
rationalised.

Reduce the flexibility of general quotations by omitting the
$language_code$ in the syntax.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************************************************************
%--------------------------------------------------------------------

\newpage

\section{GENERAL}

%********************************************************************

\subsection{Scope}

This document contains a detailed design of the file and terminal
reading and writing functions, called for by~\cite{DS/FMU/IED/HLD008}.
These functions implement the extensions to Standard~ML detailed
in~\cite{DS/FMU/IED/DEF002}
which discusses the lexical nature of the Release 1 ICL HOL.  The
design is implemented in~\cite{DS/FMU/IED/IMP005}.

%********************************************************************

\subsection{Introduction}

The reader writer comprises two main parts, structures $ReaderWriter$
and $ReaderWriterSupport$, plus extensions for each of the supported
languages.  The first extension is in structure $HOLReaderWriter$ for
the HOL language.

The `basic reader writer' of the Release 1 ICL HOL system is
in structure $ReaderWriter$, it supports an
extension to Standard~ML that allows `extended characters' to be used in
Standard~ML text; in particular, in Standard~ML identifiers and
strings.  This interface is provided by a small number of functions, see
section~\ref{PrimaryUserInterface}.  These allow the enhanced ML text to
be read from the terminal, from a named text file, or from a
Standard~ML string.

A second part of the basic reader writer, the `embedding interface'
in structure $ReaderWriterSupport$,
allows readers for other languages to be embedded, allowing the
(enhanced) Standard~ML to be used as a metalanguage for supporting work
in other languages.  Part of the embedding interface provides for
characters in the user's source text to switch between languages, text
in an embedded language is treated as a Standard~ML string that is
passed as an argument to a language specific analysis routine ---
typically for lexical analysis, parsing, etc.

Within this document a reader writer for the HOL language is detailed,
it is added to the basic reader writer using the embedding interface.
Supporting the HOL language is a primary goal of the whole system,
within the reader writer it serves as a guide for the technique for
embedding other languages.

%--------------------------------------------------------------------

\subsubsection{Purpose and Background}

Some extensions to Standard~ML are given in~\cite{DS/FMU/IED/DEF002}
where they are described in terms of ``macro processing'' of the
extended Standard~ML to form Standard~ML.  The extensions are as
follows.

\begin{itemize}

\item An extended character set.  Many of the new characters may be
	used in ML identifiers, all may be used in strings.

\item Keywords enclosed in percent `{\tt\%}' signs may be used as
	equivalents for any of the extended characters.  Additional
	keywords are supported to provide access to many of the
	characters supported by \LaTeX{} to give flexibility in the
	form of a documents printed output.

\item Standard~ML programs may be read as extended Standard~ML {\em
	provided\/} all percent `{\tt\%}' signs in the original program
	are replaced by two adjacent percent signs.

\item Other languages may be embedded in the extended Standard~ML text,
	their text is surrounded by the appropriate language embedding
	symbols (i.e., by the extended characters or their equivalent
	keywords).

\end{itemize}

%--------------------------------------------------------------------

%\subsubsection{Dependencies}

%An indication on which other documents  this document is dependent on.

%--------------------------------------------------------------------

%\subsubsection{Interface}

%A brief explanation of the external interface presented by the
%document.  This should identify the signatures defined in the
%document.

%--------------------------------------------------------------------

\subsubsection{Possible Enhancements}

A journaling system that records all inputs and/or outputs
into a named file.

%--------------------------------------------------------------------

%\subsubsection{Deficiencies}

%An indication of any shortcomings in the facilities offered by the
%document.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{BASIC READER WRITER}

The basic reader writer offers a small number of interfaces, basically
those for directing the ICL~HOL system to its source text.  Additional
interfaces are provided in structure $ReaderWriterSupport$ for embedding
additional languages.

%--------------------------------------------------------------------
=DOC
signature ⦏ReaderWriter⦎ = sig
=DESCRIBE
File and terminal reading and writing functions.
=FAILURE
5001	End of file found in comment
5002	End of file found in string
5003	Unknown keyword `?0` after `?1`
5004	Unknown keyword `?0`
5005	Unknown extended character `?0` (decimal ?1) after `?2`
5006	Unknown extended character `?0` (decimal ?1)
5007	Unexpected symbol `?0` (a symbol of type $Invalid$ has been read)
5008	Bracket mismatch, `?0` found after an opening `?1`
5010	Unknown language requested by symbol `?0` with language name `?1`
5011	Unknown language requested
5014	Newline found in string after `?0`
5030	End of file in quotation
5032	End of file found in Standard ML quotation
5036	Unknown language `?0` requested
=FAILUREC
Several error messages are provided to report faults in the user's
textual input to the ICL HOL system, they may be produced from all of
the routines $use\-\_file$, $use\-\_string$ and $use\-\_terminal$.  Some error
messages might be associated with particular routines in the
$ReaderWriterSupport$ structure but that is incidental
to most users, so they are all gathered here.
=ENDDOC

%********************************************************************

\subsection{Primary User Interface} \label{PrimaryUserInterface}

%--------------------------------------------------------------------
=DOC
val ⦏set_unsupported_unicode_glyphs⦎ : UNICODE list -> UNICODE list;
=DESCRIBE
The Unicode equivalent of a character is defined in terms of a basic translation that maps characters
with codes in the range 0x00 to 0x7f to the Unicode code point with the same numeric code and maps characters
in the range 0x80 to 0xff to a list of Unicode code points that should give a good graphical representation of
the {\Product} symbol according to the Unicode standard.
This basic translation implemented by the function {\tt pp\_to\_unicode}.
However, some systems or applications
do not support glyphs for all of the Unicode code points that are needed.
{\it set\_unsupported\_unicode\_glyph cps} defines {\it cps} as a list of code points that do not
have supported glyphs (and returns the previous value of the list).
{\it use\_terminal} and {\it use\_file} will use an ASCII representation for {\Product} symbols that are mapped to code points in this left.

Code points corresponding to ASCII characters or that are not used in Unicode translation for the current set of extended characters known to the Reader/Writer are not allowed in the argument list.
=FAILURE
5542	0wx?0 represents an ASCII character
5543	0wx?0 is not used in the ProofPower to Unicode translation for the current set of extended characters
=ENDDOC
%--------------------------------------------------------------------

%--------------------------------------------------------------------
=DOC
val ⦏use_file⦎ : string -> unit;
val ⦏use_file1⦎ : string -> unit;
=DESCRIBE
Both of these functions compile and execute {\ProductML} (i.e., Standard ML
extended to allow mathematical symbols)  from the named file.
If the file does not exist then the it will read the file with the
given name and suffix ``{\tt.ML}'', if that file does not exist it will
try the suffix ``{\tt.sml}''.

{\it use\_file} passes the file name string through {\it translate\_for\_output} before using it
as an operating system file name which is appropriate for file names given as {\ProductML} strings.
The variant {\it use\_file1} uses the string exactly as given.

If the flag {\it input\_in\_utf8} is set, {\it use\_file} assumes its input file is UTF-8 encoded.
Note that in this mode, if error 5541 occurs, then line numbers in subsequent error messages may be inaccurate.
=SEEALSO
Error messages given with signature for $ReaderWriter$.
Flag $use\-\_file_non_stop_mode$.
=FAILURE
5009	Cannot read file `?0` or `?0.ML` or `?0.sml`
5541	Invalid UTF-8 encoding encountered in file ?0 at line ?1
=ENDDOC


These messages are written to the standard output by $use\-\_file$ after
errors are detected, they show where the error occured within the text
read.  After message 5502 is produced $use\-\_file$ continues reading the
input file.  After the other messages $use\-\_file$ stops reading and
returns to its caller.

=FAILURE
5501	DESIGN ERROR Character `?0` read too often, abandoning
	file ?1 at character number ?2
5502	Exception ?0 handled by use_file at line ?1 when in `non_stop_mode`
5503	Exception ?0 raised abandoning file ?1 at line ?2
=TEX



%--------------------------------------------------------------------
=DOC
val ⦏use_string⦎ : string -> unit;
=DESCRIBE
Read {\ProductML} from the given string in the {\Product} extended character encoding.
=SEEALSO
$use\_utf8\_string$,
error messages given with signature for $ReaderWriter$.
=ENDDOC

These messages are written to the standard output by $use\-\_string$ after
errors are detected, they show where the error occured within the text
read.  After these messages are produced $use\-\_string$ stops reading and
returns to its caller.

Note that the behaviour of $use\_string$ is not affected by the flag
$input\_in\_utf8$. Use $use\_utf8\_string$ to read Standard ML from a UTF-8 encoded string.

=FAILURE
5511	DESIGN ERROR Character `?0` read too often, abandoning
	string at character number ?1
5512	Exception ?0 raised; abandoning string at character number ?1
=TEX

%--------------------------------------------------------------------
=DOC
val ⦏use_utf8_string⦎ : string -> unit;
=DESCRIBE
Read {\ProductML} from the given string in the UTF-8 encoding.
=SEEALSO
$use\_string$, 
error messages given with signature for $ReaderWriter$.
=ENDDOC

%--------------------------------------------------------------------
=DOC
val ⦏use_terminal⦎ : unit -> unit;
=DESCRIBE
Read Standard~ML with extended characters allowed, from the terminal.
This routine takes over the terminal, it handles all exceptions as the
outermost level of the ML system.  To return to the default PolyML
terminal reader use $abandon_reader_writer$.

The function prompts for input using the string controls $prompt1$ and
$prompt2$. $prompt1$ (default ``{\tt:)~}'') is used when the compiler is expecting a new top-level
statement.
$prompt1$ (default ``{\tt:\#~}'') is used when the compiler is part-way through
parsing a top-level statement.

On reaching the end of the input stream the function $PolyML.quit$ is called.

If the flag {\it input\_in\_utf8} is set, {\it use\_terminal} assumes the input stream is UTF-8 encoded.

=SEEALSO
Error messages given with signature for $ReaderWriter$.
Control strings`$prompt1$' and `$prompt2$'.
=ENDDOC

These messages are written to the standard output by $use\-\_terminal$
after errors are detected.  Messages 5523 and 5525 are produced when
$use\-\_terminal$ stops reading the input, it then returns to its caller.
The other messages are status reports about the processing of some
input text, after producing them $use\-\_terminal$ continues reading
from the terminal.

=FAILURE
5522	Exception ?0 ?1 raised
5523	End of input to use_terminal.  Quit.
5524	DESIGN ERROR Character `?0` read too often, abandoning current input
5525	Abandoning reader writer
5526	Exception ?0 raised
5540	Invalid UTF-8 encoding in standard input
=TEX
%--------------------------------------------------------------------
=DOC
(* ⦏prompt1⦎  - boolean flag declared by new_flag, default: ":>" *)
(* ⦏prompt2⦎  - boolean flag declared by new_flag, default: ":#" *)
=DESCRIBE
Prompt strings for $use\-\_terminal$.  {} String $prompt1$ is used when the
reader writer is expecting the first line of a top-level expression,
$prompt2$ is used for subsequent lines.  The strings used here must
comprise characters whose decimal codes are in the range~32 to~126
inclusive, but excluding the characters~`{\tt Q}' (i.e., code~81)
and~`{\tt\%}'~(37).
=ENDDOC
=DOC
(* ⦏input_in_utf8⦎  - boolean flag declared by new_flag, default: false *)
=DESCRIBE
Controls whether
=INLINEFT
use_terminal
=TEX
\ and
=INLINEFT
use_file
=TEX
\ treat the input stream as UTF-8 encoded.
TODO.
=ENDDOC
=DOC
(* ⦏output_in_utf8⦎  - boolean flag declared by new_flag, default: false *)
=DESCRIBE
Controls whether the writer treats encodes its output stream in UTF-8.
TODO.
=ENDDOC
%--------------------------------------------------------------------

%--------------------------------------------------------------------
=DOC
val ⦏abandon_reader_writer⦎ : unit -> unit;
=DESCRIBE
Only meaningfully used after $use\-\_terminal$ has been called, when it
forces an exit from that routine.
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏reset_use_terminal⦎ : unit -> unit;
=DESCRIBE
Restores the state that controls $use_terminal$ to its default values.
N.b., this bypasses the check that $use_terminal$ makes on
recursive calls (and so could cause a small memory leak if
not used with care).
=ENDDOC
%--------------------------------------------------------------------
=DOC
(* ⦏use_file_non_stop_mode⦎  - boolean flag declared by new_flag, default: false *)
=DESCRIBE
Makes $use\-\_file$ continue reading text (if the flag is $true$) or stop
reading (if $false$) from the file after an error is reported by PolyML,
this includes both syntax and execution errors.  Default
is to stop reading.
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏ask_at_terminal⦎ : string -> string;
=DESCRIBE
Asks a question at the terminal by writing out the given string then
reading a single line of text which is returned.  Characters are read
until a newline or end of file is reached, in the first case the
the returned string will end with a newline.

Any characters in the type ahead buffer of the terminal input stream
before $ask_at_terminal$ is called
are read and saved (for later analysis by the normal reading functions)
before the prompt is output and the response is read.
=FAILURE
5012	Function `use_terminal` is not active
5013	Input stream is not a terminal, nothing read
=ENDDOC
%--------------------------------------------------------------------

The above function uses the PolyML function $ExtendedIO.can_input$ to
determine how many characters are available in the type ahead buffer,
they are read.  It next outputs the prompt, and finally makes a single
call of $ExtendedIO.input_line$.

\bigskip

Strings produced by, for example, converting parts of HOL terms into
textual form may contain keywords that should be converted into other
forms, in some cases these keywords may be wrapped in double letter
`{\tt QQ}'' characters, see~\cite{DS/FMU/IED/DEF002} for an
explanation.  Translation is automatically performed by the reader
writer for all text that the PolyML system writes to the standard
output.  Text written by $BasicIO.output$ to the standard output is not
converted --- this is because of how PolyML controls its output
streams.  Function $translate_for_output$ performs the conversions.  It
is forgiving with its processing: unknown keywords are left in their
keyword form; unexpected letter `{\tt Q}'s are converted to an
equivalent keyword, namely `{\tt\%Q\%}'; escape sequences used in
Standard~ML strings are echoed literally if they are malformed.

A forgiving behaviour is appropriate given the expected context of use
of the function.  The ICL~HOL system or the user has created some text
to be output.  The text is often the display of a top-level binding,
frequently it indicates some change in the state of the Standard~ML
bindings.  It is appropriate to show as much as possible of these
changes to the user even if occasionally the results contain a few
unconverted characters.

=DOC
val ⦏translate_for_output⦎ : string -> string;
=DESCRIBE
Translates a string according to the macro processing rules used when
outputting text.  The output produced depends on the setting of the
control flag $use_extended_chars$, when false the result will have no
extended characters, the keyword forms will be used.
=ENDDOC
%--------------------------------------------------------------------
=DOC
(* ⦏use_extended_chars⦎  - boolean flag declared by new_flag, default: true *)
=DESCRIBE
Controls how the writer changes the text output from the PolyML
compiler.  When $true$ extended characters are written, when $false$
the corresponding keywords are written.
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏get_use_extended_chars_flag⦎ : unit -> bool;
=DESCRIBE
This function gives the value of the flag {\em use\_extended\_chars}.
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏diag_string⦎ : string -> unit;
=DESCRIBE
$diag\_string$ outputs
a string on the standard output stream,
after translating it with
$translate\-\_for\-\_output$(q.v.).
If the string exceeds the value of {\em get\_line\_length} it attempts to split the string into tokens, to fit within the line length.
A token is taken to be an initial string of spaces, followed by exclusively non-space characters.
=SEEALSO
$list\_diag\_string$, $diag\_line$, $raw\_diag\_string$.
=ENDDOC

=DOC
val ⦏list_diag_string⦎ : string list -> unit;
=DESCRIBE
$list\_diag\_string$ outputs a list of strings
onto the standard output stream,
after translating them with
$translate\-\_for\-\_output$(q.v.). The strings in the list
are concatenated (with spaces to separate them) and then
output with $diag\_string$ (q.v.).
=SEEALSO
$diag\_string$, $diag\_line$, $list\_raw\_diag\_string$.
=ENDDOC
=DOC
val ⦏diag_line⦎ : string -> unit;
=DESCRIBE
$diag\_line$ outputs a string to the standard output
stream followed by a new line,
after translating it with
$translate\-\_for\-\_output$(q.v.).
It is intended for use in printing formatted terms,
theorems and the like (for which the pretty printer
will have included new lines within the string if
necessary).
=SEEALSO
$diag\_string$, $raw\_diag\_line$.
=ENDDOC

=DOC
val ⦏input_next⦎ : (string * int * string * int) -> instream -> string list;
val ⦏input_to_end_of_line⦎ : (string * int * string * int) -> instream -> string;
=DESCRIBE
$input_next$ inputs more characters from an input stream.
If we are not processing a UTF-8 input stream, one character is input.
If we are processing a UTF-8 input stream, we input one Unicode code point
from the stream and convert it into the ProofPower representation (which
will either be a single character or a keyword representing a code point that
has no ProofPower single character equivalent).
If invalid UTF-8 is encountered it raises an exception.
Caller may choose to catch this exception and try again with the rest of the stream.
The strings in the list returned each comprise exactly one character:
end of stream is signalled by an empty list.

$input_to_end_of_line$ uses $input_next$ to read to the end of the line on the input stream, returning a single string.

=SEEALSO
=ENDDOC

=SML
end (* of signature ReaderWriter *);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newpage
\section{SUPPORTING OTHER LANGUAGES}

A large part of the reader writer interface allows the embedding
of other languages.

The style of the interface is to be documented
in~\cite{DS/FMU/IED/USR008}, most of the required information is
contained within this document and the implementation
document~\cite{DS/FMU/IED/IMP005}, but it is too bulky to be placed in
this document.  The descriptions that follow assume that such a
description has been seen by the reader of this document.

Many routines have an argument of type $READER_ENV$ which provides the
functions to read characters from the current input stream.  This
argument is not detailed with each function, but a reference to the
type declaration is made.

%--------------------------------------------------------------------
=DOC
signature ⦏ReaderWriterSupport⦎ = sig
=DESCRIBE
A set of declarations that allows the addition of new embedded
languages.  The HOL language is an example of a language embedded into
a basic system that understands Standard~ML with extended characters and
percent keywords.
=ENDDOC

%--------------------------------------------------------------------

\subsection{Diagnostic Support}

Reader functions should avoid producing fault messages, where possible
they should be left to the language recogniser to report.  Some faults
can only be reported by reader functions, for these cases the following
functions are available.

In general a fault is reported by calling either $local_error$ or
$local_warn$ and adding details of the error code to the text produced
and continuing.  In the macro processing analogy a short fault report
is written into the macro processor's output at the place of detection
of an error.  Functions $add_error_code$ and $add_error_codes$ are
provided to give a uniform style for these short reports.

%--------------------------------------------------------------------
=DOC
val ⦏local_error⦎ : string -> int -> (unit -> string) list -> unit;
val ⦏local_warn⦎ : string -> int -> (unit -> string) list -> unit;
=DESCRIBE
An error or warning message is written to the standard output, then the
function returns.  The arguments are identical in form to functions
$error$ and $fail$ of {\tt DS/FMU/IED/DTD002}.
=SEEALSO
Functions $error$ and $fail$.
=ENDDOC

These messages are used by $local_error$ and $local_warn$ for the
text they output.

=FAILURE
5531	*** WARNING ?0 from ?1: ?2
5532	*** ERROR ?0 from ?1: ?2
=TEX

%--------------------------------------------------------------------
=DOC
val ⦏add_error_code⦎ : int * string list -> string list;
val ⦏add_error_codes⦎ : int list * string list -> string list;
=DESCRIBE
For each error number ``$nn$'' given as the first argument an
entry of the form ``\verb*| ERROR__|$nn$\verb*| |'' is added
to the head of the second argument.
(Note that~``\verb*| |'' denotes aspace character.)
=ENDDOC
%--------------------------------------------------------------------

Diagnostic control $RW_diagnostics$ is interpreted as a series of
`bits'  each controlling some diagnostic output which is written to the
PolyML standard output.  A zero value indicates no diagnostics.  The
value is selected by adding numbers from the following table according
to the diagnostic outputs required.

\begin{center}
\begin{tabular}{crp{4in}}
\multicolumn{2}{c}{Value}&	Information Output\\
$2^0$&$1$&	Text passed to PolyML.\\
$2^1$&$2$&        Text passed to PolyML, but showing the list structure
		passed by routines such as $get_ML_any$.\\
$2^2$&$4$&	Characters as they are read.\\
$2^3$&$8$&	Text passed to the writer function before any
		translation is performed.\\
$2^4$&$16$&	Prevents text from being translated before output by the
		writer function.\\
\end{tabular}
\end{center}

=DOC
(* ⦏RW_diagnostics⦎  - integer control declared by new_int_control, default: 0 *)
=DESCRIBE
For reader writer diagnostic purposes.
=ENDDOC
%--------------------------------------------------------------------

\subsection{Character Input --- Part 1}

%--------------------------------------------------------------------
=DOC
type ⦏READER_ENV⦎ (* = {
	⦏advance⦎			: unit -> string,
	⦏look_at_next⦎			: unit -> string,
	⦏push_back⦎			: string -> unit
} *) ;
val ⦏skip_and_look_at_next⦎ : READER_ENV -> unit -> string;
=DESCRIBE
All of the parsing functions in the reader writer support use the
functions provided in this record type to read characters from the
current input stream.  Attempting to read characters by any other
method will have unpredictable results.
The utility function $skip\_and\_look\_at\_next$ combines
$advance $ and $look\_at\_next$ discarding the result of $advance$.
Some applications will want to use instances of this data type
to count line numbers, so pushing back newlines that have not
been read is not advisable.
=ENDDOC
%--------------------------------------------------------------------
=DOC
exception ⦏TooManyReadEmpties⦎;
=DESCRIBE
Associated with the reader functions is the exception $TooManyReadEmpties$
which is raised when the parser has read the end of the file and
has passed the end of file character at least 100 times to the compiler.
Raising this exception signifies something has gone wrong in a reader.
=ENDDOC
%--------------------------------------------------------------------

\subsection{Data Base of Keywords and Extended Characters}

%--------------------------------------------------------------------
=DOC
structure ⦏PrettyNames⦎ : sig
=DESCRIBE
A structure within $ReaderWriterSupport$ that gathers all the
information relating the extended characters and percent keywords
understood by the system, together with the interfaces for
interrogating and extending the information.
=ENDDOC
%--------------------------------------------------------------------
=DOC
	datatype ⦏NAME_CLASS⦎
		=	⦏Simple⦎
		|	⦏Starting⦎	of (READER_ENV -> (string * bool)
						-> string -> bool -> string list
						-> string list) * string
		|	⦏Middle⦎	of string
		|	⦏Ending⦎	of string
		|	⦏Ignore⦎
		|	⦏Invalid⦎;
=DESCRIBE
These detail the characteristics of a symbol.  $Simple$ is used for
symbols that may be part of identifiers.  $Starting$, $Middle$ and $Ending$
relate to the symbols position when embedding text of other languages.
The function with $Starting$ is the reader routine for
the particular embedded language.  Details of how this function should be
written (and of it arguments) are given in the implementation document
corresponding to this
design.  $Ignore$ is used for characters that are completely ignored in the
input, the extended characters for indexing come in this category.  $Invalid$
will cause an error message.
=SEEALSO
Error 5007
=ENDDOC
%--------------------------------------------------------------------
=DOC
	type ⦏PRETTY_NAME⦎ (* = ( string list * string OPT * NAME_CLASS )  *)  ;
=DESCRIBE
Each symbol is defined in a three-element tuple of this type.  Elements
of the tuple are as follows.  First, a non-empty list of the keywords
that may be used for this symbol.  These keywords exclude
the enclosing percent signs.  Second, an optional character
for the symbol.  Third, a value of datatype $NAME_CLASS$ indicating
the characteristics of the symbol.

The extended character field, when used, contains a single character.
It may be the letter ``{\tt Q}'' or any character
with decimal code greater than 127.
=SEEALSO
Function $add_new_symbols$, for details of the validation of values
of this type.
=EXAMPLE
	([	"fn",
		"lambda"],	Value "λ",			Simple),
=ENDDOC

A symbol may be known by several keywords.  E.g., {\tt\%fn\%} and
{\tt\%lambda\%} are alternative names for the symbol with ``$\lambda$''
as its extended character.  When outputting text with
$use_extended_chars$ set to $false$ any extended characters are
replaced by uses of the ``preferred'' keyword which is at the head of
the keyword list.

%--------------------------------------------------------------------
=DOC
	val ⦏add_new_symbols⦎ : PRETTY_NAME list -> unit;
=DESCRIBE
Adds details of new symbols to the data structures characterising all
known symbols.  There is some validation of the symbols added, the list
of names should not be empty, the individual names should not
contain two adjacent ``{\tt Q}''s and
the character field should have
a single character which is either a ``{\tt Q}'' or has decimal code
greater than 127.
=FAILURE
5100	Keyword `?0` has adjacent `Q`s
5101	Empty keyword list
5102	Invalid extended character `?0` with keyword `?1`
5103	Keyword `?0` duplicated
5104	Character `?0` duplicated
=FAILUREC
Errors 5100, 5101 and 5102 are issued as warnings against
particular parts of the argument value, they do not prevent
the other parts from being added to the data structures.
=ENDDOC
%--------------------------------------------------------------------
=DOC
	val ⦏find_name⦎ : string -> PRETTY_NAME OPT
	val ⦏find_char⦎ : string -> PRETTY_NAME OPT
=DESCRIBE
Finds the characteristics of a symbol based on its keyword or character.
Both functions return $Nil$ if the symbol is not known.  They return
the tuple given to $add_new_symbols$ for known symbols.
=ENDDOC
%--------------------------------------------------------------------
=DOC
	val ⦏is_same_symbol⦎ : (string * string) -> bool
=DESCRIBE
Compare two symbols return true if they are identical, i.e., the same
string.  Otherwise, look up both with $find_char$ and $find_name$ then
if they are the same symbol return true, if either is not a known
symbol or they are not the same symbol return false.
=ENDDOC
%--------------------------------------------------------------------

=SML
end (* of signature for structure PrettyNames *)
=TEX
\subsection{Character Input --- Part 2}

%--------------------------------------------------------------------
=DOC
val ⦏is_special_char⦎ : string -> bool;
=DESCRIBE
Checks whether the string contains a single non-alphanumeric character
that is allowed in a keyword.  Returns $true$ if the argument contains
exactly one of the characters listed in the description of function
$get_percent_name$, otherwise $false$ is returned.
=SEEALSO
Function $get_percent_name$.
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏get_percent_name⦎ : READER_ENV
	-> string * PrettyNames.PRETTY_NAME OPT * bool;
=DESCRIBE
Assemble a percent keyword and look it up in the list of known
keywords.  On entry the opening percent ({\tt\%}) is the first unread
character.

The tuple returned contains:
(1) the keyword read, but without the percent characters;
(2) the symbols entry as given to $add_new_symbols$ or $Nil$ for
	an unknown keyword;
(3) a flag set true if the keyword had a closing percent character,
	false otherwise, error reporting is left to the calling
	functions.
Non-alphanumeric keywords may contain the characters
``\verb"!  &  $  #  +  -  /  :  <  =  >  ?  @  \  ~  '  ^  |  *"''
=SEEALSO
Type $PRETTY_NAME$.
Type $READER_ENV$.
Function $is_special_char$.
=ENDDOC

Non-alphanumeric keywords may contain the characters
``\verb"!  &  $  #  +  -  /  :  <  =  >  ?  @  \  ~  '  ^  |  *"''
which are the same as in~\cite[section~2.4, page~4]{Milner90} apart
from the omission of the `{\tt\%}' character.
%--------------------------------------------------------------------

Some character sequences may occur in many contexts in the input text,
for these a higher level of input than simple characters is
appropriate.  These character sequences are primarily inspired by
needing to read keywords enclosed in percent signs.

Data type $SYMBOL$ gives the various sequences that may be read.
Keywords and extended characters that have been declared via
$add_new_symbols$ are returned with constructor $SymKnown$, the string
hold the keyword (without the enclosing percents) or the extended
character read, the boolean being $true$ for a keyword and %false$for
an extended character.

%--------------------------------------------------------------------
=DOC
datatype ⦏SYMBOL⦎
	=	⦏SymKnown⦎			of string * bool
						* PrettyNames.PRETTY_NAME
	|	⦏SymUnknownChar⦎		of string
	|	⦏SymUnknownKw⦎		of string * bool
	|	⦏SymDoublePercent⦎
	|	⦏SymWhite⦎			of string list
	|	⦏SymCharacter⦎ of string
	|	⦏SymEndOfInput⦎
	;
=DESCRIBE
$SymKnown$ indicates a symbol declared via $add_new_symbols$, if a keyword was
read the string hold the characters without the enclosing percents and the
boolean is $true$. {} Otherwise, when an extended character is read the
string holds the character and the boolean is $false$.

$SymUnknownChar$ indicates an extended character not declared
via $add_new_symbols$.

$SymUnknownKw$ indicates a keyword not declared
via $add_new_symbols$ or a badly formed keyword with no closing percent sign.
The boolean is $true$ for a well-formed keyword.

$SymDoublePercent$ indicates an empty keyword, i.e., two adjacent
percent signs.

$SymWhite$ indicates a non-empty sequence of formatting characters (space, tab,
newline, and formfeed) which are passed as individual characters in
reverse order in the string list.

$SymEndOfInput$ indicates an empty string was seen.

All other cases are passed back as a single character in $SymCharacter$.
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏read_symbol⦎ : READER_ENV -> SYMBOL;
=DESCRIBE
Reads one or more characters and returns a value of type $SYMBOL$.  No
errors are reported by this routine.  The routine reads as many
characters as necessary to form a symbol.  End of file is returned as a
$SymEndOfInput$.
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏expand_symbol⦎ : SYMBOL -> string;
=DESCRIBE
A value of type $SYMBOL$ is expanded into the corresponding character string.
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏skip_comment⦎ : READER_ENV -> unit;
=DESCRIBE
Skip over a comment which comprises a sequence of characters within
which the comment braces `{\tt (*}' and `{\tt *)}' are properly
balanced.  This routine is entered when the opening round bracket of
the comment has been read, the opening asterisk is the first unread
character.
Note that Standard~ML comments separate lexical items thus the calling
routine should not simply discard the comment, it might replace the
comment with a space character to ensure the lexical items remain
separated.
=FAILURE
5001	End of file found in comment
=SEEALSO
Type $READER_ENV$.
=ENDDOC

See~\cite[section~2.5]{Milner90} for the syntax of Standard~ML comments.

%--------------------------------------------------------------------

\subsection{Reading Higher Level Objects}

%--------------------------------------------------------------------
=DOC
val ⦏get_ML_string⦎ : READER_ENV -> string list -> string list * int list;
val ⦏get_primed_string⦎ : READER_ENV -> string list -> string list * int list;
=DESCRIBE
Assemble a string literal and add it to the left hand context given in the
second argument.  On entry the opening string quote has been read, exit
when the closing string quote has been read.  The goal of this routine
is to form an equivalent string that can be read by a Standard~ML
compiler, and to defer as much validation of the string as possible to
that compiler.  Minimal validation is performed on escape sequences.
Well-formed layout sequences (i.e., the sequence ``{\hbox{\verb|\|{\em
f..f\/}\verb|\|}}'') are
removed, characters not recognised as formatting ones are retained and
wrapped between ``\verb|\ |'' and ``\verb| \|'' for later checking by
the Standard~ML compiler.  Extended characters are translated to their
three digit decimal form.

Function $get_ML_string$ reads a Standard~ML string.

Function $get_primed_string$ reads a string enclosed with single
left-hand primes~(~{\tt`}~).  These are similar to Standard~ML strings
but with the meanings of the single~(~{\tt`}~) and
double~(~{\tt"}~) prime characters interchanged.

An end of file found in the string indicates that there is no more
input available, and so an immediate failure (error 5002) is raised.
Error code 5014 is included to aid in understanding where errors occur,
this error is not actually generated until the first non white-space
character after the newline is processed.
All other errors detected in strings are reported when found,
additionally their numbers passed back in the result.
=FAILURE
5002	End of file found in string
5014	Newline found in string after `?0`
=SEEALSO
Type $READER_ENV$.
=ENDDOC

The syntax of Standard~ML strings is defined
in~\cite[section~2.2, page~3]{Milner90}.

Note that error code 5014 could be deferred for detection and reporting
by the Standard~ML compiler but the PolyML compiler's error messages is
not very helpful in this case.  The delay in its production is due to
how function $read_symbol$ gathers white-space characters.

\bigskip

%--------------------------------------------------------------------
=DOC
val ⦏get_box_braces⦎ : (READER_ENV -> string list -> string list)
		-> READER_ENV -> string list -> string list;
val ⦏get_curly_braces⦎ : (READER_ENV -> string list -> string list)
		-> READER_ENV -> string list -> string list;
val ⦏get_round_braces⦎ : (READER_ENV -> string list -> string list)
		-> READER_ENV -> string list -> string list;
=DESCRIBE
These functions assemble a section of bracketed text.  The opening
bracket has been read, the first unread character is the first
character within the brackets.  Each routine reads text upto and
including the matching closing bracket.  The first argument is the
parsing routine for reading items of text within the brackets.  The
third argument is the left hand context, which is returned with the
bracketed text read by these functions, and the enclosing braces.  The
three pairs of brackets: ``\verb|[ ]|'', ``\verb|{ }|'' and ``\verb|()|''
are handled by functions $get_box_braces$, $get_curly_braces$ and
$get_round_braces$ respectively.
=FAILURE
5008	Bracket mismatch, `?0` found after an opening `?1`
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏get_ML_any⦎ : READER_ENV -> string list -> string list
=DESCRIBE
Assemble a section of Standard~ML text starting with the first unread
character.  Text is read up to the first semi colon `{\tt;}', unmatched
closing bracket or ending keyword.  A semi colon will be read and added
to the returned text, a closing bracket or ending keyword is left
unread for the calling
routine.  The syntax error where too many closing bracket are presented
must be resolved by the outermost routine that calls function.  The
second argument gives the left hand context, the new text read is added
to that context and returned.
=FAILURE
5003	Unknown keyword `?0` after `?1`
5005	Unknown extended character `?0` (decimal ?1) after `?2`
5007	Unexpected symbol `?0` (a symbol of type $Invalid$ has been read)
=SEEALSO
Type $READER_ENV$.
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏string_of_int3⦎ : int -> string
=DESCRIBE
The string representation of small positive integers is needed in
various places, particularly within Standard~ML strings where some
characters are denoted by their decimal code in three digits, preceded
by a backslash.  Function $string_of_int3$ gives a three character with
leading zeros representation of small positive numbers.  In general the
routine $PolyML.makestring$ cannot be used, if the value last passed to
$PolyML.print_depth$ is zero then $PolyML.makestring$ converts
numbers into three dots.
=FAILUREC
The intended use of this function is in building reader writer
extensions for other languages.  In such places it is intended that the
caller only supply suitable arguments, getting this wrong indicates
something wrong in the design of the caller.  The text of the message
anticipates this usage.
=FAILURE
5040	DESIGN ERROR:Number ?0 is too big or is negative
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏to_ML_string⦎ : string -> string
=DESCRIBE
Converts characters which are to form part of a string literal into
another string which may be read by a Standard~ML compiler and which
has the same meaning.  This is intended to form the string
representation of extended characters for passing them
through to a Standard~ML compiler.  Characters other than space, tab
and newline which are outside the range~32 to~126 (decimal) inclusive
are converted to their four character equivalent of a backslash
followed by a three digit decimal number with leading zeroes.
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏is_white⦎ : string -> bool
=DESCRIBE
Returns $true$ if the string is a single white-space character,
$false$ otherwise.
=ENDDOC
%--------------------------------------------------------------------

\subsection{Embedding Other Languages}

Other languages may be embedded in various ways, they are called
``general'', ``specific'' and ``named'' quotations.  Language texts
(that is, quotations in a language) are introduced and completed by
keyword or their corresponding extended character.

Embedding other languages is achieved by providing a reader for the new
language, then making it and its enclosing symbols known to the
language embedding mechanisms.

General quotations are for expressions, such as HOL terms, that may be
used as parts of larger expressions.  These may use
the keywords ``{\tt\%<\%}'' and ``{\tt\%>\%}'' (or the corresponding
extended characters) to enclose the embedded text, the language is
indicated by the characters immediately following the opening keyword.
The BNF syntax, see~\cite{DS/FMU/IED/PLN009}, of general quotations is
as follows.
General quotations may also use other introductory symbols.

=GFTSHOW BNF
quotation	=	start_symbol, [ language_code ], quoted_text, '⌝';

start_symbol	=	'⌜'	(* For HOL terms *)
		|	'ⓣ'	(* For HOL types *)
		|	other_start_symbols ;

language_code	=	'↘', name, '↕'
		|	':' ;
=TEX

Where:

\begin{description}

\item[$name$ ] is an identifier in the extended Standard~ML.

\item[$white_space$ ] is a space or a tab character.

\item[$quoted_text$ ] is text in the named language.

\item[$other_start_symbols$ ] are extended character of keywords of type
	$Starting$.

\end{description}

The combination of $start_symbols$ and $name$ identifies the quoted
language.  The default quotation with ``{\tt\%<\%}''
where the $language_code$ is not given, is of a HOL term, which may
also be indicated by a name of ``{\tt HOL}''.  The colon form is
equivalent to using the name ``{\tt HOL:}''.

Conventionally, languages which yield HOL types should have a colon as
the last character of their name.

Note that including any space or tab characters before the
$language_code$ will cause the default interpretation, namely as a HOL term.
Note also that the keywords ``{\tt\%<\%\%dntext\%}'' (or their extended
characters) indicate the start of a language code regardless of what
characters follow.  Thus it is an error if the $name$ and
``{\tt\%cantext\%}'' are absent.

\bigskip

``Specific quotations'' are intended for use at the ML top-level rather
than in expressions.  They have individual keywords and corresponding
extended characters to enclose their text, for example a Z~schema
definition would\footnote{This facility is needed for the Z in HOL work
and these are the proposed symbols.} be enclosed by the
characters~``\StartZSchema'' and~``\EndZBox''.

\bigskip

``Named quotations'' are also intended for use at the ML top-level
rather than in expressions.  They have an initial keyword or characters
which is immediately followed by a language name to start their text,
they have a common ending keyword or characters, for example a HOL
labelled product definition is enclosed by  ``{\tt\StartFormal
HOLLabProd}'' and ``{\tt\EndFormal}''.

%--------------------------------------------------------------------
=DOC
type ⦏READER_FUNCTION⦎ (*
	= READER_ENV
	-> (string * bool)	(* Starting symbol *)
	-> string		(* Language name *)
	-> string		(* Opening text *)
	-> string list		(* Left hand context *)
	-> string list *);
=DESCRIBE
The type of the reader functions for embedded languages.  The first
string argument gives the symbol that started the quotation.  For a
keyword enclosing percent signs are omitted and the boolean is true.
For an extended character the boolean is false.  The second string
holds the language name without the leading ``{\tt\%dntext\%}'' or
trailing ``{\tt\%cantext\%}'', the default language and type are expanded to
give their full names, namely ``{\tt HOL}'' or ``{\tt HOL:}'' for the
colon form.  The third string is text to be included at the start of
the quoted text, in the case of a HOL quotation it is the first
characters that are to be read by the HOL recogniser.  The string list
is the left hand context of the call and must be returned with the text
of the quotation added to its head.
=ENDDOC

The third string argument of a $READER_FUNCTION$ is provided primarily
for these forms of definition where the text is macro processed into a
call of a Standard~ML function with a HOL term as argument and where
that term should be enclosed in brackets.  This string may hold the
opening bracket.

%--------------------------------------------------------------------
=DOC
val ⦏add_general_reader⦎ : string * string * string * READER_FUNCTION -> unit;
val ⦏add_specific_reader⦎ : string * string * READER_FUNCTION -> unit;
val ⦏add_named_reader⦎ : string * string * string * READER_FUNCTION -> unit;
=DESCRIBE
Adds reader functions to the database of known readers.  The first
strings give the language name,
the last string holds the name of a Standard~ML constructor which is
to be written before the quotation when it occurs in within languages
other than Standard~ML.  Typical values of the last string are
``{\tt Lex.Term}'' and ``{\tt Lex.Type}''.
=FAILURE
5033	Reader already present for language `?0`
5034	Improper reader name `?0`
5035	Improper reader name `?0` and `?1`
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏look_up_general_reader⦎ : string * string -> (READER_FUNCTION * string) OPT;
val ⦏look_up_specific_reader⦎ : string -> (READER_FUNCTION * string) OPT;
val ⦏look_up_named_reader⦎ : string * string -> (READER_FUNCTION * string) OPT;
=DESCRIBE
Looks up readers in the database of known readers.  The argument
strings are matched against the first string given in the call of the
$add_\ldots_reader$, if the reader is known then the corresponding
constructor string and reader function are returned.  The value $Nil$
is returned for an unknown reader.
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏general_quotation⦎ : READER_ENV
	-> (string * bool)	(* Start of quotation symbol *)
	-> string		(* Opening characters *)
	-> bool		(* Context, true => in Standard ML *)
	-> string list		(* Left hand context *)
	-> string list;
val ⦏specific_quotation⦎ : READER_ENV
	-> (string * bool)	(* Start of quotation symbol *)
	-> string		(* Opening characters *)
	-> bool		(* Context, true => in Standard ML *)
	-> string list		(* Left hand context *)
	-> string list;
val ⦏named_quotation⦎ : READER_ENV
	-> (string * bool)	(* Start of quotation symbol *)
	-> string		(* Opening characters *)
	-> bool		(* Context, true => in Standard ML *)
	-> string list		(* Left hand context *)
	-> string list;
=DESCRIBE
Process the text of a quotation and add it to the left hand context
given.  The opening quotation symbol has been read and is passed as the
first string argument, a keyword is passed without its enclosing
percent signs and the boolean is true, for an extended character the
boolean is false.  For general and named quotations the next characters to be
read denote the language of the quotation.  The boolean argument
indicates whether the left hand context is in Standard~ML text or in a
quotation of another language.
=FAILURE
5004	Unknown keyword `?0`
5006	Unknown extended character `?0` (decimal ?1)
5010	Unknown language requested by symbol `?0` with language name `?1`
5011	Unknown language requested
5030	End of file in quotation
5031	End of file in language name of general quotation
=ENDDOC
%--------------------------------------------------------------------

Error 5011 is issued for any quotation for which no reader has been
provided by the $add_\ldots_reader$ functions.  After error 5011 is
issued, text is skipped until (and including) the first unmatched
quotation ending symbol is found.  Quotation opening symbols read
during this skipping must be matched by balancing ending symbol.  There
is no attempt to understand string or character literals or comments.
All characters are considered significant.  The routine is designed to
assist in error recovery by consuming the text of large quotations
rather than stopping reading at the first detected problem.  Thus the
language recognisers (probably the Standard~ML compiler in this case)
will not receive large amounts of text they cannot handle, and will not
produce copious error messages.  A number of the error messages given
with structure $ReaderWriter$ may be generated during this skipping.

%--------------------------------------------------------------------
=DOC
val ⦏SML_recogniser⦎ : string * string * 'a * string -> 'a;
=DESCRIBE
This routine is not intended to be directly called by any user code, it
is provided to allow the quotation of Standard~ML text.  The context of
use of this routine is that the ``macro processing'' of the Standard~ML
quotation ``{\tt\%<\%\%dntext\%SML\%cantext\% 42 \%>\%}'' yields the text
``{\tt(ReaderWriterSupport.SML_recogniser ("\%<\%", "SML", 42 , "\%>\%"))}''
which is read by the Standard~ML compiler.
=FAILURE
5032	End of file found in Standard ML quotation
5050	Incorrect symbols starting or ending of Standard ML quotation: `?0`, `?1`, `?2`
=ENDDOC
%--------------------------------------------------------------------
\subsection{Exception for $use_file$ and $use_string$}
=TEX
$use_string$ and $use_file$ raise the following exception if they have
successfully printed out an exception.
=SML
exception Stop;
=TEX
\subsection{Completion of Reader Writer Support}
=SML
end (* of signature for structure ReaderWriterSupport *);
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{HOL READER WRITER}

%--------------------------------------------------------------------
=DOC
signature ⦏HOLReaderWriter⦎ = sig
=DESCRIBE
This structure holds the HOL specific reader writer code.
=FAILUREC
All the errors that the basic reader writer may raise may also be raised
by the HOL reader writer.
=ENDDOC
%--------------------------------------------------------------------
=DOC
type ⦏READER_ENV⦎;
type ⦏READER_FUNCTION⦎;
=DESCRIBE
These types are used for reader functions for embedded languages, they
are identical to the types of the same name in signature
$ReaderWriterSupport$.
=SEEALSO
Signature $ReaderWriterSupport$.
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏HOL_reader⦎ : string -> bool -> READER_FUNCTION;
=DESCRIBE
This is the HOL reader function, its first argument is the name of the
recogniser for the particular aspect of HOL to be recognised.  Its
second argument indicates whether this reader is considered to be
used only at outermost (i.e., Standard~ML's top-level): $true$ is
used for outermost usage, $false$ for HOL text that may be used
within other expresions.  This
function is provided to allow specialised versions of the HOL language
to be read, it is not intended to be called directly called by any user
code.
=FAILUREC
All the errors that the basic reader writer may raise may also be raised
by the HOL reader writer.
=ENDDOC
%--------------------------------------------------------------------
=DOC
val ⦏HOL_lab_prod_reader⦎ : READER_FUNCTION;
=DESCRIBE
This is the reader function for HOL labeled products.  It is provided
to allow specialised versions of the HOL language to be read, it is not
intended to be called directly called by any user code.
=FAILUREC
All the errors that the basic reader writer may raise may also be raised
by the HOL reader writer.
=ENDDOC
%--------------------------------------------------------------------

=DOC
val ⦏get_HOL_any⦎ : READER_ENV -> string list -> string list
=DESCRIBE
Assemble a section of HOL text starting with the first unread
character.  Text is read up to and including the first unmatched symbol
of value $Ending _$. {} The second argument gives the left hand
context, the new text read is added to that context and returned.
=FAILUREC
All the errors that the basic reader writer may raise may also be raised
by the HOL reader writer.
=SEEALSO
Type $READER_ENV$.
=ENDDOC
%--------------------------------------------------------------------

=SML
end (* of signature HOLReaderWriter *);
=TEX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{TEST STRATEGY}

There are three main test areas for the reader writer.

\begin{itemize}

\item Reasonable behaviour.  Does the reader writer do the correct task
	most of the time, does it allow the compiling and execution of
	programs written in enhanced Standard~ML.

\item Correct processing.  Are the input and output streams correctly
	manipulated and passed on to or received from the PolyML system?

\item Functional interfaces.  Do the functional interfaces do the
	correct task?

\end{itemize}

These areas are distinguished by the sort of testing that is sensible to
do.  Many aspects of the first two could probably be tested using the
module test harness~\cite{DS/FMU/IED/DTD013}, but doing so would
involve excessive work and would result in opaque test scripts.

Reasonable behaviour is determined by actually using the reader writer
during the compilation of much of the ICL~HOL system.  This is
because it is written using the extended Standard~ML supported by the
reader writer.  If the modules of the ICL~HOL system compile
successfully producing the correct signatures then a large portion of
the reader writer must be executing reasonably and properly.  The
reader writer is similarly needed during the development of other
modules, its reasonable behaviour is indicated by how it supports the
development activity in the context of error detection and recovery.

Thus, tests for reasonable behaviour are:

\begin{itemize}

\item Compilation and execution of much of the ICL~HOL system.

\item Compilation and execution of module tests of the reader writer
	and the rest of the ICL~HOL system.

\end{itemize}

Correct processing concerns the manipulation of text that is to be
passed to the read phase of the (conventional) read-evaluate-print
cycle of the PolyML system, followed by the manipulation of system
outputs.  In this context much of the reader writer deals with text
that may not successfully parse as Standard~ML: the reader writer is
required to behave itself in the presence of any text the user presents
and to either report the problems itself or to pass the problem onto
the PolyML compiler for it to report.  The reader writer works by side
effect on the input output streams and via an interface to the
read-evaluate-print cycle of the PolyML system.  Accordingly the reader
writer deals with text that cannot easily be tested using the
facilities of the module test harness~\cite{DS/FMU/IED/DTD013}.

Tests for correct processing are part of integration testing of
the ICL~HOL system, they include demonstrating that the
following cases are correctly handled on both input and output.
Much of the input processing can be tested with function
$use\-\_string$ under control of the module test
harness~\cite{DS/FMU/IED/DTD013}.

\begin{itemize}

\item Strings.  Empty strings.  Escape sequences: ignored white space,
	newline characters, decimal codes, control (caret
	``{\verb|^|}'') codes.  Extended characters.  Percent
	``{\tt\%}'' characters.  Percent keywords.

\item Simple Standard~ML expressions.

\item Extended characters.  Use of equivalent keywords.  Use in
	extended Standard~ML identifiers.

\item Quotations.  Comments strings and character literals.  Nested
	quotations.  Quotations of Standard~ML.  Quotations of unknown
	languages.  Term and type quotations.  Declarative quotations,
	i.e., with schema boxes and similar.

\item Malformed variants of most of the preceding items.

\end{itemize}

Parts of the reader writer may be tested with the module test
harness~\cite{DS/FMU/IED/DTD013} and a module test document is
used for these.  Note that successful execution of the module tests
also demonstrates both reasonable behaviour and correct processing.
Functions with an argument of type $READER_ENV$ cannot easily be
tested here since they work by side effect upon that argument.
The tests cover the following.

\begin{itemize}

\item $use\-\_string$.

\item Comments.  Nested comments.  Comments containing asterisks.

\item Function $translate_for_output$ with both settings of control
	flag $use_extended_chars$.

{\sloppy\hbadness 1500
\item Simple functions from structure $ReaderWriterSupport$, namely:
	$local_error$, $local_warn$, $add_error_code$,
	$add_error_codes$, $is_special_char$, $string_of_int3$, and
	$to_ML_string$.

}%

\item Accessing extended characters and keywords from structure
	$PrettyNames$:  accessing predefined symbols by character and
	by keyword; adding and accessing some new symbols; unknown
	characters and keywords.

{\sloppy\hbadness 1500
\item The following functions from structure $ReaderWriterSupport$ can
	be invoked but cannot be easily tested for their correct side
	effects:  $add_general_reader$, $add_specific_reader$,
	$look_up_general_reader$, and $look_up_specific_reader$.

}%

\end{itemize}

Areas of the reader writer that cannot be tested by the module test
harness~\cite{DS/FMU/IED/DTD013} are as follows.

\begin{itemize}

\item Functions that take a value of type $READER_ENV$ as an argument
	and return a string line.  These functions are all tested
	indirectly mostly by other parts of the reader writer module
	tests --- if these functions were not working then the tests
	would not even compile.

=IGN
	These functions include:
		get_percent_name
		read_symbol
		skip_comment
		get_ML_string
		get_primed_string
		get_box_braces
		get_curly_braces
		get_round_braces
		get_ML_any
		general_quotation
		specific_quotation
		named_quotation
		get_HOL_any
		HOL_reader
		HOL_lab_prod_reader
=TEX
	These cannot be tested explicitly.  The test policy in
	file "dtd005.doc" explains much of this but it could be
	enhanced to name these functions and give a clearer reason.

\item Functions that can only be tested during integration tests since
	any test rely on users typing at keyboards and observing what
	happens.

=IGN
	These functions include:
		use_terminal
		abandon_reader_writer
		ask_at_terminal
=TEX

\end{itemize}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************************************************************
%--------------------------------------------------------------------

\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}



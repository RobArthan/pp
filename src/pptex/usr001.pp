=IGN
********************************************************************************
usr001.pp: this file is part of the PPTex system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% usr001.pp    ℤ $Date: 2011/07/27 13:04:13 $ $Revision: 3.34 $ $RCSfile: usr001.pp,v $
%	usr001.tex

pptex usr001 ; texdvi usr001
pptex usr001 usr001A ; texdvi usr001
bibtex usr001
texdvi usr001 ; texdvi usr001 ; texdvi usr001 ; texdvi usr001
dvipage usr001 &

=TEX
%\documentstyle[hol1,11pt,fleqn,USR]{book}
\documentclass[a4paper,11pt]{book}
%\usepackage{fontspec}
%\setmainfont{ProofPowerSerif.ttf}
\usepackage{ppusr}
\usepackage{ProofPower}
\usepackage{fleqn}

\USRmanual{Document Preparation}
\USRref{USR001}
\USRisbnl{978-1514276501}
\USRisbns{151427650X}

\raggedbottom
\ftlinepenalty=9999
\makeindex

\title{\Product}
\author{ }

\setcounter{tocdepth}{2}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************************************************************
%--------------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Local macros etc.

% Copied from /usr2/tex/tex82/LaTeX/LaTeXbibtex/bibtex/btxdoc.tex
\def\BibTeX{{\rm B\kern-.05em{\sc i\kern-.025em b}\kern-.08em
    T\kern-.1667em\lower.7ex\hbox{E}\kern-.125emX}}

\underscoreoff

% Lines starting `%..' are temporarily commented out.  They may need to be reinstated.


\def\etc{{\it etc.}}
\def\eg{{\it e.g.}}
\def\Eg{{\it E.g.}}
\def\ie{{\it i.e.}}
\def\Ie{{\it I.e.}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\begin{document}

\makeUSRfrontpage

\pagebreak
\chapter*{CONTENTS}

\tableofcontents

\pagebreak

\setcounter{chapter}{-1}

\chapter{ABOUT THIS PUBLICATION} \label{intro}


%********************************************************************


This document, one of several making up the user documentation for the \Product\ system, describes the facilities for preparing documents containing HOL, Z or similar formal material.

\section{Related Publications}

A bibliography is given at the end of this document.
Publications relating specifically to \Product\ are:

\begin{enumerate}
\item {\em {\TUTORIAL}}, tutorial covering the basic \Product{} system.
\item {\em {\ZTUTORIAL}}, tutorial covering \Product{} Z support option.
\item {\em {\HOLREFERENCE}}, the reference manual for the {\ProductHOL} system.
\item {\em {\ZREFERENCE}}, the reference manual for the {\ProductHOL} system.
\item {\em {\XPPUSERGUIDE}}, the user guide for the X Windows interface to {\Product}.
\end{enumerate}

\section{Assumptions}

Some familiarity with \LaTeX\ is assumed.



%********************************************************************

\chapter{INTRODUCTION}


Text files, often termed `document
files' or just `documents', form the basis of a user's interactions
with the \Product\ system.  They contain the formal material comprising
specifications and proofs as well as narrative
material for documentation purposes.

The formal material is used as input to various programs, most notably to the
\Product\ specification and proof tool.
This material is held in the document file in the {\em same\/} form
that is presented to these programs, this also the {\em same\/}
form as it will appear on paper when printed.  A strong point of the
documentation system is this {\em sameness\/} and that any differences
are simple to explain.  Hence an auditor of a system produced using the
\Product\ system can easily see that the text in the source file {\em
is\/} the text compiled or submitted to the proof system and {\em is\/}
the same as the text printed.

Some utility programs and supporting files are provided to assist
in the handling of literate scripts, \ie, files containing a mixture of
formal material (\eg, HOL, Standard~ML code, or Z) and narrative text.
The utilities support the extraction of formal material for processing
(\eg, by the Standard~ML compiler) or for typesetting.  The typesetting
aspects are oriented towards \LaTeX, but some are suitable for use with
other typesetting systems, such as {\tt ptroff.}

For typesetting the package consists of a \LaTeX\ style file (\ie, a
macro suite) named {\tt hol1.sty}; some TrueType font files for use on
screen or in print, namely, {\tt ProofPowerMono} and {\tt ProofPowerSerif};
two shell scripts {\tt pptex} and {\tt texdvi} which are the recommended
means of preparing documents for typesetting and for running {\LaTeX}
or its derivatives.
There are additional supporting programs which are normally invoked via
the shell scripts but which may be called directly for special effects.

The shell script {\tt pptex} (with the supporting programs) allows the
user to prepare a \LaTeX\ file using UNICODE.
The formal material appears on the screen much as it does in the printed
document, and the document can be processed directly with {\Product}.
Tools are available for editing files in this format.
Under the X Windows System, {\tt xpp} is the recommended tool;
consult {\XPPUSERGUIDE} for further information.



This document describes the typesetting facilities, largely by
example.  We assume some familiarity with \LaTeX, which is described
in~\cite{lamport86} and Z, which is described in~\cite{spivey89}.

%--------------------------------------------------------------------

%\subsection{Interface}

%Part of the interface is in the form of several programs, some being shell
%scripts others being compiled, plus a number of supporting text and data
%files.  A second part of the interface is a group of \LaTeX{} style files
%which together with the programs support the production of documents with
%neatly formatted formal material.

%The interfaces to the programs are described in various sections below.

%A third part of the interface is the non-ascii character set provided in
%the font files.  This, together with the keyboard keystrokes used to
%access the characters, is shown in section~\ref{ExtCharSet}.

%--------------------------------------------------------------------


%\subsection{Possible Enhancements}

%Extensions to the directive line macro facilities to give finer control
%on how they are processed.  The macro call (the `{\tt\$}?') might be
%parameterised with the flags now provided by {\tt argoptions}.  The
%{\tt argoptions} might be extended to allow different flags for each
%argument.

%--------------------------------------------------------------------

%\subsection{Backward Compatibility}

%The fonts, style file and programs described here are similar to those
%used for the early work on the FST project and before, however they are
%not compatible with the early work.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\chapter{FORMATTING DOCUMENTS}

This section describes the basic facilities of the document processing
system, these provide for formatting narrative text, inclusion of
Standard~ML source code and indexing of defined names.  Many other
types of material may be contained in a document, including
Z~paragraphs (see~\cite{spivey89}).  Section~\ref{CategoriesOfText}
describes the full set of text types and
section~\ref{ZLanguageMaterial} describes the support for
Z~paragraphs.

%********************************************************************

\section{Getting Started}
\label{GettingStarted}

To install the document processing package see section~\ref{Installation}.

To use the package you prepare a file, say {\tt myfile.pp}, using an editor
for UNICODE files (e.g.{\tt xpp}) and  one of the supplied TrueType fonts.
The characters available in this font are described in section~\ref{ExtCharSet}
together with the character codes and the keystrokes used to access them.
Another way of entering the non-ascii characters is by copying from the
palette which may be displayed in {\tt xpp} with the command {\tt palette}.

The form of the file is essentially that of a
\LaTeX{} file except that you can include material in formal languaes
including Z and HOL which require some processing before being acceptable
to \LaTeX{} and are intended to be extracted for processing by other tools
such as interactive proof tools, and typically make use of non-ascii
UNICODE characters.
These characters are shown in section~\ref{ExtCharSet}.

The first \LaTeX\ command in the document (normally this is the
\index{\BS documentstyle }\verb"\documentstyle" command) should
be preceded with a line containing just the characters
\index{=TEX }`{\tt=TEX}'.
Any lines before this
are simply ignored.  The significance of this line will be made clear
in section~\ref{AboutSieve} where the {\tt sieve} program and
the view-file are discussed.  For the moment, be aware that
any line whose first character is an equals sign `{\tt=}' is
a directive line which indicates
the type of processing for the lines that follow.

What to do next depends on whether you want to use {\LaTeX}2e mode or {\LaTeX}2.0.9
compatibility.

For {\LaTeX}2e, there is a package called {\tt ProofPower.sty}. To use it, use the normal {\LaTeX}2e \verb"\documentclass" command
for the type of document you are preparing (book, article, etc.)
and then put the following command in your document preamble:
=GFT
	\usepackage{ProofPower}
=TEX


The {\LaTeX}2.0.9 style file is called {\tt hol1.sty}.
To use it, the \verb"\documentstyle" command line that you use should include the
option \index{hol1.sty }{\tt hol1}. \eg, this document starts with:

% Note the leading TAB below, this prevents the line being
% treated as a directive line.
=GFT
	=TEX
	\documentstyle[TQ,hol1,11pt]{article}
=TEX

to get the options \index{TQ }{\tt TQ} (which gives our house style which is used
at an eleven point size) and {\tt hol1}.

For {\LaTeX}2e, there is a package called {\tt ProofPower.sty}. To use it, use the normal {\LaTeX}2e \verb"\documentclass" command
for the type of document you are preparing (book, article, etc.)
and then put the following command in your document preamble:
=GFT
	\usepackage{ProofPower}
=TEX

To process file {\tt myfile.pp} and produce a {\tt .dvi} file
you run \index{\BS pptex }{\tt pptex} to form the {\tt.tex} file then
run \LaTeX{} (via \index{texdvi }{\tt texdvi}) as follows:

=GFT
	pptex myfile
	texdvi myfile
=TEX

The above recipe assumes that you have put the directory containing the
programs on your search path and the \LaTeX{} style files where
\LaTeX{} can find them --- all subsequent mentions of programs, etc.,
will assume that the directories are set up correctly,
section~\ref{Installation} describes how to do this.  If your
document does not include a request to make an index as described in
\ref{MakingAnIndex} below, {\tt texdvi} will report on the fact that
the file {\tt myfile.idx} does not exist or cannot be read. This
message may be ignored if you do not wish your document to have an
index.

The basic job in preparing the {\tt.tex} file is to translate each
non-ASCII character into \LaTeX\ macro calls which
typeset that character and to add \LaTeX{} macro calls to properly
format the formal material.  The lines starting with an equals~`{\tt=}'
sign and some of the non-ascii characters are directive lines which
control the way in which it does this,
as we shall see.

Because of the way \LaTeX\ works when producing the self-referential
aspects of a document (\eg, table of contents, page and section
references, \etc) the program {\tt texdvi} will need to be run up to
four times.  If bibliographies use \BibTeX{} then the program {\tt
bibtex} should be run between the first and second execution of {\tt
texdvi}.

Program {\tt pptex} needs to be run once before the first execution of
{\tt texdvi}, thereafter it only needs to be executed after the source
file (e.g., {\tt myfile.pp}) is amended.

%********************************************************************

\section{Including Standard ML}

Program text written in Standard ML may be included, it is introduced
by a directive line containing the characters `{\tt=SML}'.  After this
comes the Standard ML code, then a directive line containing the
characters `{\tt=TEX}'.  The document may contain many segments of
Standard ML code, each surrounded\footnote{More precisely, the segments
of Standard ML code are introduced with an `{\tt=SML}' and are normally
concluded by an `{\tt=TEX}' directive, but any other directive line may
be used.} by \index{=SML } `{\tt=SML}' and
`{\tt=TEX}', the command `{\tt ppsml~myfile}' extracts the code
segments and writes them into the file {\tt myfile.sml}.  There are no
restrictions on the size or contents of the code segments, they may
contain complete or partial declarations etc., a segment may contain
several declarations.  Section~\ref{AboutFtLinePenalty} gives help
about printing Standard ML segments which are over a page in length.

%********************************************************************

\section{Formal and Narrative Text}

The Standard ML code segment is an example of the range of types of
`formal text' supported.  The segment starting with the `{\tt=TEX}'
directive line is one of the types of `narrative text'.  Other types
of formal and narrative text are discussed later on.

Within narrative text segments UNICODE characters may be used to
obtain many symbols not found in the normal keyboard.  These include
many mathematical symbols, particularly those of~Z, plus the Greek
letters.

Within formal text segments UNICODE characters are available plus
a number of percent keywords, each of which may be associated with a
particular UNICODE code point in a keyword file.
UNICODE characters can be used even if not assigned a keyword,
but production of latex documents from documents containing such
characters will depend on the use of a \LaTeX{} variant which accepts
utf-8 input, such as {\bf XeTeX} or {\bf LuaTeX}.
When associated with a keyword, an occurrence of a UNICODE character
in narrative text may be translated for typesetting using a macro
associated with the keyword in the keyword file.
If no macro is supplied in the keyword file the UNICODE character
will be passed through in utf-8.

To use percent keywords to get symbols in text that is to be typeset in
a paragraph, also to get the same formatting style as is used in formal
text, a segment starting with the directive \index{=INLINEFT }
`{\tt=INLINEFT}' is used, an `{\tt=TEX}' directive returns to narrative
text.  Blank lines before and after these two directive lines should be
avoided or \LaTeX{} will interpret them as paragraph separations.
Section~\ref{AboutInlineFT} gives more details of `{\tt=INLINEFT}'.

Formal text is typeset in \LaTeX{} math mode, but with some changes.
UNICODE characters and percent keywords are recognised and the
corresponding symbols are displayed.
Space characters are significant.
The \LaTeX{} special characters, such as `\verb|\|',
`\verb|$|', `\verb|&|', `\verb|#|', `\verb|$|' and `\verb|_|' lose
their special meaning, they are just printed.

UNICODE characters may be included in the narrative text not in math mode,
and not in a formal text section provided that the text processor
used for typesetting will accept either the unicode character itself
in utf-8 or the macro supplied for that character in the keyword file.

%********************************************************************

\section{Making an Index of Defined Terms}\label{MakingAnIndex}

An additional pair of non-ascii characters, `\StartIndex' and
`\EndIndex' may be used to help make an index of defined terms for the
document.  If you type, say, `\StartIndex
\verb"InterestingThing"\EndIndex', somewhere in {\tt myfile.pp} then
\index{InterestingThing }
InterestingThing \label{InterestingThing} will be printed in bold and
the \LaTeX{} macro \index{\BS index }\verb"\index" will be  called with `InterestingThing'
as parameter.  If, following the instructions in~\cite{lamport86}, you
have used \index{\BS makeindex }\verb"\makeindex" earlier in your document this will cause an
entry of the following form (note the~``$\pageref{InterestingThing}$''
is because this text is on page number $\pageref{InterestingThing}$):

% We have to mess about here to get the correct page number in the
% example of the "\indexentry" call.

\begin{GFT}{}
\+	\Backslash{}indexentry\{InterestingThing \}\{\pageref{InterestingThing}\}\\
\end{GFT}

to be written in the file {\tt myfile.idx}.  The program {\tt texdvi}
then sorts this file and puts the output in {\tt myfile.sid}.

A macro \index{\BS printindex }\verb"\printindex" is supplied in the {\tt hol1} style option
for including the index in the printed document.  To use it type
\verb"\printindex" in your file where you want the index to appear.  It
reads the file {\tt myfile.sid} in an environment in which each
\index{\BS indexentry }\verb"\indexentry" produces entries whose
form may be seen in the index
to this document.  Long indexes are best printed in two columns by
preceding the \verb"\printindex" call by a call of \verb"\twocolumn",
and smaller characters than usual might be used.  The index for a
document might be included by using the following \LaTeX\ commands
(this document actually uses this two column style rather than just
calling \verb"\printindex"):

=GFT
	\twocolumn[\section{INDEX}]
	{	\footnotesize
		\printindex
	}
	\onecolumn
=TEX

Note that the calls of \verb"\twocolumn" and \verb"\onecolumn" will
force page breaks.
If the index is the last part of the whole document then the
\verb"\onecolumn" may be omitted.

\bigskip

In formal text, where percent keywords are understood, the keywords
`{\tt\%SX\%}' and `{\tt\%EX\%}' may be used instead of `\StartIndex'
and `\EndIndex' respectively.

%--------------------------------------------------------------------

\subsection{Indexing Non-Ascii Characters}

Most non-ascii UNICODE characters may be used in names to be indexed,
these characters may be the whole name.  Characters that cannot be
indexed are described in section~\ref{ExtCharSet}.

%--------------------------------------------------------------------

\subsection{Indexing Strings} \label{IndexingStrings}

Some identifiers in \Product\ are defined via Standard~ML strings, these
names may be indexed by enclosing the whole string including its
quotation character between the indexing characters or percent
keywords.  If the quotation characters are outside the indexing
characters or percent keywords then the name includes those characters
or keywords.  The actual text of the index entry omits the quotation
characters.

Consider the following example of a section of a document.
(The `{\tt=SMLLITERAL}' is explained in section~\ref{OtherSMLCategories}.)

=GFTSHOW
	=SML
	⦏"Index-1"⦎
	"⦏Index-2⦎"
	=SMLLITERAL
	"⦏Index-3⦎"
=TEX

Which prints as:

=SML
⦏"Index-1"⦎
"⦏Index-2⦎"
=SMLLITERAL
"⦏Index-3⦎"
=TEX

These lines produce index entries (as shown in the index at the end of
this document) for {\tt Index-1} and {\tt Index-2}, i.e., without the
quotation characters.  No index entry is made for {\tt Index-3}.
Processing by {\tt ppsml} discards the first two pairs of indexing
characters but retains those around {\tt Index-3}.  When the text is
compiled in the extended Standard~ML of \Product\ the indexing characters
in the {\tt "\StartIndex Index-3\EndIndex "} are retained as part
of the string.

%--------------------------------------------------------------------

\subsection{Restrictions on Indexing}

The characters `\StartIndex' and `\EndIndex' and the processing that is
applied to the \LaTeX\ indexing system are intended for the names of
defined terms and symbols in the formal text.  Using it for the general
purpose indexing of other text, or for text containing tabs or spaces
is not supported.

This document includes two types of indexed entries.  First, many of
the examples of formal text define some name, and these are indexed
using the `\StartIndex' and `\EndIndex' characters.  Second, the names
of various programs described as part of the text formatting package
are indexed, for example, the program {\tt pptex} is described in a
section starting:

=GFT
	\section{{\tt pptex}\index{pptex }}
=TEX

If an index-like feature for general text is required then the use of
the \LaTeX\ glossary system, see~\cite{lamport86}, is suggested.

%--------------------------------------------------------------------

\subsection{Indexing and {\tt .sml} Files}

When {\tt ppsml} creates the {\tt .sml} file any indexing characters
and keywords in `{\tt=SML}' sections are deleted.  If indexing
characters or keywords are required in the {\tt .sml} file then the
`{\tt=SMLLITERAL}' category, see section~\ref{OtherSMLCategories},
should be used.

Note that {\tt ppsml} attempts to convert text in an `{\tt=SMLLITERAL}' section
to Standard~ML by a simple algorithm suitable only for their use in string-literals,
which means that extended characters outside of Standard~ML string literals will
provoke error messages from the Standard~ML compiler.

%********************************************************************

\newpage
\chapter{CATEGORIES OF TEXT IN A DOCUMENT} \label{CategoriesOfText}

A source document is divided into a number of segments of text of
various categories.  Each segment starts with a directive line whose
first letter is an equals~`{\tt=}' sign or is one of a small number
of non-ascii characters.  These characters are used for
categories such as Z~schemas and are discused later, see
section~\ref{ZLanguageMaterial}.

In the rest of this document we will refer to categories and directive
lines by merely quoting the first few letters of the directive line.
For example, the idiom ``$\ldots$ an `{\tt=TEX}' category $\ldots$''
should be understood to mean a segment of text whose first line is the
directive line starting with the characters~`{\tt=TEX}'.

%********************************************************************

\section{Basic Categories} \label{BasicCategories}

The getting started section, section~\ref{GettingStarted} above,
introduced some of the categories.  Here they and some other basic
categories are described.
Several other categories are provided, they are described in later
sections, particularly in sections~\ref{OtherCategories}.

%--------------------------------------------------------------------

\subsection{Narrative Text}

Text to be processed by the normal rules of \LaTeX{} is introduced by a
directive line containing the four characters \index{=TEX } `{\tt=TEX}',
this text is copied into the {\tt.tex} file by {\tt pptex} but
discarded by {\tt ppsml}.  Program {\tt pptex} additionally converts
non-ascii characters in this category into calls of \LaTeX{} macros
if a keyword has been assigned to the character and a suitable LaTeX
macro has been supplied in a keyword file.

%--------------------------------------------------------------------

\subsection{Standard~ML}

Standard~ML source code, which is an example of formal text, is headed
by a directive line containing the four
characters \index{=SML } `{\tt=SML}', this text is copied into the
{\tt.sml} file by {\tt ppsml} to form the text to be read by the
Standard~ML compiler.  Program {\tt ppsml} actually handles an
extended Standard~ML which is described in~\cite{DS/FMU/IED/USR005}.
Text in the~`{\tt=SML}' category is written in a
WYSIWYG\footnote{Acronym:  WYSIWYG = what you see is what you get.}
manner where the text is written exactly as it would be presented to
the Standard~ML compiler.  Such text is processed by {\tt pptex} to
obtain a verbatim-like layout on the printed page.

%--------------------------------------------------------------------

\newpage
\subsection{Formal Text Within Narrative Text}
\label{AboutInlineFT}

Short sections of formal text may be included in paragraphs by heading
them with a \index{=INLINEFT } `{\tt=INLINEFT}' directive line.
These section may be split over line breaks.  This category is
intended mostly to provide the space processing performed in
`{\tt=SML}' categories.

For example, the text fragments ``
=INLINEFT
f a ∧ g b
=TEX
{} '' and ``%
=INLINEFT
h "i" ∧ j k_1
 ∧ l__m
=TEX
'' were produced by the following source file text.

=GFTSHOW
... text deleted
	the text fragments ``
	=INLINEFT
	f a ∧ g b
	=TEX
	{} '' and ``%
	=INLINEFT
	h "i" ∧ j k_1
	 ∧ l__m
	=TEX
	'' were produced
... text deleted
=TEX

Note how the spacing before and after the formal texts is controlled.
A space is normally produced before the inlined text, it may be
suppressed with a \LaTeX{} comment (i.e., the {\tt\%} character).
Spaces after the inlined text are normally suppressed, an explicit
space may be included by placing an empty group (as shown above) or by
using the~\verb|~|~character.
Within the text newline characters are ignored, space characters may
need to be added at the start of lines.

%--------------------------------------------------------------------

\subsection{Ignored Text}

Text headed by the directive line \index{=IGN } `{\tt=IGN}' or
\index{=IGNORE } `{\tt=IGNORE}' is discarded by both {\tt pptex} and
{\tt ppsml}, such text segments may be used for adding commentary and
notes into a document but which are not to be extracted.  They might
also be used to remove (or comment out) sections of a document without
actually deleting the text.

The part of a document file before the first directive line is always
discarded.

%********************************************************************
\newpage
\subsection{Example}

A simple document in {\tt myfile.pp} containing two Standard~ML
functions might be written as follows.  Recall that the text before the
first directive line is ignored, thus this area may be used to include
version information about the document including keywords understood by
the UNIX {\tt sccs} program.

=GFTSHOW Document example
	File: myfile.pp

	=TEX
	\documentstyle[hol1,11pt]{article}
	\makeindex
	\begin{document}
	This example document contains a Standard ML function
	to calculate factorials and Fibonacci numbers.

	=SML
	fun %SX%factorial%EX% (n:int) : int = (
		if n > 0
		then	n * factorial(n-1)
		else	1
	);
	=TEX

	=SML
	fun ⦏fibonacci⦎ (n:int) : int = (
		if n <= 0
		then	0
		else	if n = 1
			then	1
			else	fibonacci(n-1) + fibonacci(n-2)
	);
	=TEX

	Index of defined names.

	\printindex
	\end{document}
=TEX

Notice the keywords and non-ascii characters used for creating an index
of defined names.  In particular notice how they are interchangeable
which is illustrated by indexing $factorial$ using percent keywords
and $fibonacci$ using non-ascii characters.

\newpage

The body of this example document would print as follows.  Notice the
vertical bar on the left hand side which is headed with `SML'.

\begin{quote}
\ftlmargin=\leftmargin
\ftrmargin=\leftmargin
\itemsep=0pt

This example document contains a Standard~ML function
to calculate factorials and Fibonacci numbers.

\label{FactFibExample}

=SML
fun %SX%factorial%EX% (n:int) : int = (
	if n > 0
	then	n * factorial(n-1)
	else	1
);
=TEX

=SML
fun ⦏fibonacci⦎ (n:int) : int = (
	if n <= 0
	then	0
	else	if n = 1
		then	1
		else	fibonacci(n-1) + fibonacci(n-2)
);
=TEX

Index of defined names.

% We have to mess about here to get an illustrative index with just the two names

{\dimen0=\textwidth
\advance\dimen0 by -\leftmargin
\def\indexentry#1{\hbox to\dimen0{%
	\hspace*{\leftmargin}%
	$#1$%
	\leaders\hbox to 0.5em{\hss.\hss}%
	\hfill
	\pageref{FactFibExample}}}
\indexentry{factorial}
\indexentry{fibonacci}
}

\end{quote}

\bigskip

Processing the same example with {\tt ppsml} would produce the file
{\tt myfile.sml} containing the following text.

=GFTSHOW
	fun factorial (n:int) : int = (
		if n > 0
		then	n * factorial(n-1)
		else	1
	);
	fun fibonacci (n:int) : int = (
		if n <= 0
		then	0
		else	if n = 1
			then	1
			else	fibonacci(n-1) + fibonacci(n-2)
	);
=TEX

%********************************************************************
\newpage
\section{Z Language Material} \label{ZLanguageMaterial}

Two categories of Z~material are supported, both will be printed (via
{\tt pptex}), but only one is included in the output from {\tt
ppsml}.  Here they are termed formal and informal.  The
formal Z~material is labelled with~`Z' above it top left hand corner
whereas the informal material has `Informal Z', see
section~\ref{TextLabels}.

We give an example of each sort of Z paragraph (using the terminology
of Spivey's~Z book~\cite{spivey89}).

A given type definition, from page~3 of~\cite{spivey89}.  Notice that
the printed form differs from~\cite{spivey89} by the addition of the
vertical line labelled with a ``Z'', this is in keeping with all of the
formal text categories provided by the document processing suite.

ⓈZ
│[⦏NAME⦎, ⦏DATE⦎]
■
\penalty10000\index{Z-paragraphs }\index{Z }\par

This was typed in as follows.

=GFTSHOW
	ⓈZ
	│[⦏NAME⦎, ⦏DATE⦎]
	■
=TEX

\bigskip

A Z schema box, from page~13 of~\cite{spivey89}.

┌─⦏BirthdayBook1⦎──────────────────
│	names:ℕ⋎1→NAME
│	dates:ℕ⋎1→DATE
│	hwm:ℕ
├──────────────────────
│	∀i,j: 1 .. hwm ⦁
│		i≠j ⇒ names(i) ≠ names(j)
└──────────────────────────
\penalty10000\index{Z-paragraphs }\par

This was typed in as follows.

=GFTSHOW
	┌─⦏BirthdayBook1⦎──────────────────
	│	names:ℕ⋎1→NAME
	│	dates:ℕ⋎1→DATE
	│	hwm:ℕ
	├──────────────────────
	│	∀i,j: 1 .. hwm ⦁
	│		i≠j ⇒ names(i) ≠ names(j)
	└──────────────────────────
=TEX

\bigskip

An axiomatic description box, from page~39 of~\cite{spivey89}.

ⓈZAX
│	⦏limit⦎:ℕ
├────────────
│	limit ≤ 65535
■
\penalty10000\index{Z-paragraphs }\index{ZAX }\par

This was typed in as follows.

=GFTSHOW
	ⓈZAX
	│	⦏limit⦎:ℕ
	├────────────
	│	limit ≤ 65535
	■
=TEX

\bigskip

A Generic constant, from page~41 of~\cite{spivey89}.

╒═[X, Y]════════════
│⦏first⦎ : X × Y → X
├────────────────
│∀x:X; y:Y ⦁ first(x, y) = x
└─────────────────
\penalty10000\index{Z-paragraphs }\par

This was typed in as follows.

=GFTSHOW
	╒═[X, Y]════════════
	│⦏first⦎ : X × Y → X
	├────────────────
	│∀x:X; y:Y ⦁ first(x, y) = x
	└─────────────────
=TEX

\bigskip

The remaining forms of paragraph do not have a boxed form
in~\cite{spivey89}.  They are entered in a similar fashion to given
types.  The examples are, in order: schema definition, from page~9
of~\cite{spivey89}; abbreviation definition, page~19; free type
definition, from page~82; and, constraint, page~51.

ⓈZ
⦏RAddBirthday⦎ ≜ (AddBirthday ∧ Success) ∨ AlreadyKnown
■

ⓈZ
⦏TREE⦎ ::= tip | fork ⟨⟨ℕ × TREE × TREE⟩⟩
■

ⓈZ
n_disks<5
■
\penalty10000\index{Z-paragraphs }\index{Z }\par

The first of these was typed in as follows, the others have the same
start and end symbols.

=GFTSHOW
	ⓈZ
	⦏RAddBirthday⦎ ≜ (AddBirthday ∧ Success) ∨ AlreadyKnown
	■
=TEX

The usual Z syntax for an abbreviation definition may be rendred informally thus:

ⓈIZAX
⦏DATABASE⦎ == ADDR → PAGE
■

typed:

=GFTSHOW
	ⓈIZAX
	⦏RAddBirthday⦎ ≜ (AddBirthday ∧ Success) ∨ AlreadyKnown
	■
=TEX

but this form is not accepted by \Product, which requires such definitions to be given thus:

ⓈZ
⦏DATABASE⦎ ≜ ADDR → PAGE
■


\bigskip

Points to note.

\begin{itemize}

{\samepage
\item The `$\VBar$', `$\HBar$' and `$\DblHBar$' characters are
	optional.  In many cases they allow the source text to look
	like very much like the final printed Z~text.
}

\item The `$\BigTurnstile$' character separates declarations from
	predicate in the Z boxes.  This character should be the first
	on a line, the only other characters allowed on that line are
	`$\VBar$', `$\HBar$' and `$\DblHBar$'.
	Adding other characters will normally provoke \LaTeX{} error
	messages.

\item For document printing purposes the characters `\EndFormal' and
	`\EndZBox' are interchangeable, however the language specific
	processors may impose further restrictions.

\item Examples of Z~material may be required for enhancing the narrative
	in a document, these are Z~paragraphs that are {\em not\/} to
	be sieved out for formal processing by the Z~support system.
	Such text is known as informal Z~material.  To include such
	informal Z~material the category names should be replaced as
	follows.

	\begin{center}
	\ShowAllImages

	\begin{tabular}{|l|l|}\hline
	Formal			& Informal	\\\hline\hline

	┌			& Ⓢ┌		\\\hline
	╒			& Ⓢ╒		\\\hline
	Ⓢ{\tt ZAX}		& Ⓢ{\tt IZAX}	\\\hline
	Ⓢ{\tt Z}		& Ⓢ{\tt IZAX}	\\\hline
	\end{tabular}
	\penalty10000\index{Z-paragraphs }
	\index{ZAX }\index{Z }\index{IZAX }
	\end{center}

	In informal schema and generic constant boxes the category name
	must be followed by a padding character (i.e., `$\VBar$',
	`$\HBar$' or `$\DblHBar$') or by white space.  In the formal
	equivalents the category name is a single character which does
	not require separation from the rest of the line.  It is
	recommended that these category names are always followed by a
	padding character, as in the examples above, then the only
	distinction between the formal and informal boxes is the
	leading `\StartFormal'.

\item In \ProductZ{} abbreviation definitions and horizontal schema
	definitions both use the~`~%
=INLINEFT
≜
=TEX
~' character whereas in~\cite{spivey89} the abbreviation definition
	uses~`~$==$~'.

\item The vertical bars and the ``Z''~labels at the left and top of the
	Z~paragraphs may be suppressed, see sections~\ref{VerticalBars}
	and~\ref{TextLabels}, thus making Z~paragraphs display closer
	to the style of~\cite{spivey89}, but this may obscure the
	distinction between formal and narrative texts and between
	formal texts in different languages.

\end{itemize}

%********************************************************************

\section{HOL Language Material}

%--------------------------------------------------------------------

\subsection{Constants}

HOL constants may be defined together with a constraining predicate.
Each declaration may define one or many HOL constants.

ⓈHOLCONST
c1 : type1;
c2 : type2
├
p c1 c2
■
\penalty10000\index{HOLCONST }\par

{\samepage
The above constant was typed in as follows.

=GFTSHOW
	ⓈHOLCONST
	c1 : type1;
	c2 : type2
	├
	p c1 c2
	■
=TEX
}

For details of the use of HOL constants refer to
function `$const\-_spec$' in~\cite{LEMMA1/HOL/USR029}.

%--------------------------------------------------------------------

\subsection{Labelled Products}
\label{HOLLabelledProducts}

HOL labelled product types may be defined.  The labelled product
type has a name plus a series of HOL declarations separated by
semicolons.

Example: the type $LAB_PROD$ which has four components.

ⓈHOLLABPROD ⦏LAB_PROD_EXAMPLE⦎
l1 : type1;
l2 : type2;
l3 : type3;
l4 : type4
■
\penalty10000\index{HOLLABPROD }\par

The above labelled product type was typed in as follows.

=GFTSHOW
	ⓈHOLLABPROD ⦏LAB_PROD_EXAMPLE⦎
	l1 : type1;
	l2 : type2;
	l3 : type3;
	l4 : type4
	■
=TEX

For details of the use of labelled products refer to
function `$labelled\-_product\-_spec$' in~\cite{LEMMA1/HOL/USR029}.

%********************************************************************

\section{Other Categories} \label{OtherCategories}

Programs {\tt pptex} and {\tt ppsml} support the categories described
in the preceding sections via a `view-file' and a `keyword-file'
(i.e., command files for the program {\tt sieve}, see
section~\ref{AboutSieve}) which describes the categories available and
the processing that they require.  This view-file has many other
entries which are described here in various groups.

The text in this section and in sections~\ref{GettingStarted}
and~\ref{BasicCategories} should be reguarded as a description of the
facilities provided by the {\tt sieve} program, see
section~\ref{AboutSieve}, and the standard view-file and
keyword-file

%--------------------------------------------------------------------

\subsection{Standard ML Item Descriptions}

A standard format is used by the developers of \Product\ for documenting
Standard~ML functions etc. This is the format used, for example, in the
\Product\ reference manuals, \cite{LEMMA1/HOL/USR029,LEMMA1/ZED/USR030}.
The categories shown in table~\ref{HelpBox} are provided to support
this format.

\begin{table}
\begin{center}
\begin{tabular}{||l|l|l||}\hline

Category name				& Copied by		& Type		\\
\hline\hline

{\tt=DOC}\index{=DOC }			& {\tt pptex}		& Formal	\\
					& {\tt ppsml}		& 		\\
{\tt=SYNOPSIS}\index{=SYNOPSIS }	& {\tt pptex}		& Narrative	\\
{\tt=DESCRIBE}\index{=DESCRIBE }	& {\tt pptex}		& Narrative	\\
{\tt=FAILURE}\index{=FAILURE }		& {\tt ppsml}		& Formal	\\
					& {\tt pptex}		& 		\\
{\tt=FAILUREC}\index{=FAILUREC }	& {\tt pptex}		& Narrative	\\
{\tt=EXAMPLE}\index{=EXAMPLE }		& {\tt pptex}		& Narrative	\\
{\tt=USES}\index{=USES }		& {\tt pptex}		& Narrative	\\
{\tt=COMMENTS}\index{=COMMENTS }	& {\tt pptex}		& Narrative	\\
{\tt=SEEALSO}\index{=SEEALSO }		& {\tt pptex}		& Narrative	\\
{\tt=KEYWORDS}\index{=KEYWORDS }	& {\tt pptex}		& Narrative	\\
{\tt=ENDDOC}\index{=ENDDOC }		& {\tt pptex}		& Narrative	\\\hline
\end{tabular}
\end{center}

\caption{Help Box Contents} \label{HelpBox}

\end{table}

%--------------------------------------------------------------------

\subsection{Manipulating Files}

Categories are provided for manipulating other files.

Text may be written or appended to files.  This is useful for documents
which contain shell scripts, make files and data files, it allows them
to be written and documented using the same mechanisms as, for example,
Standard~ML code.  Category \index{=DUMP } `{\tt=DUMP}' allows formal
text to be printed by {\tt pptex} plus {\tt texdvi} and extracted into
a named file by {\tt ppsml}.  The directive line `{\tt=DUMP~auxfile1}'
indicates to {\tt ppsml} that the following lines are to be written to
the file {\tt auxfile1} overwriting if it already exists.  When
printed, the vertical line at the left of the formal text is headed
with the text `{\tt Text dumped to file auxfile1}'.  Category
\index{=DUMPMORE } `{\tt=DUMPMORE}' allows formal text to be appended to
a file, the directive line `{\tt=DUMPMORE~auxfile2}' indicates to {\tt
ppsml} that the following lines are to be appended to the file {\tt
auxfile2}, the header of the printed form replaces {\tt dumped} with
{\tt appended}.

Within the formal text of `{\tt=DUMP}' and `{\tt=DUMPMORE}' categories
non-ascii characters are allowed.  The text written out by {\tt ppsml}
will have any indexing characters (i.e., `\StartIndex' and `\EndIndex')
deleted.  This allows, e.g., makefile target names to be indexed but
not have the indexing characters included in the makefile.

Categories \index{=VDUMP } `{\tt=VDUMP}' and \index{=VDUMPMORE }
`{\tt=VDUMPMORE}' are similar to `{\tt=DUMP}' and `{\tt=DUMPMORE}'
respectively, the difference being that all characters in the category
are written to the file.  This allows, e.g., the indexing characters to
be written to a file.  The {\tt tex} view of these characters is the
same as for category `{\tt=GFTSHOW}'.

No checks are made to ensure that the filename is valid.  Failing to
open the file is considered a serious error: sieving will stop.

\bigskip

Categories \index{=SH } `{\tt=SH}' and \index{=CSH } `{\tt=CSH}' may be
used to execute arbitrary shell commands.  The text following the
directive is written to the standard input of a Bourne shell or a
C-shell, respectively, by {\tt ppsml} (see {\tt sh(1)} and {\tt
csh(1)} in the UNIX or Linux manual set).  The text in these categories is
printed with the shell name at the top of the left hand vertical bar.
These categories are useful for, e.g., setting the execute flag on
shell scripts created with the `{\tt=DUMP}' category.

\bigskip

Text from other files may be included by using the \index{=INCLUDE }
`{\tt=INCLUDE}' category.  The text of this category is a list of file
names.  When printed these names are just listed.  With {\tt ppsml}
the contents of the files are included by supplying the full list of
file names as arguments to the UNIX command {\tt cat}, see {\tt cat(1)}
in the UNIX or Linux manual set.

\bigskip

An \label{ParserExample} example of these file manipulation commands
occurs in the \Product\ Parser implementatiojn where the grammar
of \Product\ is written to an auxiliary file by an `{\tt=DUMP}', the
parser generator is invoked with an `{\tt=SH}' which writes the
generated parser to another auxiliary file which is included in the
Standard~ML to be compiled by an `{\tt=INCLUDE}' directive.  The
following lines are extracted from the parser
implementation to show how the file manipulation commands are used.

=GFT Extract from ProofPower Parser Implementation
... text deleted

	=DUMP imp019.grm.txt
	(* Terms *)
		Tm	=

... text deleted

	=TEX

... text deleted

	=SH
	poly `arch`slrp.db >imp019.grm.run <<!
	Slrp.slrp{infile="imp019.grm.txt", outfile="imp019.grm.sml",
			logfile="imp019.grm.log",  eos="HLEos", loglevel=2};
	PolyML.quit();
	!
	=TEX

... text deleted

	=INCLUDE
	imp019.grm.sml
	=TEX

... text deleted
=TEX

%--------------------------------------------------------------------

\subsection{Other Standard~ML Categories} \label{OtherSMLCategories}

Text in the category \index{=SMLLABELLED } `{\tt=SMLLABELLED}' is
treated exactly the same as that in category `{\tt=SML}' except that a
user supplied label is used rather than {\tt SML} for the text placed
on the left hand vertical bar.  The user's label is supplied as
arguments on the directive line, there may be none in which case no
label is printed.

Text in the category \index{=SMLPLAIN } `{\tt=SMLPLAIN}' is treated
similarly to that of text in category `{\tt=SMLLABELLED}', the
distinction is that keywords are not recognised when processed by {\tt
ppsml}.  This category is useful for text that includes percent
characters that are not to be otherwise processed.  Examples include:
\TeX{} and \LaTeX{} macro files, where percent characters normally
denote comments; and text that includes SCCS keywords.

Some sections of Standard~ML include indexing characters that are part
of the program text rather than controlling how that text is to be
printed.  A small number of other characters, those used for Z~box
drawing, are treated in the same manner.  Text in the category
\index{=SMLLITERAL } `{\tt=SMLLITERAL}' will be printed so that all the
non-ascii characters are visible, in particular the `\StartIndex' and
`\EndIndex' are displayed and do not cause indexing.  When processed by
{\tt ppsml} all of the non-ascii characters are converted to the
Standard~ML string literal form (namely backslash plus three decimal digits)
and thus will be read by Standard~ML but keywords will not be recognised.
Thus `{\tt=SMLLITERAL}' is useful when non-ascii characters occur only
in Standard~ML strings.
Note that in the extended Standard~ML of \Product,
indexing characters in strings are retained, but elsewhere they are
discarded, see also section~\ref{IndexingStrings}.

Category `{\tt=SMLLITERAL}' is intended for use when non-ascii
characters are wanted in Standard~ML strings where the normal purpose
of the characters is to achieve some printing effect.  For example,
when initialising a data structure containing such strings.  Note that
in this case the Standard~ML identifiers within the segment may not
contain non-ascii characters --- Standard~ML compilation errors will be
reported if this rule is violated.  Standard~ML code which contains a
mixture of identifiers with non-ascii characters and strings with the
non-ascii characters for printing effects needs a combination of the
`{\tt=SML$\ldots$}' categories and the `\verb|\Show|$\ldots$' macros
(see~\ref{ShowingNon-AsciiCharacterImages}) to obtain the correct output.

%--------------------------------------------------------------------

\subsection{Theory Documentation} \label{TheoryListings}

{\tt=THDOC} and {\tt=THSML} are categorise which may be used in documentation of
theories such as may be found in the \Product{} reference manuals.
When {\tt sieve} is run with {\tt tex} as the view, the materials are fornatted
in the manner exemplified by the theory listing sections of the reference
manual.
Apart from the headings for the material, this is similar to the treatment of
formal material in {\tt=DOC} sections.
Hence this is the kind of output to be expected from {\tt pptex}.

Alternatively, if {\tt sieve} is used with the view {\tt thydoc}
(for which no special command line script is provided) then these sections
are treated in the same way as =SML sections are by {\tt ppsml}.

=IGN
THDOC		tex
THDOC		thydoc
THSML		tex
THSML		thydoc
=TEX

%--------------------------------------------------------------------

\subsection{General Formal Text}

Sections of formal text which are to be printed in the style of the
`{\tt=SML}' but discarded by {\tt ppsml} are included in the
\index{=GFT } `{\tt=GFT}' category.  This allows an optional label
on the directive line which is printed at the head of the left hand
vertical bar.  This category is used by many of the examples in this
document.  The extract from the parser shown in
section~\ref{ParserExample} above starts with the following lines.

=GFT
	=GFT Extract from ProofPower Parser Implementation
	... text deleted

		=DUMP imp019.grm.txt
=TEX

A similar environment is provided by the \index{=GFTXQ } `{\tt=GFTXQ}'
category, but here the quotation characters `~{\tt"}~' and `~{\tt`}~'
are displayed as themselves rather than being toggled between
`~``~'~and~`~''~' and between `~`~'~and~`~'~' respectively.

Category \index{=GFTSHOW } `{\tt=GFTSHOW}' is similar to `{\tt=GFTXQ}'
but here all of the non-ascii characters are shown, none of the special
interpretations of (e.g.) indexing and padding characters are made.

%--------------------------------------------------------------------

\subsection{Miscellaneous}

For the convenience of the authors of documents two further ignored
categories are provided, namely \index{=TEMP } `{\tt=TEMP}' and
\index{=TEST } `{\tt=TEST}'.

%--------------------------------------------------------------------

\newpage
\subsection{Formal Rules}

Formal rule structures having three main parts, conventionally the
name, the assumptions, and the conclusions may be formed using the
\index{=FRULE } `{\tt=FRULE}' category.  The `{\tt=FRULE}' directive has
two arguments.  First the value `{\tt 1}' or `{\tt 2}' showing how many
horizontal lines are wanted.  Second the label to use at the head of
the left hand vertical bar.  They are displayed in the following form,
similar forms are used for conversions, tactics and theorems.

=FRULE 1 Rule
name
├
assumptions
├
conclusions
=TEX

Formal rules are discussed in detail in section~\ref{AboutFRules}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newpage
\chapter{\LaTeX\ ENVIRONMENTS} \label{LaTeXEnvironments}

Several \LaTeX\ environments are provided by the {\tt hol1} style, they
are not normally invoked by typing the \verb"\begin{...}" and
\verb"\end{...}" commands of the environments defined in the \LaTeX{}
book~\cite{lamport86}, rather they are used via the capabilities of the
sieving process and the various categories of text they support.

Table~\ref{TabLaTeXEnvironments} lists the environments available in
the {\tt hol1} style.  Each environment corresponds to a piece of
formal text.  To use the environments you use the directive or
characters shown under `opening' and `closing' in the table.

\begin{table}
\begin{center}
\def\arraystretch{1.5}
\begin{tabular}{||l|l|l|p{2.6in}||}\hline
Environment & Opening & Closing & Purpose \\
 & \multicolumn{2}{|c|}{character or directive} & \\\hline\hline
{\tt FRULE} & {\tt=FRULE} & {\tt=TEX} & Rules, tactics, conversions, etc. \\

{\tt GFT*} & {\tt=GFT} & {\tt=TEX} & General formal text using a single
	font and with a user supplied label, quote character are
	toggled\\

{\tt GFTSHOW*} & {\tt=GFTSHOW} & {\tt=TEX} & General formal text where
	all of the non-ascii characters are shown rather than specially
	treated, uses a single font and with a user supplied label,
	quote character are not toggled, \\

{\tt GFTXQ*} & {\tt=GFTXQ} & {\tt=TEX} & General formal text using a
	single font and with a user supplied label, quote character are
	not toggled\\

{\tt HELPDOC} & {\tt=DOC} & {\tt=ENDDOC} & Help documentation\\

{\tt HOLConst} & {\tt\StartFormal HOLCONST} & \EndFormal & HOL constants\\

{\tt HOLLabProd} & {\tt\StartFormal HOLLABPROD} & \EndFormal & HOL~labelled
	product types\\

{\tt MLCode} & {\tt=ML} & {\tt=TEX} & Environment for ML code, toggles
	between two fonts, font changes at term bracketing characters\\

{\tt ZAxDes} & {\tt\StartFormal ZAX} & \EndFormal &
	Z~axiomatic description\\

{\tt ZAxDes} & {\tt\StartFormal IZAX} & \EndFormal & Informal
	Z~axiomatic description\\

{\tt ZGenConst*} & {\tt$\StartZGeneric$} & \EndZBox & Draw
	a Z~generic constant, the argument is the generic parameters\\

{\tt ZGenConstInformal*} & {\tt$\StartFormal\StartZGeneric$} &
	\EndZBox & Draw an informal Z~generic constant, argument
	is generic parameters\\

{\tt ZOther} & {\tt\StartFormal Z} & \EndFormal & Other Z paragraphs
	(i.e., those which are not schemas, generic constants or
	axiomatic descriptions)\\

{\tt ZOtherInformal} & {\tt\StartFormal IZ} & \EndFormal & Other
	informal Z paragraphs (i.e., those which are not schemas,
	generic constants or axiomatic descriptions)\\

{\tt ZSchema*} & {\tt$\StartZSchema$} & \EndZBox & Draw
	a Z~schema box, argument is schema name\\

{\tt ZSchemaInformal*} & {\tt$\StartFormal\StartZSchema$} &
	\EndZBox & Draw an informal Z~schema box, argument is
	schema name\\\hline
\end{tabular}
\end{center}

\caption{\LaTeX\ Environments} \label{TabLaTeXEnvironments}
\end{table}

The environments marked with an asterisk (*) take a parameter giving
the name of the schema, the parameters of the generic constant or the
title for the formal text.  For the last case the parameter may be
empty in which case the label field is suppressed.

%********************************************************************

\section{Input Format} \label{InputFormat}

Within any of the above environments, text is typeset with each `line
of input' corresponding to a line in the printed document.  Here if one
of the bracketing pairs listed above encloses the text then the phrase
`line of input' actually means a line of input from the source file; if
you are using \verb"\begin{...}" and \verb"\end{...}" to delimit the
environments, then a `line of input' must have its beginning and end
marked with \index{\BS + }\verb"\+" and \index{\BS \BS }\verb"\\"
respectively (apart from the lines
containing a `\BigTurnstile' plus optional `\HBar' characters).

Tab and space characters may be used to control the layout within each
line of input.  All space characters give a small amount of space in
the printed output.  Tab characters are used to give type-writer style
tabbing, see section~\ref{AboutTabs} for more details.

Some of the environments support Z~schema boxes where the visual layout
of the source text is important.  For these a range of non-ascii
characters are provided that allow the schema boxes to be drawn.  Some
other environments, including formal rules and $\ldots$, use the same
characters to allow a good layout.

The shape of these box drawing characters has been chosen so that you
can use them, together with the non-ascii characters `\VBar', `\HBar',
`\DblHBar' and `\BigTurnstile', to draw boxes which look on the screen
like the printed form.  The characters `\VBar', `\HBar' and `\DblHBar'
are merely padding and have no effect on the form of the printed
document, although other programs may use them.

%********************************************************************

\section{Formatting Formal Rules} \label{AboutFRules}

Rule structures have three main parts, conventionally the name, the
assumptions, and the conclusions.  They are displayed thus:

=FRULE 1 Rule
name
├
assumptions
├
conclusions
=TEX

Each of the three parts may have multiple lines.  The name part is
always aligned centrally with the horizontal line.  There may be one or
two horizontal lines.  Additionally, each structure may be labelled,
the word `Rule' labels the above display.
Similar layouts are used for conversions, tactics and theorems.

%--------------------------------------------------------------------

\subsection{Examples}

The {\em Modus Ponens\/} rule and the {\em induction
tactic\/} may be displayed as follows.

=FRULE 1 Rule
⦏⇒_elim⦎
├
Γ1 ⊢ t1 ⇒ t2; Γ2 ⊢ t1'
├
Γ1 ∪ Γ2 ⊢ t2
=TEX

=FRULE 2 Tactic
│⦏∧_tac⦎
├─────────────
│{ Γ } t1 ∧ t2
├─────────────
│{ Γ } t1; { Γ } t2
=TEX

These are typed in the source text as follows.

=GFTSHOW
	=FRULE 1 Rule
	⦏⇒_elim⦎
	├
	Γ1 ⊢ t1 ⇒ t2; Γ2 ⊢ t1'
	├
	Γ1 ∪ Γ2 ⊢ t2
	=TEX

	=FRULE 2 Tactic
	│⦏∧_tac⦎
	├─────────────
	│{ Γ } t1 ∧ t2
	├─────────────
	│{ Γ } t1; { Γ } t2
	=TEX
=TEX

Significant points shown above are as follows.

\begin{itemize}

\item The name, assumptions and conclusions are given in that order and
	are separated by the large turnstile `\BigTurnstile'
	character, which should occur on a line on its own.

\item The use of the vertical `\VBar' and horizontal `\HBar'
	bars to make the second example more readable.

\item The first argument to the `{\tt=FRULE}' directive gives the number
	of horizontal lines, either~{\tt1} or~{\tt2}.

\item The type of rule box is indicated by the second argument to the
	`{\tt=FRULE}' directive, the type is used as the label.

\item The line `{\tt=TEX}' completes each rule.

\end{itemize}

%--------------------------------------------------------------------

\subsection{\LaTeX\ Environment For Rules}

The rule environments are implemented with the \LaTeX\ environment
`{\tt=FRULE}'.  It takes two parameters.  First, a single digit, either~1
or~2, indicating the number of horizontal lines wanted.  Second the
label for the rule environment, or an empty parameter if no label is
wanted.

Within the name, assumptions and conclusions the lines of input must be
formatted according to the rules given in section~\ref{InputFormat}.

%--------------------------------------------------------------------

\subsection{Format of Rule Environments}

A rule environment contains the following~\ref{NumParts} parts,
in the stated order.

\begin{enumerate}

\item A line containing the rule type, types are given in
	section~\ref{TypesOfRule} below.

\item The name part, which should include any non-theorem arguments.

\item A large turnstile `\BigTurnstile' character with optional
	horizontal bars `\HBar' on a line on their own.

\item The assumptions part.

\item Another large turnstile `\BigTurnstile' character with
	optional horizontal bars `\HBar' on a line on their own.

\item The conclusions part.

\item \label{NumParts} Start another sieving section, normally a
	directive line containing just the text `{\tt=TEX}'.

\end{enumerate}

Each of the name, assumptions and conclusions may comprise of several
lines, each of which may start with the optional vertical `\VBar'
bar, if desired.  Lines in the assumptions and conclusions are
individually centered above or below the horizontal lines.  The name
part is left justified.  An example:

=FRULE 2 Tactic
Name line 1
2
Third name line
├
Assumptions line 1
2
Third assumptions line
and the fourth
├
First conclusions line
second
3
4, 4, 4, 4
fifth
=TEX

The source text for this example is as follows.

=GFTSHOW
	=FRULE 2 Tactic
	Name line 1
	2
	Third name line
	├
	Assumptions line 1
	2
	Third assumptions line
	and the fourth
	├
	First conclusions line
	second
	3
	4, 4, 4, 4
	fifth
	=TEX
=TEX

\label{RuleErrorMessages}
Rule environments that contain only one large turnstile
`\BigTurnstile' character are assumed to contain just the name and
conclusion parts, those with no large turnstiles just the name part.
Any third or subsequent turnstile is ignored, any text that follows
them is treated as further lines of the conclusions.

Any rule environment with fewer, or greater, than two large turnstiles
`\BigTurnstile' characters will cause a warning message to be
written to the terminal and to the log file for the \LaTeX\ run.

%--------------------------------------------------------------------

\subsection{Types of Rule} \label{TypesOfRule}

FST project conventions use a small number of types of rule, namely:
conversions, rules and theorems with one horizontal line; and, tactics
with two horizontal lines.  All of these types are illustrated within
this document.

The directive lines for these four types of rule are as follows.

=GFT
	=FRULE  1  Conversion
	=FRULE  1  Rule
	=FRULE  1  Theorem
	=FRULE  2  Tactic
=TEX

%********************************************************************

\section{Miscellaneous}

The final environments may be used for any text that is to be displayed
in the verbatim-like fashion of the other formal text environments.

Categories \index{=GFT }`{\tt=GFT}', \index{=GFTXQ }`{\tt=GFTXQ}'
and \index{=GFTSHOW }`{\tt=GFTSHOW}' correspond to
environments of the same name, i.e., \verb"GFT", \verb"GFTXQ" and
\verb"GFTSHOW".

The \verb"GFTSHOW" environment is used, via the `{\tt=GFTSHOW}'
directive, for the examples of `how to type~$\ldots$' throughout this
document.

%********************************************************************
%********************************************************************
%********************************************************************
%********************************************************************

\section{Quirks and Foibles}

The package is designed on the assumption that text in the various
categories uses the conventional category codes and macro definitions
of \LaTeX{} plus the style file {\tt hol1.sty}.

For the formal text categories (of which only the `{\tt=SML}' and
`{\tt=INLINEFT}' categories have been introduced so far), characters such
as `\verb|\|', `\verb|$|', `\verb|&|', `\verb|#|', `\verb|$|' and
`\verb|_|' are not to be treated specially, they are just to be
printed.  The intention is that the formal text categories give a
verbatim representation of their contents.

The package has also been designed on the assumption
that if you use the \LaTeX\ \verb"\begin{...}" command
to invoke one of the environments described in section~\ref{LaTeXEnvironments} you are
doing it to use \LaTeX\ to get some special effect\footnote{If
you want to do this you will need to know that lines
of text in these environments are typeset in math mode,
adjusted so that all spacing (even around relation
symbols \etc) must be requested explicitly.
See the style file for details of how this is done.}
(but, see \ref{TheoryListings} below for an exception to this).
The package
therefore only serves to translate non-ascii characters
in text which is not enclosed in a pair of
bracketing characters.
It does not put in controls
for extra spaces or for printing \LaTeX\ special characters,
on the assumption that you will want to set the
spacing yourself and to use the special characters
as special characters.

Non-ascii characters may be used in the \LaTeX\ sectioning commands, but
in such cases
they should not be used in maths mode, \ie, do not enclose them in
dollar `\verb|$|' signs.  The sectioning commands are the commands that
create entries for the table of contents, such as \verb|\section|,
\verb|\subsection| and\verb|\subsubsection|.  Having the non-ascii
characters in maths mode will often cause \LaTeX\ error messages to be
issued when it reads the `{\tt.toc}' file to generate the table of
contents.

%********************************************************************

\section{Controlling The Layout}

%--------------------------------------------------------------------

\subsection{Left and Right Margins} \label{AboutMargins}

The dimension registers \index{\BS ftlmargin }\verb"\ftlmargin" and
\index{\BS ftrmargin }\verb"\ftrmargin" may be used to adjust the additional
left and right margin space used for the boxes. These
are set to give no additional space by default.
For example, the schema below starts and finishes
with the following lines

=GFTSHOW
	{\ftlmargin=1.5in \ftrmargin=1.5in
	┌─⦏BirthdayBook1⦎───────────────
... text deleted
	└─────────────────────────
	}
=TEX

to the source text yields the following:
{\ftlmargin=1.5in \ftrmargin=1.5in
┌─⦏BirthdayBook1⦎───────────────
│	names : ℕ⋎1→NAME
│	dates : ℕ⋎1→DATE
│	hwm : ℕ
├─────────────────────
│	∀i,j: 1 .. hwm ⦁
│		i≠j⇒names(i)≠names(j)
└─────────────────────────
}

\bigskip

When formal text is included in \LaTeX{} list environments (namely:
\index{\BS description }{\tt description}, \index{\BS enumerate }{\tt
enumerate}, \index{\BS itemize }{\tt itemize} and \index{\BS list }{\tt
list}) it is, by default, placed against the left hand margin rather
than against the indented margin implied by the list environment.  To
move the formal text to the indented margin \index{\BS ftlmargin
}\verb|\ftlmargin| should be set to the sum of the \LaTeX{} list
indentations for the enclosing lists.  These values are held as the
dimensions \index{\BS leftmargini-leftmarginvi }\verb|\leftmargini|,
\verb|\leftmarginii|, \verb|\leftmarginiii|, \verb|\leftmarginiv|,
\verb|\leftmarginv| and \verb|\leftmarginvi|.  The usage of these
dimensions can be seen in the following examples.

\begin{enumerate}

\item The next formal text is at the default left hand margin.

=GFT
Formal text
=TEX

	Paragraphs of narrative text are indented.


\item This formal text is once indented, the commands required
	to achieve this effect are shown.

{\ftlmargin=\leftmargini
\catcode`\!=\active
\def!{=}% This is to stop sieve messing up the real example
=GFT
{\ftlmargin=\leftmargini
!GFT
Formal text
!TEX
}
=TEX
}

	The above formal text has the same indentation as
	paragraphs of narrative text.

\begin{itemize}

\item Double nested list environments.

\item This formal text is twice indented, the commands required
	to achieve this effect are shown.

{\ftlmargin=\leftmargini
\catcode`\!=\active
\advance\ftlmargin by \leftmarginii
\def!{=}% This is to stop sieve messing up the real example
=GFT
{\ftlmargin=\leftmargini
\advance\ftlmargin by \leftmarginii
!GFT
Formal text
!TEX
}
=TEX
}

\begin{enumerate}

\item Triple nested list environments.

\item This formal text is three times indented, the commands
	required to achieve this effect are shown.

{\ftlmargin=\leftmargini
\catcode`\!=\active
\advance\ftlmargin by \leftmarginii
\advance\ftlmargin by \leftmarginiii
\def!{=}% This is to stop sieve messing up the real example
=GFT
{\ftlmargin=\leftmargini
\advance\ftlmargin by \leftmarginii
\advance\ftlmargin by \leftmarginiii
!GFT
Formal text
!TEX
}
=TEX
}

	The above formal text has the same indentation as
	paragraphs of narrative text.

\item For more deeply nested lists add in further indentation
	dimensions in a similar manner.

\end{enumerate}

\end{itemize}
\end{enumerate}

%--------------------------------------------------------------------

\subsection{Page Breaks in Formal Text} \label{AboutFtLinePenalty}

The count register \index{\BS ftlinepenalty }\verb"\ftlinepenalty" sets
the penalty which applies at the end of each line
of formal text in the various environments.
It is set to $10000$ by default.
This value means that no page breaks will be
allowed within such an environment.  If you want
to allow page breaks use \eg, \verb"\ftlinepenalty=0".

No page breaks are possible in rule environments, so changing the
value has no effect for rules.

It is recommended that large pieces of formal text, such as HOL theory
listings and some HOL proofs, that may spread across more than one page
are preceded with a \verb"\ftlinepenalty=0" so that \LaTeX\ may choose
convenient page breaks.

%--------------------------------------------------------------------

\subsection{Space Width}

Spaces in formal texts have a width given by the \TeX{} maths skip
\index{\BS ftspaceskip }\verb|\ftspaceskip| which has a default
value of~{\tt 7~mu}.  Maths
skip distances can be seen from the
following example.

\begin{GFT}{Skips}
\+4\mskip4mu4, 5\mskip5mu5, 6\mskip6mu6,
7\mskip7mu7, 8\mskip8mu8, 9\mskip9mu9,
10\mskip10mu10, 11\mskip11mu11\\
\+some\mskip4muwords\mskip5muthat\mskip6mushow\mskip7muoff\\
\+the\mskip8muabove\mskip9mumaths\mskip10muskip\mskip11musizes\\
\end{GFT}

Which was produced as follows.

=GFT
	\begin{GFT}{Skips}
	\+4\mskip4mu4, 5\mskip5mu5, 6\mskip6mu6,
	7\mskip7mu7, 8\mskip8mu8, 9\mskip9mu9,
	10\mskip10mu10, 11\mskip11mu11\\
	\+some\mskip4muwords\mskip5muthat\mskip6mushow\mskip7muoff\\
	\+the\mskip8muabove\mskip9mumaths\mskip10muskip\mskip11musizes\\
	\end{GFT}
=TEX

%--------------------------------------------------------------------

\subsection{Tab Intervals} \label{AboutTabs}

In all of the environments tab characters are
interpreted specially and give typewriter-style
tab stops.  The size of the tabbing interval is
given by the dimension \index{\BS tabstop }\verb|\tabstop| whose default
value is $1\over2$~inch.
For instance, the example in section~\ref{AboutMargins}
above uses one tab
at the beginning of each line but the last, which has two.
By putting tabs in before the colons
in the signature part of the schema, one can get
the types to line up in columns:

┌─⦏BirthdayBook1⦎───────────────
│	names	: ℕ⋎1 → NAME
│	dates	: ℕ⋎1 → DATE
│	hwm	: ℕ
├─────────────────────
│	∀i,j: 1 .. hwm ⦁
│		i ≠ j ⇒ names(i) ≠ names(j)
└─────────────────────────

It may require some experiment to get the right
number of tabs.
The tab stop interval can be changed by setting
the dimension register \verb"\tabstop" to the
required interval. \Eg, with

=GFT
	\tabstop=1.0in
=TEX

our example looks like:
{
\tabstop=1.0in
┌─⦏BirthdayBook1⦎───────────────
│	names	: ℕ⋎1 → NAME
│	dates	: ℕ⋎1 → DATE
│	hwm	: ℕ
├─────────────────────
│	∀i,j: 1 .. hwm ⦁
│		i ≠ j ⇒ names(i) ≠ names(j)
└─────────────────────────
}

%--------------------------------------------------------------------

\subsection{Centering In Rule Environments}

Text in the assumptions and conclusions is normally centered above and
below the horizontal lines.  It may be left justified above by calling
the macro \index{\BS FruleLeftJustify }\verb|\FruleLeftJustify|.
An example of the use of this
command is in the next section,~\ref{TabsAndRules}.

%--------------------------------------------------------------------

\subsection{Width of Rule Environments}

By default the left and right parts of a rule are set in formal text
areas which are each 45\% of the whole width available, i.e., the line
width less the space for margins as held in \verb|\ftlmargin| and
\verb|\ftrmargin|, the remaining 10\% of the width is used for spacing
between the items.  The widths of the two parts may be adjusted, the
10\% for spacing is fixed.

To alter the sizes of the left and right parts of a rule macros
\index{\BS FruleLeftWidth }\verb"\FruleLeftWidth" and \index{\BS
FruleRightWidth }\verb"\FruleRightWidth" may be redefined with the
required widths.  Their sum should not exceed 90\% of the whole width
available.

For example, with the default widths the rule below would cause an
`overfull hbox' error message, but by adjusting the widths in the manner
shown the error message may be avoided.

=GFTSHOW
	{\def\FruleLeftWidth{0.7\textwidth}
	\def\FruleRightWidth{0.2\textwidth}
	=FRULE 2 Tactic
	z_∀_elim
	ⓩt⌝
	├
	Γ ⊢ ∀ D[x⋎1,...] | P⋎1[x⋎1,...]⦁ P⋎2[x⋎1,...]
	├
	Γ ⊢ "D[t.x⋎1,...] as predicate" ∧ P⋎1'[t.x⋎1,...] ⇒ P⋎2'[t.x⋎1,...]
	=TEX
	}
=TEX

{
\def\FruleLeftWidth{0.7\textwidth}
\def\FruleRightWidth{0.2\textwidth}
=FRULE 2 Tactic
z_∀_elim
ⓩt⌝
├
Γ ⊢ ∀ D[x⋎1,...] | P⋎1[x⋎1,...]⦁ P⋎2[x⋎1,...]
├
Γ ⊢ "D[t.x⋎1,...] as predicate" ∧ P⋎1'[t.x⋎1,...] ⇒ P⋎2'[t.x⋎1,...]
=TEX
}

%--------------------------------------------------------------------

\subsection{Tabs In Rule Environments} \label{TabsAndRules}

The lines of input in rules may contain TAB characters for alignment
purposes in the same way that they may be used in other formal text
environments, but when the text is centered the alignment may not be as
expected.  It is recommended that TAB characters be used in rules {\em
only\/} when \verb|\FruleLeftJustify| has been selected.  An example of
the use of this command is as follows.

{
\FruleLeftJustify
=FRULE 1 Theorem
N	a	m	e
Name line without tabs
├
Tab-free assumption line
A	ssum	ptio	ns
Some more ass	unpt	ions
├
Concl	usions
Furt	her c	onc	lusi	ons
Tab-free line
=TEX
}

Which was produced with the following input text.

{\catcode`\!=\active
\def!{\kern1pt\fbox{\it tab}\kern1pt}
=GFTSHOW
	{\FruleLeftJustify
	=FRULE 1 Theorem
	N!a!m!e
	Name line without tabs
	├
	Tab-free assumption line
	A!ssum!ptio!ns
	Some more ass!unpt!ions
	├
	Conclus!ions
	Furt!her c!onc!lusi!ons
	Tab-free line
	=TEX
	}
=TEX
}

Omitting the \verb|\FruleLeftJustify| has the following effect.

=FRULE 1 Theorem
N	a	m	e
Name line without tabs
├
Tab-free assumption line
A	ssum	ptio	ns
Some more ass	unpt	ions
├
Concl	usions
Furt	her c	onc	lusi	ons
Tab-free line
=TEX

Note how the tabs are not lined up, they appear to
give random gaps.

%--------------------------------------------------------------------

\subsection{Showing Non-Ascii Character Images}
\label{ShowingNon-AsciiCharacterImages}

Normally some of the non-ascii characters cause formatting effects such
as indexing but it may be necessary to cause these characters to be
printed.  A range of macros are provided to allow various sections of
the non-ascii character set to be shown.  These controls are normally
invoked automatically via one of the sieving categories but they may
be called by the user to get particular printing effects.

\index{\BS ShowScripts }
Macro \verb|\ShowScripts| causes the subscripting and superscripting
characters to be shown.

\index{\BS ShowBars }
Macro \verb|\ShowBars| causes the padding characters to be shown.

\index{\BS ShowIndexing }
Macro \verb|\ShowIndexing| causes the indexing characters to be shown.

\index{\BS ShowBoxes }
Macro \verb|\ShowBoxes| causes the big turnstile plus the characters
that start and end Z~schemas and generic constants to be
shown.

\index{\BS ShowAllImages }
Macro \verb|\ShowAllImages| calls all of the above showing macros.

\bigskip

These macros
may be called before the formal text environments to make their
characters be shown on the printed result.
They may have their scope limited by enclosing them in \TeX{}
groups.

In many simple cases the `{\tt=SML$\ldots$}' categories (see
section~\ref{OtherSMLCategories}) provide an alternative method
for displaying non-ascii characters.

%--------------------------------------------------------------------

\subsection{Underscores}

Some document authors want underscores to have their normal \TeX{}
meaning, i.e., as subscription, others want underscores to print as
themselves.  Macro \index{\BS underscoreoff }\verb|\underscoreoff|
makes underscore a normal printing character, and \index{\BS
underscoreon }\verb|\underscoreon| restores its usual \TeX{} meaning.
The default is that underscore have their normal \TeX{} meaning.  These
macros may have their scope limited by enclosing them in \TeX{}
groups.

This document is written with an \verb|\underscoreoff| near its start,
the effects of this may be seen in several of the examples where
underscore characters are freely used without needing to be protected
by backslash characters.

%--------------------------------------------------------------------

\subsection{Controlling Indexing}

Indexed terms are normally shown in a bold font.  Macro \index{\BS
HOLindexPlain }\verb|\HOLindexPlain| causes indexed terms to be shown
in the same font as their enclosing text and macro \index{\BS
HOLindexBold }\verb|\HOLindexBold| restores the bold font.

It may useful to be able to turn off indexing over some blocks of text
even though the indexing macros (or non-ascii characters) are still
used.  Macros \index{\BS HOLindexOff }\verb|\HOLindexOff| and
\index{\BS HOLindexOn }\verb|\HOLindexOn| turn on and off,
respectively, the indexing actions of the indexing characters
and keywords.  (The \verb|\index| macro of \LaTeX{} is not affected.)

All of these macros may have their scope limited by enclosing them in
\TeX{} groups.

	For example, this paragraph uses the non-ascii characters
	for indexing.  This term ⦏ci_one⦎ uses the default style
	of indexing.  This term {\HOLindexPlain ⦏ci_two⦎} is
	displayed with the enclosing font.  These terms \HOLindexOff
	⦏ci_three⦎ and \HOLindexPlain ⦏ci_four⦎ \HOLindexOn
	\HOLindexBold are not indexed.  This term ⦏ci_five⦎ uses
	the default style of indexing.

The above paragraph was typed as follows.

=GFTSHOW
	For example, this paragraph uses the non-ascii characters
	for indexing.  This term ⦏ci_one⦎ uses the default style
	of indexing.  This term {\HOLindexPlain ⦏ci_two⦎} is
	displayed with the enclosing font.  These terms \HOLindexOff
	⦏ci_three⦎ and \HOLindexPlain ⦏ci_four⦎ \HOLindexOn
	\HOLindexBold are not indexed.  This term ⦏ci_five⦎ uses
	the default style of indexing.
=TEX

Additional index entries may be added with the \index{\BS HOLindexEntry
}\verb|\HOLindexEntry| macro, it takes one argument which is the item
to be indexed.  The text is not included at the point of call, indexing
is controlled by the \verb|\HOLindexOff| and \verb|\HOLindexOn|
commands.  Thus, the following might be a useful idiom for some
documents.

=GFT
	\def\myindex#1{\HOLindexOn\HOLindexEntry{#1}\HOLindexOff}
=TEX

%********************************************************************

\section{Vertical Bars on Formal Texts} \label{VerticalBars}

Formal text is normally printed with a vertical bar on its
left hand edge.  This bar may be suppressed by using
\index{\BS vertbarfalse }\verb|\vertbarfalse|,
the corresponding \index{\BS vertbartrue }\verb|\vertbartrue| may
be used to bring back the
vertical bars as may the normal \LaTeX{} grouping mechanism.
For example, the following is printed

{\vertbarfalse
=SML
some text
=TEX
}

by entering the following text.

=GFTSHOW
	{\vertbarfalse
	=SML
	some text
	=TEX
	}
=TEX

%********************************************************************

\section{Labels on Formal Texts} \label{TextLabels}

Several of the types of formal text provide a label at the top left
hand corner or above the left hand vertical line.  The text of these
labels may be altered by redefining their macros.  For long labels on
the Z~boxes it may be necessary to include \index{\BS strut }\verb|\strut| in the macro
body.  Table~\ref{TabTextLabels} gives details of the labelling
macros and their default label.

\begin{table}
\begin{center}
\ShowAllImages
\begin{tabular}{||l|l|l|l||}\hline
Sieving category
		& \LaTeX{} environment	& Label macro			& Default label	\\\hline

{\tt ⓈHOLCONST}	& HOLConst		& \verb|\HOLConstLabel|		& HOL Constant	\\
{\tt ⓈHOLLABPROD} & HOLLabProd		& \verb|\HOLLabProdLabel|	& HOL Labelled Product	\\
{\tt	=ML}	& MLCode		& \verb|\MlLabel|		& ML		\\
{\tt	ⓈIZAX}	& ZAxDesInformal	& \verb|\ZAxDesInformalLabel|	& Informal Z	\\
{\tt	ⓈZAX}	& ZAxDes		& \verb|\ZAxDesLabel|		& Z		\\
	╒	& ZGenConstInformal	& \verb|\ZGenericInformalLabel|	& Informal Z	\\
	Ⓢ╒	& ZGenConst		& \verb|\ZGenericLabel|		& Z		\\
{\tt	ⓈZ}	& ZOther		& \verb|\ZOtherLabel|		& Z		\\
{\tt	ⓈIZ}	& ZOtherInformal	& \verb|\ZOtherInformalLabel|	& Informal Z	\\
	┌	& ZSchema		& \verb|\ZSchemaInformalLabel|	& Informal Z	\\
	Ⓢ┌	& ZSchemaInformal	& \verb|\ZSchemaLabel|		& Z		\\\hline
\end{tabular}
\end{center}

\index{\BS HOLConstLabel}	
\index{\BS HOLLabProdLabel}	
\index{\BS MlLabel}	
\index{\BS ZAxDesInformalLabel}
\index{\BS ZAxDesLabel}	
\index{\BS ZGenericInformalLabel}
\index{\BS ZGenericLabel}	
\index{\BS ZOtherInformalLabel}
\index{\BS ZOtherLabel}	
\index{\BS ZSchemaInformalLabel}
\index{\BS ZSchemaLabel}	
\index{Z }
\index{ZAX }
\index{IZ }
\index{IZAX }
\index{HOLCONST }
\index{HOLLABPROD }
\index{=ML }
\index{Z-paragraphs }

\caption{Formal Text Labelling} \label{TabTextLabels}
\end{table}

%********************************************************************

\section{Line Numbers in \LaTeX\ Error Messages}

Error and warning messages produced by \LaTeX\ include line numbers,
these refer to the {\tt.tex} file that \LaTeX\ actually reads, not to
the {\tt.pp} file.  Whenever \LaTeX\ opens a file for reading it
prints an open bracket `{\tt(}' to the terminal and to the {\tt.log} file,
followed by the file name.  A matching closing bracket `{\tt)}' is
printed when \LaTeX\ closes the file.

%********************************************************************

\section{Error Handling}

A few error messages are reported by the style file, most faults are
left to be reported by \LaTeX{} or other parts of the documentation
system.
Some of these errors may include translations of non-ascii characters
into their \index{\BS Pr$\cal NN$ }`\verb|\Pr|$\cal NN$\verb|{}|' form, see
section~\ref{ConvertUNICODE}, which is used internally by the document
processing system.  To assist the user in understanding these error
messages the translations are shown in
section~\ref{Non-AsciiCharImages}.

Some non-ascii character values are reserved for future expansion.  If
one of these is found in a {\tt.pp} file then the default action is
for the style file to issue an error message and display the character
as its hexadecimal value enclosed in a box.  For example, the character
value $128\sb{10}$ would be shown as ``{\NoMoaning \makeatletter
\@moan{80}}\kern1pt'' if it were one of the reserved characters.  The
error message may be suppressed by calling the macro \index{\BS NoMoaning }\verb|\NoMoaning|
in a group surrounding such characters.

A number of error messages may be produced when formatting rules,
section~\ref{RuleErrorMessages} gives details.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\chapter{COMMONLY USED PROGRAMS} \label{CommonlyUsedPrograms}

Most of the processing tasks required to produce a printed form of a
document are encapsulated in shell scripts documented here.  These
scripts use other programs described later in this document.  The idiom
for typesetting the literate script, {\tt myfile.pp} is to run the
following scripts.

=GFT
	pptex myfile
	texdvi myfile
=TEX

This generates the file {\tt myfile.dvi} containing the \LaTeX\ output
for printing with {\tt pstex} or displaying with {\tt dvipage}.
The names of these programs are formed by concatenating the extension
of the source file with the extension of the main output file.

The reason for having separate commands, {\tt pptex} and {\tt
texdvi}, is that one usually needs to run \LaTeX\ several times (\ie,
using {\tt texdvi} up to four times) to ensure that contents lists,
references, indexes and similar are all in step.

Similar shell scripts are provided to extract Standard~ML text from a
document to create the {\tt.sml} file.

%********************************************************************

\section{Steering Files for Sieving Programs} \label{FKOptions}

Some shell scripts invoke the {\tt sieve} program with a view-file
and keyword-file found by program {\tt findfile} to do the sieving.
The default view-file and keyword-file give the categories described in the
previous sections of this document.  For these shell scripts the {\tt
-f} option may be used to name an alternate view-file, similarly {\tt
-k} may be used to name additional keyword-files.   Option {\tt-K}
may be used to suppress the default keyword-file.

%********************************************************************

\section{{\tt pptex\index{pptex }}}
\label{PpTexProg}

=GFT
	pptex [-v] [-f view_file_name] [-K] [-k keyword_file_name] <files...>
=TEX

Each source file is read and sieved to produce a corresponding
{\tt.tex} file.

File name arguments may be the whole name of the {\tt .pp} file or just the
stem part, i.e., for  file {\tt myfile.pp} either {\tt myfile.pp} or
{\tt myfile} may be used.

If the {\tt -v} option is given the programs prints out the names of
the source and main output files.  The {\tt -f}, {\tt-K} and {\tt -k} options
are described in section~\ref{FKOptions}.

%********************************************************************

\section{{\tt ppsml\index{ppsml }}}

=GFT
	ppsml [-v] [-f view_file_name] [-K] [-k keyword_file_name] <files...>
=TEX

Each source file is read and sieved to produce a corresponding
{\tt.sml} file.

File name arguments and options are the same as with program {\tt pptex}
in section~\ref{PpTexProg}.


%********************************************************************

\section{{\tt pptch\index{pptch }}}

=GFT
	pptch [-v] [-f view_file_name] [-K] [-k keyword_file_name] <files...>
=TEX

Each source file is read and sieved to produce a corresponding
{\tt.tch} file.

File name arguments and options are the same as with program {\tt pptex}
in section~\ref{PpTexProg}.


%********************************************************************

\section{{\tt pptds\index{pptds }}}

=GFT
	pptds [-v] [-f view_file_name] [-K] [-k keyword_file_name] <files...>
=TEX

Each source file is read and sieved to produce a corresponding
{\tt.tds} file.

File name arguments and options are the same as with program {\tt pptex}
in section~\ref{PpTexProg}.

%********************************************************************

\section{{\tt texdvi\index{texdvi }}}
\label{TexDviProg}

=GFT
	texdvi [-v] [-b] [-p TeX_program] <files...>
=TEX

This program runs \LaTeX{} on each source file in turn to produce a
{\tt.dvi} file ready for printing or for viewing on screen.  Normally
it will be necessary to run {\tt texdvi} up to four times to ensure
that the page numbers, tables of contents and inter-page references are
correct.  Also, {\tt bibtex} should be run after the first run of {\tt
texdvi} to form the {\tt.bib} file which contains the body of the cross
references section of the document.

File name arguments may be the whole name of the {\tt .tex} file or just the
stem part, i.e., for  file {\tt myfile.tex} either {\tt myfile.tex} or
{\tt myfile} may be used.

After running \LaTeX{} any {\tt.idx} file is sorted to create a
{\tt.sid} file which may be read in to form the body of an index to the
document, see also section~\ref{MakingAnIndex}.  Before running
\LaTeX{} program {\tt texdvi} ensures that a {\tt.sid} file (possibly
and empty one) exists so that the first run of \LaTeX{} will not
complain because of a non-existent {\tt.sid} file, this allows {\tt
texdvi} to be used from make files.

The {\tt -p} option may be used to select a program other than
\LaTeX{} (the default program is {\tt latex}).
The use of {\tt luatex} instead of {\tt latex} allows documents to
include UNICODE characters for which no macro has been supplied
in the keyword files, provided that a font is used which supports
the characters.
Two fonts are supplied with \Product{} which include a wide range of
characters which might be useful in mathenmatical or formal text.

If the {\tt -v} option is given the programs prints out the names of
the source and main output files.

If the {\tt -b} option is given, {\BibTeX} is run after running {\LaTeX}.

%********************************************************************

\section{{\tt pppr\index{pppr }}}

=GFT
	pppr [-n] [-p] [-s] [-v] [-w width] <files...>
=TEX

This program produces a verbatim listing of one or more files which
may contain characters in the non-ascii character set.
By default the listings are sent to a printer using {\tt pstex}
The {\tt -n} option is used to add line numbers to the listings.
The {\tt -p} option preserves the {\tt.dvi} file, i.e., it is not
deleted when {\tt pppr} completes.
The {\tt -s} option causes the output to be sent to the screen
previewer {\tt dvipage}, allowing selected pages to be printed
using the appropriate {\tt dvipage} commands.
The {\tt -v} option causes details of some of the files read and
written (but not all of the \LaTeX{} auxiliary files) to be listed on
the standard output.  Long lines are folded to a width of~80 characters
to allow the whole line to be listed, the {\tt -w} option may be used
to alter the folding point.

%********************************************************************

\section{{\tt ppdvi\index{ppdvi }}}

=GFT
	ppdvi [-v] [-f view_file_name] [-K] [-k keyword_file_name]
		[-p TeX_program_name] [-%calN%] <filename> ...
=TEX

This program that combines the actions of {\tt pptex}, {\tt bibtex}
(which is part of the basic \TeX{} distribution) and {\tt texdvi} with
the intention of fully processing a simple document from its {\tt.pp}
form to a printable {\tt.dvi} file.  The option $-\cal N$ controls how
many times \LaTeX{} should be invoked, the default is three (i.e.,
`$-3$'), the values of $\cal N$ may be in the range~1 to~4 inclusive.
\LaTeX{} and {\tt bibtex} are run so that if they detect errors and
thus would normally prompt for input they will read an end of file and
thus stop immediately.

In some cases an extra run of \LaTeX{} may be required.  In these cases
\LaTeX{} will output the message: `{\em LaTeX Warning: Label(s) may
have changed. Rerun to get cross-references right.}

The remaining options are the same as for the programs {\tt pptex} in
section~\ref{PpTexProg} and {\tt texdvi} in section~\ref{TexDviProg}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newpage
\chapter{SUPPORTING PROGRAMS AND FILES}

Several programs and data files are used to support the programs
in section~\ref{CommonlyUsedPrograms} above.

%********************************************************************

\section{{\tt sieve\index{sieve }}} \label{AboutSieve}

The program {\tt sieve} implements a general literate script
mechanism. It is used to implement the specific mechanisms for scripts
containing \LaTeX{} and Standard~ML.  Its description is more complex
than that of the other utilities. We follow the style of the UNIX
manual pages.

%********************************************************************

\subsection{Synopsis}

=GFT
	sieve [-l] [-v] [-d number] [-f view_file_name] [-K] [-k keyword_file_name] [-u][-e][-a] view
=TEX

Multiple `{\tt-k}~$\ldots$' options may be given.

%--------------------------------------------------------------------

\subsection{Description}

This program is a filter which enables a single text file
to be used to hold data for processing by a range of different
programs. The view argument is used to indicate which program {\tt sieve} is
preparing the output for. (The idea is similar to Knuth's Web
system, but much simpler).

Directive lines are used to indicate that portions of the file belong
to particular `categories', where a category is just a tag.  A view
file relates categories to `views' and shows the processing required of
each category in each view.  In the filtering process for a particular
view the text of some categories is copied to the standard output,
perhaps with modifications.  The text of other categories may be
discarded.

%--------------------------------------------------------------------

\subsection{Options}

\begin{description}

\item{\tt-f } Names a view file, default is {\tt sieveview}.  If
	the name does not begin with a `{\tt /}' and does not identify
	a file in the current directory the program looks for the
	view file in the directories named in the environment
	variable {\tt PATH}.

\item{\tt-K } Suppress reading of the default keyword file {\tt
	sievekeyword} which the program looks for  in the directories
	named in the environment variable {\tt PATH}.

\item{\tt-k } Names a keyword file to be read.  If
	the name does not begin with a `{\tt /}' and does not identify
	a file in the current directory the program looks for the
	keyword file in the directories named in the environment
	variable {\tt PATH}.
	Multiple keyword files may be read by repeating this option.

\item{\tt-l } Shows the values of program limits, see
	section~\ref{Limits}, in addition to the other actions of the
	program.

\item{\tt-v } Shows the program version in addition to the other
	actions of the program.

\item{\tt-u } If this flag is set the all inputs and outputs are treated as
        {\tt utf-8} files.
	This is the default interpretation, if no other indication is given,
	but if the environment variable PPCHARSET is set this will override the default.

\item{\tt-e } If this flag is set then input and output files are treated as coded
	using the ``extended character set'', not as utf-8 UNICODE.  This character
	set was used by \Product{} prior to support for utf-8 encoded unicode 
	characters, and this facility is provided for backwards compatibility.
	When sieve is use in this way the resulting ML files will only be acceptable
	to \Product{} if the flag {\tt input\_in\_utf8} is set to {\tt false}.

\item{\tt-a } If this flag is set then output is in ascii, using percent keywords
	rather than `extended' characters or utf8 encoded UNICODE characters, except where
	non-ascii output is forced by the action specified in the sieve viewfile. 

\item{\tt-d <number> } Causes copious diagnostic tracing on the
	standard output.  The information produced depends on the
	number given which is interpreted as a series of binary
	flags.  Multiple {\tt-d} options are cumulative, their values
	being or-ed together.  An aggregate value of zero (the default)
	means no diagnostic output.

	Two of the bits have defined values.  The effect of setting
	other bits may vary from issue to issue of the program and
	users must not rely upon the outputs produced by these other
	bits.

	If the least significant bit is set (e.g., by `{\tt-d~1}')
	then details of the view-file as interpreted for the requested
	view are printed, the exact format of this is not defined and
	may vary from issue to issue of the program.

	If the second-least significant bit is set (e.g., by
	`{\tt-d~2}') then details of the keyword-file are printed, the
	exact format of this is not defined and may vary from issue to
	issue of the program.

\end{description}

Options may be given in any order.  White space is optional between an
option and its argument, thus `{\tt-d~1}' and `{\tt-d1}' have the
same effect.

Options may be merged provided all but the last have no arguments.
Thus the string~`{\tt -v~-l~-d~1}' may be written as~`{\tt -vld~1}'. {}
However, the following strings will not have the desired effect:~`{\tt
-dlv~1}', `{\tt -ldv~1}' and `{\tt -ld1v}' --- options are recognised
by the UNIX library function {\tt getopt(3)}, see the UNIX or Linux manual
for further details.


%--------------------------------------------------------------------

\subsection{Standard Input Format}

The sieving process reads the program's standard input which
comprises of a mixture of directive and other lines.  Directive lines
indicate how the next lines, up to the next directive or the end of the
file, are to be processed.  Directive lines take either of the
following forms.

=GFT Directive lines
	=<equals category> <arguments>

	<non-ascii category> <arguments>
=TEX

The `\verb/=/' of an equals category or the initial character of
an non-ascii category must be the first characters on the line.

Any text on lines preceding the first directive line is ignored.

The {\tt<arguments>} are a white space separated set of words, their
number should correspond to the numbers given to the {\tt<arguments>}
specification for the category in the view-file.  The ninth argument,
if used, is formed from all of the words on the line after the eighth
argument.

Section~\ref{DirectiveLines} explains in full detail how
directive lines are processed.

%--------------------------------------------------------------------

\subsection{Conversion of non-ascii characters} \label{ConvertUNICODE}

In some of the copying actions non-ascii characters are converted to
\LaTeX{} macro calls as specified in the keyword steering files.
Each such specification is associated with a keyword assigned to
a specific unicode character, optionally assigned a \LaTeX{} expression.
If a unicode character is used for which no \LaTeX{} macro has been
assigned, then the unicode character will be passed through to the
output unchanged.  It will then be necessary to process the file
though software which will accept unicode characters, such as
{\it XeLaTex} or {\it LuaLaTeX}, and to use a font for the document
which covers the relevant UNICODE characters.

In some of the copying actions non-ascii UNICODE characters are converted
to their assigned \%$\ldots$\% keyword (if there is one).
In others they may be translated into up to three character codes for
the characters in the utf-8 encoding in the format accepted by the standard
ML compiler.

%--------------------------------------------------------------------

\subsection{Conversion of Percent Keywords} \label{PercentKeywords}

In some of the copying actions percent keywords, that is strings of the
form `{\tt\%$\ldots$\%}', are converted into an appropriate \LaTeX{}
macro.
In some of the copying actions percent keywords will be converted into
the {\tt utf-8} encoding of the corresponding UNICODE code point.

Keywords corresponding to non-ascii characters which are specified as
{\tt directive} type in the keyword file are always recognised when
they occur at the start of a line of the source file.  When recognised
at the start of the line these keywords introduce a new category of
text.

Keyword of the form \%\#$\ldots$\% are read as UNICODE code points,
and in some of the copying actions will be converted either to
corresponding non-ascii characters, or into \%$\ldots$\% keywords which
have been declared in the current {\tt sievekeyword} file(s) as
corresponding to that UNICODE code point.

Keywords are always recognised on directive lines.  Unknown or
mal-formed keywords will be reported.

%--------------------------------------------------------------------

\subsection{Format of Steering Files} \label{SteerFileLineFormat}

Two steering files are used by {\tt sieve}, the view-file and the
keyword-file.  Throughout these steering files the two character
sequence backslash-newline (i.e., in C~language terms the string
`~\verb|"\\\n"|~') is ignored, thus long lines may be split into two
or more shorter lines.  After this line merging, blank lines and
comment lines are ignored.  Comment lines are those whose first non
white space character is a hash `{\tt\#}' sign.

To get a line that finishes with a backslash either add an extra
backslash and then a blank line, or add a space after the backslash.
In the second case the trailing space will be retained (it will be
significant in the echoing actions described below).

%--------------------------------------------------------------------

\subsection{Keyword File} \label{KeywordFile}

The keyword file gives the association of keywords with character codes
and \LaTeX{} macros which may be used to print them.

The standard keyword file, {\tt sievekeyword}, may be used as an
example.  It may be found, assuming the document processing system is
installed, by using the {\tt findfile} program as follows.

=GFTSHOW
	findfile sievekeyword $PATH
=TEX

\bigskip

Multiple keyword files may be used, the effect is as if they were
concatenated and then read as a single file.  The first keyword file
read is the default {\tt sievekeyword}, unless the `{\tt-K}' option is
given.  After this any other keyword files named on the command line
are read.  Having no keyword files at all (i.e., by using the `{\tt-K}'
option and no `{\tt-k}~$\ldots$' options) is valid.

Each keyword specification line has three or four elements separated by
white space.

The first element is the keyword being defined.  This includes the
percent `{\tt\%}' characters.

The second element gives both the nature of this keyword and the
interpretation of the third and fourth elements.  It is one of the
following words.

{\def\ITEM#1{\item[#1 ] \index{#1 }}

\begin{description}

\ITEM{simple} The third element gives the UNICODE code point of the
	equivalent character or if there is no character then
	the value~{\tt-1} is used.  The fourth element may be omitted if
	the third is not~{\tt-1}, if present it gives a \LaTeX{}
	macro suitable for printing the symbol designated by the keyword,
	it may contain white space.

	The \LaTeX{} macro is used when producing text from the {\tt
	cat} action with the {\tt latex} option set.  If it is not
	provided then the character or keyword is output  If both a character code
	and a \LaTeX{} macro are given then the macro element is output.
	
	The fourth element may also include a hash sign ``{\tt \#}'' followed
	by a specification of an argument to the {\LaTeX} macro to be extracted from the text
	on an input line following the keyword or non-ascii character.
	This specification comprises
	an optional minus sign ``{\tt -}'' followed by a regular expression
	(in the POSIX extended regular expression syntax).
	If the minus sign is omitted,
	the argument is taken to be the longest sequence of input characters
	that match the regular expression (or empty if no match is found).
	If the minus sign is present, the argument
	is taken to be shortest sequence of input characters delimited by and not
	including a sequence of characters matching the regular expression
	(or the rest of the input line if no match is found).
	
\ITEM{index} Same format as {\tt simple} keywords, but denotes a
	UNICODE character and keyword used for surrounding text to be
	indexed.

\ITEM{directive} Same format as {\tt simple} keywords, but denotes that the
	character is a directive character that is a complete
	category name.  These keywords must not\footnote{The reason is
	that the non-ascii category name has the non-ascii character as
	its first character.  Source file lines starting with keywords
	are, effectively, modified so that the character
	replaces the keyword.} have a character code of~{\tt-1}.

\ITEM{startdirective} Same as {\tt directive} keywords, but the
	character is used as the first character of category
	names.

\ITEM{verbalone} Same format as {\tt simple} keywords, but indicates
	the characters and percent keywords that are
	recognised by the {\tt verbalone} option to the {\tt cat}
	action of the view-file.

\ITEM{sameas} The third element is another keyword which must have
	been given elsewhere in the file.  There is no fourth element.
	The third element must not be a keyword which itself was
	defined by a {\tt sameas} entry.  The first-element keyword
	is defined to be the same as the third-element keyword.

\ITEM{white} Same format as {\tt simple} keywords, but indicates
	that the keyword and character are of a type that
	is generally ignored or treated as a space character.

\end{description}}

The UNICODE code points must be numeric hexadecimal in
the appropriate ranges, or the value~$-1$.
Hexadecimal numbers start with {\tt 0x} and may use
upper or lower case letters.

To illustrate the distinction between {\tt directive} and {\tt
startdirective} keywords consider the following definitions where the
start of Z~schema character `$\StartZSchema$' is of type {\tt
directive} and the start of formal text character~`\StartFormal' is of
type {\tt startdirective}.  Then, the source file lines
`{\tt$\StartZSchema$abcd}' and `{\tt$\StartZSchema$~abcd}' both denote
the Z~schema {\tt abcd}, i.e., the category name in both cases is
`$\StartZSchema$' and the argument is {\tt abcd}.  By contrast, in the
following three cases:  (1)~the line~`{\tt\StartFormal~abcd}' starts
the `\StartFormal' category with argument {\tt abcd}; (2)~the
line~`{\tt\StartFormal abcd}' starts a category of that name and has no
arguments; (3)~the line~`{\tt$\StartFormal$ab~cd}' starts the
`{\tt$\StartFormal$ab}' category with argument~{\tt cd}.

To avoid keywords being interpreted by SCCS their closing `{\tt\%}'
character may be replaced with a double quote~`{\verb|"|}' character
--- but only within the keyword file.  This will only be necessary for keywords
comprising a single uppercase letter.

\bigskip

Example of the keyword file.  These lines are taken from the
default keyword-file.

=GFTSHOW
	# keywordfile  @(#) 92/01/15 1.1 sievekeyword
	%=>%		simple	183
	%>"		simple	174
	%BH%		white	0xfc
	%BT%		verbalone	247
	%EFT%	directive	176
	%EX%		index	221
	%Pi%		simple	144
	%Q"		simple	81
	%SFT%	startdirective	185
	%SX%		index	219
	%calA%	simple	-1	\MMM{\cal A}
	%fn%		simple	204
	%lambda%	sameas	%fn%
=TEX

%--------------------------------------------------------------------

\subsection{View-File Format}

The view file contains the specifications of the categories
and the processing they require.

The standard view file, {\tt sieveview}, may be used as an example.  It
may be found, assuming the document processing system is installed, by
using the {\tt findfile} program as follows.

=GFTSHOW
	findfile sieveview $PATH
=TEX

View file entries for the categories and their processing are
lines of the following forms.

\begin{center}
\begin{tabular}{l@{\hspace{2cm}}l}
Form 1:	& {\tt <category> <view> [?<var>[=<val>]] <filter>}\\[1ex]

Form 2:	& {\tt <category> <view> [?<var>[=<val>]]}\\[1ex]

Form 3:	& {\tt <category> <view> [?<var>[=<val>]]}\\
	& {\tt	\hspace*{1.5cm} <redirection> <action>}\\
	& {\tt	\hspace*{1.5cm} <redirection> <action>}\\
	&	\hspace*{1.5cm} $\ldots$
\end{tabular}
\end{center}

These all indicate that lines of the category {\tt <category>} are to
be processed in the indicated manner when sieving to get view {\tt
<view>}.  The category names always start as the first character on a
line.  The sieving process is to read lines of text following
a directive line up to, but not including the next directive line and to
process them as indicated.  The output texts from each of these
processes are concatenated to give the output of the sieving
process.

In any of the three forms, the optional field {\tt ?<var>[=<val>]} comprises a question
mark followed by an environment variable name, optionally followed by an equals sign
and a possible value for the environment variable.
If {\tt ?<var>} is supplied (without a value), lines in
the given category will be ignored in this view unless the indicated environment variable is set.
If {\tt ?<var>=<val>} is supplied, lines in the given category will be ignored in this view
unless the indicated environment variable is set and has the specified value.


In form~1 source file lines are to be piped
through the command {\tt <filter>}.  Form~2 is
equivalent to form~1 with a {\tt <filter>} of
{\tt cat}.  Form~3 allows a number of fixed
actions selected from a range of options, each action line starts with
one or more spaces or tabs.  It is intended primarily for the cases
where a form~1 filter would be `{\tt echo ... ;
filter_program ; echo ...}' or similar.  In general
form~3 is preferred over
form~1 for performance reasons.  The {\tt
<redirection>} is optional, it is discussed in
section~\ref{OutputRedirection} below.
Redirection allows the output of an action to be written to a file
rather than to the standard output of the sieving process.

Two form~1 filters are detected specially
and processed internally rather than by Unix pipes.  The filter {\tt
cat} is used to copy text unchanged and the filter {\tt ignore} may be
used to discard text.  These cases are provided to allow a shorter and
neater view-file.

Category names are of two forms depending on their first character.
Those whose first character has been specified as a `{\tt directive}'
or '{\tt startdirective}'
character in the keyword file, see section~\ref{KeywordFile}, are
known as `non-ascii categories' because they are invoked using a
non-ascii character.  All others are known as `equals categories' because
they are invoked by source file lines starting with an `{\tt=}'
character.  (Note that the source file may introduce a non-ascii
category using either the character or the corresponding
keyword on the directive line.)

The actions allowed with the form~3 categories
are divided into three classes, as follows.

{\def\ITEM#1#2{\item[`{\tt #1#2}' ] \index{#1 }}

\begin{description}

\item[Informative ] These specify additional information for the
	category entry.  They must be specified before any others for
	the category.

	\begin{description}

	\ITEM{arguments }{<number> <number>}  The two decimal numbers
		give the minimum and maximum number of arguments
		that may be given on a directive line in the source
		file.  These arguments are made available as
		replacement texts via view-file macros as described in
		section~\ref{ViewFileMacros} below.

		One of the numbers may be omitted in which case the
		minimum and maximum are the same.  Both numbers must be
		in the range zero to nine inclusive.  If not specified
		then both numbers are assumed to be zero.

		A source file directive line with arguments outside the
		range allowed will cause a warning message, that
		directive line will then be considered to be of an
		unwanted category so the following text will be
		discarded.  The action entry `{\tt arguments~2~4}'
		means that between two and four inclusive arguments are
		allowed.

	\ITEM{argoptions }{<options...>} Indicates any additional
		processing required for the directive line arguments
		when they are used as replacement texts for view-file
		macros, see section~\ref{ViewFileMacros} below.  The
		options are indicated by (space separated) arguments to
		this action line.

		\begin{description}

		\ITEM{delindex}{}  Non-Ascii characters and percent
			keywords for indexing are deleted.

		\ITEM{latex}{}  See discussion under the {\tt cat}
			copying action, below.

		\end{description}

	\end{description}

\item[Copying ] These cause text to be read from the source file,
	processed in some manner, then written to the standard output.
	The processing may be null (i.e., just copy the text), it may
	delete all the text so nothing remains to be written, it may be
	an internal or an external filtering operation.

%There must be exactly one of these actions per category.

	\begin{description}

	\ITEM{cat }{<options...>} Copy subsequent lines.  With no
		options this action is equivalent to a {\tt <filter>}
		action of {\tt cat}, but faster.

		Additional processing to form text compatible with the
		document style {\tt hol1.sty} (see
		section~\ref{Hol1Style}) and for other purposes is
		indicated by the options which are indicated by (space
		separated) arguments.

		\begin{description}

		\ITEM{char}{}  Non-Ascii characters are converted to
			their \LaTeX{} equivalent.  This option is
			implied by option {\tt verbatim}.

		\ITEM{convkw}{} This option triggers conversion of percent keywords
		        either into non-ascii characters (where one is assigned to the keyword).
			Percent enclosed hexadecimal literal UNICODE code points
			are also converted to the UNICODE character.
			Only meaningful when option {\tt verbatim} is not
			set.

		\ITEM{convext}{} Non-Ascii characters are converted to
			their keyword form. This option
			is not allowed with options {\tt mlchar}, {\tt latex}
			or {\tt verbatim}.

		\ITEM{delindex}{}  Non-Ascii characters for indexing
			are deleted.  Additionally, with option {\tt
			kw} percent keywords for indexing are deleted.

		\ITEM{kw}{} Percent keywords are to be recognised.
		        If this option is \emph{not} selected percent keywords will be
			passed through untouched, unless {\tt latex} is selected,
			in which case the percent symbols are escaped.
			If it is selected the action on keywords will depend
			on what other options are selected and on what the keyword is.
			
%			With option {\tt verbatim} all keywords will be
%			converted to their \LaTeX{} equivalent. With option
%			{\tt char} the keyword \verb"%%" which stands for a
%			single \verb"%" character is just copied, but all
%			other keywords are converted to their \LaTeX{}
%			equivalent.

		\ITEM{kwflag}{}  Convert unknown keywords to a call on
			the \LaTeX{} macro
			\index{\BS UnknownKeyword }\verb|\UnknownKeyword|.
			Convert malformed keywords to a call on
			the \LaTeX{} macro
			\index{\BS MallFormedKeyword }\verb|\MallFormedKeyword|.
			Only meaningful when options {\tt verbatim} and
			{\tt kw} are set.

		\ITEM{kwwarn}{}  Issue a warning message when unknown
			keywords are found.  Only meaningful when
			option {\tt kw} is set.

		\ITEM{latex}{}  Text is converted for the \LaTeX{}
			verbatim-like fashion provided by the \LaTeX{}
			style file {\tt hol1.sty}.  In this style
			characters with special meaning
			to \LaTeX{} are converted so that they are
			printed in a verbatim-like fashion.  Non-ascii
			characters are converted using the macro provided
			in the keyword file, if there is one, and are otherwise
			passed through as utf-8 unicode.
			This option is not allowed with options {\tt convext}
			or {\tt mlchar}.

		\ITEM{mlchar}{}  Non-Ascii characters are converted to
			their Standard~ML string form, a backslash
			followed by three decimal digits for each character of the utf-8
			encoding.  This option
			is not allowed with options {\tt convext}, {\tt latex}
			or {\tt verbatim}.
	
		\ITEM{verbalone}{}  Modifies option {\tt verbatim} so
			that lines containing at least one character of
			type {\tt verbalone} and whose other characters
			are all of type {\tt white} do not have their
			line-ends converted.  This corresponds to the
			idea that some keywords have meaning outside of
			the line of text.  When option {\tt kw} is set
			this option accepts percent keywords of types
			{\tt verbalone} and {\tt white} on the line.
			Note that white space characters (e.g., space
			and tab) are not of type {\tt white}.

		\ITEM{verbatim}{}  As option {\tt latex} but additionally
			line-ends are indicated for {\tt hol1.sty}.
			This option is not allowed with options {\tt convext}
			or {\tt mlchar}.

		\ITEM{white}{} Non-ascii characters of class "white" are replaced by
			space characters.
			If option {\tt kw} is also selected keywords for non-ascii characters
			of class "white" are also replaced by spaces.

		\end{description}

	\ITEM{filter }{<command>} Pipe subsequent lines through the
		filter given by {\tt <command>}.

		The pipes are set up using {\tt popen(3S)}.  Thus the
		filter is interpreted by the Bourne shell {\tt sh(1)}.

		For performance reasons the other copying actions
		should be used in preference to this action whenever
		possible

	\ITEM{mlstring}{} Filter subsequent lines converting text to a
		Standard~ML string, but without the enclosing string
		quotes.  Convert non-printing characters to their
		decimal form, e.g., the byte value decimal \verb|234|
		is written as the four characters \verb|\234|. {}
		Characters `~\verb|"|~' and `~\verb|\|~' are
		prefixed with a `~\verb|\|~'. {} Across the whole
		input (not just each use of this action) convert even
		numbered `~\verb|`|~' characters (as counted when
		read) into `~\verb|'|~'. {} Other ascii chars are left
		unchanged. Non-ascii (UNICODE) characters are translated
		byte by byte of the utf-8 encoding into a sequence
		of byte value decimals as described above.

	\ITEM{ignore}{}  The text is discarded.

	\end{description}

\item[Echoing ] These perform some action that does not require text to
	be read from the source file, typically these are similar to
	the Unix {\tt echo} program.  There may be any number of
	these.

	\begin{description}

	\ITEM{echonl }{<text>} The characters of {\tt<text>} are copied
		to the output, followed by a newline.

	\ITEM{echo }{<text>} The characters of {\tt<text>} are copied
		to the output.

	\ITEM{nl}{} A newline is output.

	\end{description}

\end{description}}

%--------------------------------------------------------------------

\subsection{View-File Macros} \label{ViewFileMacros}

View file copying and echoing actions allow a limited form of macro
expansion.  Macros calls are indicated by a dollar sign~`{\tt \$}'
followed by a single character.  Dollar signs in macro bodies are not
treated as macro calls.  The macros available are as follows.

{\def\ITEM#1{\item[`{\tt #1}' ] }
\begin{description}

% $$
\ITEM{\$\$} A \index{\$\$ } single dollar sign is obtained by using
	two dollar signs.

% $0 $1 $2 $3 $4 $5 $6 $7 $8 $9
\ITEM{\${\rm digit}} The \index{\$0-\$9 } ten decimal digits
	indicate the arguments from the most recently read directive
	line.  The macro calls~`{\tt \$1}', `{\tt \$2}' and `{\tt
	\$9}' denote, respectively, the first, second and ninth
	arguments, `{\tt \$0}' denotes the directive.  Invoking a
	macro which has not been set yields an empty string.
	Requesting a macro outside the range allowed by the {\tt
	<arguments>} specification of the category is an error.

% $*
\ITEM{\$*} All \index{\$* } the arguments of the directive line,
	separated by single space characters.

% $&
\ITEM{\$\&} The \index{\$\& } whole directive line.

\item A dollar sign followed by anything else is erroneous, all such
	cases are reserved for future expansion.

\end{description}}

=IGNORE
Future expansions:
	include macros for file names, dates and times,
	globally macros defined.
=TEX

%--------------------------------------------------------------------

\subsection{Output Redirection} \label{OutputRedirection}

The output of most of the echoing and copying actions may be redirected
to a named file, the default is the standard output of the program.
Output from {\tt filter} actions may be redirected by using an explicit
redirection in the filter command itself, see the examples of
categories `{\tt=SLOWDUMP}' and `{\tt=SLOWDUMPMORE}' in
section~\ref{Examples} below.  Redirection of {\tt ignore} is
meaningless as it gives no output.

Two forms of redirection are provided, for writing (or creating) a new
file and for appending to a file (creating it if necessary).  To write
to a file use the redirection `{\tt write}~filename' and to append
use `{\tt append}~filename'.  The filename may be indicated by
view-file macros.  It may not contain white space and it may not be
empty, otherwise there is very little validation of the name.  A faulty
filename or failing to open the file is considered a serious error: sieving will stop.

For examples see `{\tt=DUMP}' and `{\tt=DUMPMORE}' in
section~\ref{Examples} below.

%--------------------------------------------------------------------

\subsection{Directive Lines} \label{DirectiveLines}

A line from standard input is taken to be a directive line in the
following cases.

\begin{itemize}

\item When its first character is an equals character `\verb/=/'
	and its second character is not a white space character.
	This is an equals category.

\item When its first character is a directive character (of type either
	{\tt directive} or {\tt startdirective}, see
	section~\ref{KeywordFile}).  This is an extended category.

\item When its first characters are the percent keyword for a directive
	character (of type either {\tt directive} or {\tt
	startdirective}, see section~\ref{KeywordFile}).
	This is a non-ascii category.

\end{itemize}

A directive line is split into its category and arguments as follows.

\begin{enumerate}

\item The line is processed to convert all characters and
	keywords of type {\tt white} to spaces.  Other keywords are
	converted to their non-ascii character where possible.  Note
	that directive keywords must have non-ascii characters ---
	see~\ref{KeywordFile}.  Any unknown or mal-formed keywords will
	provoke warning messages.

\item If the first character is of type {\tt directive} then a space
	character is inserted after it.

\item The resulting line is split into words which are separated by one
	or more space characters.

\item The first word is then the category.

\item The next eight words are the first eight arguments, the remaining
	words form the ninth argument.

\end{enumerate}

When a directive line is found is category is determined, as above.  If
this category is not specified in the view file then a warning message
is issued and the whole segment of following the directive line is
ignored.

Options specified with {\tt argoptions} for the category in the
current view are applied to the arguments after they are extracted by
the rules above.

%--------------------------------------------------------------------

\subsection{Examples} \label{Examples}

One might hold a program containing Fortran and C together
with its documentation using the following view file.
(Note, extra spacing has been added at the left hand side in all of
these examples of the view-file and the standard input text.  This is needed
to prevent the source text of these examples being interpreted as
directive lines.)

=GFT View file example
	=FORTRAN nroff echo .nf ; cat; echo .fi
	=C nroff
		 echonl .nf
		 cat
		 echonl .fi
	=C cc
	=FORTRAN f77
	=TEXT nroff
	=IGNORE ignore ignore
=TEX

Here the code segments are included surrounded by \verb/.nf/ and
\verb/.fi/ when the file is viewed to make a document and the relevant
languages only are presented when the file is viewed for compilation.
Note that the `{\tt=FORTRAN}' category in the {\tt nroff} view uses a
{\tt filter} action which would be more efficiently written in the style of
the {\tt C} category in the {\tt nroff} view.

\bigskip

In the above example the input for {\tt sieve} might look as follows.

=GFT Standard input
	An ignored line.
	=TEXT
	This program ...

	This Fortran routine ...
	=FORTRAN
		 SUBROUTINE ...

	=TEXT
	This C routine ...

	=C
		 main() ...

	=IGNORE
	End of file.
=TEX

Assuming the view-file is file {\tt myviewfile}, that no keyword
file is wanted and the source text is in file {\tt mydoc.pp} then the
following {\tt sieve} commands would be used to obtain the various views of
the file.

=GFT Shell commands
	sieve -k /dev/null -f myviewfile nroff < mydoc.pp > mydoc.nroff
	sieve -k /dev/null -f myviewfile cc < mydoc.pp > mydoc.c
	sieve -k /dev/null -f myviewfile f77 < mydoc.pp > mydoc.f77
=TEX

\bigskip

File inclusion facilities might be implemented as extensions to the
above example by adding view-file lines of the following form.  With
`{\tt=INCLUDE}' the line following the directive names a file (or files);
with `{\tt=POORINCLUDE}' exactly one file is named on the directive line
and a sieving error is reported if the number of names is not one.
Note that with the `{\tt=POORINCLUDE}' any text on lines after the
directive line will be discarded, it will be written to the standard
input of a UNIX pipe which does not read its standard input.  Using this side
effect of input output as shown in `{\tt=POORINCLUDE}' to discard
unwanted text is not recommended (hence the name `{\tt=POORINCLUDE}') and
it only works for small amounts of text, the reasons are given in
section~\ref{SieveErrors} about sieving errors.

=GFT View file example
	=INCLUDE nroff cat `cat` | sieve nroff
	=POORINCLUDE nroff
		 arguments 1
		 filter cat $1 | sieve nroff
=TEX

Additional output files may be created with view-file
lines of the form.

=GFT View file example
	=DUMP nroff
		 arguments 1
		 echonl Write text to file $1
		 echonl .nf
		 cat
		 echonl *** End ***
		 echonl .fi
	=DUMPMORE nroff
		 arguments 1
		 echonl Append text to file $1
		 echonl .nf
		 cat
		 echonl *** End ***
		 echonl .fi
	=DUMP f77
		 arguments 1
		 write $1 cat
	=DUMPMORE f77
		 arguments 1
		 append $1 cat
=TEX

Find\footnote{To be done} a better example of redirecting the output of
a {\tt filter} action.

Writing to other files can be produced by redirecting the output of a
{\tt filter} action.  The `{\tt=SLOWDUMP}' and `{\tt=SLOWDUMPMORE}'
examples have the same functionality as `{\tt=DUMP}' and `{\tt=DUMPMORE}'
but because they invoke UNIX sub processes and pipe the input through
them are much slower.

=GFT View file example
	=SLOWDUMP f77
		 arguments 1
		 filter cat > $1
	=SLOWDUMPMORE f77
		 arguments 1
		 filter cat >> $1
=TEX

%--------------------------------------------------------------------

\subsection{Errors} \label{SieveErrors}

Numerous error messages may be produced by {\tt sieve}.  The program
works in three phases, (1)~command line argument processing, (2)~reading the
steering files and (3)~the sieving process.  Phases will be started only
if no errors have been previously been found and reported.

If {\tt sieve} completes successfully it gives an exit status of zero,
if any errors are found during its execution the exit status is one.

Most faults found whilst reading the steering files are such that the
reading can continue, possibly finding more faults.  Recovery after
finding a steering file faults generally means discarding that line
which may introduce spurious errors.

Faults found in directive lines whilst sieving cause the text
following that directive line to be discarded.  Steering file faults
found whilst sieving cause the program to stop, note that many
possible faults are detected whilst reading the steering files.

Filter actions which do not read all of the text on their standard
input may cause problems.  Short sections of text will be ignored, the
text written to the pipe is simply lost when the filter completes.  In
this case {\tt sieve} does not notice that the text has not been read
and so the sieving will continue without reporting any problems.
Larger sections of text will fill the pipe causing {\tt sieve} to
block, when the filter completes the UNIX signal {\tt SIGPIPE} is
raised as {\tt sieve} tries to write to a pipe with no reader.  In
this case {\tt sieve} reports the fault and then stops.

%--------------------------------------------------------------------

\subsection{Limits} \label{Limits}

The values of the program's limits may be checked by using the
{\tt-l} option of {\tt sieve}.  For many of the these limits the
maximum value actually used during the execution of {\tt sieve}
is also shown.  The normal values are as follows.

No more than 80 categories per view-file.

No more than 20 actions per category.

Input lines from the all input files must be less than 1024 bytes
long.

Merged input lines from the view and keyword files (see
section~\ref{SteerFileLineFormat}) must be less than 1024 bytes long.

Lines after macro expansion and conversion of non-ascii characters and
percent keywords to their \LaTeX{} equivalents must be less than
approximately 2036 bytes.

Lines produced by echo actions and the text of a filter command must be
less than~2048 bytes.

File names for output redirection must be less than~2048 bytes.

Up to~20 keyword files may be used, one of these is always reserved for
file {\tt sievekeyword}.  These files may jointly specify up to~1000
keywords.  Each keyword may have a maximum length of~50 bytes.

%********************************************************************

\section{{\tt sieveview}\index{sieveview } --- Steering File for {\tt sieve}}

The standard view-file contains entries for all the sieving
categories described in this document.  If additional features are
required for a particular file then a copy of the view-file can be
made, and then extended, in the directory holding the document needing
these additional features.

%********************************************************************

\section{{\tt sievekeyword}\index{sievekeyword } --- Steering File for {\tt sieve}}

The standard keyword-file contains entries for all the percent
keywords supported by \Product.  If additional keywords are required for
a particular file then a supplementarey keyword file can be in
the directory holding the document needing these additional
keywords.
A keyword already mentioned may have additional information supplied about in
in this way, e.g. a latex macro.

%********************************************************************

\section{{\tt pp\_file\_conv\index{pp\_file\_conv }}} \label{AboutPpFileConv}

The program {\tt pp\_file\_conv} translates files between the {\Product}
extended character set and utf8 encoded Unicode.
Users of \Product\ are encouraged to move their files from the extended character set
to utf8, since support for the extended character set will eventually be withdrawn.
%********************************************************************

\subsection{Synopsis}

=GFT
	pp_file_conv [-l] [-v] [-d number] [-K] [-k keyword_file_name] [-u][-a][-n]
=TEX

Multiple `{\tt-k}~$\ldots$' options may be given.

%--------------------------------------------------------------------

\subsection{Description}

This program translates a single text file from one character encoding to another, supporting the transition between using the {\Product} extended character set and utf8 encoded unicode files.

Because this involves interpretation of keywords this program requires access the keyword files as used for {\tt sieve}, for which the parameters are as for {\tt sieve}.

Directive lines are ignored by this program, which therefore does not require access to viewfiles and does not need to be given a view name.
The entire file will be translated in a uniform manner, to or from utf8, as determined by the command line flags.

%--------------------------------------------------------------------

\subsection{Options}

\begin{description}

\item{\tt-K } Suppress reading of the default keyword file {\tt
	sievekeyword} which the program looks for  in the directories
	named in the environment variable {\tt PATH}.

\item{\tt-k } Names a keyword file to be read.  If
	the name does not begin with a `{\tt /}' and does not identify
	a file in the current directory the program looks for the
	keyword file in the directories named in the environment
	variable {\tt PATH}.
	Multiple keyword files may be read by repeating this option.

\item{\tt-l } Shows the values of program limits, see
	section~\ref{Limits}, in addition to the other actions of the
	program.

\item{\tt-v } Shows the program version in addition to the other
	actions of the program.

\item{\tt-u } If this flag is set the standard input is treated as a
        {\tt utf-8} file.  The input is translated from {\tt utf-8} into the
	\Product{} extended character set, or into ascii if the -a flag us set.
	UNICODE code points greater
	than 127 but not corresponding to any of the \Product{} extended
	characters will be translated into a named keyword (if
	any keyword is declared in the {\tt sievekeyword} file as corresponding
	to that UNICODE code point), or into the hexadecimal value
	of the UNICODE code point in the form \%\#x\emph{HHHHHH}\% if no
	corresponding keyword has been declared.

	If this flag is not set, the input is read as encoded using the
	{\Product} extended character set, and the output will be in {\tt utf8}.

\item{\tt-a } If this flag is set and -u is set then output is in ascii,
	using percent keywords rather than non-ascii characters
	or utf-8 encoded UNICODE codes.

\item{\tt-d <number> } Causes copious diagnostic tracing on the
	standard output.  The information produced depends on the
	number given which is interpreted as a series of binary
	flags.  Multiple {\tt-d} options are cumulative, their values
	being or-ed together.  An aggregate value of zero (the default)
	means no diagnostic output.

	Two of the bits have defined values.  The effect of setting
	other bits may vary from issue to issue of the program and
	users must not rely upon the outputs produced by these other
	bits.

	If the second-least significant bit is set (e.g., by
	`{\tt-d~2}') then details of the keyword-file are printed, the
	exact format of this is not defined and may vary from issue to
	issue of the program.

\item{\tt-n } If this flag is set and -u is not set, then the input will be treated as encoded in the {\Product} extended character set without use of \%\...\% keywords for special characters.
Any \%\...\% keywords in the input will be transcribed literally, not replaced by the corresponding unicode character code.

\end{description}

Options may be given in any order.  White space is optional between an
option and its argument, thus `{\tt-d~1}' and `{\tt-d1}' have the
same effect.

Options may be merged provided all but the last have no arguments.
Thus the string~`{\tt -v~-l~-d~1}' may be written as~`{\tt -vld~1}'. {}
However, the following strings will not have the desired effect:~`{\tt
-dlv~1}', `{\tt -ldv~1}' and `{\tt -ld1v}' --- options are recognised
by the UNIX library function {\tt getopt(3)}, see the Sun UNIX manual
for further details.

%********************************************************************

\section{{\tt findfile\index{findfile }}}

This program allows shell scripts to be written without including
full path-names for steering files \etc \ It takes as command line
arguments a file name followed by a list of search paths in a
similar format to the shell's {\tt PATH} variable, \ie, a colon-separated
list of directory or file names, where a file name is taken to identify
the directory in which the file is contained. The C-shell's tilde
convention may be used in the names in the paths.
An example in a shell script might be:

=GFT Example
	sed -f `findfile sedscript` $PATH $0`
=TEX

Here the file {\tt sedscript} is sought for first in the directories
in the users {\tt PATH} shell variable and then in the directory
identified by the name with which this script was invoked.

If a file is found then its name is written to the standard output
preceded by the name of the directory holding the file.  If no file is
found then the argument file name is written to the standard output.

The exit status is zero if a file is found; one if no file was found;
and, two if insufficient command line arguments were given.  In this
last case an error message is written to standard error.

%\bigskip

%Function \HOLindexEntry{find_file}`$find_file$' provides a `C'~language
%interface for this task, details may be found
%in~\cite{DS/FMU/IED/DTD053}.

%********************************************************************

\section{Font Files} \label{FontFiles}

Two ttf fonts are supplied for use with xpp when editing documents or
for use with {\tt luatex} in typesetting documents containing non-ascii
unicode characters for which no macro has been supplied in a keyword file.
They are {\tt \Product{}Mono.ttf} and {\tt \Product{}Serif.ttf}.

In addition, the font provisions for working with the obsolescent extended
character set continue to be supplied, pro-tempore, as desribed below:

Three font files are provided for use with literate scripts containing
non-ascii characters.  They all provide the same character images but at
different sizes, all include the standard ASCII characters (with codes
$0$~to~$127\sb{10}$) together with the non-ascii characters (with codes
$128\sb{10}$~to~$255\sb{10}$).

The non-ascii characters can be entered from the keyboard by using the
META key, although keyboard accelerators interfere with a small number
of the codes.

Font {\tt holnormal.vfont\index{holnormal.vfont }} is recommended for
normal use in text editors and command or shell tools.

Font {\tt holpalette.vfont\index{holpalette.vfont }} is recommended for
use in making a palette of characters from which characters can be
picked when required.  Having the palette avoids the need to remember
keyboard sequences for the non-ascii characters.  A suitable palette can
be obtained using the {\tt palette} command.

Font {\tt holdouble.vfont\index{holdouble.vfont }} is recommended for
use when demonstrating the system to an audience grouped around the
terminal.  The characters in this font are double sized versions of
those in font {\tt holnormal.vfont} but without the large empty
boundaries of those in {\tt holpalette.vfont}.

File {\tt holpalette\index{holpalette }} is used by the {\tt
palette} command, it contains all the non-ascii characters,
grouped according to function.

%********************************************************************

\section{Style File {\tt hol1.sty}\index{hol1.sty }} \label{Hol1Style}

Much of the document processing relies upon the \LaTeX{} style file
{\tt hol1.sty} whose functions are described throughout this document.
%The style file is produced by sieving its implementation
%document~\cite{DS/FMU/IED/IMP054}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\chapter{INSTALLING THE PACKAGE} \label{Installation}

For most users, the standard installation procedure described
in {\em \INSTALLATION} will be adequate. This chapter describes
the configuration of the document preparation facilities in more detail.

A number of installation-dependent directories are used to hold the
components of the package.  It is possible to hold all of the
components in a single directory if support for only one architecture
(Sun~3 or Sun~4) is required.

The programs of the package are located in an installation-dependent
directory which should be placed on the shell search path.  This
directory also contains some of the supporting files.  The
\LaTeX\ macro files {\tt hol1.sty} and {\tt TQ.sty} are contained in a
second installation-dependent directory.  These style files should be
made available to \TeX\ and \LaTeX\ by setting the {\tt TEXINPUTS}
\index{TEXINPUTS } environment variable.  This may be done by including
a line based on the following in the C-shell startup file
(\verb"~/.cshrc").

\begin{GFT}{}
\+	setenv TEXINPUTS .:{\rm{}local-macros\/}:{\rm{}main-macros\/}:\\
\end{GFT}

Where, {\em local-macros\/} is replaced with the installation-dependent
directory containing {\tt hol1.sty} and {\tt TQ.sty}, and {\em
main-macros\/} with the installation-dependent directory holding the
standard \TeX\ and \LaTeX\ macro files.

Here, the environment variable {\tt TEXINPUTS} contains a colon
separated list of three directories which \TeX\ and \LaTeX\ scan from
the left for any source files they want to read.  Thus, files are
chosen from the current directory (\ie, the `.' entry) in preference to
the other directories.

The font files (in {\tt vfont(5)} format, see the Sun UNIX manuals for
details) for use with Sunview are placed in a third
installation-dependent directory.  The recommended method of using
these font files is by explicitly naming them with the `{\tt-Wt}'
option when invoking the text editor or command windows (\ie, {\tt
textedit(1), shelltool(1)} or {\tt cmdtool(1)}, which are described the
Sun UNIX manuals).  Using the font setting capabilities of {\tt
defaultsedit(1)} or the Sunview defaults file (normally, {\tt
\$HOME/.defaults}) is not recommended.  On many versions of Sunview
setting a default font file means that any `{\tt-Wt}' option is
ignored, leading to {\em all\/} of the text editors and command windows
using the same font.

Section~\ref{FontFiles} describes all the fonts available, but for
initial use invoking the following commands is recommended.

\begin{GFT}{}
\+	textedit -Wt {\rm{}font_dir\/}/holnormal.vfont \&\\
\+	palette\\
\end{GFT}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\chapter{FILE FORMATS}

Various files are read or written by the programs in the package.
Suffixes, normally of three letters, are used in file names to
distinguish the various file formats involved.  These are described in
table \ref{FileSuffixes}.  Note that the master format for a literate
script is the {\tt .pp} format; the other formats are derived from
this by running programs which, in general, lose some information.

\begin{table}

\begin{center}
\begin{tabular}{||l|p{5.5in}||}\hline

Suffix & Description\\\hline\hline

{\tt .pp} & This is the usual format in which literate scripts are
	held in source code respositories and in which they are edited.
	These are UNICODE files coded as utf-8, of which ascii files are
	a special case.  Non-ascii characters can either be included
	using their UNICODE code point, or (in some cases) using
	an ascii \% enclosed keyword.\\\hline

{\tt .dvi} & This is the {\tt texdvi} output file (more precisely, it
	is the \TeX{} or \LaTeX{} output file) which may be viewed with
	a screen previewer, or printed.\\\hline

=IGN
{\tt .idx} & This contains the raw index entries generated by running
	\LaTeX{} on a file containing the command \verb"\makeindex".
	\\\hline

{\tt .sid} & This is a sorted index file generated by {\tt texdvi}.  It
	is read by the \verb"\printindex" command described in
	section~\ref{MakingAnIndex}.\\\hline
=TEX

{\tt .tex} & This is a \LaTeX{} input file. It is created from a {\tt
	.pp} file using the utilities {\tt pptex}.\\\hline

{\tt .sml} & This is a Standard~ML input file. It is created from a
	{\tt .pp} file using the utilities {\tt ppsml}.\\\hline

{\tt .tch} & This is a theory check file. It is created from a
	{\tt .pp} file using the utilities {\tt ppsml}.\\\hline

{\tt .tds} &  This is a theory design file. It is created from a
	{\tt .pp} file using the utilities {\tt ppsml}.\\\hline
\end{tabular}
\end{center}

\caption{Main File Suffixes} \label{FileSuffixes}

\end{table}

There are several other file suffixes that are used by \TeX{} and
\LaTeX{}  for various purposes.  They are derived from the {\tt .tex}
file and are documented in the \TeX{} and \LaTeX{}
books,~\cite{knuth84} and~\cite{lamport86}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\chapter{NON-ASCII CHARACTER SET}  \label{ExtCharSet}
The non-ascii character set provides characters grouped
into various categories.

{\tabstop0.3in\vertbarfalse

%********************************************************************

\section{Greek Letters}

These may be freely used between the indexing characters.

=GFTSHOW
	Γ	Δ	Θ	Λ	Ξ	Π	Σ	Υ	Φ	Ψ	Ω
	α	β	γ	δ	ε	ζ	η	θ	ι	κ	λ	μ
	ν	ξ	π	ρ	σ	τ	υ	φ	χ	ψ	ω
=TEX

%********************************************************************

\section{Logic, Equivalence and Related Symbols}

These may be freely used between the indexing characters.

=GFTSHOW
	∧	∨	¬	∀	∃	⦁	×	≤	≠	≥	∈	∉	⇔	⇒
=TEX

%********************************************************************

\section{Set Symbols}

These may be freely used between the indexing characters.

=GFTSHOW
	𝔹	ℂ	𝔽	ℕ	ℙ	ℚ	ℝ	𝕊	𝕌	ℤ	⊆	∅	⊂	∩	⋂	∪	⋃	⊖
=TEX

%********************************************************************

\section{Arrows}

These may be freely used between the indexing characters.

=GFTSHOW
	→	⤖	⤕	⇻	↔	⤀	⇸	↣	↦	↠	⤔
=TEX

%********************************************************************

\section{Formal Text Brackets}

Indexing of these non-ascii characters is not supported.
Hence, unfortunately, the index to this document cannot
include the viewing categories whose names include these
characters.
For this document categories using the~`$\StartFormal$' character are
included in the index but without the~`$\StartFormal$' character
itself.

=GFTSHOW
	⌜	ⓣ	ⓜ	ⓩ	⌝	Ⓢ	■	┌	└	╒	├
=TEX

%********************************************************************

\section{Padding Symbols}

Indexing of these non-ascii characters is not supported.  Attempting to
do so tends to get an index entry with just a page number!

=GFTSHOW
	│	─	═
=TEX

%********************************************************************

\section{Index Brackets}

Indexing of the indexing brackets themselves is not supported.

=GFTSHOW
	⦏	⦎
=TEX

These characters must be used in pairs, they must not be nested, they
should be on the same line, they should be in the correct order.
The intention is to provide indexing
for identifiers of the sort used in programming and other formal
languages, it is not intended that this be used as a general indexing
facility.

%********************************************************************

\section{Bracketing Symbols}

These may be freely used between the indexing characters.

=GFTSHOW
	⟨	⟩	⟦	⟧	⦇	⦈
=TEX

%********************************************************************

\section{Subscription and Superscription}

These characters may be used as part of the identifiers in indexed
entries, but they will cause the appropriate subscription or
superscription, their images will not be shown in the index.

=GFTSHOW
	⋎	⋏	↗	↘	↕
=TEX

These subscription and superscription characters must be used carefully
or \LaTeX{} may give error messages, probably relating to unmatched
grouping symbols (i.e., the \verb|{| and \verb|}| characters).
The subscripted or superscripted text must not contain linebreaks.
The \LaTeX{} style file defines\footnote{The actual definitions are slightly
different, they may be found in the style file {\tt hol1.sty}.}
these characters as follows.

\begin{center}
\tabcolsep=1cm
\begin{tabular}{llllll}
Character:	& \DNchar	& \UPchar	& \UPtext	& \DNtext	& \CANtext	\\
\LaTeX:		& \verb|_|	& \verb|^|	& \verb|^{|	& \verb|_{|	& \verb|}|	\\
\end{tabular}
\end{center}

%********************************************************************

\section{Underlining}
These underlining brackets enclose a block of text that will be underlined. The brackets must balance. Underlining brackets may be nested to achieve multiple underlining. The underlined text may extend over multiple lines.

These characters may be used as part of the identifiers in indexed
entries, but their images will not be shown in the index, instead the
enclosed text will be underlined.


=GFTSHOW
	⨽	⨼
=TEX


%********************************************************************

\section{Relation, Sequence and Bag Symbols}

These may be freely used between the indexing characters.

=GFTSHOW
	⩥	▷	⩤	◁	⁀	↾	↿	⊕	⊎	⨾	∘
=TEX

%********************************************************************

\section{Miscellaneous}

These may be freely used between the indexing characters.

=GFTSHOW
	⊢	⦂	≜	⊥	⊖
=TEX

%********************************************************************

=IGNORE
\section{The Remainder}
	⨽	⨼	﹣
=TEX
}% end of \tabstop0.3in


%********************************************************************

%\newpage
\section{Non-Ascii Character Images} \label{Non-AsciiCharImages}

The  table below shows all of the available non-ascii characters.  Each character is shown with
its hexadecimal value using conventional hexadecimal digits, its octal value and
its hexadecimal value using \index{\BS Pr$\cal NN$ }
the `$\cal NN$' letters used in its `\verb|\Pr|$\cal NN$\verb|{}|' form
(see section~\ref{ConvertUNICODE}).  User documents should not normally
need to give the numerical forms of the characters.
The `\verb|\Pr|$\cal NN$\verb|{}|'  form may sometimes be seen in {\LaTeX} error messages.
Octal value are used in {\tt xpp} applications defaults files (see \XPPUSERGUIDE).


\bigskip

\newbox\AllChars
\newbox\ColA
\newbox\ColB
\newbox\ColC

\newdimen\ColHeight
\parsep 0pt plus 5pt

\def\SHOWIT#1#2#3#4{\hbox{\hbox to 4ex{#1\hfil}\hbox to 4ex{#2\hfil}\hbox to 6ex{#3\hfil}#4}\par}

\def\COLHEAD{\SHOWIT{\hfill Val}{ue}{}{Char}\bigskip\ignorespaces}

\makeatletter
\def\@moan#1{--spare--}
\makeatother

\setbox\AllChars=\vbox{{
	\makeatletter
	\ShowAllImages
	\makeatother
    \SHOWIT{80}{200}{IA}{\PrIA}
    \SHOWIT{81}{201}{IB}{\PrIB}
    \SHOWIT{82}{202}{IC}{\PrIC}
    \SHOWIT{83}{203}{ID}{\PrID}
    \SHOWIT{84}{204}{IE}{\PrIE}
    \SHOWIT{85}{205}{IF}{\PrIF}
    \SHOWIT{86}{206}{IG}{\PrIG}
    \SHOWIT{87}{207}{IH}{\PrIH}
    \SHOWIT{88}{210}{II}{\PrII}
    \SHOWIT{89}{211}{IJ}{\PrIJ}
    \SHOWIT{8A}{212}{IK}{\PrIK}
    \SHOWIT{8B}{213}{IL}{n/a}
    \SHOWIT{8C}{214}{IM}{\PrIM}
    \SHOWIT{8D}{215}{IN}{\PrIN}
    \SHOWIT{8E}{216}{IO}{\PrIO}
    \SHOWIT{8F}{217}{IP}{\PrIP}
    \SHOWIT{90}{220}{JA}{\PrJA}
    \SHOWIT{91}{221}{JB}{\PrJB}
    \SHOWIT{92}{222}{JC}{\PrJC}
    \SHOWIT{93}{223}{JD}{\PrJD}
    \SHOWIT{94}{224}{JE}{\PrJE}
    \SHOWIT{95}{225}{JF}{\PrJF}
    \SHOWIT{96}{226}{JG}{\PrJG}
    \SHOWIT{97}{227}{JH}{\PrJH}
    \SHOWIT{98}{230}{JI}{\PrJI}
    \SHOWIT{99}{231}{JJ}{\PrJJ}
    \SHOWIT{9A}{232}{JK}{\PrJK}
    \SHOWIT{9B}{233}{JL}{\PrJL}
    \SHOWIT{9C}{234}{JM}{\PrJM}
    \SHOWIT{9D}{235}{JN}{\PrJN}
    \SHOWIT{9E}{236}{JO}{\PrJO}
    \SHOWIT{9F}{237}{JP}{\PrJP}
    \SHOWIT{A0}{240}{KA}{\PrKA}
    \SHOWIT{A1}{241}{KB}{\PrKB}
    \SHOWIT{A2}{242}{KC}{\PrKC}
    \SHOWIT{A3}{243}{KD}{\PrKD}
    \SHOWIT{A4}{244}{KE}{\PrKE}
    \SHOWIT{A5}{245}{KF}{\PrKF}
    \SHOWIT{A6}{246}{KG}{\PrKG}
    \SHOWIT{A7}{247}{KH}{\PrKH}
    \SHOWIT{A8}{250}{KI}{\PrKI}
    \SHOWIT{A9}{251}{KJ}{\PrKJ}
    \SHOWIT{AA}{252}{KK}{\PrKK}
    \SHOWIT{AB}{253}{KL}{\PrKL}
    \SHOWIT{AC}{254}{KM}{\PrKM}
    \SHOWIT{AD}{255}{KN}{\PrKN}
    \SHOWIT{AE}{256}{KO}{\PrKO}
    \SHOWIT{AF}{257}{KP}{\PrKP}
    \SHOWIT{B0}{260}{LA}{\PrLA}
    \SHOWIT{B1}{261}{LB}{\PrLB}
    \SHOWIT{B2}{262}{LC}{\PrLC}
    \SHOWIT{B3}{263}{LD}{\PrLD}
    \SHOWIT{B4}{264}{LE}{\PrLE}
    \SHOWIT{B5}{265}{LF}{\PrLF}
    \SHOWIT{B6}{266}{LG}{\PrLG}
    \SHOWIT{B7}{267}{LH}{\PrLH}
    \SHOWIT{B8}{270}{LI}{\PrLI}
    \SHOWIT{B9}{271}{LJ}{\PrLJ}
    \SHOWIT{BA}{272}{LK}{\PrLK}
    \SHOWIT{BB}{273}{LL}{\PrLL}
    \SHOWIT{BC}{274}{LM}{\PrLM}
    \SHOWIT{BD}{275}{LN}{\PrLN}
    \SHOWIT{BE}{276}{LO}{\PrLO}
    \SHOWIT{BF}{277}{LP}{\PrLP}
    \SHOWIT{C0}{300}{MA}{\PrMA}
    \SHOWIT{C1}{301}{MB}{\PrMB}
    \SHOWIT{C2}{302}{MC}{\PrMC}
    \SHOWIT{C3}{303}{MD}{\PrMD}
    \SHOWIT{C4}{304}{ME}{\PrME}
    \SHOWIT{C5}{305}{MF}{\PrMF}
    \SHOWIT{C6}{306}{MG}{\PrMG}
    \SHOWIT{C7}{307}{MH}{\PrMH}
    \SHOWIT{C8}{310}{MI}{\PrMI}
    \SHOWIT{C9}{311}{MJ}{\PrMJ}
    \SHOWIT{CA}{312}{MK}{\PrMK}
    \SHOWIT{CB}{313}{ML}{\PrML}
    \SHOWIT{CC}{314}{MM}{\PrMM}
    \SHOWIT{CD}{315}{MN}{\PrMN}
    \SHOWIT{CE}{316}{MO}{\PrMO}
    \SHOWIT{CF}{317}{MP}{\PrMP}
    \SHOWIT{D0}{320}{NA}{\PrNA}
    \SHOWIT{D1}{321}{NB}{\PrNB}
    \SHOWIT{D2}{322}{NC}{\PrNC}
    \SHOWIT{D3}{323}{ND}{\PrND}
    \SHOWIT{D4}{324}{NE}{\PrNE}
    \SHOWIT{D5}{325}{NF}{\PrNF}
    \SHOWIT{D6}{326}{NG}{\PrNG}
    \SHOWIT{D7}{327}{NH}{\PrNH}
    \SHOWIT{D8}{330}{NI}{\PrNI}
    \SHOWIT{D9}{331}{NJ}{\PrNJ}
    \SHOWIT{DA}{332}{NK}{\PrNK}
    \SHOWIT{DB}{333}{NL}{\PrNL}
    \SHOWIT{DC}{334}{NM}{\PrNM}
    \SHOWIT{DD}{335}{NN}{\PrNN}
    \SHOWIT{DE}{336}{NO}{\PrNO}
    \SHOWIT{DF}{337}{NP}{\PrNP}
    \SHOWIT{E0}{340}{OA}{\PrOA}
    \SHOWIT{E1}{341}{OB}{\PrOB}
    \SHOWIT{E2}{342}{OC}{\PrOC}
    \SHOWIT{E3}{343}{OD}{\PrOD}
    \SHOWIT{E4}{344}{OE}{\PrOE}
    \SHOWIT{E5}{345}{OF}{\PrOF}
    \SHOWIT{E6}{346}{OG}{\PrOG}
    \SHOWIT{E7}{347}{OH}{\PrOH}
    \SHOWIT{E8}{350}{OI}{\PrOI}
    \SHOWIT{E9}{351}{OJ}{\PrOJ}
    \SHOWIT{EA}{352}{OK}{\PrOK}
    \SHOWIT{EB}{353}{OL}{\PrOL}
    \SHOWIT{EC}{354}{OM}{\PrOM}
    \SHOWIT{ED}{355}{ON}{\PrON}
    \SHOWIT{EE}{356}{OO}{\PrOO}
    \SHOWIT{EF}{357}{OP}{\PrOP}
    \SHOWIT{F0}{360}{PA}{\PrPA}
    \SHOWIT{F1}{361}{PB}{\PrPB}
    \SHOWIT{F2}{362}{PC}{\PrPC}
    \SHOWIT{F3}{363}{PD}{\PrPD}
    \SHOWIT{F4}{364}{PE}{\PrPE}
    \SHOWIT{F5}{365}{PF}{\PrPF}
    \SHOWIT{F6}{366}{PG}{\PrPG}
    \SHOWIT{F7}{367}{PH}{\PrPH}
    \SHOWIT{F8}{370}{PI}{\PrPI}
    \SHOWIT{F9}{371}{PJ}{\PrPJ}
    \SHOWIT{FA}{372}{PK}{\PrPK}
    \SHOWIT{FB}{373}{PL}{\PrPL}
    \SHOWIT{FC}{374}{PM}{\PrPM}
    \SHOWIT{FD}{375}{PN}{\PrPN}
    \SHOWIT{FE}{376}{PO}{\PrPO}
    \SHOWIT{FF}{377}{PP}{\PrPP}
}}

\vbadness=10000

\ColHeight=\ht\AllChars
\advance\ColHeight by \dp\AllChars
\divide\ColHeight by 4

\setbox\ColA=\vsplit\AllChars to \ColHeight
\setbox\ColB=\vsplit\AllChars to \ColHeight
\setbox\ColC=\vsplit\AllChars to \ColHeight

\hbox to \textwidth{%
	\vtop{\COLHEAD\unvbox\ColA}\hfill
	\vtop{\COLHEAD\unvbox\ColB}\hfill
	\vtop{\COLHEAD\unvbox\ColC}\hfill
	\vtop{\COLHEAD\unvbox\AllChars}
}


%********************************************************************

\newpage
\section{ASCII Keywords for Special Symbols} \label{ASCIIKeywords}

ASCII keywords may be used instead of the characters in the non-ascii character set.
Use the programs {\tt conv\_ascii} and {\tt conv\_non-ascii} described in {\REFERENCE} to convert a document from non-ascii to ASCII format and vice versa.
The following table shows the ASCII keyword corresponding to each of the non-ascii characters.

\bigskip

\newbox\AllChars
\newbox\ColA
\newbox\ColB
\newbox\ColC

\newdimen\ColHeight
\parsep 0pt plus 5pt

\def\SHOWIT#1#2{\hbox{\hbox to 7.5em{\tt#1\hfil}#2}\par}

\def\COLHEAD{\SHOWIT{Keyword\hfill}{Char}\bigskip\ignorespaces}

\makeatletter
\def\@moan#1{--spare--}
\makeatother

\setbox\AllChars=\vbox{{
	\makeatletter
	\ShowAllImages
	\makeatother
\SHOWIT{\%and\%}{∧}
\SHOWIT{\%or\%}{∨}
\SHOWIT{\%not\%}{¬}
\SHOWIT{\%forall\%}{∀}
\SHOWIT{\%exists\%}{∃}
\SHOWIT{\%=>\%}{⦁}
\SHOWIT{\%x\%}{×}
\SHOWIT{\%leq\%}{≤}
\SHOWIT{\%neq\%}{≠}
\SHOWIT{\%geq\%}{≥}
\SHOWIT{\%mem\%}{∈}
\SHOWIT{\%notmem\%}{∉}
\SHOWIT{\%iff\%}{⇔}
\SHOWIT{\%implies\%}{⇒}
\SHOWIT{\%Leftarrow\%}{⇐}
\SHOWIT{\%fun\%}{→}
\SHOWIT{\%bij\%}{⤖}
\SHOWIT{\%finj\%}{⤕}
\SHOWIT{\%ffun\%}{⇻}
\SHOWIT{\%rel\%}{↔}
\SHOWIT{\%psurj\%}{⤀}
\SHOWIT{\%pfun\%}{⇸}
\SHOWIT{\%inj\%}{↣}
\SHOWIT{\%map\%}{↦}
\SHOWIT{\%surj\%}{↠}
\SHOWIT{\%pinj\%}{⤔}
\SHOWIT{\%<\%}{⌜}
\SHOWIT{\%<:\%}{ⓣ}
\SHOWIT{\%SML\%}{ⓜ}
\SHOWIT{\%SZT\%}{ⓩ}
\SHOWIT{\%>\%}{⌝}
\SHOWIT{\%SFT\%}{Ⓢ}
\SHOWIT{\%BT\%}{├}
\SHOWIT{\%EFT\%}{■}
\SHOWIT{\%SZS\%}{┌}
\SHOWIT{\%EZ\%}{└}
\SHOWIT{\%SZG\%}{╒}
\SHOWIT{\%BV\%}{│}
\SHOWIT{\%BH\%}{─}
\SHOWIT{\%BHH\%}{═}
\SHOWIT{\%SX\%}{⦏}
\SHOWIT{\%EX\%}{⦎}
\SHOWIT{\%lseq\%}{⟨}
\SHOWIT{\%rseq\%}{⟩}
\SHOWIT{\%lbag\%}{⟦}
\SHOWIT{\%rbag\%}{⟧}
\SHOWIT{\%lrelimg\%}{⦇}
\SHOWIT{\%rrelimg\%}{⦈}
\SHOWIT{\%down\%}{⋎}
\SHOWIT{\%up\%}{⋏}
\SHOWIT{\%uptext\%}{↗}
\SHOWIT{\%dntext\%}{↘}
\SHOWIT{\%cantext\%}{↕}
\SHOWIT{\%ulbegin\%}{⨽}
\SHOWIT{\%ulend\%}{⨼}
\SHOWIT{\%boolean\%}{𝔹}
\SHOWIT{\%C\%}{ℂ}
\SHOWIT{\%fset\%}{𝔽}
\SHOWIT{\%N\%}{ℕ}
\SHOWIT{\%pset\%}{ℙ}
\SHOWIT{\%rat\%}{ℚ}
\SHOWIT{\%R\%}{ℝ}
\SHOWIT{\%symbol\%}{𝕊}
\SHOWIT{\%u\%}{𝕌}
\SHOWIT{\%Z\%}{ℤ}
\SHOWIT{\%uminus\%}{﹣}
\SHOWIT{\%emptyset\%}{∅}
\SHOWIT{\%subseteq\%}{⊆}
\SHOWIT{\%subset\%}{⊂}
\SHOWIT{\%supseteq\%}{⊇}
\SHOWIT{\%supset\%}{⊃}
\SHOWIT{\%intersect\%}{∩}
\SHOWIT{\%dintersect\%}{⋂}
\SHOWIT{\%union\%}{∪}
\SHOWIT{\%symdiff\%}{⊖}
\SHOWIT{\%dunion\%}{⋃}
\SHOWIT{\%rsub\%}{⩥}
\SHOWIT{\%rres\%}{▷}
\SHOWIT{\%dsub\%}{⩤}
\SHOWIT{\%dres\%}{◁}
\SHOWIT{\%cat\%}{⁀}
\SHOWIT{\%filter\%}{↾}
\SHOWIT{\%extract\%}{↿}
\SHOWIT{\%overwrite\%}{⊕}
\SHOWIT{\%bagunion\%}{⊎}
\SHOWIT{\%thm\%}{⊢}
\SHOWIT{\%fcomp\%}{∘}
\SHOWIT{\%rcomp\%}{⨾}
\SHOWIT{\%bigcolon\%}{⦂}
\SHOWIT{\%def\%}{≜}
\SHOWIT{\%bottom\%}{⊥}
\SHOWIT{\%identical\%}{≡}
\SHOWIT{\%sqsubseteq\%}{⊑}
\SHOWIT{\%Delta\%}{Δ}
\SHOWIT{\%Phi\%}{Φ}
\SHOWIT{\%Gamma\%}{Γ}
\SHOWIT{\%Theta\%}{Θ}
\SHOWIT{\%Lambda\%}{Λ}
\SHOWIT{\%Pi\%}{Π}
\SHOWIT{\%Sigma\%}{Σ}
\SHOWIT{\%Upsilon\%}{Υ}
\SHOWIT{\%Omega\%}{Ω}
\SHOWIT{\%Xi\%}{Ξ}
\SHOWIT{\%Psi\%}{Ψ}
\SHOWIT{\%alpha\%}{α}
\SHOWIT{\%beta\%}{β}
\SHOWIT{\%delta\%}{δ}
\SHOWIT{\%select\%}{ε}
\SHOWIT{\%phi\%}{φ}
\SHOWIT{\%gamma\%}{γ}
\SHOWIT{\%eta\%}{η}
\SHOWIT{\%iota\%}{ι}
\SHOWIT{\%theta\%}{θ}
\SHOWIT{\%kappa\%}{κ}
\SHOWIT{\%fn\%}{λ}
\SHOWIT{\%mu\%}{μ}
\SHOWIT{\%nu\%}{ν}
\SHOWIT{\%pi\%}{π}
\SHOWIT{\%chi\%}{χ}
\SHOWIT{\%rho\%}{ρ}
\SHOWIT{\%sigma\%}{σ}
\SHOWIT{\%tau\%}{τ}
\SHOWIT{\%upsilon\%}{υ}
\SHOWIT{\%omega\%}{ω}
\SHOWIT{\%xi\%}{ξ}
\SHOWIT{\%psi\%}{ψ}
\SHOWIT{\%zeta\%}{ζ}
\SHOWIT{\strut}{}
\SHOWIT{\strut}{}
}}

\vbadness=10000

\ColHeight=\ht\AllChars
\advance\ColHeight by \dp\AllChars
\divide\ColHeight by 4

\setbox\ColA=\vsplit\AllChars to \ColHeight
\setbox\ColB=\vsplit\AllChars to \ColHeight
\setbox\ColC=\vsplit\AllChars to \ColHeight

\hbox to \textwidth{%
	\vtop{\COLHEAD\unvbox\ColA}\hfill
	\vtop{\COLHEAD\unvbox\ColB}\hfill
	\vtop{\COLHEAD\unvbox\ColC}\hfill
	\vtop{\COLHEAD\unvbox\AllChars}
}


In addition to the keywords for the non-ascii characters,
there are keywords for the mathematical symbols from tables 3.4, 3.5, 3.6 and 3.7 of
the  \LaTeX\ User's Guide and Reference Manual, \cite{lamport86},
and for the calligraphic and blackboard bold letters, %calA% \ldots %calZ%, %bbA% \ldots ℤ.
The keywords for the =mathematical symbols are given by the \LaTeX\ name without the leading backslash, e.g., the \verb"\bowtie" symbol, ``⋈'', has keyword {\tt \%bowtie\%}.
The keywords for the calligraphic and blackboard bold letters are
{\tt \%calA\%} \ldots {\tt \%calZ\%} and {\tt \%bbA\%} \ldots {\tt \%bbZ\%}.
%********************************************************************

\section{Using {\tt Xpp} to work with the Non-Ascii Character Set}

The {\tt xpp} program is designed to help you work with documents containing
symbols in the non-ascii character set. Its palette tool provides a graphical
interface for selecting symbols. It can also be configured to let you enter
symbols using the keyboard. See {\XPPUSERGUIDE} for more information about
{\tt xpp} and how to work with and customise the keyboard layout.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\pagebreak
\def\BS{\tt\char`\\}
\chapter*{REFERENCES}
\addcontentsline{toc}{chapter}{REFERENCES}

{\raggedright
\bibliographystyle{fmu}
\bibliography{fmu}
} %\raggedright

% LateX2e seems to do this next bit differently, the commented out line works for
% LaTeX2.09, but not for LaTeX2e.  For that we have the two commands separately.
%\twocolumn[\chapter*{INDEX}]
\twocolumn
\chapter*{INDEX}
\addcontentsline{toc}{chapter}{INDEX}
\small

\printindex


\end{document}

%--------------------------------------------------------------------
%********************************************************************
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

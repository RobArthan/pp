=IGN
********************************************************************************
imp054.doc: this file is part of the PPTex system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
% imp054.doc   ℤ $Date: 2011/07/27 12:10:10 $ $Revision: 1.40 $ $RCSfile: imp054.doc,v $

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

\def\Title{HOL Document Style For {\LaTeX}}

\def\AbstractText{This document contains the {\LaTeX}  document style {\tt hol1.sty} which is used for typesetting formal texts.}

\def\Reference{DS/FMU/IED/IMP054}

\def\Author{A.J. Hammon,  D.J.King}


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
%% LaTeX2e port: % imp054.doc   ℤ $Date: 2011/07/27 12:10:10 $ $Revision: 1.40 $ $RCSfile: imp054.doc,v $
%% LaTeX2e port: \documentstyle[hol1,11pt,TQ,ifthen]{article}
%% LaTeX2e port: 
%% LaTeX2e port: \TPPtitle{HOL Document Style For \LaTeX}
%% LaTeX2e port: %\def\TPPheadtitle{}
%% LaTeX2e port: \TPPref{DS/FMU/IED/IMP054}
%% LaTeX2e port: 
%% LaTeX2e port: =IGNORE
%% LaTeX2e port: Commands to process this document:
%% LaTeX2e port: 
%% LaTeX2e port: docsml imp054.doc ; mv imp054.sml hol1.sty
%% LaTeX2e port: docsml imp054.doc ; sed -e 's/[ 	]%.*$//' -e 's/^[ 	][ 	]*//' -e 's/[ 	][ 	]*$//' imp054.sml >! hol1.sty
%% LaTeX2e port: doctex imp054 ; texdvi imp054
%% LaTeX2e port: texdvi imp054
%% LaTeX2e port: bibtex imp054
%% LaTeX2e port: dvipage imp054 &
%% LaTeX2e port: 
%% LaTeX2e port: =TEX
%% LaTeX2e port: \makeindex
%% LaTeX2e port: \TPPissue{\VCVersion}
%% LaTeX2e port: \TPPproject{FST PROJECT}
%% LaTeX2e port: \TPPdate{\FormatDate{\VCDate}}
%% LaTeX2e port: \TPPstatus{Draft}
%% LaTeX2e port: \TPPtype{Literate Script}
%% LaTeX2e port: \TPPkeywords{HOL}
%% LaTeX2e port: \TPPauthors{	A.J. Hammon & WIN01\\
%% LaTeX2e port: 		D.J.King & WIN01}
%% LaTeX2e port: \TPPauthorisation{R.B.~Jones & FMU Manager}
%% LaTeX2e port: \TPPabstract{This document contains the \LaTeX{} document style
%% LaTeX2e port: 	{\tt hol1.sty} which is used for typesetting formal texts.}
%% LaTeX2e port: \TPPdistribution{\parbox[t]{4.0in}{%
%% LaTeX2e port: 	Library
%% LaTeX2e port: }}
%% LaTeX2e port: 
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: 
%% LaTeX2e port: \ftlinepenalty 1000
\newcommand{\cs}[1]{{\tt \string#1}}
\catcode`\_=\active
%% LaTeX2e port: 
%% LaTeX2e port: %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LaTeX2e port: 
%% LaTeX2e port: \begin{document}
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newpage
\section{DOCUMENT CONTROL}

\subsection{Contents List}
\tableofcontents
% \listoftables

\subsection{Document Cross References}
\bibliographystyle{fmu}
\bibliography{fmu}

\subsection{Changes History}

\begin{description}
\item[Earlier work ]
	The \LaTeX{} style file {\tt hol.sty} was developed over this
	and previous projects.  This document is based upon issue~1.20
	dated 23~January 1991 of {\tt hol.sty}, but there are major
	changes covering the change to a new font for the extended
	characters and recasting {\tt hol.sty} as a literate script.

\item[Issue 1.5 (1992/03/30), \FormatDate{92/03/30} ] First issue.

\item[Issue 1.6 (1992/04/29), \FormatDate{92/04/29} ]
	Allow dollar in indexed names.

\item[Issue 1.7 (1992/05/07), \FormatDate{92/05/07} ]\

	Add {\tt thlist} environment for theory listings.
	Add \verb|\HOLindexEntry| macro.

\item[Issue 1.11 (1992/10/19), \FormatDate{92/10/19} ]
	Include product and language name macros.
	Use explicit math skips rather than the `\verb|\thinmuskip|',
		`\verb|medmuskip|', `\verb|thichmuskip|', `\verb|\!|',
		`\verb|\,|', `\verb|\>|' and `\verb|\;|' forms.
	Remove some significant spaces.
	Adjust the spacing in `\verb|\StartHOLType|' and {\tt HELPDOC}.

\item[Issue 1.13 (1992/11/12), \FormatDate{92/11/12} ]
	Remove the trademark sign from the product and language macros, and change to a sans-serif font.
	Add macros to allow varying the widths in rule environments.

\item[Issue 1.14 (1992/11/25), \FormatDate{92/11/25} ]
	Adjust the spacing in {\tt HELPDOC}.

\item[Issue 1.15 (1993/02/23), \FormatDate{93/02/23} ]
	Reverse changes to StartFT which sometimes cause displacement of footer.
	Make capitalised product macros use larger font (instead of capitals).

\item[Issue 1.16 (1993/04/15), \FormatDate{93/04/15%
} ]
	Remove hbox from Product macros since this causes bizarre behaviour at start of paragraphs.

\item[Issue 1.17 (1993/07/06), \FormatDate{93/07/06%
} ]
	fixed {\tt thlist} environment to be compatible with
theory lister tabbing.

\item[Issue 1.19 (1993/08/04)]
	fixed fix of {\tt thlist} environment.
	
\item[Issue 1.20 (1993/08/17)]
	Changed handling of \verb!"! and \verb!`! to print these verbatim instead of toggling.
	
\item[Issue 1.21 (1993/09/02)]
	Put a little more space in the HOL type quotation symbol.
	
\item[Issue 1.22 (1993/12/10)]
	Reduce interline spacing in formal text by alternative method hoping that this will not cause reference manual footers to waggle.

\item[Issue 1.23 (1994/05/12)]
	Reverted to version without the fix to reduce interline spacing as it is believed to introduce problems with the index.

\item[Issue 1.24 (1994/08/19)-25]
	Style file updated to work with LateX2e.

\item[Issue 1.26 (1995/10/30)]
	Added Compliance Tool Support Macros for Hypertext viewing.

\item[Issue 1.28 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.29 (2002/10/17)] PPTex-specific updates for open source release
\item[Issue 1.30 (2003/04/02)] Compliance Notation symbols now first class citizens.
\item[Issue 1.31 (2003/07/28)] added support for new Z universe symbol (blackboard bold U).
\item[Issue 1.32 (2004/01/16)] added support for new Z boolean and ``schriftzeichen'' symbols (blackboard bold B and C).
\item[Issue 1.33 (2005/09/07),1.34 (2005/09/16)] added underlining brackets.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/04/17]
Ported to Lemma 1 document template.
%%%% END OF CHANGES HISTORY %%%%
\end{description}

\subsection{Changes Forecast}

None.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************************************************************
%--------------------------------------------------------------------

\newpage
\section{GENERAL}
\subsection{Scope}

This document contains the implementation of the \LaTeX{} style file
{\tt hol1.sty} of the document processing system whose detailed design
is in~\cite{DS/FMU/IED/HLD003}.  The user interface is described in
the user documentation for the document processing
system~\cite{DS/FMU/IED/USR001}.

%********************************************************************

\subsection{Introduction}

Many \LaTeX{} documents used on the IED FST project include formal text
in any of several languages, including: Z, Standard~ML, HOL and (for
this document) \TeX. \ The document style `hol1' allows the easy
formatting of these texts.  The style could be used on its own, but it
is designed to be used in conjunction with a preprocessor that takes
the original source and filters is according to purpose.  Filtration
has two primary outputs, firstly, \LaTeX{} source to be used with this
document style, secondly, program text for input to some compiler.  The
phrases `program text' and `some compiler' are used very generally, the
program {\bf latex} is considered a compiler whose input (program) text
is \LaTeX{} source text and whose compiled output is a {\bf .dvi} file.
The forms of the input text and the preprocessors are described in
the document~\cite{DS/FMU/IED/USR001}.


%\subsubsection{Purpose and Background}
%\subsubsection{Dependencies}

%--------------------------------------------------------------------

\subsubsection{Interface}

The interface to the style file is by quoting its name as an option in
the document style command near the start of each document.

The simplest way to produce the style file is to run the following
shell commands:

=GFTSHOW
	docsml imp054.doc
	mv imp054.sml hol1.sty
=TEX

The style file may be compacted by the following shell commands which
remove most \LaTeX{} comments plus all leading and trailing spaces and
tabs on each line.  (Note, each pair of square braces contain one space
and one tab character.)

=GFTSHOW
	docsml imp054.doc
	sed -e 's/[ 	]%.*$//' -e 's/^[ 	][ 	]*//' -e 's/[ 	][ 	]*$//' \
		imp054.sml > hol1.sty
=TEX

%\subsubsection{Algorithms}
%\subsubsection{Possible Enhancements}
%\subsubsection{Deficiencies}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{IDENTIFICATION}

Whenever the macro package is loaded it will identify itself on the
terminal and in the log file.  Note the positioning of the percent and
newline characters to avoid unnecessary spaces in the message and the
loss of significant text when the style file is being used when (in
SCCS terminology) it is `out for editing'.

=SMLPLAIN LaTeX
% HOL and Z style file hol1.sty. $Date: 2011/07/27 12:10:10 $ $Revision: 1.40 $ $RCSfile: imp054.doc,v $
\typeout{Issue $Revision: 1.40 $
dated $Date: 2011/07/27 12:10:10 $.%
}
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{PRODUCT AND LANGUAGE NAME DEFINITIONS}

The following macros give the product family name, provisionally set at ``ProofPower'', in lower case and upper case, and the language name for the particular dialect of each of the languages for which support is currently planned.
The upper case variants of the macros simply use a larger font, they do not result in an upper case product name.

\begin{tabular}{l l}
\verb|\Product| & \Product \\
\verb|\ProductML| & \ProductML \\
\verb|\ProductHOL| & \ProductHOL \\
\verb|\ProductZ| & \ProductZ \\
\verb|\ProductSAL| & \ProductSAL \\
\verb|\PRODUCT| & \PRODUCT \\
\verb|\PRODUCTML| & \PRODUCTML \\
\verb|\PRODUCTHOL| & \PRODUCTHOL \\
\verb|\PRODUCTZ| & \PRODUCTZ \\
\verb|\PRODUCTSAL| & \PRODUCTSAL \\
\end{tabular}
=SMLPLAIN LaTeX
\DeclareFixedFont {\pplarge}{OT1}{cmss}{m}{n}{17}
\DeclareFixedFont {\ppfont}{OT1}{cmss}{m}{n}{12}
\DeclareFixedFont {\ppsmall}{OT1}{cmss}{m}{n}{10}
\def\Product{{\ppfont ProofPower}}
\def\ProductML{{\ppfont ProofPower-{\ppsmall ML}}}
\def\ProductHOL{{\ppfont ProofPower-{\ppsmall HOL}}}
\def\ProductZ{{\ppfont ProofPower-{\ppsmall Z}}}
\def\ProductSAL{{\ppfont ProofPower-{\ppsmall SAL}}}
\def\PRODUCT{{\pplarge ProofPower}}
\def\PRODUCTML{{\pplarge ProofPower-{\ppfont ML}}}
\def\PRODUCTHOL{{\pplarge ProofPower-{\ppfont HOL}}}
\def\PRODUCTZ{{\pplarge ProofPower-{\ppfont Z}}}
\def\PRODUCTSAL{{\pplarge ProofPower-{\ppfont SAL}}}
=TEX

\begin{enumerate}
\item
{\Product} test paragraph.
\item
{\ProductML} test paragraph.
\item
{\ProductHOL} test paragraph.
\item
{\ProductZ} test paragraph.
\item
{\ProductSAL} test paragraph.
\item
{\PRODUCT} test paragraph.
\item
{\PRODUCTML} test paragraph.
\item
{\PRODUCTHOL} test paragraph.
\item
{\PRODUCTZ} test paragraph.
\item
{\PRODUCTSAL} test paragraph.
\end{enumerate}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\section{UTILITY MACROS AND DEFINITIONS}

Macro \verb|\MMM| ensures that its parameter is formatted in maths mode.

=SMLPLAIN LaTeX
\def\MMM#1{{\ifmmode#1\else$#1$\fi}}
=TEX

A box register is allocated here to hold a strut because of a conflict
between the height plus depth of \LaTeX{} strut boxes in some style
files and the setting of \verb|\baselineskip|.  In most cases they are
equal, but in {\tt slides.sty} as used by {\tt slitex} there is a 6pt
difference!  So at the top of each block of formal text we set the
box to be of equal total height to baselineskip using the same
algorithm as in {\tt lfonts.tex}.

=SMLPLAIN LaTeX
\newbox\ft@strutbox

\setbox\ft@strutbox\hbox{\vrule height.7\baselineskip
      depth.3\baselineskip width\z@}
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{FONT CONTROL}

\subsection{Alphabetic Characters}

To make multi-letter identifiers look better the mathcodes for the
letters {\tt A, \ldots, Z, a, \ldots, z} are changed to generate text
italic rather than math italic.  The mathcode for the characters code
are set to give variable family ({\tt"}7000) text italic ({\tt"}400).

=SMLPLAIN LaTeX
\def\@setmcodes#1#2#3{{%
	\count0=#1
	\count1=#3
	\loop
		\global\mathcode\count0=\count1
		\ifnum \count0<#2
		\advance\count0 by1
		\advance\count1 by1
	\repeat}}

\@setmcodes{`A}{`Z}{"7441}
\@setmcodes{`a}{`z}{"7461}
=TEX

\subsection{Font Switching}

To make HOL terms embedded in ML code more legible we use different
fonts for HOL and ML. Some count registers are used for this purpose:

=SMLPLAIN LaTeX
\newcount\@EnvfamA \newcount\@EnvfamB
\newcount\HOL@Zfont \newcount\ML@font
\font\tenit=cmti10
\font\tentt=cmtt10
%\newfam\itfam \def\it{\fam\itfam\tenit} \textfont\itfam=\tenit
%\newfam\ttfam \def\tt{\fam\ttfam\tentt} \textfont\ttfam=\tentt
\HOL@Zfont=\itfam \ML@font=\ttfam
=TEX

The following macros set the counts up for the~Z~and ML+HOL usage
respectively.  For~Z~(or HOL boxes etc.) we use italic always. For
ML+HOL we start off in roman and change into italic for the embedded
HOL terms. We set up \verb|\everymath| to ensure these font changes are
preserved if we leave math mode and then go back to it.

=SMLPLAIN LaTeX
\def\@zedfonts{\global\@EnvfamA=\HOL@Zfont\global\@EnvfamB=\HOL@Zfont}
\def\@HOLfonts{\global\@EnvfamA=\ttfam\global\@EnvfamB=\HOL@Zfont}
\everymath=\expandafter{\the\everymath\fam\@EnvfamA}
\@zedfonts
=TEX

\verb|\@ToggleFonts| is used to switch between fonts in HOL when we go
from metalanguage to object language and vice versa.  Quotations in
ICL~HOL are introduced by bracketing symbols (the `\StartTerm'
and `\EndTerm') which may themselves appear in
terms.  \verb|\@PushFonts| and \verb|\@PopFonts| are used to control
which font is selected when these brackets are nested, only the
outermost pair cause a font change.  Strachey brackets MUST be properly
balanced.

=SMLPLAIN LaTeX
\def\@ToggleFonts{\fam=\@EnvfamB\global\@EnvfamB=\@EnvfamA
	\global\@EnvfamA=\the\fam}
\newcount\@BracketCount
\@BracketCount=0
\def\@PushFonts{\ifnum\@BracketCount = 0 \@ToggleFonts\fi
	\global\advance\@BracketCount by 1}
\def\@PopFonts{\global\advance\@BracketCount by -1
	\ifnum\@BracketCount = 0 \@ToggleFonts\fi}
=TEX

\subsection{Quote Toggling}

Toggling of quotes has been disabled though the annotation and commented out original code has been left in the style file pro-tem.

The following macros make the active \verb|"| character toggle from
opening double primes (~``~) to closing double primes (~''~) and change
font family from \verb|\@EnvfamA| to \verb|\@EnvfamB|.

Similarly, make active \verb|`| character toggle from opening single
primes~(i.e.,~`~) to closing single primes~(i.e.,~'~).

=SMLPLAIN LaTeX
%\def\@Quotes{``\@ToggleFonts}
\def\@Quotes{\hbox{\verb!"!}\@ToggleFonts}
%\def\@Setouq{\@ToggleFonts\hbox{''}}
\def\@Setouq{\@ToggleFonts\hbox{\verb!"!}}
\def\Quotes@Toggle{\@Quotes\let\@Swap=\@Quotes
	\global\let\@Quotes=\@Setouq
	\global\let\@Setouq=\@Swap}
%\def\Quotes@Toggle{\hbox{\verb!"!}}
=TEX

=SMLPLAIN LaTeX
%\def\@Quote{`}
\def\@Quote{\hbox{\verb!`!}}
%\def\@Etuoq{\hbox{'}}
\def\@Etuoq{\hbox{\verb!`!}}
\def\Quote@Toggle{\@Quote\let\@Swap=\@Quote
	\global\let\@Quote=\@Etuoq
	\global\let\@Etuoq=\@Swap}
=TEX

Setting up the character codes and macros for the quote characters is
complex.  Both need to be defined as active characters within formal
environments, macro \verb|\active@quotes| achieves this.  For use with
those formal environments we need to associate the characters with
their macros defined above, this means they need to be active whilst
being defined, hence the grouping brackets around the whole section.

=SMLPLAIN LaTeX
{
\gdef\active@quotes{%
	\catcode`\"=\active
	\catcode`\`=\active
}
\active@quotes
\global\let"=\Quotes@Toggle
\global\let`=\Quote@Toggle
}
=TEX

=IGNORE
Also, the mathcode for semicolon is set to "8000, so it behaves as an
active character in math mode; it is defined to insert a thick space.
\semicolon is a semicolon as an ordinary symbol.

\mathcode`\;="8000 % Makes ; active in math mode
{\catcode`\;=\active \gdef;{\semicolon\;}}
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{LINE CONTROL}

This is responsible for the layout of formal text of various forms.
Lines of such text are assumed to start with `\verb|\+|' and to end
with `\verb|\\|`; extended characters are assumed to have
been converted into `\verb|\PrXX.|' macro calls (see section~\ref
{ExtendedChars} below).  There are several tasks to be done:  (a) to mimic
the layout of each line of formal text and, in particular to do
typewriter-style tabbing; (b) to do the font changes for quoted strings
using the above macros; and (c) to draw a vertical rule down the left
hand side of the text.

%********************************************************************

\subsection{Controlling Values}

These value may be altered by the users.

Dimension register \verb|\tabstop| holds the distance between tabstops.

=SMLPLAIN LaTeX
\newdimen\tabstop \tabstop=0.5in
=TEX

Dimensions \verb|\ftlmargin| and \verb|\ftrmargin| hold the widths of
the additional left and right margins for lines of formal text.  They
may be reset by the user.  Dimension (\verb|\ft@width| is used
internally to hold the width of a line and is recomputed at the start
of each box using macro \verb|\set@width|).

=SMLPLAIN LaTeX
\newdimen\ftlmargin \ftlmargin=0in
\newdimen\ftrmargin \ftrmargin=0in

\newdimen\ft@width

\def\set@width{\ft@width=\hsize\advance\ft@width by-\ftlmargin
	\advance\ft@width by-\ftrmargin}
=TEX

Penalty \verb|\ftlinepenalty| is the penalty between lines of formal
text.  We set it to~10000 so that boxes of formal text will never be
broken across pages, the user can change it (e.g., to~0) to allow page
breaks in boxes.

=SMLPLAIN LaTeX
\newcount\ftlinepenalty \ftlinepenalty=10000
=TEX

Skips \verb|\ftaboveboxskip| and \verb|\ftbelowboxskip| give the skips
taken above and below each box of formal text.

=SMLPLAIN LaTeX
\newskip\ftaboveboxskip	\ftaboveboxskip=\abovedisplayskip
\newskip\ftbelowboxskip	\ftbelowboxskip=\belowdisplayskip
=TEX

Skip \verb|\ftspaceskip| controls the width of spaces within formal text.

=SMLPLAIN LaTeX
\newmuskip\ftspaceskip	\ftspaceskip=7mu
=TEX

Some scratch registers are used.

=SMLPLAIN LaTeX
\newdimen\@A
\newdimen\@B
=TEX

%********************************************************************

\subsection{Line Building}

We use two box registers when forming the lines to be printed.  At the
beginning of each line and after each tab stop, macro \verb|\@start|
collects text into the \verb|\@block| box.  When a tab is read the
\verb|\@more| macro is executed, it rounds up the width of
\verb|\@block| to a multiple of \verb|\tabstop| and the resulting hbox
is appended to the \verb|\@line| box.  At the end of each line macro
\verb|\@done| creates an hbox holding a vertical rule of appropriate
height and depth followed by the contents of box \verb|\@line|, this is
then emitted.

=SMLPLAIN LaTeX
\newbox\@block \newbox\@line
=TEX
We maintain a global counter containing the level of nesting of underlining brackets and use this set up the initial
underlining of a block. \verb"\loop" does not seem to work if the loop body
contains \verb"\egroup", so we do our own recursion.
=SMLPLAIN LaTeX
\newcount\UL@level \UL@level=0
\newcount\UL@t \UL@t=\UL@level
\def\@bshiftsrec{
	\ifnum\UL@t > 0
		\underline\bgroup
		\global\advance\UL@t -1
		\@bshiftsrec
	\fi
}
\def\@bshifts{%
	\global\UL@t=\UL@level
	\@bshiftsrec
}
\def\@eshiftsrec{
	\ifnum\UL@t > 0
		\egroup
		\global\advance\UL@t -1
		\@eshiftsrec
	\fi
}
\def\@eshifts{%
	\global\UL@t=\UL@level
	\@eshiftsrec
}
=TEX
\bigskip

\verb|\@start| starts the processing of a line. (\verb|\+| is `let'
equal to it in \verb|\@StartAqFT|). We go into maths mode and set the
font family to \verb|\@EnvfamA|.

=SMLPLAIN LaTeX
\def\@start{\setbox\@line\null\@chew}
=TEX

Macro \verb|\@chew| starts a job of collecting text into \verb|\@block|.

=SMLPLAIN LaTeX
\def\@bmath{$}
\def\@emath{\thinmuskip=0mu\medmuskip=0mu\thickmuskip=0mu$}
=TEX

=SMLPLAIN LaTeX
\def\@chew{\setbox\@block=\hbox\bgroup\@bmath\@bshifts}
=TEX

Macro \verb|\@spit| finishes a collection job by appending the
collected text into \verb|\@line| in a box of suitable width.  It adds
glue at end of block, then stops collecting text.  The width of the box
is modified to be an integer multiple of \verb|\tabstop| units.
Finally the modified box is appended to the current line being
assembled in the \verb|\@line| box.

=SMLPLAIN LaTeX
\def\@spit{\@eshifts\@emath\hfil\egroup
	\@A=\wd\@block
	\advance\@A by\tabstop
	\divide\@A by\tabstop
	\multiply\@A by\tabstop
	\setbox\@block=\hbox to \@A{\unhbox\@block}%
	\setbox\@line=\hbox{\unhbox\@line\box\@block}}%
=TEX

Macro \verb|\@more| calls \verb|\@spit| then \verb|\@chew| as required
when a tab is read, (\verb|^^I| (tab) is `let' equal to it, see
section~\ref{SetTabActive}).

=SMLPLAIN LaTeX
\def\@more{\@spit\@chew}
=TEX

Macro \verb|\@done| finishes the processing of a line by appending the
contents of \verb|\@block| to \verb|\@line| then (optionally) emitting a box
containing a vrule of appropriate dimensions followed by the contents
of \verb|\@line|.  (\verb|\\| is `let' equal to \verb|\@done| in
\verb|\@StartAqFT|). {} The optional vrule is controlled by the conditional
\verb|\|\verb|ifvertbar|.

=SMLPLAIN LaTeX
\newif\ifvertbar
\vertbartrue
=TEX

=SMLPLAIN LaTeX
\def\@done{%
	\conclude@line
	\ifvertbar
		\make@vert@bar
		\@ftline{\box\@block\unhbox\@line}%
	\else
		\@ftline{\unhcopy\ft@strutbox\unhbox\@line}%
	\fi
	\penalty\ftlinepenalty % add rule and emit
	\ignorespaces
}
=TEX

In \verb|conclude@line| we add glue to fill out the
last block, close the box then add it to the line.

=SMLPLAIN LaTeX
\def\conclude@line{\@eshifts\@emath\hfil\egroup
	\setbox\@line=\hbox{\unhbox\@line\box\@block}%
}
=TEX

In \verb|\make@vert@bar| we set box \verb|\@block| to contain a
vertical rule plus some horizontal space.  The rule has height and
depth of the larger of \verb|\ft@strutbox| and the contents of box
\verb|\@line|.

=SMLPLAIN
\def\make@vert@bar{%
	\ifdim \dp\@line > \dp\ft@strutbox
		\@A=\dp\@line
		\else \@A=\dp\ft@strutbox
	\fi
	\advance\@A by\lineskip
	\ifdim \ht\@line > \ht\ft@strutbox
		\@B=\ht\@line
		\else \@B=\ht\ft@strutbox
	\fi
	\setbox\@block=\hbox{\vrule height\@B depth\@A\thinspace}%
}
=TEX

\verb|\@ftline| is used to emit a line of formal text:

=SMLPLAIN LaTeX
\def\@ftline#1{\moveright\ftlmargin\hbox to \ft@width{#1\hfill}}
=TEX

The macro \verb|\crossbar| draws the cross-bar for an axiomatic
descriptions or schemas and similar boxes.  It is normally invoked via
the extended character corresponding to \verb|\Big@Turnstile| which is
\verb|\let| equal to \verb|\crossbar|.

=SMLPLAIN LaTeX
\def\crossbar{
	\@A=\dp\ft@strutbox \advance\@A by\lineskip
	\advance\@A by 1ex    % down to next line
	\@ftline{\raise 1ex \hbox to 0.5\ft@width
		{\vrule height\ht\ft@strutbox depth\@A\hrulefill}}%
	\penalty\ftlinepenalty}
=TEX

%********************************************************************

\subsection{Special Character Treatment} \label{SetTabActive}

Within the formal text environments a number of characters are treated
specially.

\begin{itemize}

\item Double quote characters (~{\tt"}~) are set so that they are
	printed alternately as double opening (~``~) and closing (~''~)
	quotes.

\item Single quote characters (~{\tt`}~) are set to switch
	between opening (~`~) and closing (~'~) quotes.

\item Tab is set to give a typewriter like tabbing facility.

\item (~\verb=|=~) is made active and are let equal to appropriate
	macros.

\item Alphabetic characters are taken from the \verb|\it| family within
	math mode, this allows better spacing between groups (i.e.,
	words) of letters.

\item Space characters are set active in formal text so that they give actual
	space of a width controlled by skip value
	\verb|\ftspaceskip|.

\end{itemize}

Macro \verb|\HOL@setchars| sets up the \verb|\catcode| values needed.
It should be called before the environments with parameters are invoked
in case the parameters contain special characters.  Note that this
macro must not use tabs for layout purposes as they are made active for
its body.  This means that all of its lines should also end with a
percent character.

=SMLPLAIN LaTeX
{\catcode`\^^I=\active
\obeyspaces
\gdef\HOL@setchars{%
\catcode`\^=12
\catcode`\^^I=\active
\let^^I=\@more
\active@spaces
}%
\gdef\HOL@setcharsTab{%
\catcode`\^=12
\active@spaces
\catcode`\^^I=\active
\def^^I={\mskip\ftspaceskip}%
}%
}
=TEX

We need to be able to see spaces in maths mode.

=SMLPLAIN LaTeX
{%
	\obeyspaces
	\gdef\active@spaces{\obeyspaces
		\def {\mskip\ftspaceskip}%
	}%
}
=TEX

A new shape for the underscore.

=SMLPLAIN LaTeX
\def\_{\kern.06em\vbox{\hrule height.1ex width.3em}\hskip0.1em\relax}
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{SPECIAL CHARACTERS}

The document processing system includes a screen display font for Sun
computers where and extended character set the full eight bit character
codes is used.  The macros in this section provide the \LaTeX{} support
for these characters.

Each extended character in the font, including those which are
currently spare, has a macro named in the form ``\verb|\Pr|$\cal NN$''
where the ``$\cal NN$'' gives a hexadecimal representation of the
character code.  The hexadecimal digits used are \verb|A|--\verb|P|
rather than the conventional \verb|0|--\verb|9| and \verb|A|--\verb|F|,
this allows us to use the \TeX{} macro names without any special
actions.

Invocations of the macro for the spare positions are considered to be
faults for which warning messages are issued.

Many of the extended characters correspond to macros defined in the
plain \LaTeX{} style, for these we use the \LaTeX{} macro directly.
For the more complex macros we provide a mnemonic name for the
character's image, then use that in the ``\verb|\Pr|$\cal NN$'' macro.

%********************************************************************

\subsection{Font Control For Extended Characters}

Some characters are taken from the {\tt msxfam} and {\tt msyfam} fonts.
We arrange to get a version of the font at a suitable size.

=SMLPLAIN LaTeX
\def\ifundefined#1{\expandafter\ifx\csname#1\endcsname\relax}

\edef\@scale{%
	\ifundefined{@ptsize}%
		\magstep4
	\else	\ifcase	\@ptsize	\@m
		\or			\magstephalf
		\or			\magstep1
		\fi
	\fi}

\font\msx=msam10 scaled \@scale
\font\msy=msbm10 scaled \@scale

\newfam\msxfam \textfont\msxfam=\msx
\newfam\msyfam \textfont\msyfam=\msy
=TEX

Macros \verb|@fx| and \verb|\@fy| obtain particular characters from the
{\tt msxfam} and {\tt msyfam} fonts respectively.

=SMLPLAIN LaTeX
\def\@famletter#1{\ifcase #1 0\or 1\or 2\or 3\or 4\or 5\or 6\or 7\or
	8\or 9\or A\or B\or C\or D\or E\or F\fi}

\edef\@fx{\@famletter\msxfam}
\edef\@fy{\@famletter\msyfam}

\def\msyChar{\fam\msyfam \msy}

\mathchardef	\emptyset	"0\@fy3F
\mathchardef	\inj		"3\@fx1A
\mathchardef	\surj		"3\@fx10
\def		\cat		{\mathbin{\raise 0.8ex\hbox{$\mathchar"2\@fx61$}}}
\mathchardef	\dres		"2\@fx43
\mathchardef	\rres		"2\@fx42
=TEX

\verb|\@p| and \verb|\@f| make arrows with 1 and 2 crossings
respectively, they are named for the Z~arrows which are partial or
finite mappings respectively.

=SMLPLAIN LaTeX
\def\@p#1{{\mathrel{\setbox0=\hbox{$#1$}\rlap
	{\hbox to \wd0{\hfil$\mapstochar
			\mkern 5mu$\hfil}}\box0}}}

\def\@f#1{{\mathrel{\setbox0=\hbox{$#1$}\rlap
	{\hbox to \wd0{\hfil$\mapstochar\mkern 3mu\mapstochar
			\mkern 5mu$\hfil}}\box0}}}
=TEX

The following macros are used for subscripts and superscripts (they
enable multiple subscription by doing the subscription or
superscription in braces and backspacing to get rid of the extra space
this causes).

=SMLPLAIN LaTeX
\def\@sb#1{{\mskip-0.75mu\sb{#1}}}
\def\@sp#1{{\mskip-0.75mu\sp{#1}}}
=TEX

%********************************************************************

\subsection{Complex Character Images}

Several characters need to have macros.

%--------------------------------------------------------------------

\subsubsection{Subscripting and Superscripting}

=SMLPLAIN LaTeX
\def\UPchar{\MMM{\mathchar"0\@fx66\relax}}
\def\DNchar{\MMM{\mathchar"0\@fx67\relax}}
\def\DNtext{\MMM{\searrow}}
\def\UPtext{\MMM{\nearrow}}
\def\CANtext{\MMM{\updownarrow}}

\def\UP@char#1{{}\sp{#1}}
\def\DN@char#1{{}\sb{#1}}
\def\UP@text#1{{}\sp\bgroup}
\def\DN@text#1{{}\sb\bgroup}
\def\CAN@text{\egroup}
\def\ULbegin{\underline{(}}
\def\ULend{\underline{)}}
=TEX

%--------------------------------------------------------------------

\subsubsection{Underlining}

=SMLPLAIN LaTeX
\def\UL@begin{
	\global\advance\UL@level 1
	\underline\bgroup
}
\def\UL@end{
	\egroup
	\global\advance\UL@level -1
}
=TEX

%--------------------------------------------------------------------

\subsubsection{Bracketing of Formal Text}

=SMLPLAIN LaTeX
\mathchardef\Start@FormalChar	"0\@fx73
\mathchardef\Start@TermChar	"2\@fx70
\def\StartFormal{\MMM{\Start@FormalChar}}
\def\StartTerm{\MMM{\Start@TermChar}}

\def\StartHOLType{\MMM{\Start@TermChar\mskip-3mu:}}
\def\StartMLTerm{\MMM{\vtop
	{\hbox{\kern1ex$\Start@TermChar$}%
	\nointerlineskip
	\kern-0.8ex
	\hbox{\tiny ML\strut}}}}
\def\StartZTerm{\MMM{\vtop
	{\hbox{$\Start@TermChar$}%
	\nointerlineskip
	\kern-0.7ex
	\hbox{\tiny Z\strut}}}}

\def\Start@HOLType{\@PushFonts\StartHOLType}
\def\Start@MLTerm{\@PushFonts\StartMLTerm}
\def\Start@ZTerm{\@PushFonts\StartZTerm}
\def\Start@Term{\@PushFonts\StartTerm}
\def\Start@Formal{\@PushFonts\StartFormal}
=TEX

=SMLPLAIN LaTeX
\mathchardef\End@FormalChar	"0\@fx04
\mathchardef\End@TermChar	"2\@fx71

\def\EndFormal{\MMM{\End@FormalChar}}
\def\EndTerm{\MMM{\End@TermChar}}

\def\End@Formal{\EndFormal\@PopFonts}
\def\End@Term{\EndTerm\@PopFonts}
=TEX

%--------------------------------------------------------------------

\subsubsection{Box Drawing Symbols}

Some dimensions are frequently used in these symbols.

=SMLPLAIN LaTeX
\newdimen\RM@EX
\newdimen\RM@EM
{\rm	\global\RM@EM=1em
	\global\RM@EX=1ex
}
=TEX

Three symbols for horizontal (one and two) and vertical bars,
the `\verb|\...@Body|' macros generate the bars but they
are always caled via other macros.

=SMLPLAIN LaTeX
\def\HBar@Body#1{%
	\vbox to \RM@EX{%
		\hrule width #1 height 0pt depth 0.4pt
		\vfill
	}}
\def\DblHBar@Body#1{\leavevmode
	\vrule height 1.1\RM@EX depth 0pt width 0pt
	\vbox to 1\RM@EX{%
		\hrule width #1 height 0pt depth 0.4pt
		\vfill
		\hrule width #1
		\vfill\vfill
	}}
\def\VBar@Body{%
	\vrule height 2\RM@EX depth 0.5\RM@EX
	\vrule height 2.1\RM@EX depth 0.7\RM@EX width 0pt}
=TEX

These three macros are provided to show the images of the bars, a kern
is provided to give some separation between these characters and their
printed neighbours.  These characters are not intended to be used in
groups to draw boxes, rather the appropriate environment will draw the
box itself.  Thus these images are for use in ``how to~$\ldots$''
examples of aspects of this \LaTeX{} style.

=SMLPLAIN LaTeX
\def\HBar{\leavevmode\kern1pt\HBar@Body{\RM@EM}\kern1pt\relax}
\def\VBar{\leavevmode\kern1pt\VBar@Body\kern1pt\relax}
\def\DblHBar{\leavevmode\kern1pt\DblHBar@Body{\RM@EM}\kern1pt}

\let\H@Bar=\relax
\let\V@Bar=\relax
\let\Dbl@HBar=\relax
=TEX

Two start of~Z~structure symbols are needed, their dimensions are
intended to be compatible with the bars above.  Again, these images are
for use in ``how to~$\ldots$'' examples of aspects of this \LaTeX{}
style and so they have kerns.

=SMLPLAIN LaTeX
\def\StartZGeneric{\kern1pt
	\vrule height \RM@EX depth 0pt
	\DblHBar@Body{0.5\RM@EM}%
	\kern1pt}
\def\StartZSchema{\kern1pt
	\vrule height \RM@EX depth 0pt
	\HBar@Body{\RM@EX}%
	\kern1pt\relax}
\def\EndZBox{\kern1pt
	\raise\RM@EX\hbox{\vrule height \RM@EX depth 0pt}%
	\HBar@Body{\RM@EX}%
	\kern1pt\relax}
=TEX

=SMLPLAIN LaTeX
\def\BigTurnstile{\leavevmode\kern1pt\VBar@Body\HBar@Body{\RM@EX}\kern1pt\relax}
\let\Big@Turnstile=\BigTurnstile
=TEX

%--------------------------------------------------------------------

\subsubsection{Index brackets}

=SMLPLAIN LaTeX
\def\StartIndex{\MMM{{[}\mskip-4.5mu\sb{{\times}}}}
\def\EndIndex{\MMM{\sb{{\times}}\mskip-6mu{]}}}
=TEX

%--------------------------------------------------------------------

\subsubsection{Mathematical Symbols, Mostly for Z}

=SMLPLAIN LaTeX
\def\lrelimg{\MMM{(\mskip-4.5mu|}}			% left image, (|
\def\rrelimg{\MMM{|\mskip-4.5mu)}}			% right image, |)
\def\lbag{\MMM{[\mskip-3mu[}}				% Brackets, for start and ...
\def\rbag{\MMM{]\mskip-3mu]}}				%  ... end of bag displays

\def\rsub{\MMM{\mathbin{\rlap{$-$}{\rres}}}}		% range anti-restriction
\def\dsub{\MMM{\mathbin{\rlap{$-$}{\dres}}}}	% domain anti-restriction
\def\Zcat{\MMM{\cat}}					% concatenation
\def\filter{\MMM{\mathchar"2\@fx16}}			% filter
\def\extract{\MMM{\mathchar"2\@fx18}}			% extract
\def\Zdcat{\MMM{\cat\mskip-3mu/}}			% distributed concatenation, ^/
\def\Zthm{\MMM{\vdash}}					% turnstile, |-
\def\Uminus{\MMM{\mbox{-}}}				% unary minus
\def\Zdef{\MMM{\widehat=}}				% Z defined by

\let\mathbb=\msyChar
\def\bbA{\MMM{\mathbb A}}
\def\Zbool{\MMM{\mathbb B}}
\let\bbB\Zbool
\def\Zcomplex{\MMM{\mathbb C}}
\let\bbC\Zcomplex
\def\bbD{\MMM{\mathbb D}}
\def\bbE{\MMM{\mathbb E}}
\def\Zfset{\MMM{\mathbb F}}
\def\bbG{\MMM{\mathbb G}}
\def\bbH{\MMM{\mathbb H}}
\def\bbI{\MMM{\mathbb I}}
\def\bbJ{\MMM{\mathbb J}}
\def\bbK{\MMM{\mathbb K}}
\def\bbL{\MMM{\mathbb L}}
\def\bbM{\MMM{\mathbb M}}
\def\Znat{\MMM{\mathbb N}}
\let\bbN\Znat
\def\bbO{\MMM{\mathbb O}}
\def\Zpset{\MMM{\mathbb P}}
\let\bbP\Zpset
\def\Zrat{\MMM{\mathbb Q}}
\let\bbQ\Zrat
\def\Zreal{\MMM{\mathbb R}}
\let\bbR\Zreal
\def\Zsym{\MMM{\mathbb S}}
\let\bbS\Zsym
\def\bbT{\MMM{\mathbb T}}
\def\Zuniv{\MMM{\mathbb U}}
\let\bbU\Zuniv
\def\bbV{\MMM{\mathbb V}}
\def\bbW{\MMM{\mathbb W}}
\def\bbX{\MMM{\mathbb X}}
\def\bbY{\MMM{\mathbb Y}}
\def\Zint{\MMM{\mathbb Z}}
\let\bbZ\Zint

\def\pfun{\MMM{\@p\rightarrow}}			% partial function, -|->
\def\fpfun{\MMM{\@f\rightarrow}}			% finite partial function, -||->
\def\bij{\MMM{\mathbin{{\surj}\llap{$\inj$}}}}	% bijection, >-->>
\def\finj{\MMM{\@f\inj}}					% finite partial injection, >-||->
\def\pinj{\MMM{\@p\inj}}				% partial injection, >-|->
\def\psurj{\MMM{\@p\surj}}				% partial surjection, -|->>
=TEX

Additional useful characters.

=SMLPLAIN LaTeX
\def\DoubleOPlus{\stackrel{\scriptscriptstyle\oplus}{\scriptscriptstyle\oplus}}
\def\BigSemicolon{\lower 0.47ex\vbox{\baselineskip=0pt\lineskip 0.25ex
		\hbox{$\scriptscriptstyle o$}%
		\hbox{$\scriptscriptstyle 9$}%
	}}
\def\Backslash{\MMM{\backslash}}
\def\LBrace{\MMM{\{}}
\def\RBrace{\MMM{\}}}
\def\Circumflex{\MMM{\mathchar"2362}}
\def\Twiddles{\MMM{\sim}}
=TEX

%********************************************************************

\subsection{Requesting Images of Characters}

On occasions all of the extended characters should be displayed as
themselves rather than their requesting various actions.

=SMLPLAIN LaTeX
\def\ShowScripts{%
	\let\CAN@text=\CANtext
	\let\DN@text=\DNtext
	\let\UP@text=\UPtext
	\let\DN@char=\DNchar
	\let\UP@char=\UPchar
	\let\UL@begin=\ULbegin
	\let\UL@end=\ULend
}
=TEX

=SMLPLAIN LaTeX
\def\ShowBars{%
	\let\H@Bar=\HBar
	\let\V@Bar=\VBar
	\let\Dbl@HBar=\DblHBar
}
=TEX

=SMLPLAIN LaTeX
\def\ShowBoxes{%
	\let\Big@Turnstile=\BigTurnstile
	\let\Start@ZGeneric=\StartZGeneric
	\let\Start@ZSchema=\StartZSchema
	\let\End@ZBox=\EndZBox
}

=SMLPLAIN LaTeX
\def\ShowAllImages{%
	\ShowScripts
	\ShowBars
	\ShowIndexing
	\ShowBoxes
}
=TEX

%********************************************************************

\subsection{Displaying Unknown Keywords}

=SMLPLAIN LaTeX
\def\UnknownKeyword#1{\fbox{\MMM{\%#1\%}}}
\def\MallFormedKeyword{\fbox{Mall Formed Keyword}}
=TEX

%********************************************************************

\subsection{The Extended Characters} \label{ExtendedChars}

By default each of these characters prints as its own image.  Within
the various environments some of these characters may be modified to
perform other tasks.  The macro names of the form `\verb|\Pr|$cal NN$''
are reserved for this section of the style file, macros that might be
altered in the environments {\em must\/} have functional names that can
be redefined.  Note that such names must not be enclosed in the
`\verb|\MMM{...}|'' in this section, if they were then they would have to
have properly balanced \TeX{} grouping symbols.

The warning message for unexpected extended characters is issued by
macro \verb|@moan|, as an alternative calling macro \verb|\NoMoaning|
suppresses the error message and inserts the hexadecimal code of the
character.

=SMLPLAIN LaTeX
\def\@moan#1{\fbox{0x##1}\errmessage{Unexpected extended character: 0X#1}}
=TEX

=SMLPLAIN LaTeX
\def\NoMoaning{\def\@moan##1{\fbox{0x##1}}}
=TEX

Most of the characters are straightforward, they are given with
\LaTeX{} comments indicating their purpose where the \LaTeX{} macro
they invoke does not clearly state the macros purpose.

Note that macros \verb|\PrIA| and \verb|\PrPP| correspond to the
character codes $128\sb{10}$ and $255\sb{10}$ respectively, these
are the first and last codes of the extended character set.

=SMLPLAIN LaTeX
\def\PrIA{\MMM{\subseteq}}		% subset or equal set
\let\PrIB=\rsub				% range anti-restrict
\def\PrIC{\MMM{\uplus}}			% bag union
\let\PrID=\Zuniv
\def\PrIE{\MMM{\Delta}}			% Greek
\def\PrIF{\MMM{\circ}}			% functional composition
\def\PrIG{\MMM{\Phi}}			% Greek
\def\PrIH{\MMM{\Gamma}}		% Greek
\def\End@ZBox{\@moan{88}}
\def\PrII{\End@ZBox}
\def\PrIJ{\DN@char}			% subscript one character
\def\PrIK{\MMM{\Theta}}		% Greek
\let\PrIL=\Zdcat				% Z distributed concatenation
\def\PrIM{\MMM{\Lambda}}		% Greek
\def\PrIN{\MMM{\in}}			% set membership
\def\PrIO{\MMM{\not\in}}		% set non-membership
\let\PrIP=\bij				% >-->>  bijection
\def\PrJA{\MMM{\Pi}}			% Greek
\def\PrJB{\Start@MLTerm}
\def\PrJC{\MMM{\rres}}			% range restriction
\def\PrJD{\MMM{\Sigma}}		% Greek
\def\PrJE{\Start@HOLType}
\def\PrJF{\MMM{\Upsilon}}		% Greek
\let\PrJG\Zbool			% booleans
\def\PrJH{\MMM{\Omega}}		% Greek
\def\PrJI{\MMM{\Xi}}			% Greek
\def\PrJJ{\MMM{\Psi}}			% Greek
\def\PrJK{\MMM{\emptyset}}
\def\PrJL{\UP@char}			% superscript one character
\def\PrJM{\Dbl@HBar}
\def\Start@ZGeneric{\@moan{9d}}
\def\PrJN{\Start@ZGeneric}
\let\PrJO=\finj				% >-||->  finite partial injection
\let\PrJP=\fpfun				% -||->  partial function
\def\PrKA{\MMM{\subset}}		% proper subset
\def\PrKB{\MMM{\cap}}			% set intersection
\def\PrKC{\MMM{\rangle}}		% tall right chevron
\def\PrKD{\MMM{\ominus}}
\def\PrKE{\MMM{\Leftrightarrow}}	% <==>  equivalence, iff
\def\PrKF{\MMM{\bigcap}}		% distributed intersection
\let\PrKG=\Zdef				% =^=  Z schema define
\def\PrKH{\MMM{\langle}}		% tall left chevron
\let\PrKI=\lrelimg				% (|  left relational image
\let\PrKJ=\rrelimg				% |)  right relational image
\def\PrKK{\MMM{\leftrightarrow}}	% <-->  binary relation
\def\PrKL{\MMM{\oplus}}			% circle with + inside
\def\PrKM{\Start@Term}			% left quine corner
\def\PrKN{\MMM{\rightarrow}}		% -->  function
\def\PrKO{\End@Term}			% right quine corner
\let\PrKP=\Zreal                        % real numbers
\def\PrLA{\End@Formal}			% filled square
\def\PrLB{\MMM{\land}}			% logical and
\def\PrLC{\MMM{\lor}}			% logical or
\def\PrLD{\MMM{\lnot}}			% logical not
\def\PrLE{\MMM{\Rightarrow}}		% ==>  implies
\def\PrLF{\MMM{\forall}}
\def\PrLG{\MMM{\exists}}
\def\PrLH{\MMM{\bullet}}		% fat dot
\def\PrLI{\MMM{\times}}			% X
\def\PrLJ{\Start@Formal}			% circle with s inside
\def\PrLK{\MMM{\DoubleOPlus}}	% twice: circles with + inside
\def\PrLL{\MMM{\BigSemicolon}}		% relational composition
\def\PrLM{\MMM{\leq}}			% less or equal
\def\PrLN{\MMM{\neq}}			% not equal
\def\PrLO{\MMM{\geq}}			% greater or equal
\let\PrLP\Zsym			% Schriftzeichen
\def\PrMA{\MMM{\cup}}			% set union
\def\PrMB{\MMM{\alpha}}		% Greek
\def\PrMC{\MMM{\beta}}			% Greek
\def\PrMD{\MMM{\sqsubseteq}}	% refined by
\def\PrME{\MMM{\delta}}		% Greek
\def\PrMF{\MMM{\epsilon}}		% Greek
\def\PrMG{\MMM{\phi}}			% Greek
\def\PrMH{\MMM{\gamma}}		% Greek
\def\PrMI{\MMM{\eta}}			% Greek
\def\PrMJ{\MMM{\iota}}			% Greek
\def\PrMK{\MMM{\theta}}		% Greek
\def\PrML{\MMM{\kappa}}		% Greek
\def\PrMM{\MMM{\lambda}}		% Greek
\def\PrMN{\MMM{\mu}}			% Greek
\def\PrMO{\MMM{\nu}}			% Greek
\let\PrMP=\psurj				% -|->>  partial surjection
\def\PrNA{\MMM{\pi}}			% Greek
\def\PrNB{\MMM{\chi}}			% Greek
\def\PrNC{\MMM{\rho}}			% Greek
\def\PrND{\MMM{\sigma}}		% Greek
\def\PrNE{\MMM{\tau}}			% Greek
\def\PrNF{\MMM{\upsilon}}		% Greek
\let\PrNG\Zcomplex			% complex numbers
\def\PrNH{\MMM{\omega}}		% Greek
\def\PrNI{\MMM{\xi}}			% Greek
\def\PrNJ{\MMM{\psi}}			% Greek
\def\PrNK{\MMM{\zeta}}			% Greek
=TEX

\label{IndexingMacros} Note the change in style here for the
indexing macros.  A request for indexing the word (say) {\tt word} will
appear in the source text as ``{\tt \hbox{\StartIndex
word\EndIndex}}'', it will be converted to
``\verb|\PrNL{}word\PrNN{}|'' by the sieving process.  Then the
\verb|\HOLindex| macro below will be invoked with the argument
``\verb|{}word|'', the redundant ``\verb|{}|'' is removed by
calling \verb|\expand@once| which discards an empty argument.
To catch most of the problems of unbalanced
indexing characters an unmatched open index will cause \TeX{} to
complain, an unmatched close index will call the \verb|\@moan{dd}|
macro.

These macros give the ``normal'' or default mode for indexing.

=SMLPLAIN LaTeX
\def\expand@once#1{#1}
\def\PrNL#1\PrNN{\HOLindex{\expand@once#1}}	% Start index
\def\PrNN{\@moan{dd}}					% End index
=TEX

In some formal environments the images of the indexing characters are
required.

=SMLPLAIN LaTeX
\def\ShowIndexing{%
	\let\PrNL=\StartIndex
	\let\PrNN=\EndIndex
}
=TEX

Note the slight change of ordering of the macros.

=SMLPLAIN LaTeX
\def\PrNM{\V@Bar}

\def\PrNO{\MMM{\bigcup}}
\let\PrNP=\pfun				% -|->  partial function
\def\PrOA{\MMM{\inj}}			% >-->
\let\PrOB=\dsub				% domain anti restriction
\def\PrOC{\MMM{\bot}}			% _|_  bottom
\def\PrOD{\MMM{\Leftarrow}}             % <== reverse implication
\def\PrOE{\MMM{\supset}}		% strict superset
\def\PrOF{\MMM{\supseteq}}		% superset or equal
\let\PrOG=\Zfset
\def\PrOH{\UP@text}			% start superscripting
\def\PrOI{\DN@text}			% start subscripting
\def\PrOJ{\MMM{\equiv}}			% triple-barred identity
\def\PrOK{\CAN@text}			% cancel super- or subscripting
\let\PrOL=\Zcat				% sequence concatenation
\def\PrOM{\MMM{\extract}}
\def\PrON{\MMM{\mapsto}}		% |-->  mapsto
\let\PrOO=\Znat
\def\PrOP{\MMM{\surj}}			% -->>  total surjection
\let\PrPA=\Zpset
\def\PrPB{\Start@ZTerm}
\def\PrPC{\MMM{\dres}}			% domain restriction
\let\PrPD=\Zrat				% rational numbers
\let\PrPE=\Zthm				% turnstile
\def\PrPF{\UL@begin}			% begin underlining
\def\PrPG{\UL@end}			% end underlining
=TEX

Note that as \verb|\Big@Turnstile| is likely to be redefined for other
purposes the line below must be a define not a let.

=SMLPLAIN LaTeX
\def\PrPH{\Big@Turnstile}
\let\PrPI=\Uminus			% unary minus
\let\PrPJ=\filter			% filter and project
\let\PrPK=\Zint
\let\PrPL=\lbag				% [[
\def\PrPM{\H@Bar}
\let\PrPN=\rbag				% ]]
\let\PrPO=\pinj				% >-|->  partial injection
\def\Start@ZSchema{\@moan{ff}}
\def\PrPP{\Start@ZSchema}
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{INDEXING}

Macro \verb|\HOLindex| makes an index entry for its parameter and
also causes it to be added, possibly emboldened, to the current list.
Macro \verb|\HOLindexEntry| makes an index entry for its parameter
but does not add it to the current list, it thus provides a clean way
to get all of the extended character and maths mode processing
provided by the \verb|\HOLindex| macro.
When creating an indexed item we want the quotes suppressed so
that something sensible is written to the index file.


=SMLPLAIN LaTeX
\def\HOLindexBold{\let\HOLindex@font=\bf}
\def\HOLindexPlain{\let\HOLindex@font=\relax}

\HOLindexBold
=TEX

=SMLPLAIN LaTeX
{\active@quotes
\gdef\suppress@quoteChars{%
	\def"{}%
	\def`{}%
}}
=TEX

It may useful to be able to turn of indexing over some blocks of text
even though the indexing macros (or extended characters) are still
used.

There is a strange feature of \LaTeX{} and its handling of
dollar~`\$'~signs.  This involves the macro \verb|\pdollar| which is
defined in file {\tt lfonts.tex}.  Because of this definition,
including a dollar sign in indexed text makes the \verb|edef| below
loop.  To circumvent this problem we delay the expansion of
\verb|\pdollar| with the \verb|\noexpand|, the text written to the
index then actually includes a call of \verb|\pdollar|.

=SMLPLAIN LaTeX
\def\HOLindexOff{\def\HOLindex@aux##1{\relax}}
\def\HOLindexOn{\def\HOLindex@aux##1{%
		\suppress@quoteChars
		\MMM{\def\${\noexpand\$}
			\edef\Temp{##1}\index{\Temp }}}}

\HOLindexOn
=TEX

=SMLPLAIN LaTeX
\def\HOLindex#1{{%
	\HOL@setchars
	\MMM{\HOLindex@font#1}%
	\HOLindex@aux{#1}%
}}
=TEX

=SMLPLAIN LaTeX
\def\HOLindexEntry#1{{%
	\HOL@setchars
	\HOLindex@aux{#1}%
}}
=TEX

Other macros for indexing may be found in section~\ref{IndexingMacros}
on page~\pageref{IndexingMacros}.

For convenience we supply a version of the \verb|\indexentry| macro and
a macro \verb|\printindex| for use when displaying the index.  They are
frequently used in two column mode.  These macros may be redefined by
the user.  Macro \verb|\printindex| assumes that the index has been put
into the file \verb|\jobname.sid|, after sorting or other processing.

=SMLPLAIN LaTeX
\def\indexentry#1#2{\@ftline
	{\hbox to\ft@width{$#1$\leaders\hbox to 0.5em{\hss.\hss}\hfill#2}}}

\def\printindex{\set@width\makeatletter\input{\jobname.sid}\makeatother}%
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{VARIOUS LATEX ENVIRONMENTS}

All of these environments provide for a label at the head of the
generated text.  In some cases the label is provided as an argument to
the \verb|begin{|environment\verb|}| command, in other cases a fixed
text is used.  To allow user tuning of the output these fixed texts may
be altered by redefining the following macros, note that their names
all finish with `{\tt label}'.

These labels should include a \verb|\strut| when they are long and the
environment includes a name.  For example: HOL labelled products have a
name (for the whole product) and Z~schemas have a name.  In the first
case the label extends rightwards across the name and so a
\verb|\strut| is needed.  In the second case the label is short so there
is no vertical clash betwen label and name.

=SMLPLAIN LaTeX
\def\HOLConstLabel{HOL Constant}
\def\HOLLabProdLabel{HOL Labelled Product\strut}
\def\MlLabel{ML}
\def\ZAxDesInformalLabel{Informal Z\strut}
\def\ZAxDesLabel{Z}
\def\ZGenericInformalLabel{Informal Z\strut}
\def\ZGenericLabel{Z}
\def\ZOtherInformalLabel{Informal Z\strut}
\def\ZOtherLabel{Z}
\def\ZSchemaInformalLabel{Informal Z\strut}
\def\ZSchemaLabel{Z}
=TEX

%********************************************************************

\subsection{Common Start and End Macros}

The macros \verb|\@StartFT| and \verb|\@endFT| invoke and
revoke the line control and special character facilities.

=SMLPLAIN LaTeX
\def\@StartFT{\begingroup
	\setbox\ft@strutbox\hbox{\vrule height.7\baselineskip
		depth.3\baselineskip width\z@}%
	\thinmuskip=0mu
	\medmuskip=0mu
	\thickmuskip=0mu
%	\offinterlineskip  % commented out because it may be screwing up footers
	\HOL@setchars
	\let\+=\@start
	\let\\=\@done
	\ignorespaces}

\newcount\endFT@penalty\endFT@penalty=0
\def\@endFT{\@zedfonts\endgroup\vskip\ftbelowboxskip\penalty\endFT@penalty
	\ignorespaces
}
=TEX

The more common formal text mode has toggling quotes.

=SMLPLAIN LaTeX
\def\@StartAqFT{\@StartFT\active@quotes\ignorespaces}
=TEX

Macro \verb|\prelim@label| provides the optional labelling to formal
texts.  The penalty stops page breaks between label and formal
text.

=SMLPLAIN LaTeX
\def\prelim@label#1{{\edef\t@mpa{#1}\def\t@mpb{}%
	\ifx\t@mpa\t@mpb
	\else	\@ftline{\tiny #1}%
		\penalty10000
		\kern 2pt
		\penalty10000
	\fi}}
=TEX


=IGN
\def\category#1{\ifcase\catcode`#1%
  0-escape\or 1-begingroup\or 2-endgroup\or 3-math\or
  4-align\or 5-endline\or 6-parameter\or 7-superscript\or
  8-subscript\or 9-ignored\or 10-space\or 11-letter\or
  12-otherchar\or 13-active\or 14-comment\or 15invalid\or
  \number{\catcode`#1}-unknown\fi}
=TEX


Macro \verb|\GFT@prelim| initialises general formal texts.

=SMLPLAIN LaTeX
\def\GFT@prelim#1{\par
	\set@width
	\UL@level=0
	\nointerlineskip
	\vskip\ftaboveboxskip
	\prelim@label{#1}%
	\let\Big@Turnstile=\crossbar
}
=TEX

%********************************************************************

\subsection{General Formal Text}

For general formal text using a single font and with a
user supplied label.

=SMLPLAIN LaTeX
\newenvironment{GFT}[1]{\GFT@prelim{#1}\@zedfonts\@StartAqFT}{\@endFT}
=TEX

Another general formal text environment where quotes are not
toggled.

=SMLPLAIN LaTeX
\newenvironment{GFTXQ}[1]{\GFT@prelim{#1}\@zedfonts\@StartFT}{\@endFT}
=TEX

Another general formal text environment where quotes are not toggled
and all the extended characters are shown as themselves, none have
special purposes.

=SMLPLAIN LaTeX
\newenvironment{GFTSHOW}[1]{%
	\GFT@prelim{#1}%
	\@zedfonts
	\ShowAllImages
	\@StartFT
}{\@endFT}
=TEX

Inline formal text provides the characters and spacing of the other
formal text environments but it is used within paragraphs.

=SMLPLAIN LaTeX
\newenvironment{INLINEFT}{%
	\@zedfonts
	\begingroup
	\setbox\ft@strutbox\hbox{\vrule height.7\baselineskip
		depth.3\baselineskip width\z@}%
	\let\+=\relax
	\let\\=\relax
	\UL@level=0
	\HOL@setcharsTab
	\active@quotes
	\@bmath
	\ignorespaces
}{%
	\unskip
	\@emath
	\@zedfonts
	\endgroup
}
=TEX


%********************************************************************

\subsection{ML Code}

Environment for ML code (for proofs, etc.)  This is where the font
changing mechanism comes into its own to distinguish HOL terms from
ML.

=SMLPLAIN LaTeX
\newenvironment{MLCode}{%
	\GFT@prelim{\MlLabel}%
	\@HOLfonts
	\@StartAqFT
}{\@endFT}
=TEX

%********************************************************************

\subsection{Z Environments}

%--------------------------------------------------------------------

\subsubsection{Schemas}

Draw a schema box.

%	----- #1 ------------------------
%	|
%	|
%	---------------------------------
%	|
%	|
%	---------------------------------

This may be used for generic schemas (by having the generic parameters
as part of the parameter).

Corrupts \verb|\@A|.

=SMLPLAIN LaTeX
\def\@schemaheader#1{%
	\nointerlineskip
	\@A=\dp\ft@strutbox \advance\@A by\lineskip % compute depth of ruler
	\@ftline{\hbox to \ft@width{\vrule height0.4pt depth\@A
		\hbox to 1em{\hrulefill}#1\hrulefill}}\penalty10000}

\def\@schemafooter{\@ftline{\raise 1ex \hbox to \ft@width{\vrule
	height\ht\ft@strutbox depth0pt\hrulefill}}}

\newenvironment{ZSchema}[1]{\par
	\GFT@prelim{\ZSchemaLabel}
	\@zedfonts
	\vertbartrue
	\@schemaheader{#1}%
	\@StartAqFT
}{\@schemafooter\@endFT}

\newenvironment{ZSchemaInformal}[1]{\par
	\GFT@prelim{\ZSchemaInformalLabel}%
	\@zedfonts
	\vertbartrue
	\@schemaheader{#1}%
	\@StartAqFT
}{\@schemafooter\@endFT}
=TEX

%--------------------------------------------------------------------

\subsubsection{Generic Constant}

Draw a generic box.

%	===== #1 ========================
%	|
%	|
%	---------------------------------
%	|
%	|
%	---------------------------------

Corrupts \verb|\@A|, \verb|\@line| and \verb|\@block|.

=SMLPLAIN LaTeX
\def\@genconstheader#1{
	\nointerlineskip
	\@A=\dp\ft@strutbox \advance\@A by\lineskip % compute depth of ruler
	\setbox\@block=\hbox{#1}
	\setbox\@line=\hbox{} \wd\@line=\wd\@block
	\setbox\@block=\hbox to \ft@width{\vrule height0.4pt depth\@A
		\hbox to 1em{\hrulefill}\lower 0.5ex \box\@block\hrulefill}
	\dp\@block=0pt
	\setbox\@line=\hbox to \ft@width{\vrule height0.4pt depth\@A
		\hbox to 1em{\hrulefill}\box\@line\hrulefill}
	\ht\@line=0.5ex
	\@ftline{\box\@block}\penalty10000\nointerlineskip
		\@ftline{\box\@line}\penalty10000}

\newenvironment{ZGenConst}[1]{%
	\GFT@prelim{\ZGenericLabel}%
	\@zedfonts
	\vertbartrue
	\@genconstheader{#1}%
	\@StartAqFT
}{\@schemafooter\@endFT}

\newenvironment{ZGenConstInformal}[1]{%
	\GFT@prelim{\ZGenericInformalLabel}%
	\@zedfonts
	\vertbartrue
	\@genconstheader{#1}%
	\@StartAqFT
}{\@schemafooter\@endFT}
=TEX

%--------------------------------------------------------------------

\subsubsection{Axiomatic Description}

This may be used for those constructs which are not defined in boxes,
e.g.: given type definitions, abbreviation definitions, etc.

=SMLPLAIN LaTeX 1326
\newenvironment{ZAxDes}{\par
	\GFT@prelim{\ZAxDesLabel}%
	\@zedfonts
	\vertbartrue
	\@StartAqFT
}{\@endFT}
=TEX

=SMLPLAIN LaTeX 1326
\newenvironment{ZAxDesInformal}{\par
	\GFT@prelim{\ZAxDesInformalLabel}%
	\@zedfonts
	\vertbartrue
	\@StartAqFT
}{\@endFT}
=TEX

%--------------------------------------------------------------------

\subsubsection{Other Z Paragraphs}

This is for given set definitions etc.

=SMLPLAIN LaTeX
\newenvironment{ZOther}{\par
	\GFT@prelim{\ZOtherLabel}%
	\@zedfonts
	\@StartAqFT
}{\@endFT}
=TEX

=SMLPLAIN LaTeX
\newenvironment{ZOtherInformal}{\par
	\GFT@prelim{\ZOtherInformalLabel}%
	\@zedfonts
	\@StartAqFT
}{\@endFT}
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\subsection{HOL Environments}

%--------------------------------------------------------------------

\subsubsection{Constants}

=SMLPLAIN LaTeX
\newenvironment{HOLConst}{%
	\GFT@prelim{\HOLConstLabel}
	\@zedfonts
	\@StartAqFT
}{%
	\@endFT}
=TEX

%--------------------------------------------------------------------

\subsubsection{Labelled Products}

=SMLPLAIN LaTeX
\newenvironment{HOLLabProd}[1]{\par
	\GFT@prelim{\HOLLabProdLabel}
	\@zedfonts
	\vertbartrue
	\@schemaheader{#1}%
	\@StartAqFT
}{\@schemafooter\@endFT}
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{HELP DOCUMENTATION}

Some formal and narrative text, particularly that within project
documents in the ``{\tt dtd}'' series, is set displayed within a large
box, this is known as the ``help documentation'' format.  There is no
particular science in the fraction of \verb|\textwidth| used below, the
chosen value seems to fill most of the page width without giving
overfull box messages.

=SMLPLAIN LaTeX
\newenvironment{HELPDOC}{%
	\vskip-\lastskip
	\vskip\ftaboveboxskip
	\vbox\bgroup
		\hrule
		\hbox to \textwidth\bgroup
			\vrule
			\hfill
			\strut
			\begin{minipage}[b]{0.97\textwidth}%
				\advance\parskip by 0.5\baselineskip
				\parindent 0pt
				\ftbelowboxskip=0pt
				\vskip -\abovedisplayskip
				\vskip 2pt
				\def\paragraph{\@startsection
					{paragraph}{4}{\z@}% % name, level, indent
					{0pt plus 3pt minus 3pt}% % beforeskip
					{-1em}% % afterskip
					{\normalsize\bf}}% % style
}{%
				\vskip 1pt
			\end{minipage}%
			\hfill
			\vrule
		\egroup % \hbox to \textwidth\bgroup
		\hrule
	\egroup % \vbox\bgroup
	\vskip\ftbelowboxskip
}
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{RULES}

The rule environment is used for displaying rules, conversions, tactics
and similar structures.  These are distinguished by having three main
parts, conventionally the asumptions, the conclusions, and the name.
They are displayed thus:

%%		asumptions
%%		-----------   name
%%		conclusions

=FRULE 1 label
name
├
asumptions
├
conclusions
=TEX

Each of the three parts may have multiple lines.  The name part is
always aligned with the horizontal line.  There may be one or two
horizontal lines.  Additionally, each structure may be labelled.

The \LaTeX{} input for rules is as follows: (note that {\tt sieve} via
and {\tt doctex} would normally be used to form this input, also that
`{\tt@}'' characters must be of letter category):

=GFTSHOW
	\begin{FRULE}{C}{label}
	\+name
	\Big@Turnstile
	\+asumptions
	\Big@Turnstile
	\+conclusions
	\end{FRULE}
=TEX

\begin{tabular}{lll}
Where	& {\tt FRULE}	& name of the LaTeX environment\\
	& {\tt C}	& number of horizontal lines, either 1 or 2\\
	& {\tt label}	& title to be printed above the
				rule, no title if empty\\
\end{tabular}

Each of the three parts (i.e., `{\tt name}' `{\tt asumptions}' and
`{\tt conclusions}') are formatted according to the usual style of
formal text, i.e., lines beginning `\verb|\+|' and ending `\verb|\\|'
etc.  The lines may contain TAB characters, these are processed in the
same manner as TABs in other formal text environments.  Note that as
each line is centered individually the tabbing may not line up as
expected.

Options and special cases.

\begin{itemize}

\item Each line of text in the asumptions and the conclusions is
	normally centered with respect to the horizantal lines.  The
	text may be left justified by invoking the macro
	`\FruleLeftJustify', it has no parameters.  This is useful when
	the text requires lining up with the use of TAB characters.

\item If only one `\verb|\Big@Turnstile|' is given, then the assumptions
	part is assumed to have been omitted.  A warning message will
	be written to the \LaTeX{} log.

\item If no calls of `\verb|\Big@Turnstile|' are found a warning message is
	given.

\item Excess calls of `\verb|\Big@Turnstile|' are ignored, with a warning
	message.

\end{itemize}

=SMLPLAIN LaTeX
\newenvironment{FRULE}[2]{\def\FR@PName{#2}\@beginFrule{#1}}{\@endFrule}

\def\FruleLeftJustify{\let\FR@Centering=\relax}
=TEX

Three boxes are used to collect the three parts of the {\tt FRULE} environment.

=SMLPLAIN LaTeX
\newbox\FR@Name
\newbox\FR@Above
\newbox\FR@Below
=TEX

They are set in formal text lines of less than the normally available
size, `\verb|\FR@FullFtwidth|' records the full size for use when
assembling the whole structure.

=SMLPLAIN LaTeX
\newdimen\FR@FullFtwidth
=TEX

The LHS and RHS parts of rules are normally set to 0.45 of the line
available space, that is the line width less the space for margins as
held in \verb|\ftlmargin| and \verb|\ftrmargin|.
These proportions may be altered by redefining the following macros.

=SMLPLAIN LaTeX
\def\FruleLeftWidth{0.45\FR@FullFtwidth}
\def\FruleRightWidth{0.45\FR@FullFtwidth}
=TEX

The left hand portion of the structure (the asumptions,
horizontal lines and conclusions) are gathered in a box.

=SMLPLAIN LaTeX
\newbox\FR@LHS
=TEX

The baseline of the name part needs to be raised to where the
horizontal lines are placed, the distance is calculated here.

=SMLPLAIN LaTeX
\newdimen\FR@RhsRaise
=TEX

Only 1 or 2 horizontal lines are allowed, need some error messages for
any other value.  \TeX{} will complain if a non-numeric value is used.

=SMLPLAIN LaTeX
\newhelp\FR@Help{Only single and double lines are
	allowed.  Continuing with a single line.}

\def\FR@Moan{\errhelp=\FR@Help\errmessage
	{FRULE: lines wanted neither 1 nor 2.}}

\def\FR@MoanCrossbar{\typeout{Warning, unexpected BigTurnstile at
	line \the\inputlineno\space  has been ignored.}}
=TEX

For the second horizontal line.

=SMLPLAIN LaTeX
\def\FR@Double{\kern 2pt\hrule}
\let\FR@Centering=\hfill
=TEX

These next three macros `\verb|\FR@FormalText|' `\verb|\FR@Done|' and
`\verb|\FR@EndFormalText|' are closely based on the macros
`\verb|\@StartAqFT|' `\verb|\@done|' and `\verb|\@endFT|'
respectively.  The differences are primarily that: a short vertical
line is not wanted on the LHS of each of the lines in an {\tt FRULE}
environment, so changes lead to \verb|\FR@FormalText|' and
`\verb|\FR@Done|'; and, the end of a section of the {\tt FRULE}
environment does not indicate end of the whole formal text, hence
changes leading to `\verb|\FR@EndFormalText|'.

Used at the start of each of the three sections:

=SMLPLAIN LaTeX
\def\FR@FormalText{\begingroup
	\HOL@setchars
	\let\+=\@start
	\let\\=\FR@Done
	\active@quotes
	\ignorespaces}
=TEX

Used at the end of each line of formal text in formal rules:

=SMLPLAIN LaTeX
\def\FR@Done{\conclude@line\FR@Emit}

\def\FR@Emit{%
	\hbox to \ft@width{\FR@Centering
		\unhcopy\ft@strutbox
		\unhbox\@line
		\hfill}%
	\penalty \ftlinepenalty
	\ignorespaces}
=TEX

Used at the end of each of the three sections:

=SMLPLAIN LaTeX
\def\FR@EndFormalText{\@zedfonts\endgroup}
=TEX

At the start of the {\tt FRULE} environment macro `\verb|\@beginFrule|'
are initialises various items, then lines are collected into the name
box `\verb|\FR@Name|'.  The argument to `\verb|\@beginFrule|' is the
number of horizontal lines~(1 or~2) wanted.  At the first
`\verb|\Big@Turnstile|' the macro that completes the name box and starts the
asumption box is processed, this macro is named
`\verb|\FR@NameToAbove|' to indicate the transition from name part to
asumption part.  Similarly, at the second `\verb|\Big@Turnstile|' the macro
that completes the asumption box and starts the conclusion box is
processed.  At the `\verb|\end{FRULE}|' the conclusion box is
completed, then all the components are assembled into a box for
output.  The presence of a `\verb|\Big@Turnstile|' means that the next box
register will be set up with at least an empty vbox, by contrast,
omitting the `\verb|\Big@Turnstile|' will mean that the box register is left
void (i.e., in its initial state after declaration, or as emptied by
its use in the previous {\tt FRULE}).

=SMLPLAIN LaTeX
\def\@beginFrule#1{%
	\bgroup
	\ifcase#1	\FR@Moan\let\FR@Lines=\relax
	\or		\let\FR@Lines=\relax
	\or		\let\FR@Lines=\FR@Double
	\else		\FR@Moan\let\FR@Lines=\relax
	\fi

	\set@width
	\nointerlineskip
	\vskip\ftaboveboxskip
	\FR@FullFtwidth=\ft@width
	\ft@width=\FruleRightWidth\relax

	\let\Big@Turnstile=\FR@NameToAbove

	\@zedfonts
	\setbox\FR@Name=\vbox\bgroup
		\let\FR@Centering=\relax
		\FR@FormalText
}
=TEX

The \cs\egroup{} Completes box containing \verb|\FR@Name|.

=SMLPLAIN LaTeX
\def\FR@NameToAbove{%
		\FR@EndFormalText
	\egroup
	\ft@width=\FruleLeftWidth\relax
	\let\Big@Turnstile=\FR@AboveToBelow
	\setbox\FR@Above=\vbox\bgroup
		\FR@FormalText
}
=TEX

The \cs\egroup{} Completes box containing \verb|\FR@Above|.

=SMLPLAIN LaTeX
\def\FR@AboveToBelow{%
		\FR@EndFormalText
	\egroup
	\let\Big@Turnstile=\FR@MoanCrossbar
	\setbox\FR@Below=\vbox\bgroup
		\FR@FormalText
}
=TEX

Macro `\verb|\@endFrule|' closes the last box then assembles
the components to be output.
The \cs\egroup{} completes the box containing \verb|\FR@Below|.

=SMLPLAIN LaTeX
\def\@endFrule{%
		\FR@EndFormalText
	\egroup

	\ifvoid\FR@Below
		\typeout{Warning, insufficient BigTurnstiles in FRULE
			finishing on line \the\inputlineno.}
		\setbox\FR@Below\box\FR@Above
	\fi
	{%
		\def\t@mpb{}
		\ifx\FR@PName\t@mpb
		\else
			\moveright\ftlmargin
			\hbox{\tiny \FR@PName}
			\penalty10000
		\fi
	}%
=TEX

Calculate how much to raise the name box so that its centre is beside
the horizantal rules.  It may be thought necessary to raise the box a
little higher, to accomodate the horizantal rules.  In practice this is
a very small amount, and the box is already a little high

=SMLPLAIN LaTeX
	\FR@RhsRaise=\ht\FR@Below

	\setbox\FR@LHS=\vbox{%
		\box\FR@Above
		\hrule width \ft@width
		\FR@Lines
		\box\FR@Below}

	\moveright\ftlmargin
	\hbox{\vrule\kern 0.05\FR@FullFtwidth
		\box\FR@LHS
		\kern 0.05\FR@FullFtwidth
		\raise \FR@RhsRaise\hbox{%
			$\vcenter{\box\FR@Name}$%
		}%
	}%

	\egroup
	\vskip\ftbelowboxskip\penalty0
}
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{THEORY LISTINGS}

Theory listings are formed from several blocks of text each of which is
a table with two or more columns.  The first column is a label or name
for the entry.  The other columns hold the body of the entry.  We set
things in fixed width columns so that all the blocks of text show the
same shape.  It is the responsibility of the user of this environment
to ensure that the table entries are not overfilled, doing so may cause
overprinting of one entry with another.

=SMLPLAIN LaTeX
\newdimen\@oldtabstop
\newenvironment{thlist}{%
	\vertbarfalse
	\GFT@prelim{}%
	\@zedfonts
        \@oldtabstop=\tabstop
	\let\@oldstart=\@start
	\let\@oldmore=\@more
	\def\@start{\tabstop=1.2in\@oldstart}
	\def\@more{\@spit\tabstop=\@oldtabstop\@chew}
	\@StartFT
	\ftlinepenalty=9999
}{\@endFT}
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newpage
\section{HYPERTEXT SUPPORT FOR THE COMPLIANCE TOOL}
The macros defined below are used to introduce hypertext directives into a $.dvi$ file so that when the $.dvi$ file is viewed with dvi hypertext viewer (e.g., $xhdvi$), the hypertext links can be followed.

The macros defined below are provided primarily for the convenience of the Compliance Tool.

The style file such as $hyperbasics$ is required to provide the appropriate definitions of $href$ and $hname$.


=SMLPLAIN LaTeX
\def\@marginalium{\relax}
\def\@ftline#1{%
	\moveright\ftlmargin
	\hbox to \ft@width{#1\hfill\@marginalium}
	}%

\def\FTRightMargin#1{%
	\gdef\@marginalium{%
		\MMM{#1}
		\gdef\@marginalium{\relax}
	}%
}%

\def\FTHyperRefSocket#1{%
	\FTRightMargin{%
		\href{plug#1}{
			\hname{socket#1}{\Longrightarrow}
		}%
	}%
}%

\def\FTHyperRefPlug#1{%
	\href{socket#1}{%
		\hname{plug#1}{\Longleftarrow}
	}%
}%
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newpage
\section{MISCELLANEOUS}

\subsection{Samepage}

The \LaTeX{} \verb|\samepage| macro set various penalties to prevent
line breaking.  The penalties which are defined in this file
and should be included.

=SMLPLAIN LaTeX
\let\save@samepage=\samepage

\def\samepage{\save@samepage
	\ftlinepenalty=\@M
	\endFT@penalty=\@M
}
=TEX

\subsection{Underscores}

Some documents want underscores to have their normal \TeX{} meaning,
i.e., as subscription.  Other documents want underscores to print as
themselves.

Macro \verb|\underscoreoff| makes underscore a normal character,
and \verb|\underscoreon| restores its usual \TeX{} meaning.

=SMLPLAIN LaTeX
{\catcode`\_=\active
\gdef\underscoreoff{\catcode`\_=\active \let_=\_}
\gdef\underscoreon{\catcode`\_=8}
}
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newpage
\section{EXTENDED CHARACTER IMAGES}

For completeness we give a table showing all of the extended characters
and their hexadecimal value using both conventional hexadecimal digits
and the \LaTeX{} codes used.

\bigskip

\newbox\AllChars
\newbox\ColA
\newbox\ColB
\newbox\ColC

\newdimen\ColHeight
\parsep 0pt plus 5pt

\def\SHOWIT#1#2#3{\hbox{\hbox to 4ex{#1\hfil}\hbox to 6ex{#2\hfil}#3}\par}

\def\COLHEAD{\SHOWIT{\hfill Val}{ue}{Char}\bigskip\ignorespaces}

\makeatletter
\def\@moan#1{--spare--}
\makeatother

\setbox\AllChars=\vbox{{
	\makeatletter
	\ShowAllImages
	\makeatother
	\SHOWIT{80}{IA}{\PrIA}
	\SHOWIT{81}{IB}{\PrIB}
	\SHOWIT{82}{IC}{\PrIC}
	\SHOWIT{83}{ID}{\PrID}
	\SHOWIT{84}{IE}{\PrIE}
	\SHOWIT{85}{IF}{\PrIF}
	\SHOWIT{86}{IG}{\PrIG}
	\SHOWIT{87}{IH}{\PrIH}
	\SHOWIT{88}{II}{\PrII}
	\SHOWIT{89}{IJ}{\PrIJ}
	\SHOWIT{8a}{IK}{\PrIK}
	\SHOWIT{8b}{IL}{\PrIL}
	\SHOWIT{8c}{IM}{\PrIM}
	\SHOWIT{8d}{IN}{\PrIN}
	\SHOWIT{8e}{IO}{\PrIO}
	\SHOWIT{8f}{IP}{\PrIP}
	\SHOWIT{90}{JA}{\PrJA}
	\SHOWIT{91}{JB}{\PrJB}
	\SHOWIT{92}{JC}{\PrJC}
	\SHOWIT{93}{JD}{\PrJD}
	\SHOWIT{94}{JE}{\PrJE}
	\SHOWIT{95}{JF}{\PrJF}
	\SHOWIT{96}{JG}{\PrJG}
	\SHOWIT{97}{JH}{\PrJH}
	\SHOWIT{98}{JI}{\PrJI}
	\SHOWIT{99}{JJ}{\PrJJ}
	\SHOWIT{9a}{JK}{\PrJK}
	\SHOWIT{9b}{JL}{\PrJL}
	\SHOWIT{9c}{JM}{\PrJM}
	\SHOWIT{9d}{JN}{\PrJN}
	\SHOWIT{9e}{JO}{\PrJO}
	\SHOWIT{9f}{JP}{\PrJP}
	\SHOWIT{a0}{KA}{\PrKA}
	\SHOWIT{a1}{KB}{\PrKB}
	\SHOWIT{a2}{KC}{\PrKC}
	\SHOWIT{a3}{KD}{\PrKD}
	\SHOWIT{a4}{KE}{\PrKE}
	\SHOWIT{a5}{KF}{\PrKF}
	\SHOWIT{a6}{KG}{\PrKG}
	\SHOWIT{a7}{KH}{\PrKH}
	\SHOWIT{a8}{KI}{\PrKI}
	\SHOWIT{a9}{KJ}{\PrKJ}
	\SHOWIT{aa}{KK}{\PrKK}
	\SHOWIT{ab}{KL}{\PrKL}
	\SHOWIT{ac}{KM}{\PrKM}
	\SHOWIT{ad}{KN}{\PrKN}
	\SHOWIT{ae}{KO}{\PrKO}
	\SHOWIT{af}{KP}{\PrKP}
	\SHOWIT{b0}{LA}{\PrLA}
	\SHOWIT{b1}{LB}{\PrLB}
	\SHOWIT{b2}{LC}{\PrLC}
	\SHOWIT{b3}{LD}{\PrLD}
	\SHOWIT{b4}{LE}{\PrLE}
	\SHOWIT{b5}{LF}{\PrLF}
	\SHOWIT{b6}{LG}{\PrLG}
	\SHOWIT{b7}{LH}{\PrLH}
	\SHOWIT{b8}{LI}{\PrLI}
	\SHOWIT{b9}{LJ}{\PrLJ}
	\SHOWIT{ba}{LK}{\PrLK}
	\SHOWIT{bb}{LL}{\PrLL}
	\SHOWIT{bc}{LM}{\PrLM}
	\SHOWIT{bd}{LN}{\PrLN}
	\SHOWIT{be}{LO}{\PrLO}
	\SHOWIT{bf}{LP}{\PrLP}
	\SHOWIT{c0}{MA}{\PrMA}
	\SHOWIT{c1}{MB}{\PrMB}
	\SHOWIT{c2}{MC}{\PrMC}
	\SHOWIT{c3}{MD}{\PrMD}
	\SHOWIT{c4}{ME}{\PrME}
	\SHOWIT{c5}{MF}{\PrMF}
	\SHOWIT{c6}{MG}{\PrMG}
	\SHOWIT{c7}{MH}{\PrMH}
	\SHOWIT{c8}{MI}{\PrMI}
	\SHOWIT{c9}{MJ}{\PrMJ}
	\SHOWIT{ca}{MK}{\PrMK}
	\SHOWIT{cb}{ML}{\PrML}
	\SHOWIT{cc}{MM}{\PrMM}
	\SHOWIT{cd}{MN}{\PrMN}
	\SHOWIT{ce}{MO}{\PrMO}
	\SHOWIT{cf}{MP}{\PrMP}
	\SHOWIT{d0}{NA}{\PrNA}
	\SHOWIT{d1}{NB}{\PrNB}
	\SHOWIT{d2}{NC}{\PrNC}
	\SHOWIT{d3}{ND}{\PrND}
	\SHOWIT{d4}{NE}{\PrNE}
	\SHOWIT{d5}{NF}{\PrNF}
	\SHOWIT{d6}{NG}{\PrNG}
	\SHOWIT{d7}{NH}{\PrNH}
	\SHOWIT{d8}{NI}{\PrNI}
	\SHOWIT{d9}{NJ}{\PrNJ}
	\SHOWIT{da}{NK}{\PrNK}
	\SHOWIT{db}{NL}{\PrNL}
	\SHOWIT{dc}{NM}{\PrNM}
	\SHOWIT{dd}{NN}{\PrNN}
	\SHOWIT{de}{NO}{\PrNO}
	\SHOWIT{df}{NP}{\PrNP}
	\SHOWIT{e0}{OA}{\PrOA}
	\SHOWIT{e1}{OB}{\PrOB}
	\SHOWIT{e2}{OC}{\PrOC}
	\SHOWIT{e3}{OD}{\PrOD}
	\SHOWIT{e4}{OE}{\PrOE}
	\SHOWIT{e5}{OF}{\PrOF}
	\SHOWIT{e6}{OG}{\PrOG}
	\SHOWIT{e7}{OH}{\PrOH}
	\SHOWIT{e8}{OI}{\PrOI}
	\SHOWIT{e9}{OJ}{\PrOJ}
	\SHOWIT{ea}{OK}{\PrOK}
	\SHOWIT{eb}{OL}{\PrOL}
	\SHOWIT{ec}{OM}{\PrOM}
	\SHOWIT{ed}{ON}{\PrON}
	\SHOWIT{ee}{OO}{\PrOO}
	\SHOWIT{ef}{OP}{\PrOP}
	\SHOWIT{f0}{PA}{\PrPA}
	\SHOWIT{f1}{PB}{\PrPB}
	\SHOWIT{f2}{PC}{\PrPC}
	\SHOWIT{f3}{PD}{\PrPD}
	\SHOWIT{f4}{PE}{\PrPE}
	\SHOWIT{f5}{PF}{\PrPF}
	\SHOWIT{f6}{PG}{\PrPG}
	\SHOWIT{f7}{PH}{\PrPH}
	\SHOWIT{f8}{PI}{\PrPI}
	\SHOWIT{f9}{PJ}{\PrPJ}
	\SHOWIT{fa}{PK}{\PrPK}
	\SHOWIT{fb}{PL}{\PrPL}
	\SHOWIT{fc}{PM}{\PrPM}
	\SHOWIT{fd}{PN}{\PrPN}
	\SHOWIT{fe}{PO}{\PrPO}
	\SHOWIT{ff}{PP}{\PrPP}
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

=IGNORE

\newpage

\makeatletter
\def\refstepcounter#1{\stepcounter{#1}\global\edef\@currentlabel{\csname
	p@#1\endcsname\csname the#1\endcsname}}
\makeatother

\twocolumn[\section{INDEX}] \label{Index}

\footnotesize
\printindex

\onecolumn

=TEX

\end{document}

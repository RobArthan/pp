/*******************************************************************************
imp096.doc: this file is part of the PPTex system

Copyright (c) 2002 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
*******************************************************************************/
/* $Id: imp096.doc,v 1.29 2009/09/06 14:50:50 rda Exp rda $

=TEX
% $Id: imp096.doc,v 1.29 2009/09/06 14:50:50 rda Exp rda $
\documentstyle[11pt,TQ,hol1]{article}

\TPPtitle{Sieve and Findfile Utilities}
\TPPref{DS/FMU/IED/IMP096}

=IGNORE

copy a version of sieve from ~ied/sun4bin,
  cp ~ied/sun4bin/sieve .

using a texteditor extract the imp096.sieveview file

to get a new copy of imp096.sieveview
  sieve -f imp096.sieveview -K sieveview < imp096.doc > imp096.sieveview.new

compare the old and new copies
  diff imp096.sieveview imp096.sieveview.new

undate imp096.sieveview
  mv imp096.sieveview.new imp096.sieveview

to extract the C source for sieve
  sieve -f imp096.sieveview -K sieve_prog < imp096.doc > sieve.c

and compile it, using GCC
  gcc -o sieve.new sieve.c
  mv sieve.new ~ied/solaris2bin/sieve

to extract the C source for findfile
  sieve -f imp096.sieveview -K findfile_prog < imp096.doc > findfile.c

and compile it, using GCC
  gcc -o findfile.new findfile.c
  mv findfile.new findfile

=IGNORE

Getting the C comments correct at the top of the file is tricky.  The
file must start with a comment so that it may be read by the C
compiler.  This opening comment is ignored by all of the views.  If we
have a second start of comment symbol here which is copied into all the
C code views then that comment symbol will be ignored when compiling
the whole file.  Later in the file we have an end of comment that
concludes whichever symbol was the real second start of comment.

=CALWAYS
/* From: imp096.doc   @(#) 94/04/06 1.3 imp096.doc

=TEX

\TPPissue{\VCVersion}
\TPPdate{\FormatDate{\VCDate}}
\TPPproject{FST}

\TPPstatus{Draft}
\TPPtype{Literate Script}
\TPPkeywords{HOL}
\TPPauthor{A.J. Hammon & WIN01}  %% Mandatory field
\TPPauthorisation{R.D.~Arthan & FST Team Leader}
\TPPabstract{This document contains the implementation of the
	{\tt sieve} program which is part of the
	document processing system for ICL HOL for use under
	Solaris 2.}
\TPPdistribution{\parbox[t]{4.0in}{%
	Library
}}

\ftlinepenalty=9999
\makeindex

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\catcode`\_=\active
\def\_{\kern.06em\vbox{\hrule height.1ex width.3em}\hskip0.1em\relax}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\begin{document}
\makeTPPfrontpage
\vfill
\begin{center}
\bf Copyright \copyright\ : Lemma 1 Ltd. \number\year
\end{center}

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

\item[Previous work]
	The code in this document is copied from \cite{DS/FMU/IED/IMP053},
	and had been changed to compile using GCC 2.5.

\item[issue 1.1 ] Initial draft.
\item[Issue 1.4 (1999/04/21)] For V0.9.1 of {\Product}
\item[Issue 1.6 (2000/07/05)] Made more portable for V0.9.2 of {\Product}
\item[Issue 1.7 (2000/10/03)] Fixed bug that made `-d 2' option crash on Solaris.
\item[Issue 1.8 (2000/11/20)] Symbols for reals, reverse implication now supported.
\item[Issues 1.9 (2001/11/27), 1.10 (2001/12/02)] Added new conditional facility and allow lines beginning with an
equals sign followed by a space.
\item[Issue 1.11 (2002/10/17)] Copyright and banner updates for open source release.
\item[Issue 1.12 (2002/10/17)] PPTex-specific updates for open source release
\item[Issue 1.13 (2003/03/17)] Removed use of {\tt sys\_nerr} (not in FreeBSD).
\item[Issue 1.14 (2003/06/11)] Changes to allow dynamic linking.
\item[Issue 1.15 (2003/07/28), 1.16 (2003/07/29)] Can now specify regular expressions defining {\TeX} arguments.
\item[Issue 1.17 (2003/07/29), 1.18 (2003/07/29)] Corrected copyright statements.
\item[Issues 1.19 (2004/01/23)--1.23 (2004/01/24)] Implemented the -r option to findfile for out-of-the-box running.
\item[Issue 1.24 (2004/01/24)] Tidy-up for use in xpp. Rationalised use of static in function definitions, although
it would be nicer, later, to make more use of it rather than less.
\item[Issues 1.25 (2004/01/25), 1.26 (2004/01/25)] Now uses PPETCPATH rather than PATH as the environment variable to find steering files.
\item[Issue 1.27 (2004/01/26)] Other than when used with the -r option, findfile now looks for regular files only.
\item[Issue 1.28 (2009/09/05)] Addressed all warnings from {\tt gcc} for {\tt x86\_64}.
\item[Issue 1.29 (2009/09/06)] Tidy up to remove all warnings from {\tt gcc}
\item[Issue 1.30 (2010/08/14)] Cygwin port.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.
\item[2016/09/17]
Allowed for problem with {\tt unistd.h} header file under new versions of {\tt clang}.
%%%% END OF CHANGES HISTORY %%%%
\end{description}

%********************************************************************

\subsection{Changes Forecast}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************************************************************
%--------------------------------------------------------------------

\newpage

\section{GENERAL}

%********************************************************************

\subsection{Scope}

This document contains the implementation of the {\tt sieve} and {\tt
findfile} utility programs and of some `C' functions whose
detailed design is in~\cite{DS/FMU/IED/DTD096}.

%********************************************************************

\subsection{Introduction}

\subsubsection{Purpose and Background}

Most of the master source texts on the FST project are held in
``document'' files that contain a mixture of narrative text, \LaTeX{}
commands and program text written in various languages.  This document
is an example, it contains narrative, C~language program code and a
small amount of other text.  The purpose of the {\tt sieve} program,
which is the major part of this document, is to sieve out (also
termed: strip out) various parts of the document for various purposes.
This sieving obtains a particular ``view'' of the document; these
include the view that \LaTeX{} needs when formatting the document, the
C~view needed when compiling, and so on.

\subsubsection{Dependencies}

Compilation uses the C compiler, the programs assume a Unix operating system.

%--------------------------------------------------------------------

\subsubsection{Interface}

Full details of the interfaces to these programs and functions
are given in the user document for the document processing
system~\cite{DS/FMU/IED/USR001}.

%--------------------------------------------------------------------

\subsubsection{Possible Enhancements}

Rationalize the string lookup functions.  There are several tables of
keywords maintained by {\tt sieve} and each has its own search
protocol: some are sorted and use a binary search; others are sorted and
use a sequential search until a larger value is found; others are
unordered and use a sequential search.

Improve (i.e., reduce) the set of options offered by the {\tt cat} action.

%--------------------------------------------------------------------

%\subsubsection{Deficiencies}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newpage
\section{STRUCTURE OF THIS DOCUMENT}

This file is intended to be compiled directly by a C compiler, to that
end it uses none of the special features of the extended character set
that it supports.  The actual source text of this document makes
careful use of the facilities of the sieving process so that all of
the documentation and the ``equals category'' directives are within C
comments.  The file contains two functions called {\tt main} one for
each program, the {\tt main} function for {\tt findfile} is enclosed in
a C comment so that is not compiled as part of {\tt sieve}, it is
also enclosed in directives so that it may be extracted to create the
{\tt findfile} program.
C code for handling utf-8 and UNICODE is also included and separately
extracted so that it may be used also in xpp, and is also enclosed in
comments so that it is ignored when this source is compiled as C, and
later extracted by sieve.
The first version of this is extracted by a version of sieve which does
not support utf8, and is then added to the repository so that it does
not need to be extracted for first compilation of sieve.
When this code is amended, it is important to check that sieve is
working OK before comitting the new version into the repository.

Full processing of the file holding the source text of this document
requires a view file which contains the text in
section~\ref{DocSieveFile} below.  This text is arranged so that it
may be extracted from the document via the {\tt sieveview} view, but
note that the initial bootstrapping requires an editor.  The text is
arranged so that the following {\tt sed} command will extract the
view file (note, the last edit removes a single leading tab character).

\begin{verbatim}
        sed -e '/^# imp096.sieveview/,/^# end of imp096.sieveview/!d' \
                -e 's/^	//' \
                imp096.doc > imp096.sieveview
\end{verbatim}

When the sieve program is available a copy of the {\tt
imp096.sieveview} following may be obtained with the commands.

\begin{verbatim}
        sieve -f imp096.sieveview -K sieveview \
                imp096.doc > imp096.sieveview.new
        mv imp096.sieveview.new imp096.sieveview
\end{verbatim}


\subsection{The View File For This Document} \label{DocSieveFile}

A view file is needed to process the this document for printing and
for extracting the various~`C'~programs.  The complex nature of this
document means, unfortunately, that the view file used for the rest of
the project is not appropriate.  It would be possible to add the
necessary sieving categories to the general file, but that would
clutter it up for the sake of this document.

This document has the following textual categories.

\begin{description}

\item{TEX} for the documentation.

\item{SIEVEFILE} for the view file needed to extract the various parts
	of this document.

\item{SIEVE_PROG} for the {\tt sieve} program.

\item{UTF8_MODULE} for a module of unicode/utf8 facilities shared with xpp..

\item{FINDFILE_PROG} for the {\tt findfile} program.

\item{FIND_FILE_FUN} for the {\tt find_file} function.

\item{IGNORE} for text that is ignored by all the views, most of this text
	is C comments.

\item{CALWAYS} for adding C code to all C views.

\end{description}

The following views are used.

\begin{description}

\item{tex} for creating the ``{\tt.tex}'' file for printing.

\item{sieveview} to extract the file {\tt imp096.sieveview}.

\item{sieve_prog} to extract the {\tt sieve} program.

\item{findfile_prog} to extract the {\tt findfile} program.

\item{find_file_fun} to extract the {\tt find_file} function.

\item{narrative} to extract just the {\tt TEX} category text.

\end{description}

\bigskip

{\large Warnings:}

\begin{itemize}

\item The first and last lines of file {\tt imp096.sieveview} must not
	be altered.  Text must not be added before the first line or
	after the last line.

\item All category specification lines of the file {\tt
	imp096.sieveview} must have a leading tab character so that
	sieving this file does not get confused over which lines are
	directive lines and which this view file.  To make the file
	tidy all lines (bar the first and last) have tabs added.

\end{itemize}

Failure to observe these restrictions may prevent the proper creation
of the file and thus prevent this document being properly processed.

=SIEVEVIEW
# imp096.sieveview  from:  @(#) 94/04/06 1.3 imp096.doc
	
	# Ignore category is always ignored
	=IGNORE  tex		ignore
	=IGNORE  sieveview		ignore
	=IGNORE  sieve_prog	ignore
	=IGNORE  findfile_prog	ignore
	=IGNORE  find_file_fun	ignore
	
	# In the tex view everything is copied through for printing
	
	=TEX  tex
		cat
	
	=SIEVEVIEW  tex
		echonl \begin{GFTXQ}{imp096.sieveview}
		cat verbatim
		echonl \end{GFTXQ}
	
	=UTF8_MODULE tex
		echonl \begin{GFTXQ}{utf8 module}
		cat verbatim
		echonl \end{GFTXQ}
	
	=SIEVE_PROG  tex
		echonl \begin{GFTXQ}{sieve program}
		cat verbatim
		echonl \end{GFTXQ}
	
	=FINDFILE_PROG  tex
		echonl \begin{GFTXQ}{findfile program}
		cat verbatim
		echonl \end{GFTXQ}
	
	=FIND_FILE_FUN  tex
		echonl \begin{GFTXQ}{find_file function}
		cat verbatim
		echonl \end{GFTXQ}
	
	
	# For the sieveview view everything except the view file is discarded
	
	=TEX			sieveview	ignore
	=UTF8_MODULE	sieveview	ignore
	=SIEVE_PROG	sieveview	ignore
	=FINDFILE_PROG	sieveview	ignore
	=FIND_FILE_FUN	sieveview	ignore
	
	=SIEVEVIEW	sieveview
		filter sed -e 's/^	//'
	
	
	# For the utf8_module view everything except UTF8_MODULE and FIND_FILE_FUN is discarded
	
	=TEX			utf8_module	ignore
	=SIEVEVIEW	utf8_module	ignore
	=UTF8_MODULE	utf8_module	cat
	=SIEVE_PROG	utf8_module	ignore
	=FINDFILE_PROG	utf8_module	ignore
	=FIND_FILE_FUN	utf8_module	cat
	
	# For the sieve program view everything except sieve and the find_file
	# utility are discarded
	
	=TEX			sieve_prog	ignore
	=SIEVEVIEW	sieve_prog	ignore
	=UTF8_MODULE	sieve_prog	ignore
	=SIEVE_PROG	sieve_prog	cat
	=FINDFILE_PROG	sieve_prog	ignore
	=FIND_FILE_FUN	sieve_prog	cat
	
	
	# For the findfile program view everything except findfile and the find_file
	# utility are discarded
	
	=TEX			findfile_prog	ignore
	=SIEVEVIEW	findfile_prog	ignore
	=SIEVE_PROG	findfile_prog	ignore
	=FINDFILE_PROG	findfile_prog	cat
	=FIND_FILE_FUN	findfile_prog	cat
	
	
	# For the find_file function view everything except the function is discarded
	
	=TEX			find_file_fun	ignore
	=SIEVEVIEW	find_file_fun	ignore
	=SIEVE_PROG	find_file_fun	ignore
	=FINDFILE_PROG	find_file_fun	ignore
	=FIND_FILE_FUN	find_file_fun	cat
	
	
	# C category
	
	=CALWAYS		tex		ignore
	=CALWAYS		sieveview	ignore
	=CALWAYS		sieve_prog	cat
	=CALWAYS		findfile_prog	cat
	=CALWAYS		find_file_fun	cat

	# In the narrative view we only want the TEX category

	=TEX			narrative	cat
	
# end of imp096.sieveview
=TEX

\subsection{Index Entries}

As this document is compiled with a standard `C'~compiler it cannot use
the indexing mechanism of the other documents --- in fact it is this
program that enables this indexing mechanism to be used.  Thus the
index of this document contains approximate page numbers for each
declared item, some index entries may be one page early.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{UTF8 MODULE}

\subsection{Identification}

Note that all the code here is within the C comment when the source
file as whole is compiled, and must not therefore contain an
end-of-comment symbol.

The include file unicodepptab.h is automatically generated from some ML
code. It contains an array of records each containing a Unicode code
point (represented as a signed int) and the corresponding ProofPower character.
The array is sorted by * the code point and we do the associative lookup with bsearch.

=UTF8_MODULE
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <signal.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <regex.h>
#include <unistd.h>
#include "unicodepptab.h"
#include "ppunicodetab.h"
int unicodepp_error = 0;
int line;
char * program_name = "";
=TEX

\subsection{Diagnostics}

Several diagnostic outputs are provided, they are controlled by the
{\tt-d} command option which sets the {\tt utf8_debug} flag.
These outputs are written to the standard output.

\HOLindexEntry{debug}
\HOLindexEntry{D_\ldots}
=UTF8_MODULE
int debug = 0;
#define D_SHOW_KEYWORD_TABLE 2
#define D_GET_KW 128
=IGNORE
#define D_INIT_TABLES 4
#define D_READ_SOURCE_LINE 8
#define D_DECODE_DIR_LINE 16
#define D_ACTIONS 32
#define D_SHOW_FULL_SIEVE_TABLE 64
#define D_OPEN_OUTPUT 256
#define D_MAIN_CONVERT_CH 512
#define D_PROCESS_LINE 1024
#define D_EXPAND 2048
#define D_READ_STEER_LINE 4096
#define D_8192 8192
=TEX

\subsection{Error Reporting}

A standard style of error message starts with the text provided by {\tt
error_top} which does not output any newline characters.
Simple error messages may be produced using the function given after {\tt
error_top}, more complex cases use {\tt fprintf}.
The program attempts to check its own processing, any detected problems
are reported via function {\tt internal_error}.

\HOLindexEntry{file_data}
\HOLindexEntry{name..file_data}
\HOLindexEntry{line_no..file_data}
\HOLindexEntry{grumbles..file_data}
\HOLindexEntry{fp..file_data}
\HOLindexEntry{cur_line..file_data}
\HOLindexEntry{EXIT}

=UTF8_MODULE
#define FPRINTF (void)fprintf
#define PRINTF (void)printf
#define PUTC (void)putc
#define MAX_LINE_LEN 1024
#define NOT_FOUND (-1)

struct file_data{
	char *name;
	char *file_name;
	int line_no;
	int grumbles;
	FILE *fp;
	char cur_line[MAX_LINE_LEN+1];
};

void
EXIT(int n)
{
	if(debug) FPRINTF(stderr, "%s: exiting with code %d\n", program_name, n);

	if(n != 0) n = 1;

	(void)exit(n);
}

typedef char bool;

enum {False = 0, True = 1};

#define bool short
#define true 1
#define false 0
=TEX

{\tt grumble1} and {\tt grumble} : Print warning messages about a
particular file.  Arguments {\tt fmt} and {\tt msg} give the
message to print where {\tt fmt} is used as a format specifier to
{\tt fprintf} and {\tt msg} is a simple character string.
Argument {\tt file_F} gives the file identity.
When argument {\tt show_line} is true the line number in the file and
the line are printed.

\HOLindexEntry{grumble\ldots}
=UTF8_MODULE
void
grumble1(char *msg,
	struct file_data *file_F,
	int show_line)
{
	FPRINTF(stderr, "%s", program_name);
	if(show_line) {
		FPRINTF(stderr, ": line %d of %s", file_F->line_no, file_F->name);
		if(file_F->file_name != 0) FPRINTF(stderr, " %s", file_F->file_name);
	}
	FPRINTF(stderr, ": %s\n", msg);
	if(show_line) FPRINTF(stderr, "\t%s\n", file_F->cur_line);

	file_F->grumbles ++;
}

void
grumble(char *fmt,
	char *msg,
	struct file_data *file_F,
	int show_line)
{
	FPRINTF(stderr, "%s", program_name);
	if(show_line) {
		FPRINTF(stderr, ": line %d of %s", file_F->line_no, file_F->name);
		if(file_F->file_name != 0) FPRINTF(stderr, " %s", file_F->file_name);
	}
	PUTC(':', stderr);
	PUTC(' ', stderr);
	FPRINTF(stderr, fmt, msg);
	PUTC('\n', stderr);
	if(show_line) FPRINTF(stderr, "\t%s\n", file_F->cur_line);

	file_F->grumbles ++;
}
=TEX

\HOLindexEntry{error\ldots}
\HOLindexEntry{internal_error}

=UTF8_MODULE
void
error_top(void)
{
	FPRINTF(stderr, "%s: ", program_name);
}

void
error1(char *msg)
{
	error_top();
	FPRINTF(stderr, "%s", msg);
	PUTC('\n', stderr);
}

void
error(char *fmt, char *msg)
{
	error_top();
	FPRINTF(stderr, fmt, msg);
	PUTC('\n', stderr);
}

void
internal_error(char *fmt, char *msg)
{
	FPRINTF(stderr, "%s: possible internal error\n  ", program_name);
	FPRINTF(stderr, fmt, msg);
	PUTC('\n', stderr);
}
=TEX
\HOLindexEntry{print_unix_error}
\HOLindexEntry{unix_error1}
\HOLindexEntry{unix_error}
=UTF8_MODULE
void
print_unix_error1(int eno)
{
	char *msg = strerror(eno);

	if(msg != NULL) {
		FPRINTF(stderr, "\n\t%s\n", msg);
	} else {
		FPRINTF(stderr, "\n	unix error code: %d\n", eno);
	}
}

void
unix_error1(char *msg)
{
	extern int errno;
	int save_errno = errno;

	error_top();
	FPRINTF(stderr, "%s", msg);

	print_unix_error1(save_errno);
}

void
unix_error(char *fmt, char *msg)
{
	extern int errno;
	int save_errno = errno;

	error_top();
	FPRINTF(stderr, fmt, msg);

	print_unix_error1(save_errno);
}
=TEX

\subsection{message...}

A few {\tt message...} routines are provided as shorthands for
{\tt(void)printf(...)} and similar.  For more complex cases
the {\tt fprintf} should be used.

\HOLindexEntry{message\ldots}
=UTF8_MODULE
void
message1(char *msg)
{
	(void)fputs(msg, stdout);
	(void)fputs("\n", stdout);
}

void
message(char *fmt, char *msg)
{
	(void)printf(fmt, msg);
	(void)fputs("\n", stdout);
}
=IGNORE
void
messageN(char *fmt, int num)
{
	(void)printf(fmt, num);
	(void)fputs("\n", stdout);
}
=TEX


{\tt malloc_and_check} : Memory is allocated for various purposes, this
routine allocates and checks that the allocation succeeded.  Parameter
{\tt err} holds a code number indicating which part of the program
wanted the memory

\HOLindexEntry{malloc_and_check}
=UTF8_MODULE
void *
malloc_and_check(unsigned size, int err)
{
	void * area;

	area = malloc(size);

	if(area == NULL) {
		error1("cannot allocate work area");
		EXIT(err);
	}

	return(area);
}
=TEX

=UTF8_MODULE
int unicode_to_pp_entry_cmp(const void *buf1, const void *buf2)
{
	const unicode_to_pp_entry *u1 = buf1, *u2 = buf2;
	return  u1->code_point - u2->code_point;
}
=TEX
=UTF8_MODULE
const char *unicode_to_kw(unicode code_point)
{
	static char buf[10];
	sprintf(buf, "%%x%06X%%", code_point);
	return buf;
}
=TEX
=UTF8_MODULE
const char unicode2ppi(unicode cp)
{	
	unicode_to_pp_entry key, *search_result;
	key.code_point = cp;
	search_result = bsearch(&key, unicode_to_pp,
		UNICODE_TO_PP_LEN, sizeof(unicode_to_pp_entry), unicode_to_pp_entry_cmp);
	return (search_result=NULL) ? (char) 0 : search_result -> pp_char;
}
const char *unicode2ppk(unicode cp)
{	
	unicode_to_pp_entry key;
	char search_result;
	key.code_point = cp;
	search_result = unicode2ppi(cp);
	return (search_result=(char)0) ? NULL : unicode_to_kw(cp);
}
=TEX
If invalid UTF-8 is found, output an error message and skip to
the next new line.
=UTF8_MODULE
unicode invalid_unicode(void)
{
	int whatgot;
	fprintf(stderr, "utf8pp: line %d: invalid utf-8 input\n", line);
	unicodepp_error = 1;
	whatgot = getchar();
	while(whatgot != '\n' && whatgot != EOF) {
		whatgot = getchar();
	}
	if(whatgot == '\n') {
		line += 1;
	}
	return whatgot & 0xff;
}
=TEX
=UTF8_MODULE
unicode get_code_point(void)
{
	int whatgot, r, l;
	whatgot = getchar();
	if(whatgot == EOF) { return 0; }
	if(whatgot == '\n') { line += 1; }
	r = whatgot & 0xff;
	if(r <= 0x7f) { return r; }
	l = 0;
	while(r & 0x80) {
		r = (r & 0x7f) << 1;
		l += 1;
	}
	if(l > 4) { return invalid_unicode(); }
	r = r >> l;
	while(--l) {
		whatgot = getchar();
		if(whatgot == EOF || ((whatgot & 0xc0) != 0x80)) {
			return invalid_unicode();
		}
		r = (r << 6) | (whatgot & 0x3f);
	}
	return r;
}
=TEX
=UTF8_MODULE
void do_unicode_to_pp(void)
{
	unicode cp;
	const char *pp_string;
	cp = get_code_point();
	while(cp) {
		pp_string = unicode2ppk(cp);
		printf("%s", pp_string);
		cp = get_code_point();
	}
}
=TEX
=IGNORE
void usage(void)
{
	printf("utf8pp"
		": convert UTF-8 to ProofPower extended character format\n");
	printf("utf8pp: usage: unicodepp < input_file > output_file\n");
}
=TEX
=IGNORE
int main (int argc, char *argv[])
{
	line = 1;
	if(argc == 1) {
		do_unicode_to_pp();
		return ferror(stdin) || ferror(stdout) || unicodepp_error;
	} else {
		usage();
		return 0;
	}
}
=TEX
=UTF8_MODULE
enum {	S_INITIAL,
	S_HAVE_PERCENT,
	S_HAVE_X,
	S_HAVE_HEXIT_1,
	S_HAVE_HEXIT_2,
	S_HAVE_HEXIT_3,
	S_HAVE_HEXIT_4,
	S_HAVE_HEXIT_5,
	S_HAVE_HEXIT_6,
	S_HAVE_KEYWORD};

=TEX
=UTF8_MODULE
bool is_uc_hexit(char ch)
{
	return ('0' <= ch && ch <= '9') || ('A' <= ch && ch <= 'F');
}
=TEX
=UTF8_MODULE
bool is_percent(char ch)
{
	return ch == '%';
}
=TEX
=UTF8_MODULE
bool is_x(char ch)
{
	return ch == 'x';
}
=TEX
=UTF8_MODULE
void do_chars(int len, char *cs)
{
	while(len--) {
		printf("%s", pp_to_unicode[(int)*cs++ & 0xff]);
	}
}
=TEX
=UTF8_MODULE
bool do_keyword(unsigned u)
{
	if(u <= 0x7f) {
		return False;
	} else if (u <= 0x7ff) {
		putchar(0xc0u | (u >> 6u));
		putchar(0x80u | (u & 0x3fu));
		return True;
	} else if (u <= 0xffff) {
		putchar(0xe0u | (u >> 12u));
		putchar(0x80u | ((u & 0xfc0u) >> 6u));
		putchar(0x80u | (u & 0x3fu));
		return True;
	} else if (u <= 0x10ffffu) {
		putchar(0xf0u | (u >> 18u));
		putchar(0x80u | ((u & 0x3f000u) >> 12u));
		putchar(0x80u | ((u & 0xfc0u) >> 6u));
		putchar(0x80u | (u & 0x3fu));
		return True;
	} else {
		return False;
	}
}
=TEX
=UTF8_MODULE
#define STEP(TST, ST) \
	if((TST)(whatgot)) {\
		state = (ST);\
	} else {\
		do_chars(l, buf);\
		l = 0;\
		state = S_INITIAL;\
	};\
	break;
=TEX
=UTF8_MODULE
void do_pp_to_unicode (void)
{
	int whatgot, state, l;
	char buf[9];
	unsigned u;
	l = 0;
	state = S_INITIAL;
	while ((whatgot = getchar()) != EOF) {
		buf[l++] = whatgot;
		switch(state) {
			case S_INITIAL:      STEP(is_percent,  S_HAVE_PERCENT);
			case S_HAVE_PERCENT: STEP(is_x,              S_HAVE_X);
			case S_HAVE_X:       STEP(is_uc_hexit, S_HAVE_HEXIT_1);
			case S_HAVE_HEXIT_1: STEP(is_uc_hexit, S_HAVE_HEXIT_2);
			case S_HAVE_HEXIT_2: STEP(is_uc_hexit, S_HAVE_HEXIT_3);
			case S_HAVE_HEXIT_3: STEP(is_uc_hexit, S_HAVE_HEXIT_4);
			case S_HAVE_HEXIT_4: STEP(is_uc_hexit, S_HAVE_HEXIT_5);
			case S_HAVE_HEXIT_5: STEP(is_uc_hexit, S_HAVE_HEXIT_6);
			case S_HAVE_HEXIT_6: STEP(is_percent,  S_HAVE_KEYWORD);
		}
		if(state == S_HAVE_KEYWORD) {
			sscanf(&buf[2], "%6X", &u);
			if(!do_keyword(u)) { do_chars(l, buf); }
			l = 0;
			state = S_INITIAL;
		}
	}
}
=TEX
=IGNORE
void usage(void)
{
	printf("pputf8"
		": convert ProofPower extended character format to UTF-8\n");
	printf("usage: pputf8 < input_file > output_file\n");
}
=TEX
=IGNORE
int main (int argc, char *argv[])
{
	if(argc == 1) {
		do_pp_to_unicode();
		return ferror(stdin) || ferror(stdout);
	} else {
		usage();
		return 0;
	}
}
=TEX

\subsection{Keyword Information}

The changes for support of {\tt utf-8} result in the keyword file being used to record UNICODE code points instead of extended character codes, with a separate fixed mapping between extended characters and UNICODE code points generated as .h files at pptex build time by dtd096 using the utf8 structure in imp122, and then included into the sieve program.


\HOLindex_Entry{uni_to_pp_entry_cmp}
\HOLindex_Entry{uni_to_kw}
\HOLindex_Entry{uni_to_pp}
=UTF8_MODULE
int uni_to_pp_entry_cmp(const void *buf1, const void *buf2)
{
	const unicode_to_pp_entry *u1 = buf1, *u2 = buf2;
	return  u1->code_point - u2->code_point;
}

const char *uni_to_kw(unicode code_point)
{
	static char buf[10];
	sprintf(buf, "%%x%06X%%", code_point);
	return buf;
}
=TEX
This procedure needs to be upgraded to supply named keywords
=UTF8_MODULE
const int uni_to_pp(unicode cp)
{	
	unicode_to_pp_entry key, *search_result;
	key.code_point = cp;
	if (cp<128) return cp;
	search_result = bsearch(&key, unicode_to_pp,
		UNICODE_TO_PP_LEN, sizeof(unicode_to_pp_entry), uni_to_pp_entry_cmp);
	return search_result != NULL ? (unsigned char)search_result->pp_char : -1;
}
=TEX
Definitions of extended characters and percent keywords used by
sieve.

\subsection{Input File Controls}

For each of the files read during the sieving process various data is
held.

An attempt is made to read the whole of the view file and the keyword
file issuing complaints as they read, these faults are counted so that
if any were found the program will stop.  All faults should be reported
via function {\tt grumble} or {\tt grumble1}, additional information
may be output using {\tt fprintf}.

Need to hold details of all the extended characters and their
equivalent keywords.  Each keyword is held with its enclosing percent
characters.


\subsection{Keyword Information}

\HOLindexEntry{keyword_F}
\HOLindexEntry{keyword_information}
\HOLindexEntry{ech..keyword_information}
\HOLindexEntry{orig_kind..keyword_information}
\HOLindexEntry{act_kind..keyword_information}
\HOLindexEntry{name..keyword_information}
\HOLindexEntry{macro..keyword_information}
\HOLindexEntry{KW_\ldots}

=UTF8_MODULE
struct file_data keyword_F = 	{ "keyword file", 0, 0, 0 };

struct keyword_information{
	unicode uni;		
	short ech;		
	short orig_kind;	
	short act_kind;
=TEX

uni = the UNICODE code point, -1 => none

ech =  extended character code, -1 => none

orig$\_$kind = As read from keyword file

act_kind = allowing for KW_SAMEAS

=UTF8_MODULE
#define KW_NOT_SET 0
#define KW_SIMPLE 1
#define KW_INDEX 2
#define KW_SAMEAS 3
#define KW_SAMEAS_UNKNOWN 4
#define KW_DIRECTIVE 5
#define KW_START_DIR 6
#define KW_VERB_ALONE 7
#define KW_WHITE 8
	char *name;		
	char *macro;	
	regex_t *tex_arg;
	char tex_arg_sense;
#define KW_RE_MATCH 0	
#define KW_RE_DELIMITER 1
};
=TEX
*name = The keyword

*macro = Equivalent macro, or NULL

*tex_arg = R.E. defining the TeX argument of this keyword, if non-null

tex_arg_sense = How to interpret the R.E.

KW_RE_MATCH = The argument must match the R.E.

KW_RE_DELIMITER = The argument is delimited by something that matches the R.E.

Information about keywords is gathered into a single structure {\tt
kw_information}, this structure is statically allocated.  It holds data
about each keyword sorted by keyword and by character code.  The two
{\tt keyword_information} structures refer to the same data items
allowing fast access via character code and fairly fast access via a
binary search of the keyword names.

\HOLindexEntry{MAX_KEYWORDS}
\HOLindexEntry{MAX_KW_LEN}
\HOLindexEntry{kw_information}
\HOLindexEntry{num_keywords..kw_information}
\HOLindexEntry{max_kw_len..kw_information}
\HOLindexEntry{char_code..kw_information}
\HOLindexEntry{keyword..kw_information}

=UTF8_MODULE
#define MAX_KEYWORDS 4000
#define MAX_KW_LEN 50

struct kw_information {
	int num_keywords;
	int max_kw_len;
	struct keyword_information *char_code[256];
=TEX

Char codes are set to NULL in "initialize", they are set to their proper values by "conclude_keywordfile".

=UTF8_MODULE
	struct keyword_information *unicode_code[MAX_KEYWORDS];
=TEX

Unicode codes are set to NULL in "initialize", they are set to their proper values by "conclude_keywordfile".

=UTF8_MODULE
	struct keyword_information keyword[MAX_KEYWORDS];
} kwi = {0, 0,};
=TEX

\HOLindexEntry{add_new_keyword}
{\tt add_new_keyword} : Add details of a new keyword.
It is caller's responsibility to have allocated space that will
not be overwritten later for the string and regular expression
arguments.

=UTF8_MODULE
void
add_new_keyword(
	char *name,
	unicode uni,
	int kind,
	char *macro,
	regex_t * tex_arg,
	char tex_arg_sense)
{
	struct keyword_information *ki;
	int len = strlen(name);
	int orig_kind = kind;

	if(kwi.num_keywords >= MAX_KEYWORDS) {
		error1("too many keywords");
		EXIT(29);
	}

	if(len > MAX_KW_LEN) {
		grumble1("keyword too long", &keyword_F, true);
	}

	if(len > kwi.max_kw_len) kwi.max_kw_len = len;

	if(kind == KW_SAMEAS_UNKNOWN) {
		int len2 = strlen(macro);
		orig_kind = KW_SAMEAS;

		if(len2 > MAX_KW_LEN) {
			grumble1("sameas keyword too long", &keyword_F, true);
		}

		if(len2 > kwi.max_kw_len) kwi.max_kw_len = len2;
	}

	ki = &kwi.keyword[kwi.num_keywords];
	kwi.num_keywords++;

	ki->name = name;
	ki->ech = uni_to_pp(uni);
	ki->uni = uni;
	ki->orig_kind = orig_kind;
	ki->act_kind = kind;
	ki->macro = macro;
	ki-> tex_arg = tex_arg;
	ki-> tex_arg_sense = tex_arg_sense;

	if (debug & D_SHOW_KEYWORD_TABLE) {
	   PRINTF("add_keyword: %s ext: %d uni %x\n", name, ki->ech, uni);
	};
	
	if(kwi.num_keywords>1 && strcmp(kwi.keyword[kwi.num_keywords-1].name,
				name) < 0) {
		grumble1("keywords unsorted", &keyword_F, true);
	}
}
=TEX

\HOLindexEntry{find_keyword}
{\tt find_keyword} : Look up the keyword {\tt str} which includes the
opening and closing `{\tt\%}' signs.  If found return its index,
otherwise return {\tt NOT_FOUND}.

Do the work with a binary search through the keyword list.

=UTF8_MODULE
int
find_keyword(char *kw)
{
	int lower_end = 0;
	int top_end = kwi.num_keywords - 1;

	while (lower_end <= top_end) {
		int middle = (lower_end + top_end) / 2;
		int posn = strcmp(kw, kwi.keyword[middle].name);

		if(posn == 0) return(middle);

		if(posn < 0)	top_end = middle - 1;
		else		lower_end = middle + 1;
	}

	return(NOT_FOUND);
}
=TEX

\HOLindexEntry{show_kw_kind}
=UTF8_MODULE
void
show_kw_kind(int kind)
{
	char * kwty = NULL;
	switch (kind) {
	case KW_NOT_SET:			kwty = "not-set";		break;
	case KW_SIMPLE:			kwty = "simple";		break;
	case KW_INDEX:			kwty = "index";		break;
	case KW_SAMEAS:			kwty = "sameas";		break;
	case KW_SAMEAS_UNKNOWN:	kwty = "sameas-?";		break;
	case KW_DIRECTIVE:		kwty = "directive";		break;
	case KW_START_DIR:		kwty = "startdirective";	break;
	case KW_VERB_ALONE:		kwty = "verbalone";		break;
	case KW_WHITE:			kwty = "white";		break;
	default:									break;
	}

	if(kwty == NULL) PRINTF("?(%d)", kind);
	else PRINTF("%s", kwty);
}
=TEX

\HOLindexEntry{show_one_keyword}
=UTF8_MODULE
void
show_one_keyword(struct keyword_information *ki)
{
	PRINTF("(%p)",		ki);
	PRINTF(" ech=%4d",		ki->ech);
	PRINTF(" uni=%8x",		ki->uni);
	PRINTF("  ty=");
	show_kw_kind(ki->act_kind);
	if(ki->act_kind != ki->orig_kind) {
		PRINTF("(was=");
		show_kw_kind(ki->orig_kind);
		PUTC(')', stdout);
	}
	PRINTF("  name=(%ld)",		(long)strlen(ki->name));
	PRINTF("'%s'",			ki->name);
	PRINTF("  macro='%s'\n",	ki->macro ? ki->macro : "(None)");
}
=TEX

\HOLindexEntry{show_one_indexed_keyword}
=UTF8_MODULE
void
show_one_indexed_keyword(int kwindex)
{
	if(kwindex>=0 && kwindex<kwi.num_keywords) {
		(void)printf("%4d  ", kwindex);
		show_one_keyword(&(kwi.keyword[kwindex]));
	} else {
		(void)printf("%4d  not a valid keyword index\n", kwindex);
	}

}
=TEX

\HOLindexEntry{show_keywords}
{\tt show_keywords} : Extended characters and keywords are held in a
structure which may be displayed with this function.

=UTF8_MODULE
void
show_keywords(void)
{
	int i;

	(void)printf("Characters and keywords\n\t%d  keywords\n",
		kwi.num_keywords);
	(void)printf("\t%d  max keyword length\n", kwi.max_kw_len);

	for(i=0; i<kwi.num_keywords; i++) {
		show_one_indexed_keyword(i);
	}
}
=TEX

\HOLindexEntry{compare_keyword_information}
When sorting keyword entries with "qsort(3)" we need an
element comparator.

=UTF8_MODULE
int
compare_keyword_information(
	const void *vp1,
	const void *vp2)
{
	const struct keyword_information *kw1 = vp1;
	const struct keyword_information *kw2 = vp2;
	return(kw1->name == NULL || kw2->name == NULL
		? -1 : strcmp(kw1->name, kw2->name));
}
=TEX


\HOLindexEntry{initialise_keyword_information}

=UTF8_MODULE
void initialise_keyword_information(void) {
        int i;
	for(i=0; i<MAX_KEYWORDS; i++)
		kwi.keyword[i].orig_kind =
		kwi.keyword[i].act_kind =
			KW_NOT_SET;
=TEX
The "kwi.char_code"s are cleared here, they are not properly initialised until "conclude_keywordfile".
=UTF8_MODULE
	for(i=0; i<256; i++)
		kwi.char_code[i] = NULL;

	add_new_keyword("%%", -1, KW_SIMPLE, "\\%", NULL, 0);
};
=TEX

\subsection{Character Flags} \label{CharacterFlags}

A series of flags, one for each character code is held.  Values are set
and found by masking against the appropriate element.  The array is
structured giving several flags per character to allow for future
expansion.  Each flag has 0 as its default value.

The first two flags are used to help to quickly identify directive
lines in the source text.  If the first character of any source text
line has the {\tt DIRECTIVE_CHAR} flag set then it is potentially a
directive line, further testing is required.  If the first character is
an equals~``{\tt=}'' or is a directive character then the line is a
directive line.  If the first character is a percent~``{\tt\%}'' we may
have a directive line, in this case to avoid needing to always extract
and test the keyword we see if the second character is that of a
directive keyword by seeing if the {\tt SND_CHAR_DIR_KW} flag is set.
These flags are initialized with~``{\tt=}'' and~``{\tt\%}'' having the
their {\tt DIRECTIVE_CHAR} flag set.  As directive characters and
keywords are read the appropriate flags are set.

\HOLindexEntry{character_flags}
\HOLindexEntry{DIRECTIVE_CHAR}
\HOLindexEntry{IS_DIRECTIVE_CHAR}
\HOLindexEntry{SET_DIRECTIVE_CHAR}
\HOLindexEntry{SND_CHAR_DIR_KW}
\HOLindexEntry{IS_SND_CHAR_DIR_KW}
\HOLindexEntry{SET_SND_CHAR_DIR_KW}
\HOLindexEntry{VERB_ALONE_CH}
\HOLindexEntry{IS_VERB_ALONE_CH}
\HOLindexEntry{SET_VERB_ALONE_CH}
=UTF8_MODULE
unsigned char character_flags[256];

#define DIRECTIVE_CHAR 1
#define IS_DIRECTIVE_CHAR(qq) (character_flags[(qq)&0xFF] & DIRECTIVE_CHAR)
#define SET_DIRECTIVE_CHAR(qq) character_flags[(qq)&0xFF] |= DIRECTIVE_CHAR

#define SND_CHAR_DIR_KW 2
#define IS_SND_CHAR_DIR_KW(qq) (character_flags[(qq)&0xFF] & SND_CHAR_DIR_KW)
#define SET_SND_CHAR_DIR_KW(qq) character_flags[(qq)&0xFF] |= SND_CHAR_DIR_KW

#define VERB_ALONE_CH 4
#define IS_VERB_ALONE_CH(qq) (character_flags[(qq)&0xFF] & VERB_ALONE_CH)
#define SET_VERB_ALONE_CH(qq) character_flags[(qq)&0xFF] |= VERB_ALONE_CH
=TEX

The remaining flags are available for future expansion.



\HOLindexEntry{find_steering_file}
{\tt find_steering_file} : Resolve the name of one of the steering files by looking in the defined places.

=UTF8_MODULE
int
file_exists(char *name, int is_reg)
{
	struct stat st;
	return((name != NULL) && !stat(name, &st) && (!is_reg ||S_ISREG(st.st_mode)));

char *
find_steering_file(char *name, char *file_type)
{
	char *result, *pp_env_debug;
	char *pp_home, *pp_home_etc;

	if(file_exists(name, 1) || *name == '/') {
		result = name;
	} else if(file_exists(result = find_file(name, getenv(PPETCPATH), 1), 1)) {
		;
	} else {
		pp_home = getenv(PPHOME);
		if(pp_home == NULL) {
			error("cannot find file '%s'", name);
			EXIT(26);							/* EXIT */
		}
		pp_home_etc = (char*)malloc(strlen(pp_home) + strlen(SLASH_ETC) + 1);
		strcpy(pp_home_etc, pp_home);
		strcat(pp_home_etc, SLASH_ETC);
		if(!file_exists(result = find_file(name, pp_home_etc, 1), 1)) {
			error("cannot find file '%s'", name);
			EXIT(26);							/* EXIT */
		}
		free((void*)pp_home_etc);		
	}

	if( (pp_env_debug = getenv (PPENVDEBUG)) && pp_env_debug[0] != 0) {
		fprintf(stderr, "sieve: using %s %s\n", file_type, result);
	}

	return result;
}
=TEX

\subsection{Read Keyword File}

\HOLindexEntry{read_keyword_file}
{\tt read_keyword_file} : Read the body of the keyword file.

=UTF8_MODULE
void
read_keyword_file(char *name)
{
	char line[MAX_LINE_LEN+1];
	char * actname;

	actname = find_steering_file(name, "keyword file");

	if( (keyword_F.fp = fopen(actname, "r")) == NULL ) {
		unix_error("cannot open keyword file '%s'", actname);
		EXIT(25);							/* EXIT */
	}

	if(debug) message("Processing keyword file '%s'", actname);
	keyword_F.file_name = actname;
	keyword_F.line_no = 0;

	while( (!feof(keyword_F.fp)) && (!ferror(keyword_F.fp)) ) {
		char * def_kw;
		char * kind_str;
		int kind;
		char * code_kw_str;
		int code;
		char * macro;
		regex_t * tex_arg;
		char tex_arg_sense;

		read_steering_line(line, &keyword_F);

		if(limits.opt_list) {
			int len = strlen(line);
			if(len > limits.keyword_file)
				limits.keyword_file = len;
		}

		def_kw = skip_space(line);

		if(def_kw == NULL || def_kw[0] == '\0' || def_kw[0] == '#') {
			/* Comment line, ignore it */
			continue;						/* CONTINUE */
		}

		kind_str = split_at_space(def_kw);

		{	int len_m_1 = strlen(def_kw)-1;

			if(def_kw[len_m_1] == '"') def_kw[len_m_1] = '%';

			if(def_kw[0] != '%' || def_kw[len_m_1] != '%') {
				grumble1("missing '%%' on keyword", &keyword_F, true);
				continue;					/* CONTINUE */
			}
		}

		if(kind_str == NULL) {
			grumble1("no keyword kind", &keyword_F, true);
			continue;						/* CONTINUE */
		}

		code_kw_str = split_at_space(kind_str);

		if(code_kw_str == NULL) {
			grumble1("no code or second keyword", &keyword_F, true);
			continue;						/* CONTINUE */
		}

		macro = split_at_space(code_kw_str);

		if	(strcmp(kind_str, "simple") == 0) kind = KW_SIMPLE;
		else if	(strcmp(kind_str, "index") == 0) kind = KW_INDEX;
		else if	(strcmp(kind_str, "directive") == 0) kind = KW_DIRECTIVE;
		else if	(strcmp(kind_str, "startdirective") == 0) kind = KW_START_DIR;
		else if	(strcmp(kind_str, "sameas") == 0) kind = KW_SAMEAS;
		else if	(strcmp(kind_str, "verbalone") == 0) kind = KW_VERB_ALONE;
		else if	(strcmp(kind_str, "white") == 0) kind = KW_WHITE;
		else {
			grumble("unknown keyword kind: %s",
				kind_str, &keyword_F, true);
			continue;						/* CONTINUE */
		}

		if(kind == KW_SAMEAS) {
			if(macro == NULL || macro[0] == '\0') {
				/* OK */
			} else {
				grumble("unexpected text \"%s\" with sameas keyword", macro,
					&keyword_F, true);
				continue;					/* CONTINUE */
			}

			{	int len_m_1 = strlen(code_kw_str)-1;
	
				if(code_kw_str[len_m_1] == '"') code_kw_str[len_m_1] = '%';
	
				if(code_kw_str[0] != '%' || code_kw_str[len_m_1] !='%') {
					grumble1("missing '%%' on sameas keyword",
						&keyword_F, true);
					continue;				/* CONTINUE */
				}
			}

			add_new_keyword(strdup(def_kw), -1, KW_SAMEAS_UNKNOWN,
				strdup(code_kw_str), NULL, 0);
		} else {

			if(!get_char_unicode(code_kw_str, &code)) {
				grumble1("unreadable or out of range char code",
					&keyword_F, true);
				continue;					/* CONTINUE */
			}

			if(find_keyword(def_kw) != NOT_FOUND) {
				grumble1("duplicate keyword", &keyword_F, true);
				continue;					/* CONTINUE */
			}

			if((kind == KW_DIRECTIVE || kind == KW_START_DIR)
					&& code == -1) {
				grumble1("char code for directive is '-1'", &keyword_F, true);
				continue;					/* CONTINUE */
			}

			get_tex_arg(macro, &tex_arg, &tex_arg_sense);

			add_new_keyword(strdup(def_kw), code, kind,
				macro != NULL && macro[0] != '\0'
			?	strdup(macro)
			:	(char*)NULL,
				tex_arg,
				tex_arg_sense);
		}
	}

	keyword_F.file_name = 0;
	if(fclose(keyword_F.fp) != 0) {
		unix_error1("i/o error reported on close file operation");
		EXIT(8);							/* EXIT */
	};
}
=TEX

\subsection{Conclude Keyword File}

\HOLindexEntry{conclude_keywordfile}
{\tt conclude_keywordfile} : Complete the initializations of the
keyword file and make some simple validations of the tables
made from it.

=UTF8_MODULE
void
conclude_keywordfile(void)
{
	int i;
	int dump_keywords = 0;
	int stop_prog = 0;
=TEX
First sort the keywords so that the "find_keyword" below works.

Could check here whether keywords are in order.
If they are properly ordered then the sort below is unnecessary.

	if(strcmp(kwi.keyword[i-1].name, cur_ki->name) >= 0) {\\
		unsorted = 1;\\
	}\\
=UTF8_MODULE
	qsort((char*)kwi.keyword,
			kwi.num_keywords,
			sizeof(struct keyword_information),
			compare_keyword_information);
=TEX

Now process the "sameas" keywords and build the "kwi.char_code" array.
=UTF8_MODULE
	for(i=1; i<kwi.num_keywords; i++) {
		struct keyword_information *cur_ki = &kwi.keyword[i];

		switch(cur_ki->orig_kind) {
		case KW_SAMEAS :
		case KW_SAMEAS_UNKNOWN : {
				int copy_from_index = find_keyword(cur_ki->macro);

				if(copy_from_index == NOT_FOUND) {
					grumble("no keyword the same as '%s'",
						cur_ki->macro, &keyword_F, false);
					dump_keywords = 1;
				} else {
					struct keyword_information *copy_from
						= &kwi.keyword[copy_from_index];

					free(cur_ki->macro);

					cur_ki->orig_kind = KW_SAMEAS;
					cur_ki->act_kind = copy_from->orig_kind;
					cur_ki->ech = copy_from->ech;
					cur_ki->macro = copy_from->macro;

					if(cur_ki->act_kind == KW_SAMEAS ||
							cur_ki->act_kind ==
								KW_SAMEAS_UNKNOWN) {
						grumble("unresolved sameas for keyword '%s'",
							cur_ki->name, &keyword_F, false);
						dump_keywords = 1;
					}
				}
			}
			break;

		case KW_SIMPLE :
		case KW_INDEX :
		case KW_DIRECTIVE :
		case KW_START_DIR :
		case KW_VERB_ALONE :
		case KW_WHITE :
			if(cur_ki->ech != -1) {
				if(kwi.char_code[cur_ki->ech] == NULL)
					kwi.char_code[cur_ki->ech] = cur_ki;
				else {
					grumble("conflicting char codes for keyword '%s'",
						cur_ki->name, &keyword_F, false);
					FPRINTF(stderr,
						"\tchar code %d already has keyword '%s'\n",
						cur_ki->ech,
						kwi.char_code[cur_ki->ech]->name);
					dump_keywords = 1;
				}
			}

			break;

		case KW_NOT_SET :
			break;
		default:
			internal_error("unknown entry in keyword database", "");
			dump_keywords = 1;
			stop_prog = 1;
		}

		if(cur_ki->ech == -1 && cur_ki->uni == -1 && cur_ki->macro == NULL) {
			grumble1("macro required when char code is -1", &keyword_F, false);
			dump_keywords = 1;
		}
	}

	for(i=1; i<kwi.num_keywords; i++) {
		struct keyword_information *cur_ki = &kwi.keyword[i];

		switch(cur_ki->act_kind) {
		case KW_START_DIR:
		case KW_DIRECTIVE:
			if(cur_ki->ech != -1)
				SET_DIRECTIVE_CHAR(cur_ki->ech);
			else
				grumble("no extended char with directive keyword '%s'",
						cur_ki->name, &keyword_F, false);

			if(cur_ki->name[1] != '\0' && cur_ki->name[1] != '%')
				SET_SND_CHAR_DIR_KW(cur_ki->name[1]);
			break;

		case KW_VERB_ALONE:
			if(cur_ki->ech != -1)
				SET_VERB_ALONE_CH(cur_ki->ech);
			else
				grumble("no extended char with directive keyword '%s'",
						cur_ki->name, &keyword_F, false);
			break;

		default:
			break;
		}
	}

	if(dump_keywords || (debug & D_SHOW_KEYWORD_TABLE))
		show_keywords();

	if(stop_prog) EXIT(22);	
}
=TEX

\HOLindexEntry{get_hol_kw}
{\tt get_hol_kw} : Examines characters from {\tt str} to form a percent
keyword.  The opening `{\tt\%}' is guaranteed to be the first character
of {\tt str}.  A keyword is defined to be a `{\tt\%}' character
followed by zero or more non-white and non-`{\tt\%}' characters
followed by another `{\tt\%}' character.  A further restriction is the
maximum length of keywords.

If a well-formed keyword is found set its length which includes both
`{\tt\%}' characters into argument {\tt len}, otherwise set argument
{\tt len} to zero and return {\tt NOT_FOUND}.

If the well-formed keyword is known then return its index in the
keyword array.

If the well-formed keyword is not known then return {\tt NOT_FOUND}.

If the flag {\tt warn} is set issue a warning message against the {\tt
file_F} file for unknown or mal-formed keywords.

=UTF8_MODULE
int
get_hol_kw(char *str,
	int * len,
	int warn,
	struct file_data *file_F)
{
	int kwlen = 0;
	int ch;
	int ans;

	char kw[MAX_KW_LEN+1];

	kw[kwlen++] = '%';
=TEX
We know the first char is a '%'.
=UTF8_MODULE
	while(			kwlen<=kwi.max_kw_len
			&&	(ch = str[kwlen]) != '\0'
			&&	ch != '%'
			&&	isascii(ch)
			&&	isgraph(ch)
	) {
		kw[kwlen++] = ch;
	}

	kw[kwlen] = '\0';

	if(ch != '%') {
		*len = 0;
		ans = NOT_FOUND;
		kw[MAX_KW_LEN / 4] = '\0';

		if(warn) {
			grumble("mal-formed keyword starting with %s", kw, file_F, true);
		}
	} else {
		kw[kwlen++] = '%';
		kw[kwlen] = '\0';
=TEX
Now look up the keyword.
=UTF8_MODULE
		if(kwlen>kwi.max_kw_len) {
			*len = 0;
			ans = NOT_FOUND;
			kw[MAX_KW_LEN / 4] = '\0';
		} else {
			int kwindex = find_keyword(kw);

			*len = kwlen;
			ans = kwindex;
		}

		if(ans<0 && warn) {
=TEX
Well-formed but unknown keyword.
=UTF8_MODULE
grumble("unknown keyword: %s", kw, file_F, true);
		}
	}

	if(debug & D_GET_KW) {
		(void)printf("get_hol_kw: index=%d  len=%d  anslen=%d  kw=\"%s\"\n",
			ans, kwlen, *len, kw);
	}


	return(ans);
}
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{SIEVE PROGRAM}


\subsection{Initial Declarations}

Note that the end of comment symbol below completes the C~comment that
contains all of the introductory material in this document.

\HOLindexEntry{bool}
\HOLindexEntry{true}
\HOLindexEntry{false}
\HOLindexEntry{MAX_CAT}
\HOLindexEntry{MAX_LINE_LEN}
\HOLindexEntry{MAX_ACTION}
\HOLindexEntry{NOT_FOUND}
\HOLindexEntry{STEER_FILE}
\HOLindexEntry{KEYWORD_FILE}
=SIEVE_PROG
*/
#define SIEVE_PROG

#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <signal.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <regex.h>
#include <unistd.h>
#include "utf8module.h"
#ifdef __CYGWIN__
#include <locale.h>
#endif

#define MAX_CAT (80+1)
#define MAX_ACTION 20
#define NOT_FOUND (-1)

#define STEER_FILE "sieveview"
#define KEYWORD_FILE "sievekeyword"

#define PPHOME "PPHOME"
#define PPETCPATH "PPETCPATH"
#define PPENVDEBUG "PPENVDEBUG"
#define SLASH_ETC "/etc"

/*
=TEX

\subsection{Identification}

=SIEVE_PROG
*/

char *coprlemma1 =
#ifdef VERSION
	VERSION
#else
	"XXX.YYYwZZZ"
#endif
     " Copyright Lemma 1 Ltd.";
/*
=TEX

\HOLindexEntry{FPRINTF}
=CALWAYS
*/
#define FPRINTF (void)fprintf
#define PRINTF (void)printf
#define PUTC (void)putc
/*
=TEX

\HOLindexEntry{PrNN_SIZE}
Macro {\tt PrNN_SIZE} is described with function {\tt copy_PrNN} in section~\ref{FunCopyPrNN}.

=SIEVE_PROG
*/
#define PrNN_SIZE 7

int copy_PrNN(char *str, int code);


extern int getopt(int argc, char *const argv[], const char *optstring);
extern char *optarg;
extern int optind, opterr;
void * malloc(size_t size);
char * getenv(const char *name);
void	exit(int status);

extern char *find_file(char *name, char *dirs, int is_reg);
extern int file_exists(char *name, int is_reg);
/*
=TEX

Mostly we have declare before use, but there are a few exceptions!

=SIEVE_PROG
*/
void main_convert(
	char *in_line,
	int flags,
	char *out_line,
	int lenout_line,
	struct file_data *file_F);
/*
=TEX

Global variables used in argument processing.

\HOLindexEntry{view_option}
=SIEVE_PROG
*/
char view_option[MAX_LINE_LEN+1];
/*
=TEX

\subsection{Diagnostics}

Several diagnostic outputs are provided, they are controlled by the
{\tt-d} command option which sets the {\tt debug} flag.
These outputs are written to the standard output.

\HOLindexEntry{debug_data}
\HOLindexEntry{flag..debug}
\HOLindexEntry{purpose..debug}
\HOLindexEntry{D_\ldots}
=SIEVE_PROG
*/
struct debug_data{
	int flag;
	char *purpose;
} debug_data [] = {
#define D_SHOW_SIEVE_TABLE 1
	{D_SHOW_SIEVE_TABLE,		"sieving table"},
#define D_SHOW_KEYWORD_TABLE 2
	{D_SHOW_KEYWORD_TABLE,		"keyword table"},
#define D_INIT_TABLES 4
	{D_INIT_TABLES,			"actions available"},
#define D_READ_SOURCE_LINE 8
	{D_READ_SOURCE_LINE,		"source lines read"},
#define D_DECODE_DIR_LINE 16
	{D_DECODE_DIR_LINE,		"decoded directive lines"},
#define D_ACTIONS 32
	{D_ACTIONS,			"filter actions"},
#define D_SHOW_FULL_SIEVE_TABLE 64
	{D_SHOW_FULL_SIEVE_TABLE,	"whole sieving table"},
#define D_GET_KW 128
	{D_GET_KW,			"percent keywords read"},
#define D_OPEN_OUTPUT 256
	{D_OPEN_OUTPUT,			"open output for write or append"},
#define D_MAIN_CONVERT_CH 512
	{D_MAIN_CONVERT_CH,		"char by char in main convert"},
#define D_PROCESS_LINE 1024
	{D_PROCESS_LINE,		"source line processing"},
#define D_EXPAND 2048
	{D_EXPAND,			"macro expansions"},
#define D_READ_STEER_LINE 4096
	{D_READ_STEER_LINE,		"view and keyword file lines read"},
#define D_8192 8192
};
/*
=TEX
\subsection{Error and Warning Messages}

Various error and warning messages are written to the standard error
stream.  All of the error exits provide a code number that indicates the
source of the fault, these are printed using function {\tt EXIT}.
Successful completion of sieving also completes via this routine,
but with a code of zero.

=IGNORE
EXIT codes are allocated sequentially starting at 0.
The next free error code is
41
all codes below this are used.

To check the usage of these error codes the following commands are useful.

sed	-e '/([0-9][0-9]*)/\!d' \
	-e 's=^[^E]*==' \
	-e 's=	*''/\* EXIT \*''/==' \
	-e 's/(\([0-9])\)/( \1/' \
	-e 's/^EXIT(//' \
	-e 's/);//' \
	imp096.doc \
| sort \
	> zz1
awk '{{while(l<$1) {printf "%4d\n", (l++)} }; printf "%4d %4d\n", (l++), $1}' \
	zz1 > zz1a

=TEX

\HOLindexEntry{usage}
=SIEVE_PROG
*/
void
usage(void)
{
    FPRINTF(stderr,
	"usage: %s [-l|v] [-d debug-level] [-f steering_file] [-K] [-k keyword_file] view\n",
	program_name);
    FPRINTF(stderr, "%s version: %s\n", program_name, coprlemma1);
}
/*
=TEX


\HOLindexEntry{handle_sigpipe}
=SIEVE_PROG
*/
/*ARGSUSED*/
void
handle_sigpipe(int sig)
{
	error1("SIGPIPE caught.  Filter has not read all its standard input");
	EXIT(6);
}
/*
=TEX

\HOLindexEntry{init_signals}
=SIEVE_PROG
*/
void
init_signals(void)
{
	(void)signal(SIGPIPE, handle_sigpipe);
}
/*
=TEX

\subsection{Sizes of Data Areas Used}

The `{\tt-l}' option causes various numbers about sizes of data
structures to be printed.  The variable part of this information is
gathered here.  A structure is used just to reduce the number of global
names.  These values are printed by function $list_limits$.

\HOLindexEntry{limits}
\HOLindexEntry{opt_list..limits}
\HOLindexEntry{file_name_area..limits}
\HOLindexEntry{non_copy_length..limits}
\HOLindexEntry{process_line_len..limits}
\HOLindexEntry{filter_len..limits}
=SIEVE_PROG
*/
struct limits{
	int opt_list;
	int file_name_area;
	int non_copy_length;
	int process_line_len;
	int filter_len;
	int view_file;
	int keyword_file;
	int source_file;
	int num_keyword_files;
} limits = {
	0, 0, 0, 0, 0, 0, 0, 0, 0
};
/*
=TEX

Many of the limiting values are declared near the data structures
they refer to.  A few are declared here.

=SIEVE_PROG
*/
#define MAX_KEYWORD_FILES 20
/*
=TEX

\subsection{Input Files}

The input file controls are now located in the utf8module, so that it can use them in processing the keyword file.
They are also used in the sieve program for the view file and the main (standard) input stream.

\HOLindexEntry{view_F}
\HOLindexEntry{main_F}
=SIEVE_PROG
*/

struct file_data view_F = 		{ "view file", 0, 0, 0 };
struct file_data main_F = 		{ "standard input", 0, 0, 0 };
/*
=TEX

\subsection{String Utilities}

\HOLindexEntry{skip_space}
{\tt skip_space} : Return a pointer to the first non space like character
in "str".

=SIEVE_PROG
*/
char *
skip_space(char *str)
{
	char *p = str;

	if(p != NULL) {
		while( isascii(*p) && isspace(*p) ) {
			++p;
		}
	}
	return(p);
}
/*
=TEX

\HOLindexEntry{find_space}
{\tt find_space} : Return a pointer to the first space like character
in "str".

=SIEVE_PROG
*/
char *
find_space(char *str)
{
	char *p = str;

	if(p != NULL) {
		while( (*p) && !(isascii(*p) && isspace(*p)) ) {
			++p;
		}
	}
	return(p);
}
/*
=TEX

\HOLindexEntry{string_n_copy}
{\tt string_n_copy} : Copy a string of at most {\tt n} characters, but
stop at an earlier null character.  Append a null character to the
resultant string.  Thus the result string may occupy {\tt n+1}
characters.  This routine is very similar to the library routine {\tt
strncpy} but: (1)~it does not pad the result string with nulls; (2)~it
guarantees the result is null terminated; and, (3)~it does not return
any value.

=SIEVE_PROG
*/
void
string_n_copy(char *dest, char *source, int n)
{
	while((n--)>0 && *source) {
		*(dest++) = *(source++);
	}
	*dest = '\0';
}
/*
=TEX

\HOLindexEntry{split_at_space}
{\tt split_at_space} : Split the given string into two by overwriting
the first white space character in the argument with a null,
effectively leaving the argument as the first word of string.  Then,
skip further white space characters returning a pointer to the first
non-space character.  If the argument does not have any spaces then
nothing is overwritten and the value returned is a pointer to the null
character at the end of the string.

=SIEVE_PROG
*/
char *
split_at_space(char *str)
{
	char *p = find_space(str);

	if(p != NULL && *p) {
		*p = '\0';
		p = skip_space(p+1);
	}
	return(p);
}
/*
=TEX

\HOLindexEntry{str_match}
{\tt str_match} : Compares the two strings.  If the first string is a prefix of
the second string then the length of the first string is returned.
Otherwise 0 is returned.

=SIEVE_PROG

int
str_match(char *prefix, char *str)
{
	int i = 0;

	while(prefix[i] != '\0' && str[i] != '\0' && prefix[i] == str[i]) {
		i++;
	}

	return( prefix[i] == '\0' ? i : 0 );
}
=TEX

\HOLindexEntry{read_line}
{\tt read_line} : Reads a line into a buffer, checking that the line
isn't too long and returning the number of characters read, i.e., the
number of characters stored in argument {\tt line} but excluding the
trailing null.

=SIEVE_PROG
*/
int
read_line(char *line, int max, struct file_data *file_F)
{
	int whatgot;
	int i = 0;

	while(i < max && (whatgot = getc(file_F->fp)) != '\n' && whatgot != EOF) {
		line[i++] = whatgot;
	}

	if(i >= max) {
		error_top();
		FPRINTF(stderr, "line %d of %s too long\n",
			file_F->line_no, file_F->name);
		EXIT(4);
	}

	line[i] = '\0';

	return(i);
}
/*
=TEX

\HOLindexEntry{read_steering_line}
{\tt read_steering_line} : Read a steering file line, possibly escaped
over several input lines.  The argument {\tt line_no} is incremented
for each line read.

=SIEVE_PROG
*/
void
read_steering_line(char *line, struct file_data *file_F)
{
	int len_so_far = 0;
	int len_read = 0;
	do{
		(file_F->line_no) ++;
		len_read = read_line(line + len_so_far,
			MAX_LINE_LEN - len_so_far, file_F) - 1;
		len_so_far += len_read;
	} while( (len_read > 0) && (line[len_so_far] == '\\') );

	(void)strcpy(file_F->cur_line, line);

	if(debug & D_READ_STEER_LINE) {
		(void)printf("%s %d: %s\n", file_F->name,
			file_F->line_no, file_F->cur_line);
	}
}
/*
=TEX

\subsection{Character Flags} \label{CharacterFlags}

A series of flags, one for each character code is held.  Values are set
and found by masking against the appropriate element.  The array is
structured giving several flags per character to allow for future
expansion.  Each flag has 0 as its default value.

The first two flags are used to help to quickly identify directive
lines in the source text.  If the first character of any source text
line has the {\tt DIRECTIVE_CHAR} flag set then it is potentially a
directive line, further testing is required.  If the first character is
an equals~``{\tt=}'' or is a directive character then the line is a
directive line.  If the first character is a percent~``{\tt\%}'' we may
have a directive line, in this case to avoid needing to always extract
and test the keyword we see if the second character is that of a
directive keyword by seeing if the {\tt SND_CHAR_DIR_KW} flag is set.
These flags are initialized with~``{\tt=}'' and~``{\tt\%}'' having the
their {\tt DIRECTIVE_CHAR} flag set.  As directive characters and
keywords are read the appropriate flags are set.

\HOLindexEntry{DIRECTIVE_CHAR}
\HOLindexEntry{IS_DIRECTIVE_CHAR}
\HOLindexEntry{SET_DIRECTIVE_CHAR}
\HOLindexEntry{SND_CHAR_DIR_KW}
\HOLindexEntry{IS_SND_CHAR_DIR_KW}
\HOLindexEntry{SET_SND_CHAR_DIR_KW}
\HOLindexEntry{VERB_ALONE_CH}
\HOLindexEntry{IS_VERB_ALONE_CH}
\HOLindexEntry{SET_VERB_ALONE_CH}
=SIEVE_PROG
*/

#define DIRECTIVE_CHAR 1
#define IS_DIRECTIVE_CHAR(qq) (character_flags[(qq)&0xFF] & DIRECTIVE_CHAR)
#define SET_DIRECTIVE_CHAR(qq) character_flags[(qq)&0xFF] |= DIRECTIVE_CHAR

#define SND_CHAR_DIR_KW 2
#define IS_SND_CHAR_DIR_KW(qq) (character_flags[(qq)&0xFF] & SND_CHAR_DIR_KW)
#define SET_SND_CHAR_DIR_KW(qq) character_flags[(qq)&0xFF] |= SND_CHAR_DIR_KW

#define VERB_ALONE_CH 4
#define IS_VERB_ALONE_CH(qq) (character_flags[(qq)&0xFF] & VERB_ALONE_CH)
#define SET_VERB_ALONE_CH(qq) character_flags[(qq)&0xFF] |= VERB_ALONE_CH
/*
=TEX

The remaining flags are available for future expansion.

\subsection{Action Options} \label{ActionOptions}

Associated with some of the actions there are a number
of options available.

\HOLindexEntry{options_available}
\HOLindexEntry{name..options_available}
\HOLindexEntry{flag..options_available}
=SIEVE_PROG
*/
typedef struct{
	char *name;
	int flag;
} options_available;
/*
=TEX

\HOLindexEntry{OPT_\ldots}
The {\tt flags} may take one of the following values.

\begin{itemize}

\item Lines are to be processed for the verbatim-like formal text
	environments.  This flag implies {\tt OPT_LATEX} and {\tt OPT_CHAR}.

=SIEVE_PROG
*/
#define OPT_VERBATIM 1
/*
=TEX

\item Text is to be processed for the verbatim-like formal text
	environments, only with this flag set are the LaTeX conversions
	applied.  This option is automatically set with {\tt
	OPT_VERBATIM}.

=SIEVE_PROG
*/
#define OPT_LATEX 1024
/*
=TEX

\item Percent keywords are to be understood.

=SIEVE_PROG
*/
#define OPT_KW 2
/*
=TEX

\item Convert extended characters, but not percent keywords, to their
	\LaTeX{} form.  This option is automatically set with {\tt
	OPT_VERBATIM}.

=SIEVE_PROG
*/
#define OPT_CHAR 4
/*
=TEX

\item Modifies options {\tt OPT_KW} and {\tt OPT_VERBATIM} so that
	extended characters and percent keywords for indexing are
	deleted.

=SIEVE_PROG
*/
#define OPT_DELINDEX 8
/*
=TEX

\item Extended characters, but not percent keywords, are converted to
	their Standard ML string form.  This option is not compatible
	with {\tt OPT_KW} or {\tt OPT_VERBATIM}.

=SIEVE_PROG
*/
#define OPT_ML_CHAR 16
/*
=TEX

\item Issue a warning message when unknown keywords are
	found.  Only meaningful when {\tt OPT_KW} is set.

=SIEVE_PROG
*/
#define OPT_WARN_KW 32
/*
=TEX

\item Convert unknown keywords to a call on the \LaTeX{} macro
	\verb|\UnknownKeyword|.  Only meaningful when {\tt OPT_KW} and
	{\tt OPT_VERBATIM} are set.

=SIEVE_PROG
*/
#define OPT_FLAG_KW 64
/*
=TEX

\item Lines containing at least one character of type {\tt verbalone}
	plus any number of {\tt white} characters have a reduced
	verbatim-like processing where the line ends are not marked.

=SIEVE_PROG
*/
#define OPT_VERB_ALONE 128
/*
=TEX

\item Where possible keywords are converted to their corresponding
	extended character.

=SIEVE_PROG
*/
#define OPT_CONV_KW 256
/*
=TEX

\item Convert extended characters of class {\tt white} to a
	space character.  When {\tt OPT_KW} is set also convert the
	keywords.

=SIEVE_PROG
*/
#define OPT_WHITE 512
/*
=TEX

\item Convert extended characters to keywords.

=SIEVE_PROG
*/
#define OPT_CONV_EXT 2048
/*
=TEX

\end{itemize}

Now do some checking that these flags are well-defined.
Other checks are made in the startup function, {\tt initialize}.

\HOLindexEntry{AND_FLAGS}
\HOLindexEntry{OR_FLAGS}
=SIEVE_PROG
*/
#define AND_FLAGS	(	OPT_CHAR \
			&	OPT_CONV_KW \
			&	OPT_DELINDEX \
			&	OPT_FLAG_KW \
			&	OPT_KW \
			&	OPT_LATEX \
			&	OPT_ML_CHAR \
			&	OPT_VERBATIM \
			&	OPT_VERB_ALONE \
			&	OPT_WARN_KW \
			&	OPT_WHITE \
			&	OPT_CONV_EXT \
			)
#define OR_FLAGS	(	OPT_CHAR \
			|	OPT_CONV_KW \
			|	OPT_DELINDEX \
			|	OPT_FLAG_KW \
			|	OPT_KW \
			|	OPT_LATEX \
			|	OPT_ML_CHAR \
			|	OPT_VERBATIM \
			|	OPT_VERB_ALONE \
			|	OPT_WARN_KW \
			|	OPT_WHITE \
			|	OPT_CONV_EXT \
			)

#if AND_FLAGS != 0
	Faulty setting of flags;
#endif
/*
=TEX

The options are gathered together with their keywords for function {\tt
get_options} below.

\HOLindexEntry{cat_options}
=SIEVE_PROG
*/
options_available cat_options[] = {
	{"delindex", OPT_DELINDEX},
	{"kw", OPT_KW},
	{"convkw", OPT_CONV_KW | OPT_KW},
	{"convext", OPT_CONV_EXT},
	{"char", OPT_CHAR},
	{"latex", OPT_LATEX | OPT_CHAR},
	{"mlchar", OPT_ML_CHAR},
	{"verbatim", OPT_VERBATIM | OPT_LATEX | OPT_CHAR},
	{"verbalone", OPT_VERB_ALONE},
	{"kwwarn", OPT_WARN_KW},
	{"kwflag", OPT_FLAG_KW},
	{"white", OPT_WHITE},
	{NULL, 0}
};
/*
=TEX

\HOLindexEntry{arg_options}
=SIEVE_PROG
*/
options_available arg_options[] = {
	{"delindex", OPT_DELINDEX},
	{"latex", OPT_LATEX | OPT_CHAR},
	{NULL, 0}
};
/*
=TEX

\HOLindexEntry{get_options}
{\tt get_options} : Reads the text of argument {\tt filt} looking for
any option keywords from argument {\tt opts}.  The flag values for each
keyword found are logically ORed to form the result value.  Any
characters that are not keywords indicate errors.

=SIEVE_PROG
*/
int
get_options(options_available *opts, char *filt)
{
	int ikw;
	int ans = 0;

	char wrkstr[MAX_LINE_LEN+1];
	char *start_kw, *end_kw;

	start_kw = skip_space(filt);

	while(start_kw[0] != '\0') {
		end_kw = find_space(start_kw);
		string_n_copy(wrkstr, start_kw, end_kw - start_kw);
		*(wrkstr + (end_kw - start_kw)) = '\0';

		ikw = 0;

		while(opts[ikw].name != NULL && strcmp(opts[ikw].name, wrkstr) != 0) {
			ikw++;
		}

		if(opts[ikw].name != NULL) {
			ans |= opts[ikw].flag;
		} else {
			grumble("unexpected keyword '%s'", wrkstr, &view_F, true);
			return(0);						/* RETURN */
		}

		start_kw = skip_space(end_kw);
	}

	return(ans);
}
/*
=TEX

\HOLindexEntry{check_cat_options}
{\tt check_cat_options} : Validate the options set for
the {\tt"cat"} action.

=SIEVE_PROG
*/
void
check_cat_options(int flags)
{
	if(flags & OPT_VERBATIM && flags & OPT_ML_CHAR)
		grumble1("conflicting options: 'verbatim' and 'mlchar'", &view_F, true);

	if(flags & OPT_LATEX && flags & OPT_ML_CHAR)
		grumble1("conflicting options: 'latex' and 'mlchar'", &view_F, true);

	if(flags & OPT_CONV_EXT && flags & OPT_ML_CHAR)
		grumble1("conflicting options: 'convext' and 'mlchar'", &view_F, true);

	if(flags & OPT_VERBATIM && flags & OPT_CONV_EXT)
		grumble1("conflicting options: 'verbatim' and 'convext'", &view_F, true);

	if(flags & OPT_LATEX && flags & OPT_CONV_EXT)
		grumble1("conflicting options: 'latex' and 'convext'", &view_F, true);

	if(flags & OPT_VERBATIM && flags & OPT_CONV_KW)
		grumble1("conflicting options: 'verbatim' and 'convkw'", &view_F, true);

	/* Need both OPT_VERBATIM and OPT_KW for OPT_FLAG_KW */
	if(flags & OPT_FLAG_KW && !(flags & OPT_VERBATIM && flags & OPT_KW))
		grumble1("ignored option: 'kwflag'", &view_F, true);

	if(flags & OPT_VERB_ALONE && !(flags & OPT_VERBATIM))
		grumble1("ignored option: 'verbalone'", &view_F, true);
}
/*
=TEX

\HOLindexEntry{show_options}
{\tt show_options} : Print out the names of any options set.

=SIEVE_PROG
*/
void
show_options(FILE *fp, int flags)
{
#define SHOW_OPT(f, s) if(flags & f) (void)fputs(s, fp)
	SHOW_OPT(OPT_CHAR, " char");
	SHOW_OPT(OPT_DELINDEX, " delindex");
	SHOW_OPT(OPT_FLAG_KW, " kwflag");
	SHOW_OPT(OPT_KW, " kw");
	SHOW_OPT(OPT_CONV_KW, " convkw");
	SHOW_OPT(OPT_CONV_EXT, " convext");
	SHOW_OPT(OPT_LATEX, " latex");
	SHOW_OPT(OPT_VERBATIM, " verbatim");
	SHOW_OPT(OPT_VERB_ALONE, " verbalone");
	SHOW_OPT(OPT_ML_CHAR, " mlchar");
	SHOW_OPT(OPT_WARN_KW, " kwwarn");
	SHOW_OPT(OPT_WHITE, " white");
#undef SHOW_OPT
}
/*
=TEX

\subsection{Available Sieving Categories}

Each category described in the view file may specify several actions,
the available set are described in this structure.  Note that the
entries in the array must be sorted on the {\tt name} field so that
function {\tt find_action} works.  This ordering is checked in function
{\tt check\-_program\-_initializations}.

\HOLindexEntry{actions_available}
\HOLindexEntry{name::actions_available}
\HOLindexEntry{arg_type::actions_available}
\HOLindexEntry{copy_action::actions_available}
\HOLindexEntry{code::actions_available}
\HOLindexEntry{options::actions_available}
\HOLindexEntry{ARGS_NO}
\HOLindexEntry{ARGS_YES}
\HOLindexEntry{ARGS_OPT}
\HOLindexEntry{UNKNOWN_ACT}
\HOLindexEntry{IGNORE_ACT}
\HOLindexEntry{CAT_ACT}
\HOLindexEntry{ECHO_ACT}
\HOLindexEntry{ECHONL_ACT}
\HOLindexEntry{FILTER_ACT}
\HOLindexEntry{NL_ACT}
\HOLindexEntry{ML_STRING_ACT}
\HOLindexEntry{APPEND_ACT}
\HOLindexEntry{WRITE_ACT}
\HOLindexEntry{ARGS_SET_UP}
\HOLindexEntry{ARG_ACTIONS}
\HOLindexEntry{NUM_ACTIONS}
=SIEVE_PROG
*/
struct actions_available{
	char *name;
	int arg_type;
#define ARGS_NO 0
#define ARGS_YES 1
#define ARGS_OPT 2
	short copy_action;
	short code;
#define UNKNOWN_ACT 0
#define IGNORE_ACT 1
#define CAT_ACT 2
#define ECHO_ACT 3
#define ECHONL_ACT 4
#define FILTER_ACT 5
#define NL_ACT 6
#define ML_STRING_ACT 7
#define APPEND_ACT 8
#define WRITE_ACT 9
#define ARGS_SET_UP 100
#define ARG_ACTIONS 101
	options_available *options;
} actions_available [] ={
	/* these names must be sorted so that "find_action" works */
	/* name		arg		copy	code			options */
	{  "append", 		ARGS_YES,	0,	APPEND_ACT,	NULL },
	{  "argoptions",	ARGS_YES,	0,	ARG_ACTIONS,	arg_options },
	{  "arguments",	ARGS_YES,	0,	ARGS_SET_UP,	NULL },
	{  "cat",		ARGS_OPT,	1,	CAT_ACT,		cat_options },
	{  "echo",		ARGS_YES,	0,	ECHO_ACT,		NULL },
	{  "echonl",		ARGS_YES,	0,	ECHONL_ACT,	NULL },
	{  "filter",		ARGS_YES,	1,	FILTER_ACT,	NULL },
	{  "ignore",		ARGS_NO,	1,	IGNORE_ACT,	NULL },
	{  "mlstring",		ARGS_NO,	1,	ML_STRING_ACT,	NULL },
	{  "nl",		ARGS_NO,	0,	NL_ACT,		NULL },
	{  "write",		ARGS_YES,	0,	WRITE_ACT,	NULL },

};

#define NUM_ACTIONS ((sizeof actions_available) / (sizeof (struct actions_available)))
/*
=TEX

\HOLindexEntry{find_action}
{\tt find_action} : Given an action code name find the
corresponding entry in {\tt actions_available}.

=SIEVE_PROG
*/
int
find_action(char *act_name)
    {
	int i;
	int ans;
	for(i=0; i<NUM_ACTIONS; i++) {
		ans = strcmp(act_name, actions_available[i].name);
		if(ans == 0) return(i);					/* RETURN */
			/* Next line requires that the "actions_available" be sorted */
		else if(ans < 0) return(NOT_FOUND);			/* RETURN */
	}
	return(NOT_FOUND);
    }
/*
=TEX

\HOLindexEntry{decode_action}
=SIEVE_PROG
*/
char *
decode_action(int act_code)
    {
	int i;
	for(i=0; i<NUM_ACTIONS; i++) {
		if(actions_available[i].code == act_code)
			return(actions_available[i].name);			/* RETURN */
	}
	return("??");
    }
/*
=TEX



\HOLindexEntry{dump_actions_available}
=SIEVE_PROG
*/
void
dump_actions_available(void)
{
	int i;
	int j;

	(void)printf("  %ld actions available\n", (long) NUM_ACTIONS);
	for(i=0; i<NUM_ACTIONS; i++) {
		(void)printf("%5d %10s %2d %2d %4d = %s",
			i,
			actions_available[i].name,
			actions_available[i].arg_type,
			actions_available[i].copy_action,
			actions_available[i].code,
			decode_action(actions_available[i].code));

		if(i>0) {
			if(strcmp(actions_available[i-1].name, actions_available[i].name) >= 0)
				(void)fputs("        <== out of order\n", stdout);
			else PUTC('\n', stdout);
		} else PUTC('\n', stdout);

		if(actions_available[i].options != NULL) {
			options_available *opts = actions_available[i].options;
			(void)fputs("        Options:", stdout);
			j = 0;
			while(opts[j].name != NULL) {
				(void)printf("    %s %d", opts[j].name, opts[j].flag);
				j++;
			}
			PUTC('\n', stdout);
		}
	}
}
/*
=TEX

\subsection{Decoded View File}

Each category entry in the view file is represented by a value of
structure {\tt cat_filt}.  Some of these categories have several
actions which are represented by a value of structure {\tt
cat\-_filt\-_action}.

\HOLindexEntry{cat_filt_action}
\HOLindexEntry{action_type::cat_filt_action}
\HOLindexEntry{action_str::cat_filt_action}
\HOLindexEntry{opt_flags::cat_filt_action}
\HOLindexEntry{cfa_flags::cat_filt_action}
\HOLindexEntry{op_file::cat_filt_action}
\HOLindexEntry{CFA_\ldots}
=SIEVE_PROG
*/
typedef struct{
	short action_type;
			/* One of the "..._ACT" macro values */
	char *action_str;
			/* hold the string argument for the action type, ie the
				string to be echoed or the filter to execute */
	short opt_flags;
			/* holds a collection of the "OPT_..." flags */
	short cfa_flags;
			/* holds a collection of the "CFA_..." flags */
#define CFA_ACT_MACROS 1
#define CFA_WRITE 2
#define CFA_APPEND 4
#define CFA_FILE_MACROS 8
	char *op_file;
} cat_filt_action;
/*
=TEX

\HOLindexEntry{cat_filt}
\HOLindexEntry{cat..cat_filt}
\HOLindexEntry{num_actions..cat_filt}
\HOLindexEntry{cfa..cat_filt}
\HOLindexEntry{is_one_liner..cat_filt}
\HOLindexEntry{has_copy_action..cat_filt}
\HOLindexEntry{min_args..cat_filt}
\HOLindexEntry{max_args..cat_filt}
\HOLindexEntry{extra_flags..cat_filt}
=SIEVE_PROG
*/
typedef    struct{
	    char *cat;
	    short num_actions;
			/* <0	=> view not wanted for this run */
			/* 0	=> no filter, no actions, so do a "cat" */
			/* >0	=> number of actions */
	    cat_filt_action cfa[MAX_ACTION];
	    short is_one_liner;
			/* 1 => filter read on first category */
	    short has_copy_action;
			/* 1 => has an action which copies input to output,
					such as a "cat" */
	    short min_args;
			/* -1 => not yet set up, equivalent to 0 */
	    short max_args;
			/* -1 => not yet set up, equivalent to 0 */
	    int extra_flags;
			/* Extra processing required on the directive line arguments.
					This value is from the "argoptions" action line
					in the view file, it holds "or"-ed together
					action option flags. */
	} cat_filt;
/*
=TEX

An array is built, it has one element (which is of structure {\tt
cat_filt}) per category described in the view file.

A simple linear search technique is used in this table to find
the entry associated with a given category. It is initialized
to a table with an entry corresponding to a category which is
ignored.

\HOLindexEntry{table}
\HOLindexEntry{max_cat}
=SIEVE_PROG
*/
cat_filt	table[MAX_CAT];

int		max_cat;
/*
=TEX

\HOLindexEntry{initialize_table}
=SIEVE_PROG
*/
void
initialize_table(void)
    {
	table[0].cat = "Ignoring text";
	table[0].num_actions = 1;
	table[0].has_copy_action = 1;
	table[0].is_one_liner = 1;
	table[0].cfa[0].action_type = IGNORE_ACT;
	table[0].cfa[0].action_str = "";
	table[0].min_args = 0;
	table[0].max_args = 0;
	table[0].extra_flags = 0;
	max_cat = 1;
    }
/*
=TEX



\HOLindexEntry{print_table_entry}
=SIEVE_PROG
*/
void
print_table_entry(cat_filt *tab, FILE *fp)
{
	int j;
	int num_acts;
	char *cat;

	cat = tab->cat;
	num_acts = tab->num_actions;

	if(num_acts < 0) {
		FPRINTF(fp, "%s is not wanted in current view\n", cat);
	} else if(num_acts == 0) {
		FPRINTF(fp, "%s is just copied\n", cat);
	} else {
		FPRINTF(fp, "%s", cat);
		if(tab->min_args>0 || tab->max_args>0) {
			FPRINTF(fp, "  allows %d", tab->min_args);
			if(tab->min_args != tab->max_args)
					FPRINTF(fp, " to %d", tab->max_args);
			(void)fputs(" arguments", fp);
			if(tab->extra_flags !=0) {
				FPRINTF(fp, ", extra_flags=(%d", tab->extra_flags);
				show_options(fp, tab->extra_flags);
				PUTC(')', fp);
			}
		}
		PUTC('\n', fp);

		for(j=0; j<num_acts; j++) {
			cat_filt_action *cf = &(tab->cfa[j]);
			FPRINTF(fp, "        %d: %-10s  (%d",
				j,
				(char*)decode_action(cf->action_type),
				cf->opt_flags);
			show_options(fp, cf->opt_flags);

			FPRINTF(fp, ")  (%d", cf->cfa_flags);

#define SHOW_CFA(f, s) if(cf->cfa_flags & f) (void)fputs(s, fp)
			SHOW_CFA(CFA_ACT_MACROS, " macros");
			SHOW_CFA(CFA_FILE_MACROS, " file-macros");
			SHOW_CFA(CFA_WRITE, " write");
			SHOW_CFA(CFA_APPEND, " append");
			if(cf->op_file != NULL)
				FPRINTF(fp, " %s '%s'",
					cf->cfa_flags & CFA_WRITE ? ">" : ">>",
					cf->op_file);
#undef SHOW_CFA

			FPRINTF(fp, ")  %s\n", cf->action_str);
		}
	}
}
/*
=TEX



\HOLindexEntry{look_up}
=SIEVE_PROG
*/
int
look_up(char *cat)
{
	int i;
	for(i = 1; i < max_cat; ++i) {
	    if(!(strcmp(cat, table[i].cat))) {
		return(i);							/* RETURN */
	    }
	};
	return(NOT_FOUND);
}
/*
=TEX



\HOLindexEntry{print_table}
=SIEVE_PROG
*/
void
print_table(void)
{
	int i;
	int num_copied = 0;
	int num_not_wanted = 0;
	int num_acts;
	int num_flagged_chars = 0;

	(void)fputs("Sieving table:\n", stdout);

	for(i = ((debug & D_SHOW_FULL_SIEVE_TABLE) ? 0 : 1); i<max_cat; ++i) {
		num_acts = table[i].num_actions;

		if(num_acts == 0)	num_copied ++;
		else if(num_acts < 0)	num_not_wanted ++;

		if(num_acts > 0 || (debug & D_SHOW_FULL_SIEVE_TABLE)) {
			print_table_entry(&table[i], stdout);
		}
	}

	if(num_copied > 0) {
		(void)printf("%d categories just copied:\n", num_copied);
		for(i = 0; i < max_cat; ++i) {
			num_acts = table[i].num_actions;
			if(num_acts == 0) (void)printf("        %s\n",
				table[i].cat);
		}
	}

	if(num_not_wanted > 0) {
		(void)printf("%d categories not wanted in current view:\n",
			num_not_wanted);
		for(i = 0; i < max_cat; ++i) {
			num_acts = table[i].num_actions;
			if(num_acts < 0) (void)printf("        %s\n",
				table[i].cat);
		}
	}

	num_flagged_chars = 0;
	for(i = 0; i < 256; ++i) num_flagged_chars += (character_flags[i] ? 1 : 0);
	(void)printf("%d characters have flags set\n", num_flagged_chars);
	if(num_flagged_chars) {
		for(i = 0; i < 256; ++i) {
			if(character_flags[i]) {
				(void)printf("    '%c' %d 0x%02x",
					i, i, character_flags[i]);
				if(IS_DIRECTIVE_CHAR(i))
					(void)fputs("  DIRECTIVE_CH", stdout);
				if(IS_SND_CHAR_DIR_KW(i))
					(void)fputs("  SND_CHAR_DIR_KW", stdout);
				if(IS_VERB_ALONE_CH(i))
					(void)fputs("  VERB_ALONE_CH", stdout);
				PUTC('\n', stdout);
			}
		}
	}
}
/*
=TEX

\subsection{Source File Context}

A structure holding the current sieving context is maintained.  This
holds the arguments from the directive line plus indexes into the table
of known categories.  The arguments are numbered~1~to~9, additionally
argument~0 refers to the directive name.

\HOLindexEntry{dir_info}
\HOLindexEntry{num_dl_args::dir_info}
\HOLindexEntry{cat::dir_info}
\HOLindexEntry{dl_words::dir_info}
\HOLindexEntry{dl_line::dir_info}
\HOLindexEntry{dir_line::dir_info}
\HOLindexEntry{table_index::dir_info}
\HOLindexEntry{cur_act_index::dir_info}
\HOLindexEntry{tab::dir_info}
\HOLindexEntry{current_action::dir_info}
\HOLindexEntry{cur_fp::dir_info}
\HOLindexEntry{cur_fp_class::dir_info}
\HOLindexEntry{FP_\ldots}
=SIEVE_PROG
*/
#define MAX_DIR_ARGS 9

typedef struct{
	int num_dl_args;
	char *cat;		/* category of directive line */
	char *dl_words[MAX_DIR_ARGS+1];
				/* These may validly be NULL */
	char dl_line[MAX_LINE_LEN+1];
				/* Storage for the strings for "cat" and "dl_words[]" */

	char dir_line[MAX_LINE_LEN+1];
				/* Holds a copy of the original line */

				/* 	These next declarations relate to the currently
					active table entry, they are initialized to the
					table entry set up by "initialize_table" */
	int     table_index;	/* ... into "table[]" */
	int     cur_act_index;	/* ... into "table[table_index].cfa" */
	cat_filt *tab;
	int	current_action;
				/* from "table[table_index].action_type[cur_act_index]" */
	FILE * cur_fp;	/* Output stream used for the current directive */
	int cur_fp_class;
#define FP_STDOUT 1
#define FP_PIPE 2
#define FP_OTHERFILE 3
} dir_info;
/*
=TEX

\HOLindexEntry{init_directive_line}
\HOLindexEntry{dump_dir_info}
=SIEVE_PROG
*/
void
init_directive_line(dir_info *di)
{
	int i;

	di->dl_words[0] = di->cat = "";
	di->num_dl_args = 0;
	for(i=1; i<=MAX_DIR_ARGS; i++) di->dl_words[i] = NULL;
	di->table_index = 0;
	di->cur_act_index = 0;
	di->tab = &table[di->table_index];
	di->current_action = IGNORE_ACT;
	di->dl_line[0] = di->dir_line[0] = '\0';
	di->cur_fp = stdout;
	di->cur_fp_class = FP_STDOUT;
}

/* Function not used, but it may be nice one day
void
dump_dir_info(dir_info *di)
{
	int i;
	char *fpcl = "unknown";

	(void)printf(
		"dir_info(0x%x): cat=%s #args=%d cur_act=%d tab_idx=%d act_idx=%d",
		di,
		di->cat, di->num_dl_args, di->current_action,
			di->table_index, di->cur_act_index);

	switch (di->cur_fp_class) {
	case FP_STDOUT:		fpcl = "stdout";	break;
	case FP_PIPE:		fpcl = "stdpipe";	break;
	case FP_OTHERFILE:	fpcl = "otherfile";	break;
	default:		fpcl = "unknown";	break;
	}

	(void)printf("  cur_fp_class=%d=%s", di->cur_fp_class, fpcl);
	putchar('\n');

	for(i=0; i<di->num_dl_args; i++) {
		(void)printf("\t arg %d = '%s'\n", i, di->dl_words[i]);
	}
}
*/
/*
=TEX
\subsection{Macro Expansion}

Maximum length for macro expansion is twice the normal line length.
This is derived by allowing the maximum length of an input line plus
the maximum length of view file line.  This limit is easy to exceed,
e.g., by having a view file action that echoes the whole of a large
directive line many times.  It is a reasonable upper limit since many
of the other programs used, such as \LaTeX{}, have a much smaller
maximum input line length.

\HOLindexEntry{MACRO_EXP_SIZE}
=SIEVE_PROG
*/
#define MACRO_EXP_SIZE ((MAX_LINE_LEN) * 2)
/*
=TEX

\HOLindexEntry{copy_macro_arg}
{\tt copy_macro_arg}: is used by {\tt expand_macro} to copy a macro.
The text in {\tt macro} is appended to {\tt out_line} starting at
character index {\tt orig_outp}, but no more than {\tt maxlen}
characters may be written to {\tt out_line}.  Argument {\tt flags} gives
details of how the macro text should be copied or converted.

=SIEVE_PROG
*/
int
copy_macro_arg(
	int flags,
	char *out_line,
	int orig_outp,
	char *macro,
	int maxlen)
{
	int outp = orig_outp;
	int ans = 0;

	maxlen--; /* Allow for a trailing null */

	if(macro != NULL) {
		if(flags == 0) {
			while(macro[0] != '\0' && outp < maxlen) {
				out_line[outp++] = macro[0];
				macro++;
			}
			out_line[outp] = '\0';
			ans = outp-orig_outp;
		} else {
			main_convert(macro,
				flags | OPT_KW | OPT_CONV_KW,
				&(out_line[outp]),
				maxlen - outp,
				&main_F);
			outp = strlen(out_line);
		}
		ans = strlen(&(out_line[orig_outp]));
	}

	return(ans);
}
/*
=TEX

\HOLindexEntry{expand_macro}
{\tt expand_macro} : Expand the text of {\tt in_line} into the area {\tt
out_line} which is {\tt lenout_line} characters long.  The macro
parameters are found in {\tt di}.

=SIEVE_PROG
*/
void
expand_macro(
	dir_info *di,
	char    *in_line,
	char    *out_line,
	int	lenout_line)
{
	char ch;
	int outp = 0;
	int flags = table[di->table_index].extra_flags;

	if(debug & D_EXPAND) {
		(void)printf("expand_macro: '%s'  max_len=%d\n", in_line, lenout_line);
	}

	while((ch = in_line[0]) != '\0' && outp < lenout_line) {
		if(ch == '$') {
			/* Macro invocation */
			int i;

			in_line++;
			ch = in_line[0];

			if(debug & D_EXPAND) {
				(void)printf("\texpand $%c\n", ch);
			}

			switch(ch) {
			case '0':
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
				/* Copy a specific argument */
				outp += copy_macro_arg(flags, out_line, outp,
					di->dl_words[ch - '0'], lenout_line);
				break;

			case '$':
				/* Copy a dollar sign */
				out_line[outp++] = ch;
				break;

			case '&':
				/* Copy the original line */
				{
					int orig_outp = outp;
					outp += copy_macro_arg(flags, out_line, outp,
						di->dir_line, lenout_line);
					/* ... but lose trailing spaces.  These spaces tend
						to come from converted "white" characters. */
					while(out_line[outp-1] == ' ' && outp > 0
							&& outp > orig_outp) outp --;
				}
				break;

			case '*':
				/* Copy all the arguments.  $0 = directive which is not copied */
				for(i=1; i<=di->num_dl_args; i++) {
					if(i>1 && outp > 0 && out_line[outp-1] != ' ')
						out_line[outp++] = ' ';
					outp += copy_macro_arg(flags, out_line, outp,
						di->dl_words[i], lenout_line);
				}
				break;

			default:
				internal_error("category %s ", di->tab->cat);
				FPRINTF(stderr,
					"unexpected '$%c' in action %d of\n",
					ch, di->cur_act_index);
				print_table_entry(di->tab, stderr);
				EXIT(24);	
			}
		} else {
			out_line[outp++] = ch;
		}
		in_line++;
	}

	if(outp >= lenout_line-1) {
		error("macro expansion line length overflow, source line '%s'", in_line);
		EXIT(27);						
	}

	out_line[outp++] = '\0';
}
/*
=TEX

\subsection{Initialization and Initial Checks}

A number of arrays need to be initialized.

On versions of cygwin that support multi-byte character sets, we have
to set a locale with single-byte characters to prevent {\tt regcomp}
failing on patterns containing non-ASCII characters. We don't check the
success of this to support earlier versions of cygwin with the call should
failing harmlessly. The problem with illegal patterns causes the {\Product}
build to break at an early stage, so there is little to be gained by checking
for errors here.

\HOLindexEntry{initialize}
=SIEVE_PROG
*/
void
initialize(void)
{
	int i;
	char pr_test[PrNN_SIZE+PrNN_SIZE];
#ifdef __CYGWIN__
	setlocale(LC_ALL, "C.ISO88591");
#endif
	for(i=1; i<256; i++) character_flags[i] = 0;

	initialise_keyword_information();

	SET_DIRECTIVE_CHAR('%');
	SET_DIRECTIVE_CHAR('=');

	if(copy_PrNN(pr_test, 0) != PrNN_SIZE) {
		internal_error("copy_PrNN", "");
		EXIT(32);						
	}

	/* Make sure that various flags are OK */
	{
		int used_flags = 0;
		int not_or_flags = ~OR_FLAGS;

		i = 0;
		while(cat_options[i].name != NULL) { used_flags |= cat_options[i].flag; i++; }
		i = 0;
		while(arg_options[i].name != NULL) { used_flags |= arg_options[i].flag; i++; }

		if((used_flags & not_or_flags) != 0) {
			internal_error("Flag values faulty", "");
			EXIT(36);					
		}
	}
}
/*
=TEX

Check the data structures built from the view file.

\HOLindexEntry{check_program_initializations}
=SIEVE_PROG
*/
void
check_program_initializations(void)
{
	int i;
	int j;
	int stop_prog = 0;	/* set to 1 if any faults found */
	int order_wrong;
	int flag_zero;

	order_wrong = 0;
	flag_zero = 0;
	for(i=1; i<NUM_ACTIONS; i++) {
		if(strcmp(actions_available[i-1].name, actions_available[i].name) >= 0)
			order_wrong = 1;

		if(actions_available[i].options != NULL) {
			options_available *opts = actions_available[i].options;
			j = 0;
			while(opts[j].name != NULL) {
				if(opts[j].flag == 0) flag_zero = 1;
				j++;
			}
		}
	}

	if(order_wrong > 0)
		internal_error("actions_available entries out of order\n", "");

	if(flag_zero > 0)
		internal_error("actions_available has zero flag option\n", "");

	if(	order_wrong > 0
		|| flag_zero > 0
	) {
		dump_actions_available();
		stop_prog = 1;
	}

	if(stop_prog)
		EXIT(21);
}
/*
=TEX

\HOLindexEntry{conclude_steerfile}
{\tt conclude_steerfile} : Complete the initializations of the
various tables which are initialized from the view file and
make some simple validations of those tables.

=SIEVE_PROG
*/
void
conclude_steerfile(void)
{
	int i;
	int stop_prog = 0;

	for(i = 1; i < max_cat; ++i) {
		cat_filt *tab = &table[i];
		if(tab->min_args == -1) tab->min_args = 0;
		if(tab->max_args == -1) tab->max_args = 0;
		if(tab->max_args < tab->min_args) {
			internal_error("min-max args out of order, cat %s",tab->cat);
			print_table_entry(tab, stderr);
			stop_prog = 1;
		}

		if(tab->num_actions > 0 && ! tab->has_copy_action) {
			grumble("no copy action for category %s in current view",
				tab->cat, &view_F, false);
		}
	}

	if(debug & (D_SHOW_SIEVE_TABLE | D_SHOW_FULL_SIEVE_TABLE))
		print_table();

	if(stop_prog) EXIT(23);							/* EXIT */
}
/*
=TEX

\subsection{Entering Data Into Category Table}

{\tt overwrite} : Write values into a particular category table entry.
This corresponds to either a new entry being inserted or to overwriting
a previously set up entry.  It is the responsibility of the caller to
ensure that the previously entry is not wanted.

The category table entry to overwrite is in {\tt tab_ent}, the
optional filter is in {\tt filt}, if this category header line is for
the wanted view then {\tt using_view} is non zero.

\HOLindexEntry{overwrite}
=SIEVE_PROG
*/
void
overwrite(int tab_ent, int using_view, char *filt)
{
	char *text;
	cat_filt *tab = &table[tab_ent];
	unsigned len_filt = strlen(filt);

	if(using_view) {
		if(len_filt == 0) {
			tab->has_copy_action = 0;
			tab->num_actions = 0;
			tab->is_one_liner = 0;
		} else if(strcmp(filt, "ignore") == 0) {
			tab->has_copy_action = 1;
			tab->num_actions = 1;
			tab->is_one_liner = 1;
			tab->cfa[0].action_type = IGNORE_ACT;
			tab->cfa[0].action_str = "";
		} else if(strcmp(filt, "cat") == 0) {
			tab->has_copy_action = 1;
			tab->num_actions = 1;
			tab->is_one_liner = 1;
			tab->cfa[0].action_type = CAT_ACT;
			tab->cfa[0].action_str = "";
			tab->cfa[0].opt_flags = 0;
		} else {
			tab->has_copy_action = 1;
			text = malloc_and_check(len_filt+1, 101);
			tab->is_one_liner = 1;
			tab->num_actions = 1;
			tab->cfa[0].action_type = FILTER_ACT;
			(void)strcpy(text, filt);
			tab->cfa[0].action_str = text;
		}
	} else {
		tab->num_actions = -1;
	}
}
/*
=TEX

\HOLindexEntry{insert}
{\tt insert} : Add a new entry into the category table.  Return its
index.  The category name is in {\tt cat}, the optional filter is in
{\tt filt}, if this category header line is for the wanted view then
{\tt using_view} is non zero.

The tests on proper category names are made here so that the name will
be inserted even if it is bad, thus providing better error reporting
and error recovery.  Percent characters are excluded as leading
characters, they are only directive characters in that they start
keywords and so calling them directive characters assists in the fast
finding of directive lines.  Perhaps we should use another character
flag, see section~\ref{CharacterFlags}, rather than treat the percent
character specially here.

=SIEVE_PROG
*/
int
insert(char *cat, int using_view, char *filt)
{
	char *text;
	unsigned len_cat = strlen(cat);
	int first_char = cat[0] & 0xFF;

	if(max_cat >= MAX_CAT) {
	    error1("too many categories");
	    EXIT(9);							/* EXIT */
	};

	if(!IS_DIRECTIVE_CHAR(first_char) || first_char == '%') {
		grumble("category name '%s' does not start with a directive character",
			cat, &view_F, true);
	}

	if(len_cat > 1 && kwi.char_code[first_char] != NULL
			&& kwi.char_code[first_char]->act_kind == KW_DIRECTIVE) {
		grumble("badly formed category name '%s'", cat,  &view_F, true);
		FPRINTF(stderr, "\tcharacter '%c' is a category name on its own\n",
			first_char);
	}

	text = malloc_and_check(len_cat+1, 102);
	(void)strcpy(text, cat);
	table[max_cat].cat = text;
	table[max_cat].min_args = -1;
	table[max_cat].max_args = -1;

	overwrite(max_cat, using_view, filt);

	++max_cat;

	return(max_cat-1);
}
/*
=TEX

\HOLindexEntry{arguments_decode}
{\tt arguments_decode} : Decode an arguments action storing the results
in the category table at {\tt tab_ent}.  The arguments are in
{\tt filt} which has either one or two decimal numbers.

=SIEVE_PROG
*/
void
arguments_decode(int tab_ent, char *filt)
{
	int l_min, l_max;
	int decoded = 0;
	int len_filt = strlen(filt);

	int scan_ans, chars_used;

	if(table[tab_ent].num_actions > 0) {
		grumble1("arguments entry must come first", &view_F, true);
		return;								/* RETURN */
	}

	len_filt --;
	while(len_filt > 0 && (filt[len_filt] == ' ' || filt[len_filt] == '\t')) {
		filt[len_filt] = '\0';
		len_filt --;
	}
	len_filt++;

	scan_ans = sscanf(filt, "%d %d%n", &l_min, &l_max, &chars_used);

	if(scan_ans == 2 && chars_used == len_filt) decoded = 1;
	else {
		scan_ans = sscanf(filt, "%d%n", &l_min, &chars_used);

		if(scan_ans == 1 && chars_used == len_filt) {
			decoded = 1;
			l_max = l_min;
		}
	}

	if(decoded == 0) {
		grumble1("cannot decode min-max on arguments", &view_F, true);
		l_max = l_min = 0;
	}

	if(l_max < 0 || l_max > MAX_DIR_ARGS
	|| l_min < 0 || l_min > MAX_DIR_ARGS)
		grumble1("min or max arguments outside range", &view_F, true);
	else {
		if(l_min > l_max) {
			int temp = l_min; l_min = l_max; l_max = temp;
		};

		if((table[tab_ent].min_args >=0 && table[tab_ent].min_args != l_min)
		|| (table[tab_ent].max_args >=0 && table[tab_ent].max_args != l_max)) {
			grumble1("conflict with earlier min or max arguments",
				&view_F, true);
		} else {
			table[tab_ent].min_args = l_min;
			table[tab_ent].max_args = l_max;
		}
	}
}
/*
=TEX

\HOLindexEntry{verify_macro_calls}
{\tt verify_macro_calls} : Check that the text contains only valid
macro calls.  Issue warnings for bad macro calls.  Return 1 if there are
any macro calls, 0 otherwise.

=SIEVE_PROG
*/
int
verify_macro_calls(int max_args, char *filt)
{
	int has_macros = 0;
	int i;
	int ch;
	static char fail_text[3] = {'$', '?', '\0'};

	i = 0;
	while((ch = filt[i]) != '\0') {
		if(ch == '$') {
			has_macros = 1;
			ch = filt[++i];

			switch(ch) {
			case '0':
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9': {
					int argnum = ch - '0';
						/* argument index == argnum */
					if(argnum != 0 && argnum > max_args) {
						fail_text[1] = ch;
						grumble("macro '%s' digit out of range",
							fail_text, &view_F, true);
					}
				}
				break;

			case '$':
			case '&':
			case '*':
				/* It's OK, do nothing */
				break;

			default:
				fail_text[1] = ch;
				grumble("unknown macro '%s'", fail_text, &view_F, true);
				break;
			}
		}
		i++;
	}

	return(has_macros);
}
/*
=TEX

\HOLindexEntry{decode_action_line}
{\tt decode_action_line} : Decode and add an additional action to the indicated
entry in the category table.  Return 1 if all decoded OK, 0 otherwise.
This function is recursive, the initial two words of {\tt line} may
indicate writing or appending to a named file, in which case the
recursive call is used to process the rest of the line which contains
the real action.  Argument depth is used to prevent multiple output
redirections, it is incremented on each recursive call.

=SIEVE_PROG
*/
int
decode_action_line(
	int tab_ent,
	int using_view,
	char *line,
	int depth)
{
	cat_filt *tab = &table[tab_ent];
	char *action_name;
	char *filt;
	char *text;
	int act_idx;
	unsigned len_filt;

	if(depth > 1) {
		grumble1("too many output options", &view_F, true);
		return(0);							/* RETURN */
	}

	if(tab->is_one_liner && using_view) {
		grumble1("unexpected action line", &view_F, true);
		return(0);							/* RETURN */
	}

	action_name = skip_space(line);

	filt = split_at_space(action_name);

	len_filt = strlen(filt);

	act_idx = find_action(action_name);
	if(act_idx == NOT_FOUND) {
		grumble1("action type not recognized", &view_F, true);
		return(0);							/* RETURN */
	}

	switch(actions_available[act_idx].arg_type) {
	case ARGS_YES:
		if(len_filt == 0) {
			grumble1("no argument provided for action", &view_F, true);
			return(0);						/* RETURN */
		}
		break;								/* BREAK */
	case ARGS_NO:
		if(len_filt != 0) {
			grumble1("unexpected argument with action", &view_F, true);
			return(0);						/* RETURN */
		}
		break;								/* BREAK */
	default:
		break;								/* BREAK */
	}

	if(using_view) {
		if(actions_available[act_idx].code == ARGS_SET_UP) {
			arguments_decode(tab_ent, filt);
		} else if(actions_available[act_idx].code == ARG_ACTIONS) {
			if(tab->extra_flags != 0) {
				grumble1("duplicate action options",
					&view_F, true);
			}
			tab->extra_flags = get_options(
				actions_available[act_idx].options, filt);
		} else if(actions_available[act_idx].code == WRITE_ACT ||
				actions_available[act_idx].code == APPEND_ACT) {
			/* Argument in "filt" is a file name, remaining
				text is the real action line */

			char *action_body = split_at_space(filt);

			if(decode_action_line(tab_ent, using_view, action_body, depth+1)) {
				/* Have added the action body into "tab", now add the
					output qualifier */

				int act_num = tab->num_actions - 1;
				cat_filt_action *cf = &(tab->cfa[act_num]);
				cf->cfa_flags |=
					(actions_available[act_idx].code == WRITE_ACT)
					? CFA_WRITE : CFA_APPEND;
				cf->op_file = strdup(filt);
				if(verify_macro_calls(tab->max_args, filt))
					cf->cfa_flags |= CFA_FILE_MACROS;

				if(cf->action_type == FILTER_ACT ||
						cf->action_type == IGNORE_ACT) {
					grumble1("output redirect not compatible with filter",
						&view_F, true);
					return(0);				/* RETURN */
				}
			} else {
				return(0);					/* RETURN */
			}
		} else {
			int act_num = tab->num_actions;

			if(actions_available[act_idx].copy_action) {
				if(tab->has_copy_action) {
					grumble1("multiple copy actions",
						&view_F, true);
					return(0);				/* RETURN */
				}
				tab->has_copy_action = 1;
			}

			if(act_num >= MAX_ACTION) {
				grumble1("Too many actions", &view_F, true);
				return(0);					/* RETURN */
			}

			tab->cfa[act_num].action_type = actions_available[act_idx].code;
			tab->cfa[act_num].action_str = "";
			tab->cfa[act_num].opt_flags = 0;

			switch(actions_available[act_idx].code) {
			case CAT_ACT :
				tab->cfa[act_num].opt_flags = get_options(
					actions_available[act_idx].options, filt);
				check_cat_options(tab->cfa[act_num].opt_flags);
				break;						/* BREAK */

			case ECHONL_ACT :
			case ECHO_ACT :
			case FILTER_ACT:
				if(len_filt != 0) {
					text = malloc_and_check(len_filt+1, 103);
					(void)strcpy(text, filt);
					tab->cfa[act_num].action_str = text;
					if(verify_macro_calls(tab->max_args, filt))
						tab->cfa[act_num].cfa_flags
							|= CFA_ACT_MACROS;
				}
				break;						/* BREAK */

			default:
				break;						/* BREAK */
			}
			tab->num_actions ++;
		}
	}

	return(1);
}
/*
=TEX

\subsection{Keyword File Reading Functions}

\HOLindexEntry{get_char_code}
{\tt get_char_code} : Extract a character code from {\tt line}, if a
code is obtained then return 1 and set {\tt value} to the code found.
If no code found then return 0 and set "value" to 0.

Character codes are one of:  hex with a leading "0x" or "0X"; octal
with a leading "0"; or decimal numbers.
Character codes are now expected to be UNICODE code points.
They must be in the range~$-1\sb{10}$ to~$xFFFFFF\sb{16}$ (this needs to be refined a bit).



=SIEVE_PROG
*/
int
get_char_code(char *line, int *value)
{
	int ch = -1;		/* -1 ==> not a valid code */

	int scan_ans;
	int len;

	scan_ans = sscanf(line, "%i%n", &ch, &len);

	if(scan_ans != 1 || len != strlen(line))
		ch = -1;

	if(ch >= -1 && ch <= 0xFFFFFF) {
		*value = ch;
		return(1);
	} else {
		*value = 0;
		return(0);
	}
}
/*

\HOLindexEntry{get_char_unicode}
{\tt get_char_unicode} : Extract a character unicode code point from {\tt line}, if a
code is obtained then return 1 and set {\tt value} to the code found.
If no code found then return 0 and set "value" to 0.

Unicode code points are one of:  hex with a leading "0x" or "0X"; octal
with a leading "0"; or decimal numbers.  They must be in the
range~$-1\sb{10}$ to~$ffffff\sb{16}$.

=SIEVE_PROG
*/
int
get_char_unicode(char *line, unicode *value)
{
	int ch = -1;		/* -1 ==> not a valid code */

	int scan_ans;
	int len;

	scan_ans = sscanf(line, "%i%n", &ch, &len);

	if(scan_ans != 1 || len != strlen(line))
		ch = -1;

	if(ch >= -1 && ch <= 0xFFFFFF) {
		*value = ch;
		return(1);
	} else {
		*value = 0;
		return(0);
	}
}
/*
=TEX
A keyword may be defined to have a {\TeX} argument, given as a regular expression
following a {\#} sign not escaped by a backslash in the macro part of the keyword file line.
The  following function checks for this regular expression, replaces the {\#} sign by a null
terminator and compiles the regular expression (into a malloced buffer). The return
value is a pointer to the compiled regular expression or null, if there is no {\TeX} argument.

\HOLindexEntry{get_tex_arg}
=SIEVE_PROG
*/
void
get_tex_arg(char *macro, regex_t **tex_arg, char *tex_arg_sense)
{
	char *p = macro;
	char escaped = false;
	int error_code;
	int cflags = REG_EXTENDED;
	while(*p) {
		if(escaped) {
			escaped = false;
		} else if (*p == '\\') {
			escaped = true;
		} else if (*p == '#') {
			break;
		}
		p += 1;
	}
	if(*p == '#') {
		*p = '\0';
		p += 1;
		if(*p == '-') {
			*tex_arg_sense = KW_RE_DELIMITER;
			p += 1;
		} else {
			*tex_arg_sense = KW_RE_MATCH;
		}
		*tex_arg = malloc_and_check(sizeof(regex_t), 108);
		error_code = regcomp(*tex_arg, p, cflags);
		if(error_code != 0) {
			char *errbuf;
			int errbufsize = regerror(error_code, *tex_arg, 0, 0);
			errbuf = malloc_and_check(errbufsize, 109);
			(void) regerror(error_code, *tex_arg, errbuf, errbufsize);
			grumble(" error in regular expression: %s", errbuf,
				&keyword_F, true);
			free(errbuf);
			free(*tex_arg);
			*tex_arg = 0;
		}
	} else {
		*tex_arg =0;
	}	
}
/*
=TEX

\subsection{Sieving Functions}

These are used whilst processing the source text.  Text may be
written to several places whilst sieving.

\HOLindexEntry{open_output}
{\tt open_output} : Open any output file wanted for the action given by
{\tt cf}, returning the file details in the argument {\tt di}.

=SIEVE_PROG
*/
void
open_output(dir_info *di, cat_filt_action *cf)
{
	static char *file_name_area = NULL;
	int file_name_length = 0;

	if(file_name_area == NULL) {
		file_name_area = malloc_and_check(MACRO_EXP_SIZE+1, 104);
	}

	di->cur_fp = stdout;
	di->cur_fp_class = FP_STDOUT;

	if(cf->cfa_flags & (CFA_WRITE | CFA_APPEND)) {
		if(debug & D_OPEN_OUTPUT) {
			(void)printf("open_output: flags=%d  start_name=%s\n",
				cf->cfa_flags, cf->op_file);
		}

		if(cf->cfa_flags & CFA_FILE_MACROS) {
			expand_macro(di, cf->op_file, file_name_area, MACRO_EXP_SIZE);
		} else {
			string_n_copy(file_name_area, cf->op_file, MACRO_EXP_SIZE);
		}

		file_name_length = strlen(file_name_area);
		if(file_name_length > limits.file_name_area)
			limits.file_name_area = file_name_length;

		if(file_name_length<=0 || *(find_space(file_name_area)) != '\0') {
			error("faulty file name '%s' created for redirection", file_name_area);
			EXIT(33);
		}

		if(debug & D_OPEN_OUTPUT) {
			(void)printf("open_output: flags=%d  real_name=%s\n",
				cf->cfa_flags, file_name_area);
		}

		di->cur_fp_class = FP_OTHERFILE;
		di->cur_fp = fopen(file_name_area,
			cf->cfa_flags & CFA_WRITE ? "w" : "a");
		if(di->cur_fp == NULL) {
			unix_error("cannot create file '%s'", file_name_area);
			EXIT(31);
		}
	}
}
/*
=TEX

\HOLindexEntry{reset_output}
{\tt reset_output} :  Called at end of input and at changes of
category, this function makes sure that any active filter and any
output other than standard output are shut down properly.

=SIEVE_PROG
*/
void
reset_output(dir_info *di)
{
	if(fflush(di->cur_fp) != 0) {
		unix_error1("i/o error reported on flush operation");
		EXIT(14);							/* EXIT */
	}

	switch(di->cur_fp_class) {
	case FP_PIPE:
		if(pclose(di->cur_fp) != 0) {
			unix_error1("i/o error reported on close pipe operation");
			EXIT(7);						/* EXIT */
		}
		break;								/* BREAK */

	case FP_OTHERFILE:
		if(fclose(di->cur_fp) != 0) {
			unix_error1("i/o error reported on close file operation");
			EXIT(8);						/* EXIT */
		}
		break;								/* BREAK */
	default:
		break;								/* BREAK */
	}

	di->cur_fp = stdout;
	di->cur_fp_class = FP_STDOUT;
}
/*
=TEX

\HOLindexEntry{do_non_copy_actions}
{\tt do_non_copy_actions} :  Do the next actions of the current
category until either all are done or until a non-copy action is
found.  Return the index of the non-copy action or an index past the
last action.  The current category and next action number are found
from argument {\tt di}.  Argument {\tt fp} gives the output stream
for those cases where the action does not state its own output stream.

=SIEVE_PROG
*/
int
do_non_copy_actions(dir_info *di)
{
	cat_filt *tab = di->tab;
	static char *macro_exp_area = NULL;
	char *op_text = "";

	if(macro_exp_area == NULL) {
		macro_exp_area = malloc_and_check(MACRO_EXP_SIZE+1, 105);
	}

	while(di->cur_act_index < tab->num_actions) {
		int new_stream = 0;

		switch(tab->cfa[di->cur_act_index].action_type) {
		case IGNORE_ACT :
		case CAT_ACT :
		case FILTER_ACT:
		case ML_STRING_ACT:
			return(di->cur_act_index);				/* RETURN */
		default: break;							/* BREAK */
		}

		if(tab->cfa[di->cur_act_index].cfa_flags & (CFA_WRITE | CFA_APPEND)) {
			/* Open a new stream for this output */
			open_output(di, &(tab->cfa[di->cur_act_index]));
			new_stream = 1;
		}

		switch(tab->cfa[di->cur_act_index].action_type) {
		case ECHO_ACT :
		case ECHONL_ACT :
			op_text = tab->cfa[di->cur_act_index].action_str;
			if(di->tab->cfa[di->cur_act_index].cfa_flags
					& CFA_ACT_MACROS) {
				expand_macro(di, op_text, macro_exp_area, MACRO_EXP_SIZE);
				op_text = macro_exp_area;
				if(limits.opt_list) {
					int op_len = strlen(op_text);
					if(op_len > limits.non_copy_length)
						limits.non_copy_length = op_len;
				}
				break;						/* BREAK */
			}
			default:
				break;						/* BREAK */
		}

		switch(tab->cfa[di->cur_act_index].action_type) {
		case ECHO_ACT :
			(void)fputs(op_text, di->cur_fp);
			break;							/* BREAK */

		case ECHONL_ACT :
			(void)fputs(op_text, di->cur_fp);
									/* FALL THROUGH */
		case NL_ACT :
			(void)fputs("\n", di->cur_fp);
			break;							/* BREAK */

		default:
			internal_error("in table for category %s", tab->cat);
			FPRINTF(stderr, "  unknown action code %d\n",
				tab->cfa[di->cur_act_index].action_type);
			print_table_entry(tab, stderr);
			EXIT(19);						/* EXIT */
			break;							/* BREAK */
		}

		if(new_stream) {
			if(fclose(di->cur_fp) != 0) {
				unix_error1("cannot close file");
				EXIT(20);
			}
			di->cur_fp = stdout;
			di->cur_fp_class = FP_STDOUT;
		}

		di->cur_act_index++;
	}

	return(di->cur_act_index);
}
/*
=TEX

\HOLindexEntry{complete_actions}
{\tt complete_actions} :  Do all the remaining actions for the
category.  These must be non-copy actions.

=SIEVE_PROG
*/
void
complete_actions(dir_info *di)
{
	cat_filt *tab = di->tab;
	di->cur_act_index++;
	di->cur_act_index = do_non_copy_actions(di);
	if(di->cur_act_index < tab->num_actions) {
		internal_error("actions not completed for category:%s", tab->cat);
		FPRINTF(stderr, "\tprocessed %d actions but category has %d actions\n",
				di->cur_act_index, tab->num_actions);
		print_table_entry(tab, stderr);
		EXIT(12);							/* EXIT */
	}
}
/*
=TEX

\subsection{Auxiliaries For Source File Line Processing}


\HOLindexEntry{copy_PrNN}
\label{FunCopyPrNN}
{\tt copy_PrNN} : Writes the characters `\verb|\Pr|$\cal NN$\verb|{}|'
starting at {\tt str} where the `$\cal NN$' is the hexadecimal value of
`{\tt code~\&~0xFF}' but the hexadecimal digits are encoded 0=>`{\tt
A}', 1=>`{\tt B}', $\ldots$ 15=>`{\tt P}'.  Return the number of
characters written.

Note that it may look nicer if the output were to have the brackets
enclosing the macro call (i.e., `\verb|{\Pr|$\cal NN$\verb|}|') but
this would mean that the macros themselves could not contain unmatched
\TeX{} grouping characters.  One such instance is the indexing
characters where the open index character is expanded to something like
`\verb|\index\bgroup|' and the close index character
to `\verb|\egroup|'.

=SIEVE_PROG
*/
int
copy_PrNN(char *str, int code)
{
	int d1 = (code & 0xF0) >> 4;
	int d2 = (code & 0x0F);

	int i = 0;

	str[i++] = '\\';
	str[i++] = 'P';
	str[i++] = 'r';
	str[i++] = d1 + 'A';
	str[i++] = d2 + 'A';
	str[i++] = '{';
	str[i++] = '}';

	return(PrNN_SIZE);
}
/*
=TEX

\HOLindexEntry{copy_string}
{\tt copy_string} : Copies the {\tt source} string into the {\tt dest}
string for up to {\tt max} characters.  Does not add a null character
after the copied characters if the length is exceeded.  Return the
number of characters copied.  This differs from the C library routines
{\tt strcpy} and {\tt strncpy} which return the address of the output
string.
=SIEVE_PROG
*/
int
copy_string(char *source, char *dest, int max)
{
	int i = 0;

	if(source != NULL) {
		while((*(dest++) = *(source++)) != '\0' && i < max) {
			i++;
		}
	}

	return(i);
}
/*
=TEX

\HOLindexEntry{copy_keyword}
{\tt copy_keyword} :  Copies the keyword {\tt kw} read from the input
string into the {\tt dest} string for up to {\tt max} characters.
Return the number of characters written to {\tt dest}.  The keyword is
{\tt kwlen} characters long, it starts and (probably) ends with
`{\tt\%}' characters which are not copied if {\tt suppress} is non zero.

=SIEVE_PROG
*/
int
copy_keyword(
	char *kw,
	int kwlen,
	char *dest,
	int max,
	int suppress)
{
	int inp = 0;
	int outp = 0;

	while(*kw != '\0' && inp < kwlen && outp < max) {
		if(suppress && *kw == '%') {
			kw++;
		} else {
			*(dest++) = *(kw++);
			outp++;
		}
		inp++;
	}

	return(outp);
}
/*
=TEX

\subsection{Source File Line Processing}

These routines are called by function {\tt process_line} to
perform the various manipulations of the non-directive lines.

\HOLindexEntry{mlstring}
{\tt mlstring} :  Convert input argument to a Standard ML string, but
without the enclosing string quotes, write the result to the given
output stream.  Convert pretty characters to their decimal form, e.g.,
the byte value decimal \verb|234| is written as the characters
\verb|\234|.  Prefix ``~\verb|"|~'' and ``~\verb|\|~'' with a
``~\verb|\|~'' character.  Across the whole input (not just each call
of this routine) convert even numbered ``~\verb|`|~'' characters (as
counted when read) into ``~\verb|'|~''characters.  Other characters are
left unchanged.

=SIEVE_PROG
*/
void
mlstring(char *line, FILE    *fp)
{
	int ch;
	int j;
	static int is_even_prime = 1;  /* Assume the first prime is odd-numbered, ie
					that an even-number prime has been read */

	for(j=0; (ch = line[j]) != '\0'; j++) {
		switch(ch) {
		case '`':
				is_even_prime = !is_even_prime;
				PUTC(is_even_prime ? '\'' : '`', fp);
				break;						/* BREAK */
		case '"':
		case '\\':
				/* Copy these, but preceeded by a '\\' */
				PUTC('\\', fp) ;
									/* FALL THROUGH */
		case '\n':
		case '\t':
		case ' ':
				/* Copy these */
				PUTC(ch, fp);
				break;						/* BREAK */
		default:
				/* Copy the printing chars, show others in decimal */
				if(isascii(ch) && isgraph(ch)) {
					PUTC(ch, fp);
				} else {
					FPRINTF(fp, "\\%03d", ch & 0xFF);
				}
		}
	}
	PUTC('\n', fp);
}
/*
=TEX

\HOLindexEntry{main_convert}
{\tt main_convert} : Provides the conversion routine used for most things.
If it is called with no flags set it just copies the text through
unchanged.

Various conversions are supported, they are described with the
definitions of the options flags in section~\ref{ActionOptions}.

\HOLindexEntry{MAIN_LEEWAY}
To avoid complicating the code below by excessive testing of
overflowing the line length macro {\tt MAIN_LEEWAY} allows a little
leeway for adding a few single characters.  The value allows at least
the number of characters that the conversions below may create.

\HOLindexEntry{MAX_TEX_ARG_NESTING}
{\tt MAX_TEX_ARG_NESTING} defines the length of the stack containing arguments
for {\TeX}.
=SIEVE_PROG
*/
#define MAIN_LEEWAY (MAX_KW_LEN+5)
#define MAX_TEX_ARG_NESTING (16)

void
main_convert(
	char *in_line,
	int flags,
	char *out_line,
	int lenout_line,
	struct file_data *file_F)
{
	int inp = 0;
	int outp = 0;
	int ch;
	int opt_del_index = flags & OPT_DELINDEX;
	int opt_do_latex = flags & OPT_LATEX;
	int opt_do_line_verbatim = flags & OPT_VERBATIM;
	int opt_do_kw = flags & OPT_KW;
	int opt_conv_kw = flags & OPT_CONV_KW;
	int opt_do_ml_char = flags & OPT_ML_CHAR;
	int opt_do_conv_ext = flags & OPT_CONV_EXT;
	int opt_do_char = flags & OPT_CHAR;
	int opt_kw_warn = flags & OPT_WARN_KW;
	int opt_flag_kw = opt_do_kw && opt_do_latex && (flags & OPT_FLAG_KW);
	int opt_do_white = flags & OPT_WHITE;
	int tex_arg_stack[MAX_TEX_ARG_NESTING];
	int tex_arg_stack_head = -1;

	int spin_count = 5;

	lenout_line -= MAIN_LEEWAY;

	/* Possibly override "opt_do_line_verbatim" when "OPT_VERB_ALONE" set. */
	if(flags & OPT_VERB_ALONE) {
		int all_alone = 1;
		int found_white_space = 0;
		int c_va = 0;
		while(all_alone && (ch = (in_line[inp] & 0xFF)) != '\0') {
			if(ch == '%' && opt_do_kw) {
				int kwlen;
				int kwindex;

				kwindex = get_hol_kw(&in_line[inp], &kwlen, opt_kw_warn, file_F);

				if(kwindex>=0) {
					int kwty = kwi.keyword[kwindex].act_kind;
					if(kwty == KW_VERB_ALONE) c_va++;
					else if(kwty == KW_WHITE) { /* Do nothing */ }
					else all_alone = 0;
					inp += kwlen;
				} else all_alone = 0;
			} else {
				if(IS_VERB_ALONE_CH(ch)) c_va++;
				else if(kwi.char_code[ch] != NULL &&
						kwi.char_code[ch]->act_kind == KW_WHITE)
					{ /* Do nothing */ }
				else if(isascii(ch) && isspace(ch))
					{ found_white_space = 1; }
				else all_alone = 0;
				inp ++;
			}
		}

		if(c_va == 0) all_alone = 0;
		else if(found_white_space) {
			grumble1("white space characters found on verbalone line", file_F, true);
		}
		opt_do_line_verbatim = ! all_alone;
	}

	inp = outp = 0;

	if(opt_do_line_verbatim) {
		/* Add start of line text */
		out_line[outp++] = '\\';
		out_line[outp++] = '+';
	}

	while((ch = (in_line[inp] & 0xFF)) != '\0' && outp < lenout_line) {
		int top_inp = inp;  /* To test that the code below increments "inp" */
		regex_t *tex_arg = NULL;
		char tex_arg_sense;

		if(debug & D_MAIN_CONVERT_CH)
			(void)printf("main_convert: inp=%d  ch=%d:%c  outp=%d\n",
				inp, ch, ch, outp);

		while(tex_arg_stack_head >= 0 && inp == tex_arg_stack[tex_arg_stack_head]) {
			out_line[outp++] = '}';
			tex_arg_stack_head -= 1;
		}

		switch(ch) {
		case '%': if(opt_do_kw) {
				int kwlen;
				int kwindex;

				kwindex = get_hol_kw(&in_line[inp], &kwlen, opt_kw_warn, file_F);

				/* Three cases: (1) known keyword, (2)
					well-formed but unknown keyword,
					(3) mal-formed keyword */


				if(kwindex>=0) {
					/* Known keyword */
					struct keyword_information *curkw
						= &kwi.keyword[kwindex];

					if((curkw->act_kind == KW_INDEX)
							&& opt_del_index) {
						/* Suppress it */
						/* I.e., do nothing. */
					} else if(opt_do_white && curkw->act_kind
							== KW_WHITE) {
						/* Replace with a space */
						out_line[outp++] = ' ';
					} else if(opt_do_char && curkw->macro != NULL && kwlen != 2) {
						/* Convert it to LaTeX form */
						outp += copy_string(curkw->macro,
							&out_line[outp], lenout_line-outp);
						tex_arg = curkw->tex_arg;
						tex_arg_sense = curkw->tex_arg_sense;
					} else if(opt_do_latex && curkw->ech != -1) {
						/* Convert to LaTeX form */
						outp += copy_PrNN(&out_line[outp],
							curkw->ech);
					} else if(opt_do_char && curkw->ech != -1) {
						/* Convert to LaTeX form */
						outp += copy_PrNN(&out_line[outp],
							curkw->ech);
						tex_arg = curkw->tex_arg;
						tex_arg_sense = curkw->tex_arg_sense;
					} else if(opt_conv_kw && curkw->ech != -1) {
						/* Replace with the extended character */
						out_line[outp++] = curkw->ech;
					} else {
						/* Just copy the keyword */
						outp += copy_keyword(&in_line[inp], kwlen,
							&out_line[outp], lenout_line-outp, 0);
					}
					inp += kwlen;
				} else if(kwlen>0) {
					/* Unknown, but well-formed, keyword */
					if(opt_flag_kw) {
						/* Copy the keyword without its percent chars */
						outp += copy_string("\\UnknownKeyword{",
							&out_line[outp], lenout_line-outp);
						outp += copy_keyword(&in_line[inp], kwlen,
							&out_line[outp], lenout_line-outp, 1);
						out_line[outp++] = '}';
					} else if(opt_do_latex) {
						/* Copy the keyword but protect its percent
							characters.  Note that "MAIN_LEEWAY"
							allows us to add the protected percents */
						out_line[outp++] = '\\';
						out_line[outp++] = '%';

						outp += copy_keyword(&in_line[inp], kwlen,
							&out_line[outp], lenout_line-outp, 1);

						out_line[outp++] = '\\';
						out_line[outp++] = '%';
					} else {
						/* Just copy the keyword */
						outp += copy_keyword(&in_line[inp], kwlen,
							&out_line[outp], lenout_line-outp, 0);
					}
					inp += kwlen;
				} else {
					/* Mall-formed keyword */
					if(opt_flag_kw) {
						outp += copy_string("\\MalFormedKeyword",
							&out_line[outp], lenout_line-outp);
					}
					if(opt_do_latex) out_line[outp++] = '\\';
					out_line[outp++] = '%';
					inp++;
				}
			} else {
				/* Do not try to recognize percent keywords, just
					copy them through.  Note that percent signs
					may need to be escaped with a '\' */
				if(opt_do_latex) out_line[outp++] = '\\';
				out_line[outp++] = ch;
				inp++;
			}
			break;							/* BREAK */

		case  '\\':
			if(opt_do_latex) outp += copy_string("\\Backslash{}",
				&out_line[outp], lenout_line-outp);
			else out_line[outp++] = ch;
			inp++;
			break;							/* BREAK */

		case  '^':
			if(opt_do_latex) outp +=
				copy_string("\\Circumflex{}", &out_line[outp],
				 lenout_line-outp);
			else out_line[outp++] = ch;
			inp++;
			break;							/* BREAK */

		case  '~':
			if(opt_do_latex) outp += copy_string("\\Twiddles{}", &out_line[outp],
				lenout_line-outp);
			else out_line[outp++] = ch;
			inp++;
			break;							/* BREAK */

		case  '{':
		case  '}':
		case  '_':
		case  '#':
		case  '&':
		case  '$':
			/* Characters with special meaning to LaTeX must be escaped. */
			if(opt_do_latex) out_line[outp++] = '\\';
			out_line[outp++] = ch;
			inp++;
			break;							/* BREAK */

		default: {
			struct keyword_information *curkw = kwi.char_code[ch];

			if(opt_del_index && curkw != NULL
					&& curkw->act_kind == KW_INDEX) {
				/* Suppress it */
			} else if(opt_do_white && curkw != NULL
					&& curkw->act_kind == KW_WHITE) {
				/* Replace with a space */
				out_line[outp++] = ' ';
			} else if(ch > 127) {
				if(opt_do_ml_char) {
					int dig_unit = ch % 10;
					int tens = (ch - dig_unit) / 10;
					int dig_ten = tens % 10;
					int hundreds = (tens - dig_ten) / 10;
					int dig_hun = hundreds % 10;

					out_line[outp++] = '\\';
					out_line[outp++] = dig_hun + '0';
					out_line[outp++] = dig_ten + '0';
					out_line[outp++] = dig_unit + '0';
				} else if(opt_do_char) {
					if(curkw != NULL && curkw->macro != NULL) {
						/* Convert it to LaTeX form */
						outp += copy_string(curkw->macro,
							&out_line[outp], lenout_line-outp);
					} else {
						outp += copy_PrNN(&out_line[outp], ch);
					}
					if(curkw != NULL) {
						tex_arg = curkw->tex_arg;
						tex_arg_sense = curkw->tex_arg_sense;
					}
				} else if (opt_do_conv_ext) {
					if(curkw != NULL && curkw->name != NULL) {
						/* Convert it to LaTeX form */
						outp += copy_string(curkw->name,
							&out_line[outp], lenout_line-outp);
					} else {
						out_line[outp++] = ch;
					}
				} else {
					out_line[outp++] = ch;
				}
			} else {
				out_line[outp++] = ch;
			}
			inp++;
			break;							/* BREAK */
			} /* End of switch:default */
		}

		if(top_inp >= inp) {
			internal_error("main_convert spinning", "");
			spin_count --;
			if(spin_count > 0) {
				FPRINTF(stderr,
					"%3d:  top_inp=%d  inp=%d  outp=%d  ch=%d",
					spin_count, top_inp, inp, outp, ch);
				if(isascii(ch) && isgraph(ch)) {
					PUTC('=', stderr);
					PUTC('\'', stderr);
					PUTC(ch, stderr);
					PUTC('\'', stderr);
				}
				PUTC('\n', stderr);
			} else {
				out_line[outp++] = '\0';
				FPRINTF(stderr, "in_line: '%s'\nout_line: '%s'\n",
					in_line, out_line);
				EXIT(35);					/* EXIT */
			}
		}

		if(tex_arg != NULL && tex_arg_stack_head < MAX_TEX_ARG_NESTING) {
			int eflags = REG_NOTBOL;
			int error_code;
			regmatch_t pmatch;
			error_code = regexec(tex_arg, &in_line[inp], 1, &pmatch, eflags);
			out_line[outp++] = '{';
			tex_arg_stack_head += 1;
			if(tex_arg_sense == KW_RE_MATCH) {
				if(error_code == 0 && pmatch.rm_so == 0) {
					tex_arg_stack[tex_arg_stack_head] = inp + pmatch.rm_eo;
				} else {
					tex_arg_stack[tex_arg_stack_head] = inp;
				}
			} else {
				if(error_code == 0) {
					tex_arg_stack[tex_arg_stack_head] = inp + pmatch.rm_so;
				} else {
					tex_arg_stack[tex_arg_stack_head] = strlen(in_line);
				}
			}
		} else if (tex_arg != NULL) {
			grumble1("TeX argument stack overflow", file_F, true);
		}
	}

	if(outp >= lenout_line) {
		grumble1("output line too large after macro expansion etc", file_F, true);
		EXIT(34);
	}


	/* The next few lines MUST not add more than "MAIN_LEEWAY" characters */
	lenout_line += MAIN_LEEWAY;

	while(tex_arg_stack_head >= 0) {
		out_line[outp++] = '}';
		tex_arg_stack_head -= 1;
	}

	if(opt_do_line_verbatim) {
		/* Add end of line text */
		out_line[outp++] = '\\';
		out_line[outp++] = '\\';
	}

	out_line[outp++] = '\0';

	if(outp >= lenout_line-1) {
		internal_error("output line too large", "");
		EXIT(40);
	}

	if(debug & D_MAIN_CONVERT_CH) {
		(void)printf("main_convert: was: %s\n", in_line);
		(void)printf("main_convert: now: %s\n", out_line);
	}
}
/*
=TEX

\subsection{Sieving Routines}

\HOLindexEntry{process_line}
{\tt process_line} : Handles each non-directive line, it selects the
appropriate type of processing.  Function {\tt sieve} is in overall control of
the sieving phase of the program.

=SIEVE_PROG
*/
void
process_line(char *line, dir_info *di)
{
	static char *convert_area = NULL;
	char *op_text = line;
	int a_flags = di->tab->cfa[di->cur_act_index].opt_flags;

	if(convert_area == NULL) {
		convert_area = malloc_and_check(MACRO_EXP_SIZE+1, 107);
	}

	if(debug & D_PROCESS_LINE) {
		(void)printf("process_line action#=%d  flags=0x%04x %4d: '%s'\n",
			di->cur_act_index, a_flags, main_F.line_no, line);
	}

	switch(di->current_action) {

	case IGNORE_ACT :
		break;								/* BREAK */

	case FILTER_ACT :
		FPRINTF(di->cur_fp, "%s\n", op_text);
		break;								/* BREAK */

	case CAT_ACT :
		/* if(a_flags) */ {
			main_convert(op_text, a_flags, convert_area,
				MACRO_EXP_SIZE, &main_F);
			if(limits.opt_list) {
				int ca_len = strlen(convert_area);
				if(ca_len > limits.process_line_len)
					limits.process_line_len = ca_len;
			}
			op_text = convert_area;
		}

		FPRINTF(di->cur_fp, "%s\n", op_text);
		break;								/* BREAK */

	case ML_STRING_ACT :
		mlstring(op_text, di->cur_fp);
		break;								/* BREAK */

	default :
		internal_error("category %s ", di->tab->cat);
		FPRINTF(stderr, "unexpected action type %d at line %d: %s\n",
			di->current_action, main_F.line_no, line);
		print_table_entry(di->tab, stderr);
		EXIT(18);							/* EXIT */
		break;								/* BREAK */
	}

	if(feof(di->cur_fp) || ferror(di->cur_fp)) {
		error_top();
		FPRINTF(stderr, "i/o error on write operation at line %d: %s\n",
			main_F.line_no, op_text);
		EXIT(11);							/* EXIT */
	}
}
/*
=TEX

\HOLindexEntry{set_up_for_copy_action}
{\tt set_up_for_copy_action} :  After decoding a directive line set up
the copying action.  The actual copying is done via {\tt process_line}
which is called for the non-directive lines.  A main activity here is
to set up the pipe for a filter or the output for write or appending.
These are set into the given {\tt di}.

=SIEVE_PROG
*/
void
set_up_for_copy_action(dir_info *di)
{
	static char *expanded_filter = NULL;
	int cur_action = di->tab->cfa[di->cur_act_index].action_type;

	if(expanded_filter == NULL) {
		expanded_filter = malloc_and_check(MACRO_EXP_SIZE+1, 106);
	}

	di->cur_fp = stdout;
	di->cur_fp_class = FP_STDOUT;

	switch(cur_action) {

	case IGNORE_ACT :
			    	di->current_action = cur_action;
				break;						/* BREAK */

	case CAT_ACT :
	case ML_STRING_ACT :
				open_output(di, &(di->tab->cfa[di->cur_act_index]));
			    	di->current_action = cur_action;
				break;						/* BREAK */

	case FILTER_ACT :{
				char *filt = di->tab->cfa[di->cur_act_index].action_str;

				if(debug & D_ACTIONS)
					message("Filtering text with: %s", filt);

			    	di->current_action = FILTER_ACT;

				if(di->tab->cfa[di->cur_act_index].cfa_flags
						& CFA_ACT_MACROS) {
					expand_macro(di, filt, expanded_filter,
						MACRO_EXP_SIZE);
					if(limits.opt_list) {
						int filt_len = strlen(expanded_filter);
						if(filt_len > limits.process_line_len)
							limits.process_line_len = filt_len;
					}
					filt = expanded_filter;
					if(debug & D_ACTIONS) message(
						"    which expands to: %s", filt);
				}

				di->cur_fp_class = FP_PIPE;
				di->cur_fp = popen(filt, "w");
				if(di->cur_fp == NULL) {
					unix_error("cannot execute filter %s", filt);
					EXIT(10);				/* EXIT */
				};

				break;						/* BREAK */
			}

	default :		internal_error("category %s ", di->cat);
				FPRINTF(stderr,
					"unexpected action number %d at line %d: %s",
					di->cur_act_index, main_F.line_no, main_F.cur_line);
				print_table_entry(di->tab, stderr);
				EXIT(17);					/* EXIT */
				break;						/* BREAK */
	}
}
/*
=TEX

\HOLindexEntry{set_up_new_category}
{\tt set_up_new_category} : Update the directive information in {\tt
di} ready to process a new category whose name, arguments, etc., are
given in {\tt di}.

=SIEVE_PROG
*/
void
set_up_new_category(dir_info *di)
{
	di->table_index = look_up(di->cat);
	if(di->table_index < 0) {
		/* Unknown category */
		grumble("skipping unknown category %s", di->cat, &main_F, true);
		di->tab = &table[0];
		di->current_action = IGNORE_ACT;
	} else {
		/* Known new category */
		di->tab = &table[di->table_index];

		if(table[di->table_index].num_actions < 0) {
			/* Suppress this category */
			di->current_action = IGNORE_ACT;
		} else if(di->num_dl_args < di->tab->min_args ||
				di->num_dl_args > di->tab->max_args) {
			/* Wrong number of arguments, suppress the category */
			grumble("%s arguments, ignoring category",
				di->num_dl_args < di->tab->min_args
					? "insufficient" : "too many",
				&main_F, true);
			if(di->tab->min_args == 0 && di->tab->max_args == 0) {
				FPRINTF(stderr, "\tas %d,  but 0 argument allowed\n",
					di->num_dl_args);
			} else {
				FPRINTF(stderr,
					"\thave %d args,  require %d <= args <= %d\n",
					di->num_dl_args, di->tab->min_args,
					di->tab->max_args);
			}
			di->tab = &table[0];
			di->current_action = IGNORE_ACT;
		} else {
			/* Known category which is wanted in current view */
			di->current_action = UNKNOWN_ACT;
			di->cur_act_index = 0;

			di->cur_act_index = do_non_copy_actions(di);

			if(di->tab->num_actions == 0) { /* just copy */
				di->current_action = CAT_ACT;
			} else if(di->tab->num_actions < 0
					|| di->tab->num_actions > MAX_ACTION) {
				internal_error("category %s ", di->cat);
				FPRINTF(stderr,
					" unexpected number of actions at line %d: %s\n",
					main_F.line_no, main_F.cur_line);
				print_table_entry(di->tab, stderr);
				EXIT(13);					/* EXIT */
			} else if(di->cur_act_index > di->tab->num_actions) {
				internal_error("no copying action with category %s", di->cat);
				FPRINTF(stderr, "  line %d: %s",
					main_F.line_no, main_F.cur_line);
				print_table_entry(di->tab, stderr);
				EXIT(15);					/* EXIT */
			} else {
				/* Must flush the results of any previous actions
					before invoking the fliter. */
				if(fflush(di->cur_fp) != 0) {
					unix_error("i/o error reported on flush operation", "");
					EXIT(16);				/* EXIT */
				};

				set_up_for_copy_action(di);
			}
		}
		/* Bottom of known category */
	}
}
/*
=TEX

\subsection{Directive Line Decoding}

\HOLindexEntry{decode_directive_line}
{\tt decode_directive_line} :  Return 0 if the line is not a directive
line.  If it is a directive line then split it into its component
pieces, which comprise the category and some arguments.  The last
argument is the {\tt MAX_DIR_ARGS-1} word and all remaining characters on
the line.  Update {\tt di} with the information found.

Directive lines are of various forms.  They start with an equals
sign, a directive character or a directive keyword.  If one of
these three starting sequences is found the line is regarded as a
directive line, then if the directive is not specified in the
view file an error is reported.

The category name is built as follows.

\begin{itemize}

\item For directives starting with an equals sign the name comprises
	the equals sign plus the word after the equals sign.

\item Directives lines starting with a percent keyword are processed to
	convert percent keywords to the corresponding extended
	characters, then they are processed as if they started with the
	extended character.

\item Directives lines starting with an extended character are of two
	types, those where the character is a category name in its own
	right (i.e., it has status {\tt directive} in the keyword file)
	and those where the character may start a category name (i.e.,
	it has status {\tt startdirective} in the keyword file).  In
	this second case the category name is the directive character
	plus the word immediately after it.

\end{itemize}

=SIEVE_PROG
*/
int
decode_directive_line(
	char *line,	/* in: text */
	dir_info *di	/* updated */)
{
	char	*next_arg;
	int start_copy_dest = 1;
	int start_copy_source = 1;

	if(	!IS_DIRECTIVE_CHAR(line[0])
	||	(line[0] == '%' && !IS_SND_CHAR_DIR_KW(line[1]))
	||	(line[0] == '=' && isascii(line[1]) && isspace(line[1]))) {
		/* Quickly exclude most cases */
		return(0);							/* RETURN */
	}

	init_directive_line(di);

	if(line[0] == '%') {
		/* Might be a keyword directive.  This is the most difficult case to identify.
			We already know that the character after the percent is used by some
			directives (from the test with "IS_SND_CHAR_DIR_KW" above). */

		int kwlen = 0;
		int kwindex;
		int dir_kw_type;

		di->dl_line[kwlen++] = '%';

		while(kwlen<=kwi.max_kw_len && line[kwlen] != '\0' &&
				line[kwlen] != '%') {
			di->dl_line[kwlen] = line[kwlen];
			kwlen++;
		}

		if(line[kwlen] != '%') {
			/* White space or end of line before the closing
				percent required for a proper keyword */
			return(0);						/* RETURN */
		}

		/* Got a well formed keyword in "di->dl_line" */

		di->dl_line[kwlen++] = '%';
		di->dl_line[kwlen] = '\0';

		kwindex = find_keyword(di->dl_line);

		if(kwindex<0) {
			/* Unknown keyword */
			return(0);						/* RETURN */
		}

		dir_kw_type = kwi.keyword[kwindex].act_kind;

		if(dir_kw_type != KW_DIRECTIVE && dir_kw_type != KW_START_DIR) {
			/* Not a directive keyword */
			return(0);						/* RETURN */
		}

		/* It is a directive line.  Put the corresponding directive
			character into "di->dl_line" then append the rest of the
			line ready for chopping it up.  Note that the directive
			starts with the first character of "di->dl_line" */

		if(kwi.keyword[kwindex].ech == -1) {
			internal_error("directive keyword '%s' has no character", di->dl_line);
			EXIT(28);
		}

		 di->dl_line[0] = kwi.keyword[kwindex].ech;

		/* For cases where the character is a category name in its own
			right we add a space after the character so that the chopping
			will keep the directive and the first word separate */

		if(dir_kw_type == KW_DIRECTIVE) {
			di->dl_line[1] = ' ';
			start_copy_dest = 2;
		}

		start_copy_source = kwlen;
	} else {
		/* Must be a directive line, copy it into "dl_line"
			ready to be chopped up */

		int first_char = line[0] & 0xFF;

		di->dl_line[0] = first_char;

		if(kwi.char_code[first_char] != NULL &&
				kwi.char_code[first_char]->act_kind == KW_DIRECTIVE) {
			di->dl_line[1] = ' ';
			start_copy_dest = 2;
		}

		start_copy_source = 1;
	}

	/* Now have in the first character of "di->dl_line" the extended
		character that starts the directive.  If we have "KW_DIRECTIVE"
		then this character is followed by a space, when
		"KW_START_DIR" there is no space since the character is the
		simply the first character of the directive.  */

	main_convert(&(line[start_copy_source]),
		OPT_KW | OPT_CONV_KW | OPT_WARN_KW | OPT_WHITE,
		&(di->dl_line[start_copy_dest]),
		MAX_LINE_LEN-start_copy_dest,
		&main_F);

	di->cat = di->dl_line;

	/* Make a copy of the original directive line for the "$&" macro */

	string_n_copy(di->dir_line, line, MAX_LINE_LEN+1);

	/* Now have "di->dl_line" containing the directive line where a
		leading percent keyword has been replaced by the corresponding
		directive character.  Also "di->cat" points to the first
		character of the category name within "di->dl_line" */

	/* The line must now be split to give the category and the arguments. */

	di->num_dl_args = 0;

	di->dl_words[0] = next_arg = di->cat;

	while(di->num_dl_args<MAX_DIR_ARGS &&
			*(next_arg = split_at_space(next_arg)) != '\0') {
		di->num_dl_args++;
		di->dl_words[di->num_dl_args] = next_arg;
	}

	{	int i;
		for(i=di->num_dl_args+1; i<=MAX_DIR_ARGS; i++)
			di->dl_words[i] = NULL;
	}

	/* Tidy up the "MAX_DIR_ARGS" argument, if present.  Convert
		multiple white spaces to a single space, lose any
		trailing white space. */

	if(di->dl_words[MAX_DIR_ARGS] != NULL) {
		char *arg = di->dl_words[MAX_DIR_ARGS];
		int inp = 0;
		int outp = 0;
		int in_ch;
		int prev_is_space = 1;

		while((in_ch = arg[inp]) != '\0') {
			if(isascii(in_ch) && isspace(in_ch)) {
				if(! prev_is_space) arg[outp++] = ' ';
				prev_is_space = 1;
			} else {
				arg[outp++] = in_ch;
				prev_is_space = 0;
			}
			inp++;
		}

		if(prev_is_space && outp >0) outp--;
		arg[outp] = '\0';
	}

	if(debug & D_DECODE_DIR_LINE) {
		int i;
		int j;
		int ch;

		(void)printf("Found directive '%s' with %d arguments\n",
			di->cat, di->num_dl_args);

		for(i=0; i<=di->num_dl_args; i++) {
			(void)printf("    %d %4ld '", i,
				(long)strlen(di->dl_words[i]));
			for(j=0; (ch = (di->dl_words[i][j]) & 0xFF) != '\0'; j++) {
				if((isascii(ch) && isprint(ch)) || ch > 127)
					PUTC(ch, stdout);
				else (void)printf("\\%03o", ch);
			}
			PUTC('\'', stdout);
			PUTC('\n', stdout);
		}
	}

	return(1);
}
/*
=TEX

\HOLindexEntry{is_same_directive}
{\tt is_same_directive} : Return 1 if the decoded directive
lines are the same, 0 otherwise.

=SIEVE_PROG
*/
int
is_same_directive(dir_info *old, dir_info *new)
{
	int i;

	if(strcmp(old->cat, new->cat) != 0) return(0);

	if(old->num_dl_args != new->num_dl_args) return(0);

	for(i=1; i<=old->num_dl_args; i++) {
		if(strcmp(old->dl_words[i], new->dl_words[i]) != 0) return(0);
	}

	return(1);
}
/*
=TEX

\subsection{Main Sieve Function}

\HOLindexEntry{main_sieve}
{\tt main_sieve} : Read standard input and process it according to the
steering and keyword files already read.

The first block of text is of an ignored category.

Directive lines are of three flavours.  They start with (1) an equals
sign, (2) a directive character or (3) a directive keyword.  If one of
these three starting sequences is found the line is regarded as a
directive line, then if the directive is not specified in the
view file an error is reported.

=SIEVE_PROG
*/
void
main_sieve(void)
{
	dir_info di_area_1, di_area_2;

	dir_info *c_di = &di_area_1;
	dir_info *next_di = &di_area_2;

	main_F.fp = stdin;

	init_directive_line(c_di);

	if(debug) message1("Processing standard input");
	while( (!feof(main_F.fp)) && (!ferror(main_F.fp)) ) {
		(void)read_line(main_F.cur_line, MAX_LINE_LEN, &main_F);
		main_F.line_no ++;

		if(debug & D_READ_SOURCE_LINE) {
			(void)printf("%s %d: %s\n", main_F.name,
				main_F.line_no, main_F.cur_line);
		}

		if(limits.opt_list) {
			int len = strlen(main_F.cur_line);
			if(len > limits.source_file)
				limits.source_file = len;
		}

		if(decode_directive_line(main_F.cur_line, next_di)) {
			/* Found a directive line */

			/* Check if it is the same as the current directive.
				"Same" means that the category and all of
				its arguments are identical */


			if(is_same_directive(c_di, next_di)) { /* no change */
				if(debug & D_DECODE_DIR_LINE)
					message1("No category change");
				continue;					/* CONTINUE */
			} else {
				/* Change of category */

				reset_output(c_di);

				complete_actions(c_di);

				/* Finished with current "c_di", change to "next_di" */

				{
					dir_info *temp = c_di;
					c_di = next_di;
					next_di = temp;
				}

				set_up_new_category(c_di);

				/* Bottom of change of category */
			}
			/* Bottom of found a directive line */
		} else {
			process_line(main_F.cur_line, c_di);
		}
		/* Bottom of while loop */
	}

	/* End of input file */

	reset_output(c_di);

	complete_actions(c_di);
}
/*
=TEX

\subsection{View File Reading Functions}

\HOLindexEntry{read_view_file}
{\tt read_view_file} : Read the body of the steering file.

=SIEVE_PROG
*/
void
read_view_file(char *name)
{
	char line[MAX_LINE_LEN+1];
	char cat_area[MAX_LINE_LEN+1];
	int tab_ent = NOT_FOUND;
	char view[MAX_LINE_LEN+1];
	int using_view = 0;
	char filt[MAX_LINE_LEN+1];
	char *p, *q, *actname;

	initialize_table();

	actname = find_steering_file(name, "keyword file");

	if( (view_F.fp = fopen(actname, "r")) == NULL ) {
		unix_error("cannot open steering file '%s'", actname);
		EXIT(5);							/* EXIT */
	}

	if(debug) message("Processing steering file '%s'", actname);
	view_F.file_name = actname;

	while( (!feof(view_F.fp)) && (!ferror(view_F.fp)) ) {
		read_steering_line(line, &view_F);

		if(limits.opt_list) {
			int len = strlen(line);
			if(len > limits.view_file)
				limits.view_file = len;
		}

		p = skip_space(line);
		switch(*p) {
		case '\0':
		case '#':
			/* Either line is all-white or its first non-white
				character starts a comment. */
			continue;						/* CONTINUE */
		default:
		    if(isascii(line[0]) && isspace(line[0])) {
			/* Continuation of previous entry */
			if(tab_ent == NOT_FOUND) {
				/* ... but there is no previous entry! */
				grumble1("no category prior to action line",
					&view_F, true);
				continue;					/* CONTINUE */
			}

			(void)decode_action_line(tab_ent, using_view, p, 0);
		    } else {
			/* First line of an entry */
			char * cat = cat_area;

			/* Get the category.  Copy it first into "view" then convert any
				percent keywords it has writing the result of that into
				the correct place, namely "cat" */
			q = find_space(p);
			string_n_copy(view, p, q - p);
			*(view + (q - p)) = '\0';
			main_convert(view, OPT_KW | OPT_CONV_KW | OPT_WARN_KW,
				cat, MAX_LINE_LEN, &view_F);

			/* Get the view */
			p = skip_space(q);
			q = find_space(p);
			string_n_copy(view, p, q - p);
			*(view + (q - p)) = '\0';

			if(strlen(cat) == 0) {
				grumble1("no category found", &view_F, true);
			}

			if(strlen(view) == 0) {
				grumble1("no view found", &view_F, true);
			}

			/* Check the test variable, if any */
			p = skip_space(q);
			if(*p == '?') { /* there is a test variable */
				char testvarval[MAX_LINE_LEN+1];
				char *v, *val, *envval;
				p = skip_space(p+1);
				q = find_space(p);
				string_n_copy(testvarval, p, q - p);
				*(testvarval + (q - p)) = '\0';
				p = skip_space(q);
				v = testvarval;
				while(*v && *v != '=') { ++v;}
				if (*v == '=') {
					*v = '\0';
					val = v+1;
				} else {
					val = 0;
				}
				envval = getenv(testvarval);
				using_view =
					envval &&
					!strcmp(view, view_option) &&
					(val == 0 || !strcmp(val, envval));
			} else {
				using_view = !strcmp(view, view_option);
			}

			/* p will now be the filter, if any */
			(void)strcpy(filt, p);

			/* See what we know about this view */
			tab_ent = look_up(cat);
			if(tab_ent == NOT_FOUND) {
				tab_ent = insert(cat, using_view, filt);
			} else if(using_view) {
				if(table[tab_ent].num_actions >= 0) {
					grumble1(
"steering file line conflicts with an earlier entry", &view_F, true);
					continue;				/* CONTINUE */
				} else {
					overwrite(tab_ent, using_view, filt);
				}
			}
		    }
		    break;							/* BREAK */
		}
	}

	view_F.file_name = actname;
	if(fclose(view_F.fp) != 0) {
		unix_error1("i/o error reported on close file operation");
		EXIT(8);							/* EXIT */
	};
}
/*
=TEX

\subsection{Printing the Sizes of Data Areas Used}

\HOLindexEntry{list_limits}
=SIEVE_PROG
*/
void
list_limits(void)
{
	int i, maxused;

#define LLL(s, m, u) FPRINTF(stderr, s, m, u)
	FPRINTF(stderr, "%s: limit usage\n", program_name);
	FPRINTF(stderr, "%-8s %-8s description\n", "Upper", "Quantity");
	FPRINTF(stderr, "%8s %8s description\n", "bound", "used");
	LLL("%8d %8d no of categories\n", MAX_CAT-1, max_cat);
	maxused = 0;
	for(i=0; i<max_cat; ++i)
		if(table[i].num_actions > maxused)
			maxused = table[i].num_actions;
	LLL("%8d %8d no of actions\n", MAX_ACTION, maxused);
	LLL("%8d %8d number of keyword files\n",
		MAX_KEYWORD_FILES, limits.num_keyword_files);
	LLL("%8d %8d no of keywords\n", MAX_KEYWORDS, kwi.num_keywords);
	LLL("%8d %8d keyword length\n", MAX_KW_LEN, kwi.max_kw_len);
	LLL("%8d %8d view file line length\n", MAX_LINE_LEN, limits.view_file);
	LLL("%8d %8d keyword file line length\n", MAX_LINE_LEN, limits.keyword_file);
	LLL("%8d %8d source line length\n", MAX_LINE_LEN, limits.source_file);
	LLL("%8d %8s no of directive line arguments\n", MAX_DIR_ARGS, "");
	LLL("%8d %8d length of copy with flags output\n",
		MACRO_EXP_SIZE - MAIN_LEEWAY, limits.process_line_len);
	LLL("%8d %8s     absolute limit of above\n", MACRO_EXP_SIZE, "");
	LLL("%8d %8d length of filter command\n", MACRO_EXP_SIZE, limits.filter_len);
	LLL("%8d %8d length of echo output\n",
		MACRO_EXP_SIZE, limits.non_copy_length);
	LLL("%8d %8d output file name length\n",
		MACRO_EXP_SIZE, limits.file_name_area);
#undef LLL
}
/*
=TEX

\subsection{Main Function for Sieve}

\HOLindexEntry{main}
=SIEVE_PROG
*/
int
main(int argc, char **argv)
{
	int option;
	char *steering_file = STEER_FILE;
	char *keyword_files[MAX_KEYWORD_FILES];

	limits.num_keyword_files = 0;
	keyword_files[limits.num_keyword_files++] = KEYWORD_FILE;
	program_name = argv[0];
	
	initialize();

	check_program_initializations();

	while((option = getopt(argc, argv, "d:f:Kk:lv")) != -1) {
	    switch(option) {
		case 'd':
		    debug |= atoi(optarg);
		    break;							/* BREAK */
		case 'f':
		    steering_file = optarg;
		    break;							/* BREAK */
		case 'K':
		    /* Do not use default keyword file */
		    keyword_files[0] = NULL;
		    break;							/* BREAK */
		case 'k':
		    if(limits.num_keyword_files >= MAX_KEYWORD_FILES) {
			error1("too many keyword files");
			EXIT(2);						/* EXIT */
		    }

		    keyword_files[limits.num_keyword_files++] = strdup(optarg);
		    break;							/* BREAK */
		case 'l':
		    limits.opt_list = 1;
		    break;							/* BREAK */
		case 'v':
		    FPRINTF(stderr, "%s: version %s\n", program_name,
				coprlemma1);
		    break;							/* BREAK */

		default:
		   usage();
		   EXIT(1);							/* EXIT */
	    }
	}

	if(debug) {
		int i;
		PRINTF("Debug options set:\n");
		for(i=0; i < (sizeof(debug_data)) / (sizeof(struct debug_data)); i++) {
			PRINTF("\t%4s  %s\n",
				debug & debug_data[i].flag ? "on" : "off",
				debug_data[i].purpose);
		}
	}

	if(optind != argc -1) { /* as in `sieve -f blah view junk */
		error1( argc -1 < optind ? "no view given" : "too many arguments given");
		usage();
		EXIT(2);							/* EXIT */
	};
	if( (strlen(argv[argc-1])) > MAX_LINE_LEN ) {
		error1("view argument too long");
		EXIT(3);							/* EXIT */
	};
	(void)strcpy(view_option, argv[argc-1]);

	if(debug & D_INIT_TABLES) {
		dump_actions_available();
	}

	if(debug) message("Processing for view %s", view_option);

	for(option=0; option<limits.num_keyword_files; option++) {
		if(keyword_files[option] != NULL)
			read_keyword_file(keyword_files[option]);
	}
	conclude_keywordfile();
	read_view_file(steering_file);
	conclude_steerfile();

	if(keyword_F.grumbles > 0) {
		FPRINTF(stderr, "\n%s: %d fault%s reported on the keyword file.\n",
			program_name,
			keyword_F.grumbles, (keyword_F.grumbles>1 ? "s" : ""));
	}

	if(view_F.grumbles > 0) {
		FPRINTF(stderr, "\n%s: %d fault%s reported on the view file.\n",
			program_name,
			view_F.grumbles, (view_F.grumbles>1 ? "s" : ""));
	}

	if(keyword_F.grumbles > 0 || view_F.grumbles > 0)
		EXIT(37);							/* EXIT */

	init_signals();

	if(debug) message1("Sieving starts");

	main_sieve();

	if(debug) message1("Sieving completed");

	if(limits.opt_list) list_limits();

	if(main_F.grumbles > 0) {
		FPRINTF(stderr, "\n%s: %d warning%s reported on the input text.\n",
			program_name,
			main_F.grumbles, (main_F.grumbles>1 ? "s" : ""));
		EXIT(39);							/* EXIT */
	}

	EXIT(0);								/* EXIT */

    }
/*
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{FIND FILE FUNCTION}

To implement find file a number of auxiliary functions are needed.

First some useful general declarations.

\HOLindexEntry{VoidStrcpy}
\HOLindexEntry{Strcpy}
=FIND_FILE_FUN
*/
#include <pwd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/param.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

#define VoidStrcpy(a,b) { if(a != NULL) (void)strcpy(a, b); }
#define Strcpy(a,b) ((a != NULL) ? strcpy(a, b) : NULL)

extern struct passwd *getpwnam(const char *name);
/*
=TEX

\HOLindexEntry{tilde_expand}
{\tt tilde_expand} : Returns a string, an initial `\verb|~|' followed
by a user name is replaced by that user's home directory and an initial
`\verb|~|' followed by  `\verb|/|' (or end of string) by the value of
the shell variable {\tt HOME}.  This approximates the C-shell
convention.

=FIND_FILE_FUN
*/

char *
tilde_expand(char *name)
{
	char uname[9]; /* usernames longer than 8 chars truncated */
	char *insert_str, *res;
	char *p, *q;
	int res_len, insert_len;
	struct passwd *pw;
	if(*name != '~') {
	    return(Strcpy((char*)malloc((unsigned)strlen(name)+1), name));
	};
	for(q = uname, p=name+1; p - name < 8 && *p && *p != '/'; ++p) {
	    *q++ = *p;
	};
	*q = 0;
	if(*uname) { /* A name has been supplied */
	    pw = getpwnam(uname);
	    if(pw == NULL) {
		return(NULL);
	    };
	    insert_str = pw->pw_dir;
	} else if((insert_str=getenv("HOME")) == NULL){
	    return(NULL);
	};
	insert_len = strlen(insert_str);
	res_len = insert_len + strlen(p);
	if((res=(char*)malloc((unsigned)res_len))==NULL){
	    return(NULL);
	};
	VoidStrcpy(res, insert_str);
	VoidStrcpy(res+insert_len, p);
	*(res+res_len) = 0;
	return(res);
}
/*
=TEX

\HOLindexEntry{dirname}
=FIND_FILE_FUN
*/
char *
dirname(char *name)
{
	struct stat buf;
	char *ans;
	char *slash;
	if(name == NULL) {
	    return(NULL);
	};
	ans = tilde_expand(name);
	if(ans == NULL) return(NULL);

	if(stat(ans, &buf) || !S_ISDIR(buf.st_mode)) {
		if((slash=strrchr(ans, '/')) == NULL){
		    slash = ans;
		};
		*slash = 0;
	};
	return(ans);
}
/*
=TEX

\HOLindexEntry{file_exists}
{\tt file_exists} : Returns 0 if the file name does not exist or if
name is a {\tt NULL} pointer, 1 otherwise.
The file is taken to exist if it exists (as a regular file or a link to same if {\tt is_reg} is non-zero) and
the user has enough access rights to find that out using {\tt stat}.

=FIND_FILE_FUN
*/
int
file_exists(char *name, int is_reg)
{
	struct stat st;
	return((name != NULL) && !stat(name, &st) && (!is_reg ||S_ISREG(st.st_mode)));
}
/*
=TEX

\HOLindexEntry{find_file}
{\tt find_file} : Treats {\tt dirs} as a list of directory names
separated by colons and attempts to find the file given by {\tt name} in that
list of directories.  If a file name rather than a directory name is
encountered in {\tt dirs} then the name of the directory containing that file is used.  A pointer to a string held containing the first such name for
which a file is found.  If no such file is found {\tt NULL} is returned.
All file names are expanded using the C-shell's tilde convention before
use and the expanded name is returned.
If {\tt is_reg} is non-zero, require the found file to be a regular file (i.e., not a directory, but could be
a symbolic link).
=FIND_FILE_FUN
*/
char *
find_file(char *name, char *dirs, int is_reg)
{
	char *dir;
	char *buf;
	char *mydirs;
	int name_len = strlen(name);
	int dir_len;
	char *path_entry;

	if(name[0] == '/') {
		return(name);
	};

	if(dirs == NULL || (mydirs = (char*)malloc((unsigned)strlen(dirs)+1)) == NULL) {
		return(NULL);
	};

	VoidStrcpy(mydirs, dirs);
	path_entry = strtok(mydirs, ":");
	while(path_entry != NULL) {
	    dir = dirname(path_entry);
	    if(dir != NULL) {
		dir_len = strlen(dir);
		if((buf = (char*)malloc((unsigned)dir_len+name_len+2)) == NULL) {
			return(NULL);
		};
		VoidStrcpy(buf, dir);
		*(buf+dir_len) = '/';
		VoidStrcpy(buf+dir_len+1, name);
		if(file_exists(buf, is_reg)) {
			return(buf);
		};
		free(buf);
	    }
	    path_entry = strtok((char*)NULL, ":");
	};
	return(NULL);
}
/*
=TEX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\section{FIND FILE PROGRAM}

Program {\tt findfile} basically just calls the {\tt find_file} function.
For greater generality it allows more than one path argument and searches them
in turn until the file name is found.

A common idiom of use from within a shell script will be

\begin{verbatim}
        sed -f `findfile sedscript $PATH $0`
\end{verbatim}

Note that this block of code does not include any C~comments, this
means that it will be treated as comment when compiling to create the
program {\tt sieve} and it will be extracted without any comments when
the {\tt findfile_prog} view of the document is obtained.

/*
=TEX

\HOLindexEntry{is_sym_link}
{\tt is_sym_link} : Returns 0 if the file name does not refer to a symbolic link or if
name is a {\tt NULL} pointer, 1 otherwise.

=FINDFILE_PROG
*/
#ifndef SIEVE_PROG
int
is_sym_link(char *name)
{
	struct stat st;
	if(name == NULL || lstat(name, &st)) {
		return 0;
	}
	return S_ISLNK(st.st_mode);
}
/*
=TEX

\HOLindexEntry{is_dir}
{\tt is_dir} : Returns 0 if the file name does not refer to a directory or if
name is a {\tt NULL} pointer, 1 otherwise.

=FINDFILE_PROG
*/
int
is_dir(char *name)
{
	struct stat st;
	if(name == NULL || lstat(name, &st)) {
		return 0;
	}
	return S_ISDIR(st.st_mode);
}
/*
=TEX
\HOLindexEntry{split_file_name}
{\tt split_file_name} : split a file name into directory name and base name.
=FINDFILE_PROG
*/

void
split_file_name(char *name, char **dir, char **base)
{
	int name_len, dir_len;
	if (name == NULL) {
		*dir = NULL;
		*base = NULL;
		return;
	}
	name_len = strlen(name);
	for(dir_len = name_len - 1; dir_len >= 0; dir_len -= 1) {
		if(name[dir_len] == '/') {
			*dir = (char*) malloc(dir_len + 2);
			*base = (char*) malloc(name_len - dir_len);
			strncpy(*dir, name, dir_len);
			if(dir_len > 0) {
				(*dir)[dir_len] = 0;
			} else {
				strcpy(*dir, "/");
			}
			strcpy(*base, &name[dir_len+1]);
			return;
		}
	}
	*dir = (char*) malloc(1);
	(*dir)[0] = 0;
	*base = (char*) malloc(name_len + 1);
	strcpy(*base, name);
}
/*
=TEX
\HOLindexEntry{read_link}
{\tt read_link} : like the system call readlink, but handling the memory allocation.
=FINDFILE_PROG
*/
char *
read_link(char *name)
{
	char *buf;
	int count, bufsiz;
	bufsiz = 20;
	buf = (char*) malloc(bufsiz);
	do {
		bufsiz *= 2;
		buf = (char*)realloc(buf, bufsiz);
		count = readlink(name, buf, bufsiz - 1);
		if(count < 0) {
			free(buf);
			return NULL;
		}
	} while(count == bufsiz - 1);
	buf[count] = 0;
	return buf;
}
/*
=TEX
\HOLindexEntry{get_real_name}
{\tt get_real_name} : from a file name potentially containing symbolic links find the real name of the parent directory of the file;
if {\tt base_name} is not NULL return the real file base name in it too.
Apparently there are portability problems with the MAXPATHLEN symbol (it can in principle be much too large to use as an array size or argument to malloc or it may not be defined).
The code below also tries hard to defend itself against the somewhat loosely specified behaviour when
the buffer is too small.
=FINDFILE_PROG
*/
#define MAX_LINKS 100
#ifdef MAXPATHLEN
#	if	MAX_PATH_LEN < 50000
#	define	MAX_FILE_NAME_LEN MAXPATHLEN
#	endif
#else
#	define	MAX_FILE_NAME_LEN 50000
#endif
char *
get_real_name (char * name)
{
	char *dir, *base, *cur_name, *res, buf[MAX_FILE_NAME_LEN+2];
	int orig_cwd;
	int loops;
	orig_cwd = open(".", 0, 0);
	if(orig_cwd < 0) {
		return NULL;
	}
	cur_name = (char*) malloc(strlen(name) + 1);
	strcpy(cur_name, name);
	for(loops = 0; loops < MAX_LINKS; loops += 1) {
		if(is_dir(cur_name)) {
			dir = cur_name;
			base  = (char*) malloc(1);
			*base = 0;
			if(chdir(dir)) {
				fchdir(orig_cwd);
				close(orig_cwd);
				free(dir);
				free(base);
				return NULL;
			}
			break;
		}
		split_file_name(cur_name, &dir, &base);
		free(cur_name);
		cur_name = NULL;
		if(dir == NULL) {
			return NULL;
		}
		if(*dir) {
			if(chdir(dir)) {
				fchdir(orig_cwd);
				close(orig_cwd);
				free(dir);
				free(base);
				return NULL;
			}
		}
		if(!is_sym_link(base)) {
			free(dir);
			dir = NULL;
			break;
		}
		cur_name = read_link(base);
		if(cur_name == NULL) {
			free(dir);
			free(base);
			return NULL;
		}
	}
	if(cur_name != NULL) {
		free(cur_name);
	}
	buf[MAX_FILE_NAME_LEN+1] = 0;
	if(	loops == MAX_LINKS
	||	getcwd(buf, MAX_FILE_NAME_LEN) == NULL
	||	strlen(buf) == MAX_FILE_NAME_LEN+1) {
		if(dir) {
			free(dir);
		}
		if(base) {
			free(base);
		}
		fchdir(orig_cwd);
		close(orig_cwd);
		return NULL;
	}
	res = (char*) malloc(strlen(buf) + strlen(base) + 2);
	strcpy(res, buf);
	if(strcmp(buf, "/") && *base) {
		strcat(res, "/");
	}
	strcat(res, base);
	fchdir(orig_cwd);
	close(orig_cwd);
	return res;
}
/*
=TEX
\HOLindexEntry{main}
There are two usages for two somewhat separate functions:

With no options, the first command line argument is taken as the name of a file to be sought in the list
of search options given by the remaining arguments (of which there must be at least one),
the file name is printed on standard output (or just the original argument if not found) and
the result code is set to 0 if the resulting file exists.

With the ``{\tt -r}'' option, the remaining arguments are a list of file names and the output
is a list of lines each containing the result of recursively expanding any symbolic links in each file name.
If one of the resulting file names does not exist to
call {\tt stat} on it, then the unexpanded name is printed out and the program stops with result code set to 1.

A ``{\tt --}'' option may be supplied to indicate that the next argument (typically, ``{\tt -r}'') is to
be interpreted as a name not an option.

In the above, a file is taken to exist if it exists as a regular file (or a symbolic link to a regular
file) and the user has enough access
to read its file attributes and it is not a broken symbolic link.
=FINDFILE_PROG
*/


#ifndef NO_FINDFILE_MAIN
char *coprlemma1_ff =
#ifdef VERSION
	VERSION
#else
	"XXX.YYYwZZZ"
#endif
     " Copyright Lemma 1 Ltd.";
extern char *find_file(char *name, char *dirs, int is_reg);
#include<stdio.h>
void	exit(int status);

int
main(int argc, char **argv)
{
	int ind;
	char *ans;
	char *name;
	char * program_name = argv[0];

	if(argc < 3) {
		FPRINTF(stderr,
			"usage: %s (name path ... | -r name ...)\n",
					program_name);
		FPRINTF(stderr, "%s version: %s\n", program_name, coprlemma1_ff);
		exit(2);
	}
	name = *(argv+1);
	if(!strcmp(name, "-r")) {
		char *real_name;
		for(ind = 2; ind < argc; ++ind) {
			name = tilde_expand(*(argv+ind));
			real_name = get_real_name(name);
			if(real_name) {
				if(file_exists(real_name, 0)) {
					(void)printf("%s\n", real_name);
				} else {
					(void)printf("%s\n", name);
					exit(1);
				}
			} else {
				(void)printf("%s\n", name);
				exit(1);
			}
			free(real_name);
			free(name);
		}
		exit(0);
	}
	if(!strcmp(name, "--")) {
		if(argc < 4) {
			FPRINTF(stderr,
			"usage: %s (name path ... | -r name ...)\n",
					program_name);
			FPRINTF(stderr, "%s version: %s\n", program_name, coprlemma1_ff);
			exit(2);
		}
		name = *(argv+2);
		ind = 3;
	} else {
		ind = 2;
	}
	for(ans = NULL; ind < argc && ans == NULL; ++ind) {
		ans = find_file(name, *(argv+ind), 1);
	}
	if(ans == NULL) ans = name;

	(void)printf("%s\n", ans);
	return ! file_exists(ans, 1);

}

#endif
#endif
/*
=TEX

\makeatletter
\def\refstepcounter#1{\stepcounter{#1}\global\edef\@currentlabel{\csname
	p@#1\endcsname\csname the#1\endcsname}}
\makeatother

\twocolumn[\section{INDEX}] \label{Index}

\footnotesize
\printindex

\onecolumn

\end{document}

=IGNORE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%********************************************************************
%--------------------------------------------------------------------
=CALWAYS
*/

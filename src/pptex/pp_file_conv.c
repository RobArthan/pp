/*******************************************************************************
pp_file_conv.c: this file is part of the PPTex system

Copyright (c) 2002-2017 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
*******************************************************************************/
/* 

 
\subsubsection{Purpose and Background}

This program is a derivative of sieve.c simplified to address directly file conversion
between the ProofPower extended character set and unicode/utf8.

\subsubsection{Dependencies}

Mainly effected by invoking utf8module.c.

Compilation uses the C compiler, the programs assume a Unix operating system.
utf8module is required.

%--------------------------------------------------------------------

\subsubsection{Interface}

Full details of the interfaces to these programs and functions
are given in the user document for the document processing
system~\cite{DS/FMU/IED/USR001}.

%--------------------------------------------------------------------

\subsubsection{Possible Enhancements}

%--------------------------------------------------------------------

%\subsubsection{Deficiencies}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{PP_FILE_CONV PROGRAM}

\subsection{Initial Declarations}
*/

#define PP_FILE_CONV

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

/*
#define MAX_CAT (80+1)
#define MAX_ACTION 20
*/

#define NOT_FOUND (-1)

#define STEER_FILE "sieveview"
#define KEYWORD_FILE "sievekeyword"

#define PPHOME "PPHOME"
#define PPETCPATH "PPETCPATH"
#define PPENVDEBUG "PPENVDEBUG"
#define SLASH_ETC "/etc"

/*


\subsection{Identification}


*/

char *coprlemma1 =
#ifdef VERSION
	VERSION
#else
	"XXX.YYYwZZZ"
#endif
     " Copyright Lemma 1 Ltd.";

#define FPRINTF (void)fprintf
#define PRINTF (void)printf
#define PUTC (void)putc

extern int getopt(int argc, char *const argv[], const char *optstring);
extern char *optarg;
extern int optind, opterr;
void * malloc(size_t size);
char * getenv(const char *name);
void	exit(int status);

/*

Global variables used in argument processing.

*/
char view_option[MAX_LINE_LEN+1];
/*


\subsection{Diagnostics}

Several diagnostic outputs are provided, they are controlled by the
{\tt-d} command option which sets the {\tt debug} flag.
These outputs are written to the standard output.


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
#define D_UTF8 16384
	{D_UTF8,		        "unicode/utf8 processing"},
};
/*

\subsection{Error and Warning Messages}

Various error and warning messages are written to the standard error
stream.  All of the error exits provide a code number that indicates the
source of the fault, these are printed using function {\tt EXIT}.
Successful completion of sieving also completes via this routine,
but with a code of zero.

EXIT codes are allocated sequentially starting at 0.
The next free error code is
41
all codes below this are used.
*/

void
usage(void)
{
    FPRINTF(stderr,
	"usage: %s [-l|v] [-d debug-level] [-K] [-k keyword_file] [-u] [-a]\n",
	program_name);
    FPRINTF(stderr, "%s version: %s\n", program_name, coprlemma1);
}

/*ARGSUSED*/
void
handle_sigpipe(int sig)
{
	error1("SIGPIPE caught.  Filter has not read all its standard input");
	EXIT(6);
}
/*


\HOLindexEntry{init_signals}

*/
void
init_signals(void)
{
	(void)signal(SIGPIPE, handle_sigpipe);
}
/*



\subsection{Input Files}

The input file controls are now located in the utf8module, so that it can use them in processing the keyword file.
They are also used in the sieve program for the view file and the main (standard) input stream.
*/

struct file_data view_F = 		{ "view file", 0, 0, 0, 0, 0, 0};
struct file_data main_F = 		{ "standard input", 0, 0, 0, 0, 0, 0};

/*

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


The remaining flags are available for future expansion.

\subsection{Action Options} \label{ActionOptions}

Associated with some of the actions there are a number
of options available.


*/
typedef struct{
	char *name;
	int flag;
} options_available;
/*


The {\tt flags} may take one of the following values.

\begin{itemize}

\item Lines are to be processed for the verbatim-like formal text
	environments.  This flag implies {\tt OPT_LATEX} and {\tt OPT_CHAR}.
*/
#define OPT_VERBATIM 1
/*


\item Text is to be processed for the verbatim-like formal text
	environments, only with this flag set are the LaTeX conversions
	applied.  This option is automatically set with {\tt
	OPT_VERBATIM}.


*/
#define OPT_LATEX 1024
/*
Percent keywords are to be understood.
*/
#define OPT_KW 2
/*
Convert extended characters, but not percent keywords, to their
	\LaTeX{} form.  This option is automatically set with {\tt
	OPT_VERBATIM}.
*/
#define OPT_CHAR 4
/*


\item Modifies options {\tt OPT_KW} and {\tt OPT_VERBATIM} so that
	extended characters and percent keywords for indexing are
	deleted.


*/
#define OPT_DELINDEX 8
/*


\item Extended characters, but not percent keywords, are converted to
	their Standard ML string form.  This option is not compatible
	with {\tt OPT_KW} or {\tt OPT_VERBATIM}.


*/
#define OPT_ML_CHAR 16
/*


\item Issue a warning message when unknown keywords are
	found.  Only meaningful when {\tt OPT_KW} is set.


*/
#define OPT_WARN_KW 32
/*


\item Convert unknown keywords to a call on the \LaTeX{} macro
	\verb|\UnknownKeyword|.  Only meaningful when {\tt OPT_KW} and
	{\tt OPT_VERBATIM} are set.


*/
#define OPT_FLAG_KW 64
/*


\item Lines containing at least one character of type {\tt verbalone}
	plus any number of {\tt white} characters have a reduced
	verbatim-like processing where the line ends are not marked.


*/
#define OPT_VERB_ALONE 128
/*


\item Where possible keywords are converted to their corresponding
	extended character.


*/
#define OPT_CONV_KW 256
/*


\item Convert extended characters of class {\tt white} to a
	space character.  When {\tt OPT_KW} is set also convert the
	keywords.


*/
#define OPT_WHITE 512
/*


\item Convert extended characters to keywords.


*/
#define OPT_CONV_EXT 2048
/*


\item Convert extended characters to keywords.


*/
#define OPT_UTF8_OUT 4096
/*


\end{itemize}

Now do some checking that these flags are well-defined.
Other checks are made in the startup function, {\tt initialize}.


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
			&	OPT_UTF8_OUT \
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
			|	OPT_UTF8_OUT \
			)

#if AND_FLAGS != 0
	Faulty setting of flags;
#endif
/*
-----------------
options_available
-----------------
The options are gathered together with their keywords for function
get_options below.

*/
options_available cat_options[] = {
	{"char", OPT_CHAR},
	{"convkw", OPT_CONV_KW | OPT_KW},
	{"convext", OPT_CONV_EXT},
	{"delindex", OPT_DELINDEX},
	{"kw", OPT_KW},
	{"kwflag", OPT_FLAG_KW},
	{"kwwarn", OPT_WARN_KW},
	{"latex", OPT_LATEX | OPT_CHAR},
	{"mlchar", OPT_ML_CHAR},
	{"verbalone", OPT_VERB_ALONE},
	{"utf8out", OPT_UTF8_OUT},
	{"verbatim", OPT_VERBATIM | OPT_LATEX | OPT_CHAR},
	{"white", OPT_WHITE},
	{NULL, 0}
};
/*
-----------
arg_options
-----------

*/
options_available arg_options[] = {
	{"delindex", OPT_DELINDEX},
	{"latex", OPT_LATEX | OPT_CHAR},
	{NULL, 0}
};
/*
-----------
get_options
-----------
Reads the text of argument {\tt filt} looking for
any option keywords from argument {\tt opts}.  The flag values for each
keyword found are logically ORed to form the result value.  Any
characters that are not keywords indicate errors.

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

-----------------
check_cat_options
-----------------
Validate the options set for the "cat" action.

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

------------
show_options
------------
Print out the names of any options set.

*/
void
show_options(FILE *fp, int flags)
{
#define SHOW_OPT(f, s) if(flags & f) (void)fputs(s, fp)
	SHOW_OPT(OPT_CHAR, " char");
	SHOW_OPT(OPT_CONV_EXT, " convext");
	SHOW_OPT(OPT_CONV_KW, " convkw");
	SHOW_OPT(OPT_DELINDEX, " delindex");
	SHOW_OPT(OPT_KW, " kw");
	SHOW_OPT(OPT_FLAG_KW, " kwflag");
	SHOW_OPT(OPT_WARN_KW, " kwwarn");
	SHOW_OPT(OPT_LATEX, " latex");
	SHOW_OPT(OPT_ML_CHAR, " mlchar");
	SHOW_OPT(OPT_UTF8_OUT, " utf8out");
	SHOW_OPT(OPT_VERB_ALONE, " verbalone");
	SHOW_OPT(OPT_VERBATIM, " verbatim");
	SHOW_OPT(OPT_WHITE, " white");
#undef SHOW_OPT
}

/*
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

*/
void
initialize(void)
{
	int i;
#ifdef __CYGWIN__
	setlocale(LC_ALL, "C.ISO88591");
#endif
	for(i=1; i<256; i++) character_flags[i] = 0;

	initialise_keyword_information();

	SET_DIRECTIVE_CHAR('%');
	SET_DIRECTIVE_CHAR('=');

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
===========================================
Auxiliaries For Source File Line Processing
===========================================

\HOLindexEntry{copy_string}
{\tt copy_string} : Copies the {\tt source} string into the {\tt dest}
string for up to {\tt max} characters.  Does not add a null character
after the copied characters if the length is exceeded.  Return the
number of characters copied.  This differs from the C library routines
{\tt strcpy} and {\tt strncpy} which return the address of the output
string.

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


{\tt copy_keyword} :  Copies the keyword {\tt kw} read from the input
string into the {\tt dest} string for up to {\tt max} characters.
Return the number of characters written to {\tt dest}.  The keyword is
{\tt kwlen} characters long, it starts and (probably) ends with
`{\tt\%}' characters which are not copied if {\tt suppress} is non zero.

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
-----------
list_limits
-----------
Printing the Sizes of Data Areas Used
*/
void
list_limits(void)
{
	int i, maxused;

#define LLL(s, m, u) FPRINTF(stderr, s, m, u)
	FPRINTF(stderr, "%s: limit usage\n", program_name);
	FPRINTF(stderr, "%-8s %-8s description\n", "Upper", "Quantity");
	FPRINTF(stderr, "%8s %8s description\n", "bound", "used");
	LLL("%8d %8d number of keyword files\n",
		MAX_KEYWORD_FILES, limits.num_keyword_files);
	LLL("%8d %8d no of keywords\n", MAX_KEYWORDS, kwi.num_keywords);
	LLL("%8d %8d keyword length\n", MAX_KW_LEN, kwi.max_kw_len);
	LLL("%8d %8d keyword file line length\n", MAX_LINE_LEN, limits.keyword_file);
	LLL("%8d %8d source line length\n", MAX_LINE_LEN, limits.source_file);
#undef LLL
}
/*
====
main
====
*/
int
main(int argc, char **argv)
{
  int option, ascii_out = False;
	char *steering_file = STEER_FILE;
	char *keyword_files[MAX_KEYWORD_FILES];

	
	limits.num_keyword_files = 0;
	keyword_files[limits.num_keyword_files++] = KEYWORD_FILE;
	program_name = argv[0];
	
	main_F.fp = stdin;
	
	initialize();

	/*	check_program_initializations(); */

	main_F.utf8 = False;
	while((option = getopt(argc, argv, "ad:f:Kk:luv")) != -1) {
	    switch(option) {
		case 'a':
		  ascii_out = True;
		  break;							/* BREAK */
	    case 'd':
	      debug |= atoi(optarg);
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
	    case 'u':
	      main_F.utf8 = True;
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
	
	if(optind != argc) {
	  error1("too many arguments given");
	  usage();
	  EXIT(2);							/* EXIT */
	};
	
	read_keyword_files(keyword_files);

	if(keyword_F.grumbles > 0) {
	  FPRINTF(stderr, "\n%s: %d fault%s reported on the keyword file.\n",
		  program_name,
		  keyword_F.grumbles, (keyword_F.grumbles>1 ? "s" : ""));
	}
	
	if(keyword_F.grumbles > 0)
	  EXIT(37);							/* EXIT */
	
	init_signals();
	
	if (main_F.utf8)
	  if (ascii_out) transcribe_file_to_ascii(&main_F, stdout);
	  else transcribe_file_to_ext(&main_F, stdout);
	else transcribe_file_to_utf8(&main_F, stdout);
	
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



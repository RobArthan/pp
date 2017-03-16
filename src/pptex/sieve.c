/*******************************************************************************
imp096.c: this file is part of the PPTex system

Copyright (c) 2002-2017 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
*******************************************************************************/
/* 

This c file begins as a copy of imp096.doc and will be gradually stripped down.
It results from the abandonment of the attempt to include the sources necessary
for building sieve in literate scripts (as .doc files), since this is getting
too unwieldy as the extra complications involved in support of utf8 kick in.

This file should therefore be read just as a c program, and the complications
in how the comments were originally processable can be ignored.
It is no longer a c program which can be compiled by itself to deliver a working
sieve program, it must now be compiled with utf8module to make a working program
and this file is no longer the source either for utf8module, or for findfile or
the findfile program (which may be found in findfile.c).

\subsubsection{Purpose and Background}

Most of the master source texts on the FST project are held in
``document'' files that contain a mixture of narrative text, \LaTeX{}
commands and program text written in various languages.
The purpose of the {\tt sieve} program,
is to sieve out (also termed: strip out)
various parts of the document for various purposes.

\subsubsection{Dependencies}

Compilation uses the C compiler, the programs assume a Unix operating system.
utf8module is required.

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

Implement support for utf8 file and unicode characters
%--------------------------------------------------------------------

%\subsubsection{Deficiencies}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\section{SIEVE PROGRAM}

\subsection{Initial Declarations}
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
/*


\HOLindexEntry{PrNN_SIZE}
Macro {\tt PrNN_SIZE} is described with function {\tt copy_PrNN} in section~\ref{FunCopyPrNN}.


*/
#define PrNN_SIZE 7

int copy_PrNN(char *str, int code);


extern int getopt(int argc, char *const argv[], const char *optstring);
extern char *optarg;
extern int optind, opterr;
void * malloc(size_t size);
char * getenv(const char *name);
void	exit(int status);

/*


Mostly we have declare before use, but there are a few exceptions!


*/
void main_convert(
	char *in_line,
	int flags,
	char *out_line,
	int lenout_line,
	struct file_data *file_F);
/*


Global variables used in argument processing.

\HOLindexEntry{view_option}

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
42
all codes below this are used.
*/

void
usage(void)
{
    FPRINTF(stderr,
	"usage: %s [-l|v] [-d debug-level] [-f steering_file] [-K] [-k keyword_file] view\n",
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

struct file_data view_F = 		{ "view file", 0, 0, 0, 0, 0, 0, 0};
struct file_data main_F = 		{ "standard input", 0, 0, 0, 0, 0, 0, 0};

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
----------------------------
Available Sieving Categories
----------------------------

Each category described in the view file may specify several actions,
the available set are described in this structure.  Note that the
entries in the array must be sorted on the {\tt name} field so that
function {\tt find_action} works.  This ordering is checked in function
{\tt check\-_program\-_initializations}.


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

-----------
find_action
-----------
Given an action code name find the
corresponding entry in actions_available.

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


\HOLindexEntry{decode_action}

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

\HOLindexEntry{dump_actions_available}

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


An array is built, it has one element (which is of structure {\tt
cat_filt}) per category described in the view file.

A simple linear search technique is used in this table to find
the entry associated with a given category. It is initialized
to a table with an entry corresponding to a category which is
ignored.

\HOLindexEntry{table}
\HOLindexEntry{max_cat}

*/
cat_filt	table[MAX_CAT];

int		max_cat;
/*


\HOLindexEntry{initialize_table}

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
-----------------
print_table_entry
-----------------
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
-------------------
Source File Context
-------------------

A structure holding the current sieving context is maintained.  This
holds the arguments from the directive line plus indexes into the table
of known categories.  The arguments are numbered~1~to~9, additionally
argument~0 refers to the directive name.
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

\subsection{Macro Expansion}

Maximum length for macro expansion is twice the normal line length.
This is derived by allowing the maximum length of an input line plus
the maximum length of view file line.  This limit is easy to exceed,
e.g., by having a view file action that echoes the whole of a large
directive line many times.  It is a reasonable upper limit since many
of the other programs used, such as \LaTeX{}, have a much smaller
maximum input line length.

\HOLindexEntry{MACRO_EXP_SIZE}

*/
#define MACRO_EXP_SIZE ((MAX_LINE_LEN) * 2)
/*

\HOLindexEntry{copy_macro_arg}
{\tt copy_macro_arg}: is used by {\tt expand_macro} to copy a macro.
The text in {\tt macro} is appended to {\tt out_line} starting at
character index {\tt orig_outp}, but no more than {\tt maxlen}
characters may be written to {\tt out_line}.  Argument {\tt flags} gives
details of how the macro text should be copied or converted.


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

------------
expand_macro
------------
Expand the text of {\tt in_line} into the area {\tt
out_line} which is {\tt lenout_line} characters long.  The macro
parameters are found in {\tt di}.

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


Check the data structures built from the view file.

\HOLindexEntry{check_program_initializations}

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
------------------
conclude_steerfile
------------------
Complete the initializations of the
various tables which are initialized from the view file and
make some simple validations of those tables.

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

=================================
Entering Data Into Category Table
=================================
---------
overwrite
---------
Write values into a particular category table entry.
This corresponds to either a new entry being inserted or to overwriting
a previously set up entry.  It is the responsibility of the caller to
ensure that the previously entry is not wanted.

The category table entry to overwrite is in tab_ent, the
optional filter is in filt, if this category header line is for
the wanted view then using_view is non zero.

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

------
insert
------
Add a new entry into the category table.  Return its
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
----------------
arguments_decode
----------------
Decode an arguments action storing the results
in the category table at {\tt tab_ent}.  The arguments are in
{\tt filt} which has either one or two decimal numbers.

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


\HOLindexEntry{verify_macro_calls}
{\tt verify_macro_calls} : Check that the text contains only valid
macro calls.  Issue warnings for bad macro calls.  Return 1 if there are
any macro calls, 0 otherwise.


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


\HOLindexEntry{decode_action_line}
{\tt decode_action_line} : Decode and add an additional action to the indicated
entry in the category table.  Return 1 if all decoded OK, 0 otherwise.
This function is recursive, the initial two words of {\tt line} may
indicate writing or appending to a named file, in which case the
recursive call is used to process the rest of the line which contains
the real action.  Argument depth is used to prevent multiple output
redirections, it is incremented on each recursive call.


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

\subsection{Sieving Functions}

These are used whilst processing the source text.  Text may be
written to several places whilst sieving.

\HOLindexEntry{open_output}
{\tt open_output} : Open any output file wanted for the action given by
{\tt cf}, returning the file details in the argument {\tt di}.

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

------------
reset_output
------------
Called at end of input and at changes of
category, this function makes sure that any active filter and any
output other than standard output are shut down properly.

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


\HOLindexEntry{do_non_copy_actions}
{\tt do_non_copy_actions} :  Do the next actions of the current
category until either all are done or until a non-copy action is
found.  Return the index of the non-copy action or an index past the
last action.  The current category and next action number are found
from argument {\tt di}.  Argument {\tt fp} gives the output stream
for those cases where the action does not state its own output stream.


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

----------------
complete_actions
----------------
Do all the remaining actions for the
category.  These must be non-copy actions.

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
===========================================
Auxiliaries For Source File Line Processing
===========================================

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
===========================
Source File Line Processing
===========================

These routines are called by function {\tt process_line} to
perform the various manipulations of the non-directive lines.

--------
mlstring
--------
Convert input argument to a Standard ML string, but
without the enclosing string quotes, write the result to the given
output stream.  Convert pretty characters to their decimal form, e.g.,
the byte value decimal \verb|234| is written as the characters
\verb|\234|.  Prefix ``~\verb|"|~'' and ``~\verb|\|~'' with a
``~\verb|\|~'' character.  Across the whole input (not just each call
of this routine) convert even numbered ``~\verb|`|~'' characters (as
counted when read) into ``~\verb|'|~''characters.  Other characters are
left unchanged.
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
------------
main_convert
------------
Provides the conversion routine used for most things.
If it is called with no flags set it just copies the text through
unchanged.

Various conversions are supported, they are described with the
definitions of the options flags in section~\ref{ActionOptions}.

MAIN_LEEWAY
...........
To avoid complicating the code below by excessive testing of
overflowing the line length macro {\tt MAIN_LEEWAY} allows a little
leeway for adding a few single characters.  The value allows at least
the number of characters that the conversions below may create.

MAX_TEX_ARG_NESTING defines the length of the stack containing arguments
for TeX.
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
	int opt_utf8_out = flags & OPT_UTF8_OUT;
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

================
Sieving Routines
================
------------
process_line
------------
Handles each non-directive line, it selects the appropriate type of processing.
Function main_sieve is in overall control of the sieving phase of the program.
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
	  if (a_flags & OPT_UTF8_OUT) {
	    if (debug & D_UTF8){message1("UTF8:process_line 1");};
	    output_ext_as_utf8(op_text, di->cur_fp);
	    if (debug & D_UTF8){message1("UTF8:process_line 2");};
	  }
	  else FPRINTF(di->cur_fp, "%s\n", op_text);
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
----------------------
set_up_for_copy_action
----------------------
After decoding a directive line set up the copying action.
The actual copying is done via process_line which is called
for the non-directive lines.
A main activity here is to set up the pipe for a filter or the output
for write or appending.
These are set into the given {\tt di}.
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
-------------------
set_up_new_category
-------------------
Update the directive information in {\tt
di} ready to process a new category whose name, arguments, etc., are
given in {\tt di}.
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
		  if (debug & D_UTF8){message1("UTF8:set_up_new_category: just copy");};
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
					before invoking the filter. */
		  if (debug & D_UTF8){message1("UTF8:set_up_new_category: about to fflush");};
				if(fflush(di->cur_fp) != 0) {
		  if (debug & D_UTF8){message1("UTF8:set_up_new_category: fflush failed");};
					unix_error("i/o error reported on flush operation", "");
					EXIT(16);				/* EXIT */
				};
		  if (debug & D_UTF8){message1("UTF8:set_up_new_category: fflush-ed OK");};

				set_up_for_copy_action(di);
			}
		}
		/* Bottom of known category */
	}
}
/*
---------------------
decode_directive_line
---------------------
Return 0 if the line is not a directive line.
If it is a directive line then split it into its component
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
-----------------
is_same_directive
-----------------
Return 1 if the decoded directive
lines are the same, 0 otherwise.
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
----------
main_sieve
----------
Read standard input and process it according to the
steering and keyword files already read.

The first block of text is of an ignored category.

Directive lines are of three flavours.  They start with (1) an equals
sign, (2) a directive character or (3) a directive keyword.  If one of
these three starting sequences is found the line is regarded as a
directive line, then if the directive is not specified in the
view file an error is reported.
*/
void
main_sieve(void)
{
	dir_info di_area_1, di_area_2;

	dir_info *c_di = &di_area_1;
	dir_info *next_di = &di_area_2;

	main_F.fp = stdin;
	if(debug & D_UTF8) message("main_sieve: main_F.name = %s", main_F.name);

	init_directive_line(c_di);

	if(debug) PRINTF("main_sieve: processing %s from %s\n",
			 main_F.utf8 ? "utf8 input" : "ext input", main_F.name);
	while( (!feof(main_F.fp)) && (!ferror(main_F.fp)) ) {
	  	(void)read_line_as_ext(&main_F);
	/*      (void)simple_read_line(main_F.cur_line, MAX_LINE_LEN, &main_F); */
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
--------------
read_view_file
--------------
Read the body of the steering file.
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
====
main
====
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

	main_F.utf8 = False;
	while((option = getopt(argc, argv, "d:f:Kk:luv")) != -1) {
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

	read_keyword_files(keyword_files);

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



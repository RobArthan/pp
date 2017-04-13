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

#define NOT_FOUND (-1)
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
void exit(int status);

/*

Global variables used in argument processing.

*/
char view_option[MAX_LINE_LEN+1];
/*
-----------
Diagnostics
-----------

Several diagnostic outputs are provided, they are controlled by the
{\tt-d} command option which sets the {\tt debug} flag.
These outputs are written to the standard output.

*/

struct debug_data{
	int flag;
	char *purpose;
} debug_data [] = {
#define D_SHOW_KEYWORD_TABLE 2
	{D_SHOW_KEYWORD_TABLE,		"keyword table"},
#define D_GET_KW 128
	{D_GET_KW,			"percent keywords read"},
#define D_READ_STEER_LINE 4096
	{D_READ_STEER_LINE,		"view and keyword file lines read"},
#define D_UTF8 16384
	{D_UTF8,		        "unicode/utf8 processing"},
};

/*
--------------------------
Error and Warning Messages
--------------------------
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
	"usage: %s [-l|v] [-d debug-level] [-K] [-k keyword_file] [-u] [-a]\n",
	program_name);
    FPRINTF(stderr, "%s version: %s\n", program_name, coprlemma1);
}

void
handle_sigpipe(int sig)
{
	error1("SIGPIPE caught.  Filter has not read all its standard input");
	EXIT(6);
}
/*
------------
init_signals
------------
*/
void
init_signals(void)
{
	(void)signal(SIGPIPE, handle_sigpipe);
}
/*
-----------
Input Files
-----------

The input file controls are now located in the utf8module,
so that it can use them in processing the keyword file.
They are also used in the sieve program for the view file
and the main (standard) input stream.
*/

struct file_data view_F = 		{ "view file", 0, 0, 0, 0, 0, 0};
struct file_data main_F = 		{ "standard input", 0, 0, 0, 0, 0, 0};

/*
==========================================
Initialization and Command Line Processing
==========================================

On versions of cygwin that support multi-byte character sets, we have
to set a locale with single-byte characters to prevent {\tt regcomp}
failing on patterns containing non-ASCII characters. We don't check the
success of this to support earlier versions of cygwin with the call should
failing harmlessly. The problem with illegal patterns causes the {\Product}
build to break at an early stage, so there is little to be gained by checking
for errors here.
*/

void
initialize(int argc, char **argv, int option, int *ascii_out,
	   char *keyword_files[MAX_KEYWORD_FILES])
{
#ifdef __CYGWIN__
	setlocale(LC_ALL, "C.ISO88591");
#endif


	main_F.utf8 = False;
	while((option = getopt(argc, argv, "ad:f:Kk:luv")) != -1) {
	    switch(option) {
	    case 'a':
		  *ascii_out = True;
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
	
	if(optind != argc) {
	  error1("too many arguments given");
	  usage();
	  EXIT(2);							/* EXIT */
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
  char *keyword_files[MAX_KEYWORD_FILES];
  
  limits.num_keyword_files = 0;
  keyword_files[limits.num_keyword_files++] = KEYWORD_FILE;
  program_name = argv[0];
  
  main_F.fp = stdin;
  
  initialize(argc, argv, option, &ascii_out, keyword_files);
  
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
  
  EXIT(0);							 /* EXIT */
  
}

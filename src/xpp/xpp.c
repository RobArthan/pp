/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: xpp.c,v 2.12 2003/05/20 15:16:13 rda Exp rda $
 *
 * xpp.c -  main for the X/Motif ProofPower
 *
 * xpp.c: this file is part of the PPTex system
 *
 * Copyright (c) 2002 Lemma 1 Ltd.
 * 
 * See the file LICENSE for your rights to use and change this file.
 *
 * Contact: Rob Arthan < rda@lemma-one.com >
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macro definitions: 
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#define _xpp

#define XtNtextTranslations		"textTranslations"
#define XtCTextTranslations		"TextTranslations"
#define XtNtemplates			"templates"
#define XtCTemplates			"Templates"
#define XtNinterruptPrompt		"interruptPrompt"
#define XtCInterruptPrompt		"InterruptPrompt"
#define XtNabandonReply		"abandonReply"
#define XtCAbandonReply		"AbandonReply"
#define XtNaddNewlineMode		"addNewlineMode"
#define XtCAddNewlineMode		"AddNewlineMode"
#define XtNcommandLineList		"commandLineList"
#define XtCCommandLineList		"CommandLineList"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files: 
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#include <X11/StringDefs.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include "xpp.h"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Static and global data
 * **** **** **** **** **** **** **** **** **** **** **** **** */

XtTranslations text_translations;
char *templates;
char *command_line_list;

#ifdef BUILDTITLE
char *title = BUILDTITLE;
#else
char *title = "xpp (test version)";
#endif
static char *file_name;

static Boolean synchronous;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Following option table reserves single lower-case letter
 * options for the command-line. The resource name is irrelevant.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static XrmOptionDescRec options [] = {
	{"-command", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-file", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-a", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-b", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-c", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-d", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-e", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-f", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-g", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-h", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-i", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-j", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-k", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-l", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-m", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-n", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-o", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-p", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-q", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-r", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-s", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-t", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-u", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-v", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-w", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-x", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-y", "*commandLine",  XrmoptionSkipLine, NULL},
	{"-z", "*commandLine",  XrmoptionSkipLine, NULL}
};

typedef struct {
	XtTranslations text_translations;
	char *templates;
	char *interrupt_prompt;
	char *abandon_reply;
	char *command_line_list;
	int  add_new_line_mode;
} XppResources;

XppResources xpp_resources;

static XtResource resources[] = {
	{
		XtNtextTranslations,
		XtCTextTranslations,
		XtRTranslationTable,
		sizeof(char *),
		XtOffsetOf(XppResources, text_translations),
		XtRString,
		""
	},
	{
		XtNtemplates,
		XtCTemplates,
		XtRString,
		sizeof(char *),
		XtOffsetOf(XppResources, templates),
		XtRString,
		""
	},
	{
		XtNinterruptPrompt,
		XtCInterruptPrompt,
		XtRString,
		sizeof(char *),
		XtOffsetOf(XppResources, interrupt_prompt),
		XtRString,
		""
	},
	{
		XtNabandonReply,
		XtCAbandonReply,
		XtRString,
		sizeof(char *),
		XtOffsetOf(XppResources, abandon_reply),
		XtRString,
		""
	},
	{
		XtNcommandLineList,
		XtCCommandLineList,
		XtRString,
		sizeof(char *),
		XtOffsetOf(XppResources, command_line_list),
		XtRString,
		""
	},
	{
		XtNaddNewlineMode,
		XtCAddNewlineMode,
		XtRInt,
		sizeof(int),
		XtOffsetOf(XppResources, add_new_line_mode),
		XtRImmediate,
		(XtPointer) 1
	}
};




/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Usage line
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void usage (void)
{
	msg( "xpp",
"usage: xpp [standard X Toolkit options] [-readonly] [-file fname] [-commmand command-line]");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Check whether a command line option matches a given keyword
 * **** **** **** **** **** **** **** **** **** **** **** **** */
Boolean check_option(char *option,  char*keyword)
{
	int l = strlen(option);
	return	l > 1
	&&	*option == '-'
	&&	!strncmp(option + 1, keyword, l - 1);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * check_sep: check for command line options, and set up some of the static data accordingly.
 * Returns number of argv items to skip
 * **** **** **** **** **** **** **** **** **** **** **** **** */
int check_sep(int argc, char **argv)
{
	int i;
	synchronous = False;
	file_name = NULL;
	for (i = 1; i < argc; i += 1) {
		if(check_option(argv[i], "blocking")) {
			synchronous = True;
		} else if (check_option(argv[i], "readonly")) {
			global_options.read_only = True;
		} else if (check_option(argv[i], "filename")) {
			if(i + 1 < argc) {
				file_name = argv[i+1];
				i += (i + 2 < argc && check_option(argv[i+2], "command")) ? 3 : 2;
				break;
			} else {
				file_name = "";
			}
		} else if (check_option(argv[i], "command")) {
			i += 1;
			break;
		} else {
			file_name = argv[i];
			i += 1;
			break;
		}
	}
	global_options.edit_only = i == argc && !check_option(argv[argc-1], "command");
	return i;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Process non-X options and set up the command line
 * Note this needs to be an XtMalloced string for various other
 * parts of the code to work, even in an edit-only session.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static char *get_command_line(int argc, char **argv)
{
	int i, siz, skip, len;
	char *p, *res;

	skip = check_sep(argc, argv);

	siz = 1;

	for(i = skip; i < argc; ++i) {
		siz += strlen(argv[i]) + 1;
	};

	if((res = XtMalloc(siz)) == NULL) {
		msg("xpp",
		"cannot allocate space for command-line\n");
		exit(52);
	};

	p = res;

	for(i = skip; i < argc; ++i) {
		len = strlen(argv[i]);
		strcpy(p, argv[i]);
		p[len] = ' ';
		p += len + 1;
	};
	if (skip < argc) {
		 *(p - 1) = '\0';
	} else {
		 *p = '\0';
	}
	return res;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * main:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

int main(int argc, char **argv)
{
	argv0 = argv[0];

	root = XtVaAppInitialize(&app,
		"Xpp",
		options,
		XtNumber(options),
		&argc,
		argv, NULL, NULL);
	
	(void) fcntl(ConnectionNumber(XtDisplay(root)), F_SETFD, 1);

	XtVaSetValues(root,
		XmNtitle, title,
		NULL);

	XtVaGetApplicationResources(root,
		&xpp_resources,
		resources,
		XtNumber(resources),
		NULL);

	text_translations = xpp_resources.text_translations;
	templates = xpp_resources.templates;

	global_options.command_line = get_command_line(argc, argv);

	global_options.interrupt_prompt = xpp_resources.interrupt_prompt;

	global_options.abandon_reply = xpp_resources.abandon_reply;

	global_options.add_new_line_mode = 
		xpp_resources.add_new_line_mode > EXECUTE_IGNORE_NEW_LINES
	?	EXECUTE_IGNORE_NEW_LINES
	:	xpp_resources.add_new_line_mode < EXECUTE_ADD_NEW_LINES
	?	EXECUTE_ADD_NEW_LINES
	:	xpp_resources.add_new_line_mode;

	command_line_list = xpp_resources.command_line_list;
	
	(void) fcntl(ConnectionNumber(XtDisplay(root)), F_SETFD, 0);

	if(!synchronous) {
		run_in_background();
	}

	(void) fcntl(ConnectionNumber(XtDisplay(root)), F_SETFD, 1);

	main_window_go(file_name);
	return 0;
}

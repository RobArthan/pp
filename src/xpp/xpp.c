/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: xpp.c,v 2.5 2002/03/12 14:48:20 phil Exp rda $
 *
 * xpp.c -  main for the X/Motif ProofPower
 *
 * (c) ICL 1993, 1994
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
"usage: xpp [standard X Toolkit options] [-file fname] [-commmand command-line]");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Check whether the -command or -file command-line option is there
 * And set up static data accordingly.
 * Returns number of argv items to skip ((1 or 2)
 * Error message and exit if no command line at all.
 * Note can omit -command if there are no X options 
 * THIS AREA IS NOT VERY GOOD YET AND NEEDS A BIT MORE DESIGN THOUGHT
 * **** **** **** **** **** **** **** **** **** **** **** **** */
int check_sep(int argc, char **argv)
{
	int l, acc;
	if(argc == 1) {
		file_name = NULL;
		global_options.edit_only = True;
		return argc;
	};
	if(argc == 2) {
		file_name = argv[1];
		global_options.edit_only = True;
		return argc;
	};
	if(	(l = strlen(argv[1])) <= strlen("-file")
	&&	!strncmp(argv[1], "-file", l) ) {
		if(argc < 3) {
			/* it's not possible to get here!  PG. 12/3/2002 */
			usage();
			exit(60);
		}
		file_name = argv[2];
		acc = 2;
	} else if ( (l = strlen(argv[1])) <= strlen("-command")
	       && !strncmp(argv[1], "-command", l) ) {
		file_name = NULL;
		acc = 1;
	} else {
		file_name = argv[1];
		acc = 1;
	}
	if(	argc > acc + 1
	&&	(l = strlen(argv[acc + 1])) <= strlen("-command")
	&&	!strncmp(argv[acc + 1], "-command", l) ) {
		return acc + 2;
	} else {
		global_options.edit_only = (argc == acc + 1);
		return acc + 1;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Set up non-X arguments
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static char *get_command_line(int argc, char **argv)
{
	int i, siz, skip, len;
	char *p, *res;

	skip = check_sep(argc, argv);

	siz = 0;

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
	root = XtVaAppInitialize(&app,
		"Xpp",
		options,
		XtNumber(options),
		&argc,
		argv, NULL, NULL);

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

	main_window_go(file_name);
	return 0;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: xpp.c,v 2.15 2003/06/25 12:22:40 rda Exp rda $
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
#include <stdlib.h>
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

#define PPHOME "PPHOME"
#define PPENVDEBUG "PPENVDEBUG"
#define PATH "PATH"
#define XUSERFILESEARCHPATH "XUSERFILESEARCHPATH"
#define XAPPLRESDIR "XAPPLRESDIR"
#define HOME "HOME"

/*
* In the following, the first two %s are set to $HOME and the third to $PPHOME
*/
#define X_SEARCH_PATH \
	"%s/app-defaults/%%N:%s/%%N:%s/app-defaults/%%N"
#define X_SEARCH_PATH_NO_HOME \
	"%s/app-defaults/%%N"

#define TEST_FONT "holnormal"
#define FONTS "fonts"

static Boolean synchronous, havefonts;

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
	msg( "usage",
"xpp [standard X Toolkit options] [-blocking] [-readonly] [-filename fname] -havefonts [-commmand command-line]");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * PPHOME environment variable.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void set_pp_home(void)
{
	char *env_val, *dir, *base, *real_name, *find_file_path, *env_entry, *x_search_path;
/*
 * The first part of this is closely based on what the shell scripts like pp do.
 * If the environment variable PPENVDEBUG is set and non-empty, we output diagnostics about all this.
 */
	env_val = getenv(PPENVDEBUG);
	pp_env_debug = env_val != NULL && env_val[0] != 0;
/*
 * Look for users setting of PPHOME environment variable and if found just report about it.
 */
	env_val = getenv(PPHOME);
	if(env_val != NULL) {
		pp_home = env_val;
		env_diag(PPHOME " set by caller to %s", pp_home);
		env_val = getenv(PATH);
		if(env_val != NULL) {
			env_diag(PATH " set by caller to %s", env_val);
		} else {
			env_diag(PATH " not set by caller", "");
		}
	} else {
/*
 * Otherwise, compute PPHOME as the parent of the parent of the directory containing the
 * file identified by argv[0]. E.g., if invoked as /usr/share/pp/bin/xpp, that's /usr/share/pp.
 */
		real_name = get_real_name(argv0);
		if(!real_name) {
			env_diag("cannot find real path to executable %s", argv0);
			msg("initialisation error", "cannot locate the ProofPower installation directory");
			exit(51);
		}
		split_file_name(real_name, &dir, &base);
		XtFree(real_name);
		XtFree(base);
		real_name = dir;
		split_file_name(real_name, &pp_home, &base);
		XtFree(real_name);
		XtFree(base);
		if(!is_dir(pp_home)) {
			env_diag("cannot access %s", pp_home);
			msg("initialisation error", "cannot locate the ProofPower installation directory");
			exit(51);
		}
		env_diag("using PPHOME=%s", pp_home);
/*
 * But don't put it on the environment. Let the called command, e.g., pp do that for itself.
 * That way you can use one version of xpp to run several different versions of ProofPower,
 * by giving full path names for the ProofPower command on  the xpp command line.
 */
		env_val = getenv(PATH);
		env_entry = (char*) XtMalloc(strlen(PATH) + strlen(pp_home) + strlen(env_val) + 3);
/*
 * Do set up the path. Otherwise out-of-the-box running won't be so easy.
 */		strcpy(env_entry, PATH);
		strcat(env_entry, "=");
		strcat(env_entry, pp_home);
		if(env_val != NULL) {
			strcat(env_entry, ":");
			strcat(env_entry, env_val);
		}
/*
 * No setenv on Solaris so we have to use putenv. The memory allocation question shouldn't be too
 * bad as we only do this once.
 */
		putenv(env_entry);
		env_diag("using %s", env_entry);
	}
	if(	getenv(XUSERFILESEARCHPATH) == NULL
	&&	getenv(XAPPLRESDIR) == NULL) {
		env_val = getenv(HOME);
		if(env_val == NULL) {
			env_val = pp_home;
		}
		x_search_path = (char*)XtMalloc(
			sizeof(XUSERFILESEARCHPATH) + 
			sizeof(X_SEARCH_PATH) +
			2*sizeof(env_val) +
			sizeof(pp_home) +
			sizeof(X_SEARCH_PATH) +2);
		sprintf(x_search_path,
			XUSERFILESEARCHPATH "=" X_SEARCH_PATH,
			env_val, env_val, pp_home);
		putenv(x_search_path);
		env_diag("using %s", x_search_path);
	} else {
		env_diag("using callers values for XUSERFILESEARCHPATH", "");
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Check for our fonts - must call after XtOpenDisplay 
 * Returns true if caller should close and reopen.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
Boolean get_pp_fonts(void)
{
	char **fonts, **old_font_path, **new_font_path, *pp_font_dir;
	int nfonts, npaths, i;
	fonts = XListFonts(XtDisplay(root), TEST_FONT, 1, &nfonts);
	if(nfonts == 1) {
		return 0;
	}
	old_font_path = XGetFontPath(XtDisplay(root), &npaths);
	new_font_path = (char**)XtMalloc( (npaths+1) * (sizeof (char*)) );
	pp_font_dir = (char*) XtMalloc(strlen(pp_home) + strlen(FONTS) + 2);
	sprintf(pp_font_dir, "%s/%s", pp_home, FONTS);
	if(!is_dir(pp_font_dir)) {
		msg("warning", " cannot find the ProofPower font directory");
		return 0;
	}
	new_font_path[0] = pp_font_dir;
	for(i = 0; i < npaths; ++i) {
		new_font_path[i+1] = old_font_path[i];
	}
	XSetFontPath(XtDisplay(root), new_font_path, npaths+1);
	(void)XListFonts(XtDisplay(root), TEST_FONT, 1, &nfonts);
	if(nfonts != 1) {
		env_diag("failed to add %s to X font path", pp_font_dir);
		msg("warning", " could not use the ProofPower font directory");
	} else {
		env_diag("added %s to X font path", pp_font_dir);
	}
	XFreeFontPath(old_font_path);
	XtFree((void*)new_font_path);
	XtFree((void*)pp_font_dir);
	XFlush(XtDisplay(root));
	return nfonts == 1;
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
	havefonts = False;
	file_name = NULL;
	global_options.edit_only = True;
	for (i = 1; i < argc; i += 1) {
		if(check_option(argv[i], "blocking")) {
			synchronous = True;
		} else if(check_option(argv[i], "havefonts")) {
			havefonts = True;
		} else if (check_option(argv[i], "readonly")) {
			global_options.read_only = True;
		} else if (check_option(argv[i], "filename")) {
			if(file_name != NULL) {
				usage();
				exit(53);
			}
			if(i + 1 < argc) {
				file_name = argv[i+1];
				i += 1;
			} else {
				file_name = "";
			}
		} else if (check_option(argv[i], "command")) {
			global_options.edit_only = False;
			i += 1;
			break;
		} else if(file_name == NULL) {
			file_name = argv[i];
		} else {
			break;
		}
	}
	global_options.edit_only = global_options.edit_only && i == argc;
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
		msg("system error",
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
	char **retry_args;
	int i;
	retry_args = (char **) XtMalloc((argc+2)*(sizeof(char*)));
	retry_args[0] = argv0;
	retry_args[1] = "-havefonts";
	for(i = 2; i <  argc; i += 1) {
		retry_args[i+1] = argv[i];
	}
	retry_args[i+1] = (char*) 0;
	set_pp_home();

	root = XtOpenApplication(&app,
		APP_CLASS,
		options,
		XtNumber(options),
		&argc,
		argv,
		NULL, /* no fallback resources */
		applicationShellWidgetClass,
		NULL, 0); /* default widget resources*/

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

	if (!havefonts && get_pp_fonts())  {
		new_session(retry_args);
		exit(0);
	}

	if(!synchronous) {
		run_in_background();
	} else {
		XtFree((char*)retry_args);
	}

	(void) fcntl(ConnectionNumber(XtDisplay(root)), F_SETFD, 1);

	main_window_go(file_name);
	return 0;
}

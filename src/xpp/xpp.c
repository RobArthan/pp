/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: xpp.c,v 2.30 2004/02/18 16:23:57 rda Exp rda $
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
#define XtNdefaultCommand		"defaultCommand"
#define XtCDefaultCommand		"DefaultCommand"
#define XtNargumentChecker		"argumentChecker"
#define XtCArgumentChecker		"ArgumentChecker"

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
#define BIN "bin"

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
	char *default_command;
	char *argument_checker;
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
	},
	{
		XtNdefaultCommand,
		XtCDefaultCommand,
		XtRString,
		sizeof(char *),
		XtOffsetOf(XppResources, default_command),
		XtRString,
		""
	},
	{
		XtNargumentChecker,
		XtCArgumentChecker,
		XtRString,
		sizeof(char *),
		XtOffsetOf(XppResources, argument_checker),
		XtRString,
		""
	}
};




/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Usage line
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void usage (void)
{
	msg( "usage",
"xpp [X Toolkit options] [Xpp Options | Command Options ...]");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * PPHOME environment variable.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void set_pp_home(void)
{
	char *env_val, *dir, *base, *real_name, *find_file_path, *env_entry, *unix_path, *x_search_path;
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
 * Be careful if invoked via the search path, when argv0 will typically not be a full path name.
 * If PATH is not set, give up.
 */
		unix_path = getenv(PATH);
		if(unix_path == NULL) {
			msg("initialisation warning", PATH " has not been set by caller");
			return;
		}
		if(strchr(argv0, '/') == NULL) { /* must have been invoked via PATH */
			char *n;
			n = find_file(argv0, unix_path, 1);
			if(n != NULL) {
				real_name = get_real_name(n);
				XtFree(n);
			} else {
				real_name = NULL;
			}
		} else {
			real_name = get_real_name(argv0);
		}
		if(!real_name) {
			env_diag("cannot find real path to executable %s", argv0);
			msg("initialisation error", "cannot locate the ProofPower installation directory");
			exit(51);
		}
		env_diag("invoked as %s", real_name);
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
		env_entry = (char*) XtMalloc(strlen(PATH) + strlen(pp_home) + strlen(BIN)
			+ strlen(unix_path) + 4);
/*
 * Do set up the path. Otherwise out-of-the-box running won't be so easy.
 */		strcpy(env_entry, PATH);
		strcat(env_entry, "=");
		strcat(env_entry, pp_home);
		strcat(env_entry, "/");
		strcat(env_entry, BIN);
		strcat(env_entry, ":");
		strcat(env_entry, unix_path);
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
		env_diag("using caller's value for XUSERFILESEARCHPATH", "");
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
 * Append an argument onto the command line string.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static char *append_arg(char *cmd_line, char *arg)
{
	char *res;
	if(cmd_line == NULL) {
		if((res = XtMalloc(strlen(arg) + 1)) == NULL) {
			msg("system error",
			"cannot allocate space for command-line\n");
			exit(52);
		}
		strcpy(res, arg);
	} else {
		if((res = XtRealloc(cmd_line, strlen(cmd_line) + strlen(arg) + 2)) == NULL) {
			msg("system error",
			"cannot allocate space for command-line\n");
			exit(54);
		}
		strcat(res," ");
		strcat(res, arg);
	}
	return res;
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Process non-X options and set up the command line
 * Note this needs to be an XtMalloced string for various other
 * parts of the code to work, even in an edit-only session.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	
static char *get_command_line(int argc, char **argv, Boolean *use_default_command)
{
	char *res;
	int i;
	Boolean have_non_xpp_arg = False;
	Boolean just_collect = False;

	synchronous = False;
	havefonts = False;
	file_name = NULL;
	global_options.edit_only = False;
	res = NULL;
	*use_default_command = True;

	for (i = 1; i < argc; i += 1) {
		if(just_collect) {
			res = append_arg(res, argv[i]);
		} else if(check_option(argv[i], "b")) {
			synchronous = True;
		} else if(check_option(argv[i], "h")) {
			havefonts = True;
		} else if (check_option(argv[i], "r")) {
			global_options.read_only = True;
		} else if (check_option(argv[i], "f")) {
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
		} else if (check_option(argv[i], "c")) {
			if(have_non_xpp_arg) {
				usage();
				exit(55);
			}
			global_options.edit_only = False;
			just_collect = True;
			*use_default_command = False;
		} else if (check_option(argv[i], "--")) {
			res = append_arg(res, argv[i]);			
			just_collect = True;
		} else if(!have_non_xpp_arg && argv[i][0] != '-') {
			file_name = argv[i];
		} else {
			have_non_xpp_arg = True;
			res = append_arg(res, argv[i]);
		}
	}
	if(res == NULL){
		res = XtMalloc(1);
		res[0] = '\0';
		global_options.edit_only = True;
	}
	return res;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * default_command_line: check the arguments if the argument
 * checker resource has been set. Prefix the command line with
 * the default command string (and a space). Return the command line.
 * cmd_line argument must have been malloced and may be re-alloced.
 * **** **** **** **** **** **** **** **** **** **** **** ****/
char *default_command_line(char *cmd_line)
{
	char *tmp;
	if(xpp_resources.argument_checker && *xpp_resources.argument_checker) {
		int ret_code;
		tmp = XtMalloc(strlen(xpp_resources.argument_checker) + 1);
		strcpy(tmp, xpp_resources.argument_checker);
		tmp = append_arg(tmp, cmd_line);
		ret_code = new_session(get_arg_list(tmp), False);
		if(ret_code != 0) {
			exit(ret_code);
		}
		XtFree(tmp);
	}
	if(xpp_resources.default_command && *xpp_resources.default_command) {
		tmp = XtMalloc(strlen(xpp_resources.default_command) + 1);
		strcpy(tmp, xpp_resources.default_command);
		tmp = append_arg(tmp, cmd_line);
		XtFree(cmd_line);
		return tmp;
	} else {
		return cmd_line;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * main:
 * Apart from starting up Xt, there are several complications here:
 *
 * 1) We have to take a copy of the command line arguments, before Xt has
 * tinkered with them. This is for the case where this instance of xpp is just
 * going to use the X connection to set the font path and then another xpp
 * is going to be exec'ed to provide the user interface.
 * 2) If we are going to exec another xpp, we need to pass it the -h option
 * in the right place in the argument list to prevent it trying to mess with the
 * font path (there being a possibility for weird behaviour if another process
 * is doing xsets as well). The right place is taken to be immediately after
 * any X options and before any xpp-specific ones.
 * 3) There are various bits of global state to be set up (see code)
 * 4) If there is an argument checker to be run, we run it.
 * 5) If we are going to run in the background, then the child we fork to do
 * the work inherits our X connection, so the file descriptor given by the
 * connection number must not be closed on the exec, so we need to do the
 * appropriate fcntls to ensure (a) that we do inherit the X connection and
 * (b) other applications exec'ed by us do not (if they are X application, e.g.,
 * inside a Poly/ML ProofPower session using the ML Motif interface, then
 * they will set up their own connection).
 * 6) If we are going to spawn a new xpp because we've had to change th
 * font path, then the spawned copy will set up its own connection.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

int main(int argc, char **argv)
{
	char **retry_argv;
	int i, orig_argc, num_x_args;
	Boolean use_default_command;
	char *cmd_line;

	argv0 = argv[0];
	orig_argc = argc;
	retry_argv = (char **) XtMalloc((argc+2)*(sizeof(char*)));
/* N.b., argc not argc - 1 below because we want the final null, and similarly later */
	memmove((void*)retry_argv, (void*) argv, argc * (sizeof(char*)));

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

	num_x_args = orig_argc - argc;

	memmove((void*) &retry_argv[num_x_args+2], (void*) &retry_argv[num_x_args + 1], argc * (sizeof(char*)));

	retry_argv[num_x_args+1] = "-h";

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

	cmd_line = get_command_line(argc, argv, &use_default_command);
	
	if(!global_options.edit_only && use_default_command) {
		global_options.command_line = default_command_line(cmd_line);
	} else {
		global_options.command_line = cmd_line;	
	}

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
		/* Need to restart to pick up the fonts added to the path by get_pp_fonts */
		/* don't need X any more: */
		XtDestroyApplicationContext(app);
		(void) fcntl(ConnectionNumber(XtDisplay(root)), F_SETFD, 1);
		/* Start again asynchronously or synchronously as appropriate */
		new_session(retry_argv, !synchronous);
		exit(0);
	} else if(!synchronous) {
		run_in_background();
	} else {
		XtFree((char*)retry_argv);
	}

	(void) fcntl(ConnectionNumber(XtDisplay(root)), F_SETFD, 1);

	main_window_go(file_name);
	return 0;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macro definitions: 
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#define _xpp

#define MAX_ARGS 	256

#define XtNcommandLine	"commandLine"
#define XtCCommandLine	"CommandLine"

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

char *cmd_buf;

char *arglist[MAX_ARGS + 1];

char *file_name;

Bool edit_only = False;

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

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Usage line
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void usage ()
{
	msg( "xpp",
"usage: xpp [standard X Toolkit options -command] command-line");
};

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Check whether the -command or -file command-line option is there
 * And set up static data accordingly.
 * Returns number of argv items to skip ((1 or 2)
 * Error message and exit if no command line at all.
 * Note can omit -command if there are no X options 
 * THIS AREA IS NOT VERY GOOD YET AND NEEDS A BIT MORE DESIGN THOUGHT
 * **** **** **** **** **** **** **** **** **** **** **** **** */
int check_sep(argc, argv)
int argc;
char **argv;
{
	int l, acc;
	if(argc == 1) {
		file_name = NULL;
		edit_only = True;
		return argc;
	};
	if(argc == 2) {
		file_name = argv[1];
		edit_only = True;
		return argc;
	};
	if(	(l = strlen(argv[1])) <= strlen("-file")
	&&	!strncmp(argv[1], "-file", l) ) {
		if(argc < 3) {
			usage();
			exit(60);
		}
		file_name = argv[2];
		acc = 2;	
	} else {
		file_name = NULL;
		acc = 1;
	}
	if(	argc > acc + 1
	&&	(l = strlen(argv[acc + 1])) <= strlen("-command")
	&&	!strncmp(argv[acc + 1], "-command", l) ) {
		return acc + 2;
	} else {
		edit_only = (argc == acc + 1);
		return acc + 1;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Set up non-X arguments
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void set_up_arglist(argc, argv)
int argc;
char **argv;
{
	int i, siz, skip;
	char *p;

	skip = check_sep(argc, argv);

	if(argc - skip > MAX_ARGS) {
		char buf[256];
		sprintf(buf,
		"too many command-line arguments (max %d)", MAX_ARGS);
		msg("xpp", buf);
		exit(51);
	};
		
	siz = 0;

	for(i = skip; i < argc; ++i) {
		siz += strlen(argv[i]) + 1;
	};

	if((cmd_buf = XtMalloc(siz)) == NULL) {
		msg("xpp",
		"cannot allocate space for command-line\n");
		exit(52);
	};

	p = cmd_buf;

	for(i = skip; i < argc; ++i) {
		strcpy(p, argv[i]);
		arglist[i - skip] = p;
		p += strlen(argv[i]) + 1;
	};

	arglist[i - skip] = NULL;

}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * main:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void main(argc, argv)
int argc;
char **argv;
{
	root = XtVaAppInitialize(&app,
		"Xpp",
		options,
		XtNumber(options),
		&argc,
		argv, NULL, NULL);

	set_up_arglist(argc, argv);

	main_window_go(edit_only, file_name);
	exit(0);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macro definitions: 
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#define _xpp

#define CMD_BUF_SIZ 	256
#define ARG_BUF_SIZ	1024

#define XtNcommandLine	"commandLine"
#define XtCCommandLine	"CommandLine"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files: 
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#include <X11/StringDefs.h>
#include <stdio.h>
#include "xpp.h"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Global data
 * **** **** **** **** **** **** **** **** **** **** **** **** */

char cmd_buf [CMD_BUF_SIZ];

char arg_buf [ARG_BUF_SIZ];

char *arglist[CMD_BUF_SIZ];

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Application resources:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
typedef struct {
	char *command_line
} AppData;

static AppData app_data;

static XtResource resources [] = {
	{
		XtNcommandLine,
		XtCCommandLine,
		XtRString,
		sizeof(char *),
		XtOffsetOf(AppData, command_line),
		XtRString,
		"pp"
	}
};

static XrmOptionDescRec options [] = {
	{"-command", "*commandLine",  XrmoptionSepArg, NULL}
};

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * main:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void main(argc, argv)
int argc;
char **argv;
{
	debug = TRUE;

	root = XtVaAppInitialize(&app,  "Xpp", NULL,
		0, &argc, argv, NULL, NULL);
/*
	XtVaGetApplicationResources(root, &app_data,
		resources,
		XtNumber(resources),
		NULL);

	strcpy(cmd_buf, app_data.command_line);
*/
	arglist[0] = argv[1];

	arglist[1] = NULL;

	cmdwin();
}



/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$
 *
 * files.c -  file operations for the X/Motif ProofPower Interface
 *
 * (c) ICL 1993
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _files
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#include <string.h>

#include <sys/types.h>
#include <sys/stat.h>

#include <stdio.h>
#include <X11/Xatom.h>
#include <X11/Intrinsic.h>
#include <X11/Shell.h>
#include <Xm/Protocols.h>
#include <Xm/Xm.h>

#include <stdio.h>
#include<varargs.h>

#include "xpp.h"


static char *cant_stat_message = "That file does not seem to exist";

static char *not_text_message = "That file is not a text file";

static char *no_space_message = "Not enough memory to read the file";

static char *cant_open_message = "That file cannot be read";

static char *read_error_message = "Error reading the file";
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * FILE OPERATIONS
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * open a file and load it into a text widget given the
 * widget, the file name 
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void load_file(text, name)
Widget text;
char *name;
{
	struct stat status;
	NAT siz;
	FILE *fp;
	char *buf;

	if(!(name && *name)) { /* NULL or empty */
		XmTextSetString(text, "");
		return;
	};
	if(stat(name, &status) != 0) {
		ok_dialog(text, cant_stat_message);
		return;
	};
	if(!S_ISREG(status.st_mode)) {
		ok_dialog(text, not_text_message);
		return;
	};
	siz = status.st_size;
	if(!(buf = XtMalloc(siz + 1))) {
		ok_dialog(text, no_space_message);
		return;
	};
	if((fp = fopen(name, "r")) == NULL) {
		ok_dialog(text, cant_open_message);
		XtFree(buf);
		return;
	};
	if(fread(buf, sizeof(char), siz, fp) != siz) {
		ok_dialog(text, read_error_message);
		XtFree(buf);
		return;
	};
	buf[siz] = '\0';
	XmTextSetString(text, buf);
	XtFree(buf);
	return;
}


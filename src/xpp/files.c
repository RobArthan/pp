
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


static char *cant_read_message =
	 "The file \"%s\" cannot be opened for reading";

static char *cant_write_message =
	 "The file \"%s\" cannot be opened for writing";

static char *cant_stat_message =
	 "The file \"%s\" does not seem to exist";

static char *contains_nulls_message =
	" The file \"%s\" contains binary data and cannot be edited";

static char *load_not_reg_message =
	 "The file \"%s\" is not an ordinary file";

static char *no_space_message =
	 "Not enough memory is available to read the file \"%s\"";

static char *no_message_space_message =
	 "Not enough memory is available to report a file error";

static char *overwrite_message =
	 "The file %s exists. Do you want to overwrite it?";

static char *read_error_message =
	 "Error reading the file \"%s\"";

static char *save_not_reg_message =
	 "The file \"%s\" is not an ordinary file";

static char *write_error_message =
	 "Error writing the file \"%s\"";

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Private functions:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * file_error_dialog: error reporting for the file operations
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void file_error_dialog(
	Widget	w,
	char	*fmt,
	char	*fname)
{
	char	*msg;
	if((msg = XtMalloc(strlen(fmt) + strlen(fname) - 1)) == NULL) {
/* Not - 2 because need room for the null-padding */
		ok_dialog(w, no_message_space_message);
		return;
	};
	sprintf(msg, fmt, fname);
	ok_dialog(w, msg);
	XtFree(msg);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * get_file_contents: read the contents of a file into a buffer.
 * The first parameter is the name of a widget to own any error
 * message dialogues.
 * The second parameter is a pointer to the file name.
 * NULL is returned if anything goes wrong (and if NULL is
 * returned, the user will have been presented with an error
 * message dialogue).
 * If all is well the return value is a pointer to a buffer
 * containing the contents of the file as a null-terminated
 * character array.
 * The buffer should be XtFree'd when caller is done with it
 * (if it is not NULL).
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static char *get_file_contents(
	Widget	w,
	char	*name)
{
	struct stat status;
	NAT siz;
	FILE *fp;
	char *buf;

	if(stat(name, &status) != 0) {
		file_error_dialog(w, cant_stat_message, name);
		return NULL;
	};
	if(!S_ISREG(status.st_mode)) {
		file_error_dialog(w, load_not_reg_message, name);
		return NULL;
	};
	siz = status.st_size;
	if(!(buf = XtMalloc(siz + 1))) {
		file_error_dialog(w, no_space_message, name);
		return NULL;
	};
	if((fp = fopen(name, "r")) == NULL) {
		file_error_dialog(w, cant_read_message, name);
		XtFree(buf);
		return NULL;
	};
	if(fread(buf, sizeof(char), siz, fp) != siz) {
		file_error_dialog(w, read_error_message, name);
		XtFree(buf);
		fclose(fp);
		return NULL;
	};
	fclose(fp);
	buf[siz] = '\0';
	if(strlen(buf) != siz) { /* use strlen to check for null chars */
		file_error_dialog(w, contains_nulls_message, name);
		XtFree(buf);
		return NULL;
	}
	return buf;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * store_file_contents: store a buffer into a file.
 * The first parameter is the name of a widget to own any error
 * message dialogues.
 * The second parameter is a pointer to the file name.
 * The third parameter is a pointer to the data as a null-terminated
 * string.
 * False is returned if anything goes wrong (and if NULL is
 * returned, the user will have been presented with an error
 * message dialogue).
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static Boolean store_file_contents(
	Widget	w,
	char	*name,
	char	*buf)
{
	struct stat status;
	NAT siz;
	FILE *fp;

	siz = strlen(buf);
	if((fp = fopen(name, "w")) == NULL) {
		file_error_dialog(w, cant_write_message, name);
		return False;
	};
	if(fwrite(buf, sizeof(char), siz, fp) != siz) {
		file_error_dialog(w, read_error_message, name);
		fclose(fp);
		return False;
	};
	fclose(fp);
	return True;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * open_file: open a file and load it into a text widget given the
 * widget and the file name 
 * Implements `open' in a file menu.
 * If name is NULL or an empty string it just empties out the
 * contents of the text window and returns False.
 * E.g., this is done when opening the file named on the
 * command line.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean open_file(
		Widget	text,
		char	*name)
{
	char *buf;

	if(!(name && *name)) { /* NULL or empty */
		XmTextSetString(text, "");
		return False;
	};
	if((buf = get_file_contents(text, name)) != NULL) {
		XmTextSetString(text, buf);
		XtFree(buf);
		return True;
	} else {
		return False;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * save_file: store contents of a text widget into a named file
 * which will presumably already exist and may be overwritten
 * without confirmation.
 * Implements `save' as opposed to `save as' in a file menu
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean save_file(
	Widget	text,
	char	*name)
{
	FILE *fp;
	char *buf;
	Boolean success;
	buf = XmTextGetString(text);
	success = store_file_contents(text, name, buf);
	XtFree(buf);
	return success;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * save_file_as: store contents of a text widget into a named file
 * asks for confirmation if the file already exists.
 * Implements `save as' as opposed to `save' in a file menu
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean save_file_as(
	Widget	text,
	char	*name)
{
	FILE *fp;
	char *buf;
	Boolean success;
	struct stat status;

	if(stat(name, &status) == 0) { /* file exists */
		char msg_buf[200];
		if(!S_ISREG(status.st_mode)) {
			file_error_dialog(text, save_not_reg_message, name);
			return False;
		};
		sprintf(msg_buf, overwrite_message, name);
		if(!yes_no_dialog(text, msg_buf)) {
			return False;
		}
	}; /* else file doesn't exist so no checks needed */
	buf = XmTextGetString(text);
	success = store_file_contents(text, name, buf);
	XtFree(buf);
	return success;
}


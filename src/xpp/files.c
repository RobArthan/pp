
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: files.c,v 2.45 2009/09/06 13:20:10 rda Exp rda $
 *
 * files.c -  file operations for the X/Motif ProofPower Interface
 *
 * files.c: this file is part of the PPTex system
 *
 * Copyright (c) 2002 Lemma 1 Ltd.
 *
 * See the file LICENSE for your rights to use and change this file.
 *
 * Contact: Rob Arthan < rda@lemma-one.com >
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
#include <stdlib.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <limits.h>
#include <errno.h>

#include <stdio.h>

#include "xpp.h"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * messages:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static char *cant_read_message =
	 "The file \"%s\" cannot be opened for reading: "
     "edit a new buffer or quit?";

static char *cant_write_message =
	 "The file \"%s\" cannot be opened for writing";

static char *cant_write_backup_message =
	"An error has occurred while taking a backup.\n"
	"Do you want to overwrite the file \"%s\" without a backup?";

static char *cant_open_file_to_backup_message =
	"Cannot read the file \"%s\" to take a backup.\n\n"
	"Do you want to overwrite your file without a backup?";

static char *backup_file_same_as_file_message =
	"Cannot take a backup of the file. "
	"It is probably on an MS-DOS or similar file system that will "
	"not support a file named \"%s.xpp.backup\".\n\n"
	"Do you want to overwrite your file without a backup?";

static char *cant_open_backup_message =
	"Cannot open a backup file.\n\n"
	"Do you want to overwrite the file \"%s\" anyway?";

static char *cant_stat_message =
	 "The file \"%s\" does not seem to exist.";

static char *cant_stat_message2 =
	 "The file \"%s\" does not seem to exist.\n\n"
	  "Do you want to edit a new empty buffer?";

static char *load_not_reg_message =
	 "The file \"%s\" is not an ordinary file";

static char *no_backup_name_space_message =
	 "Running out of memory! "
	"Not enough memory is available to create the backup file name";

static char *no_space_message =
	 "Running out of memory! "
	"Not enough memory is available to read the file \"%s\"";

static char *no_message_space_message =
	 "Running out of memory! "
	"Not enough memory is available to report a file error";

static char *overwrite_message =
	 "The file \"%s\" exists.\n\n"
	"Do you want to overwrite it?";

static char *panic_file_cant_be_opened =
	"xpp: sorry! cannot open a file to save the editor text\n";

static char *panic_file_error =
	"xpp: saving editor text using file type Unix to file \"%s\": not all the text was saved\n";

static char *panic_file_written =
	"xpp: editor text saved using file type Unix to file \"%s\"\n";

static char *read_error_message =
	 "Error reading the file \"%s\"";

static char *root_read_only_message =
	 "You are running as the super-user. "
	"The file \"%s\" does not have owner write-permission "
	"and will be opened read-only.\n\n"
	"Do you want to open it?";

static char *root_not_owner_message =
	 "You are running as the super-user. "
	"The file \"%s\"  is not owned by the super-user "
	"and will be opened read-only.\n\n"
	 "Do you want to open it?";

static char *save_read_only_message =
	"The read-only option is turned on.\n\n"
	"Do you really want to turn this option off "
	"and save the file \"%s\"?";

static char *save_not_reg_message =
	 "The file \"%s\" is not an ordinary file";

static char *write_error_message =
	 "Error writing the file \"%s\"";

static char *save_file_changed_message =
	 "Another program has modified the file \"%s\".\n\n"
	"Do you want to overwrite it?";

static char *save_file_created_message =
	 "Another program has created the file \"%s\".\n\n"
	"Do you want to overwrite it?";

static char *save_file_deleted_message =
	"Cannot access the file \"%s\". "
	 "Another program may have moved or deleted it.\n\n"
	"Do you want to create it?";

static char *old_file_changed_message =
	 "Another program has modified the file \"%s\".";

static char *old_file_created_message =
	 "Another program has created the file \"%s\".\n";

static char *old_file_deleted_message =
	"Cannot access the file \"%s\". "
	 "Another program may have moved or deleted it.\n";

static char *writable_binary_message =
	"The file \"%s\" contains binary data."
	" If you open it, uneditable characters will be replaced by question"
	" marks and the read-only option will be set.\n\n"
	"Do you wish to open it?";

static char *read_only_binary_message =
	"The file \"%s\" is read-only and contains binary data."
	" If you open it, uneditable characters will be replaced by question"
	" marks.\n\n"
	"Do you wish to open it?";

static char *mixed_file_type_message =
	 "The file \"%s\"  contains a mixture of Unix, MS-DOS or Macintosh line terminators."
	"The file type will be taken as Unix. You may use the Options Tool to change the file type.";

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Static data:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static struct stat *current_file_status = NULL;

#define MAX_PANIC_SAVE_NAME 100
	/* allow for /tmp/xpp.panic.<user's file name>.XXXXXX */

static char panic_save_name[MAX_PANIC_SAVE_NAME];

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
	char *msg;
	/* Not - 2 because need room for the null-padding */
	if((msg = XtMalloc(strlen(fmt) + strlen(fname) - 1)) == NULL) {
		ok_dialog(w, no_message_space_message);
		return;
	}
	sprintf(msg, fmt, fname);
	ok_dialog(w, msg);
	XtFree(msg);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * file_quit_new_dialog: quit/new confirmation for the file operations
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean file_quit_new_dialog(
	Widget	w,
	char	*fmt,
	char	*fname)
{
	char *msg;
	Boolean reply;
	/* Not - 2 because need room for the null-padding */
	if((msg = XtMalloc(strlen(fmt) + strlen(fname) - 1)) == NULL) {
		ok_dialog(w, no_message_space_message);
		return False;
	}
	sprintf(msg, fmt, fname);
	reply = quit_new_dialog(w, msg);
	XtFree(msg);
	return reply;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * file_yes_no_dialog: yes/no confirmation for the file operations
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean file_yes_no_dialog(
	Widget	w,
	char	*fmt,
	char	*fname,
	char	*title)
{
	char *msg;
	Boolean reply;
	/* Not - 2 because need room for the null-padding */
	if((msg = XtMalloc(strlen(fmt) + strlen(fname) - 1)) == NULL) {
		ok_dialog(w, no_message_space_message);
		return False;
	}
	sprintf(msg, fmt, fname);
	reply = yes_no_dialog(w, msg, title);
	XtFree(msg);
	return reply;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * get_file_contents: read the contents of a file into a buffer.
 * The first parameter, w,  is the name of a widget to own any error
 * message dialogues.
 *
 * The second parameter, name, is a pointer to the file name.
 *
 * The third parameter, cmd_line, should be set true iff. this is the call
 * to open the file named on the command line (for which it is not
 * an error if the file does not exist).
 *
 * The fourth parameter, including, should be set true iff. this is the call
 * to open a file to be included in the text window (which affects the
 * behaviour with respect to file type and with respect to binary data in
 * the file). With including false, file type is set according to what is found
 * in the file and a warning dialogue is put up and is set if the file
 * contained binary (the control characters are converted to question marks).
 * With including true, file type is not set, and we leave it to text_verify_cb to
 * deal with binary (although we do map nulls to backspaces to avoid potential
 * confusion with null-termination). Caller is informed  via the binary parameter
 * if binary data was encountered.
 *
 * The fifth parameter, outcome, tells caller more about what happened (supply
 * NULL if not interested).
 *
 * The sixth parameter, stat_buf, is a buffer to contain the stat of the file
 * if it already existed (supply NULL if not interested).
 * If all is well the return value is a pointer to a buffer
 * containing the contents of the file as a null-terminated
 * character array.
 *
 * The seventh parameter, binary, is set true if the file contained binary data and
 * false otherwise (supply NULL if not interested).
 *
 * The eighth parameter returns the file type (supply NULL if not interested)
 *
 * NULL is returned if anything goes wrong (and if NULL is
 * returned, the user will have been presented with an error
 * message dialogue).
 * The buffer should be XtFree'd when caller is done with it
 * (if it is not NULL).
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static wchar_t *get_file_contents(
	Widget		w,
	char		*name,
	Boolean	 	cmd_line,
	Boolean		including,
	OpenOutcome 	*outcome,
	struct stat 	*stat_buf,
	Boolean		*binary,
	FileType	*file_type_return)
{
	struct stat status;
	Cardinal siz;
	FILE *fp;
	wchar_t *buf, *p;
	wint_t wi;
	FileType file_type;
	enum {FT_ANY, FT_UNIX, FT_DOS_OR_MAC, FT_DOS,  FT_MAC,
		FT_MIXED,  FT_DOS_CR, FT_MAC_CR, FT_MIXED_CR, FT_BINARY} ft_state;
	if(stat(name, &status) != 0) {
		if (cmd_line) {
			if (file_quit_new_dialog(w, cant_stat_message2, name)) {
				if (outcome != (OpenOutcome *) NULL) {
					*outcome = NEW_FILE;
				}
			}
			else {
				if (outcome != (OpenOutcome *) NULL) {
					*outcome = QUIT_NOW;
				}
			}
			return NULL;
		}
		else {
			file_error_dialog(w, cant_stat_message, name);
			return NULL;
		}
	}
	if(!S_ISREG(status.st_mode)) {
		file_error_dialog(w, load_not_reg_message, name);
		return NULL;
	}
	siz = status.st_size;
	if(!(buf = (wchar_t*)XtMalloc((siz + 1)*sizeof(wchar_t)))) {
/* Note that if there are multibyte strings or CRLF line terminators
   some of this space will not be used */
		file_error_dialog(w, no_space_message, name);
		return NULL;
	}
	if((fp = fopen(name, "r")) == NULL) {
		if (file_quit_new_dialog(w, cant_read_message, name)) {
			if (outcome != (OpenOutcome *) NULL) {
				*outcome = EMPTY_FILE;
			}
		}
		else {
			if (outcome != (OpenOutcome *) NULL) {
				*outcome = QUIT_NOW;
			}
		}
		XtFree((char*)buf);
		return NULL;
	}
	p = buf;
/*
 * Now the FSM that reads the file and copies it into the buffer mapping DOS and Mac line terminators
 * onto Unix ones. Exit from the loop is either the return in the error case where binary data is detected
 * or when end-of-file or read-error occurs. In those latter cases, the last value of wi to be read will be
 * EOF, and ft_state will be one of FT_UNIX, FT_DOS, FT_MAC, FT_MIXED or FT_BINARY enabling the file type
 * and read-only options to be set up accordingly.
 */
	ft_state = FT_ANY;
	while( True ) {
		wi = getwc(fp);
		if(	(0 <= wi && wi <= 0xff && control_chars[wi]) 
		||	(wi == WEOF && errno == EILSEQ)) {
/* Either a control character or invalid multibyte input */
			if(wi == WEOF) {
/* Invalid multibyte input: clear the error and skip a byte */
				clearerr(fp);
				(void) getc(fp);
				if(feof(fp) || ferror(fp)) {
					break; /* out of while( True ) */
				}
			}
			ft_state = FT_BINARY;
			if(!including) {
		 /* Recover by mapping to question mark */
				wi = L'?';
			} else {
		/* recover by mapping to backspace, leaving text_verify_cb to recover that and report */
				wi = L'\b';
			}
		}
/* wi now holds a valid wide character or WEOF (if end-of-file or
   error other than invalid multibyte input) */
		if(wi == L'\r') {
			switch(ft_state) {
				case FT_ANY:
		
			ft_state = FT_DOS_OR_MAC;
					break;
				case FT_UNIX:
					ft_state = FT_MIXED;
					*p++ = L'\n';
					break;
				case FT_DOS_OR_MAC:
					ft_state = FT_MAC_CR;
					*p++ = L'\n';
					break;
				case FT_DOS:
					ft_state = FT_DOS_CR;
					break;
				case FT_MAC:
					ft_state = FT_MAC_CR;
					break;
				case FT_MIXED:
					ft_state = FT_MIXED_CR;
					break;
				case FT_DOS_CR:
					ft_state = FT_MIXED_CR;
					*p++ = L'\n';
					break;
				case FT_MAC_CR:
					*p++ = L'\n';
					break;
				case FT_MIXED_CR:
					*p++ = L'\n';
					break;
				case FT_BINARY:
					*p++ = L'\n';
					break;
			}
		} else if (wi == L'\n') {
			switch(ft_state) {
				case FT_ANY:
					ft_state = FT_UNIX;
					*p++ = L'\n';
					break;
				case FT_UNIX:
					*p++ = L'\n';
					break;
				case FT_DOS_OR_MAC:
					ft_state = FT_DOS;
					*p++ = L'\n';
					break;
				case FT_DOS:
					ft_state = FT_MIXED;
					*p++ = L'\n';
					break;
				case FT_MAC:
					ft_state = FT_MIXED;
					*p++ = L'\n';
					break;
				case FT_MIXED:
					*p++ = L'\n';
					break;
				case FT_DOS_CR:
					ft_state = FT_DOS;
					*p++ = L'\n';
					break;
				case FT_MAC_CR:
					ft_state = FT_MIXED;
					*p++ = L'\n';
					break;
				case FT_MIXED_CR:
					ft_state = FT_MIXED;
					*p++ = L'\n';
					break;
				case FT_BINARY:
					*p++ = L'\n';
					break;
			}
		} else if (wi == WEOF) {
			switch(ft_state) {
				case FT_ANY:
					ft_state = FT_UNIX;
					break;
				case FT_UNIX:
					break;
				case FT_DOS_OR_MAC:
					ft_state = FT_MAC;
					break;
				case FT_DOS:
					break;
				case FT_MAC:
					break;
				case FT_MIXED:
					break;
				case FT_DOS_CR:
					ft_state = FT_MIXED;
					*p++ = '\n';
					break;
				case FT_MAC_CR:
					ft_state = FT_MAC;
					*p++ = '\n';
					break;
				case FT_MIXED_CR:
					ft_state = FT_MIXED;
					*p++ = '\n';
					break;
				case FT_BINARY:
					break;
			}
			break; /* out of the while (True) */
		} else {
			switch(ft_state) {
				case FT_ANY:
					*p++ = wi;
					break;
				case FT_UNIX:
					*p++ = wi;
					break;
				case FT_DOS_OR_MAC:
					ft_state = FT_MAC;
					*p++ = '\n';
					*p++ = wi;
					break;
				case FT_DOS:
					*p++ = wi;
					break;
				case FT_MAC:
					*p++ = wi;
					break;
				case FT_MIXED:
					*p++ = wi;
					break;
				case FT_DOS_CR:
					ft_state = FT_MIXED;
					*p++ = '\n';
					*p++ = wi;
					break;
				case FT_MAC_CR:
					ft_state = FT_MAC;
					*p++ = '\n';
					*p++ = wi;
					break;
				case FT_MIXED_CR:
					ft_state = FT_MIXED;
					*p++ = '\n';
					*p++ = wi;
					break;
				case FT_BINARY:
					*p++ = wi;
					break;
			}
		}
	}
	if(ferror(fp)) {
		file_error_dialog(w, read_error_message, name);
		XtFree((char*)buf);
		fclose(fp);
		return NULL;
	}
	if(binary) {
		*binary = False; /* overwritten if ft_state = FT_BINARY */
	}
	switch(ft_state) {
		case FT_MIXED:
			if(!including) {
				file_error_dialog(w, mixed_file_type_message, name);
			}
			file_type = UNIX;
			break;
		case FT_UNIX:
			file_type = UNIX;
			break;
		case FT_MAC:
			file_type = MACINTOSH;
			break;
		case FT_DOS:
			file_type = MSDOS;
			break;
		case FT_BINARY:
		default:
			file_type = UNIX;
			if(binary) {
				*binary = True;
			}
			break;
	}
	if(file_type_return) {
		*file_type_return = file_type;
	}
	fclose(fp);
	*p = '\0';
	if(stat_buf != NULL) {
		*stat_buf = status;
	}
	return buf;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * backup_file: copy a file XXX into XXX.old
 * The first parameter is the name of a widget to own any error
 * message dialogues.
 * The second parameter is a pointer to the file name.
 * The third parameter is set to point to the name of the backup file.
 * This will be NULL unless a backup file was successfully written.
 * This should be XtFree'd when finished with (unless NULL).
 * False is returned if anything goes wrong (and if False is
 * returned, the user will have been presented with an error
 * message dialogue).
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static Boolean backup_file(
	Widget	w,
	char	*name,
	char	**backup_name)
{
	struct stat status, bu_status;
	Cardinal siz;
	FILE *fp, *backup_fp;
	const char *suffix = ".xpp.backup";

	*backup_name = NULL;
	if(stat(name, &status) == 0) { /* file exists */
		if((fp = fopen(name, "r")) == NULL) {
			return file_yes_no_dialog(w,
				cant_open_file_to_backup_message, name, NULL);
		}
	} else { /* else file doesn't exist so no backup needed */
		return True;
	}

	siz = strlen(name);
	if((*backup_name = XtMalloc(siz + strlen(suffix) + 1)) == NULL) {
		file_error_dialog(w, no_backup_name_space_message, name);
		return False;
	}
	strcpy(*backup_name, name);
	strcpy(*backup_name + siz, suffix);
	if(	(backup_fp = fopen(*backup_name, "r")) != NULL ) {
		if(	fstat(fileno(backup_fp), &bu_status) == 0 &&
			bu_status.st_dev == status.st_dev &&
			bu_status.st_ino == status.st_ino) {
				/* backup file and file same */
			XtFree(*backup_name);
			*backup_name = NULL;
			fclose(backup_fp);
			return file_yes_no_dialog(w,
					backup_file_same_as_file_message, name, NULL);
		}
		fclose(backup_fp);
	}
	if((backup_fp = fopen(*backup_name, "w")) == NULL) {
		fclose(fp);
		XtFree(*backup_name);
		*backup_name = NULL;
		return file_yes_no_dialog(w,
				cant_open_backup_message, name, NULL);
	} else {
		char buf[MBSBUFSIZ];
		size_t bytes_read;
		while((bytes_read = fread(buf, 1, MBSBUFSIZ, fp))) {
			if(fwrite(buf, 1, bytes_read, backup_fp)
					!= bytes_read) {
				Boolean reply;
				reply = file_yes_no_dialog(w,
					cant_write_backup_message, name, NULL);
				fclose(backup_fp);
				fclose(fp);
				unlink(*backup_name);
				XtFree(*backup_name);
				*backup_name = NULL;
				return reply;
			}
		}
	}
	fclose(fp);
	fclose(backup_fp);
	return True;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * store_file_contents: store a buffer into a file.
 * The first parameter is the name of a widget to own any error
 * message dialogues.
 * The second parameter is a pointer to the file name.
 * The third parameter is a pointer to the data as a null-terminated
 * string.
 * False is returned if anything goes wrong (and if False is
 * returned, the user will have been presented with an error
 * message dialogue).
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static Boolean store_file_contents(
	Widget	w,
	char	*name,
	char	*buf)
{
	FILE *fp;
	char *p, *eoln;
	char *backup_name = NULL;

	if(global_options.backup_before_save) {
		if(!backup_file(w, name, &backup_name)) {
			return False;
		}
	}
	if((fp = fopen(name, "w")) == NULL) {
		file_error_dialog(w, cant_write_message, name);
		if(backup_name) {XtFree(backup_name);}
		return False;
	}
	switch(global_options.file_type) {
		case UNIX: eoln = "\n"; break;
		case MSDOS: eoln = "\r\n"; break;
		case MACINTOSH: eoln = "\r"; break;
	}
	p = buf;
	while(*p && !ferror(fp)) {
		if(*p == '\n') {
			fprintf(fp, "%s", eoln);
		} else {
			putc(*p, fp);
		}
		p += 1;
	}
	if(ferror(fp)) {
		file_error_dialog(w, write_error_message, name);
		fclose(fp);
		if(backup_name) {XtFree(backup_name);}
		return False;
	}
	fclose(fp);
	if(backup_name) {
		if(global_options.delete_backup_after_save) {
			unlink(backup_name);
		}
		XtFree(backup_name);
	}
	return True;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * check_file_status: check current status of file against last
 * time we took it.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

FileStatus check_file_status(char *name)
{
	struct stat new_status;
	if(name == NULL) {
		return FS_OK;
	}
	if(current_file_status != NULL) {
		if(stat(name, &new_status) == 0) { /* file still exists */
			if(	new_status.st_mtime != current_file_status->st_mtime
			||	new_status.st_size != current_file_status->st_size) {
				return FS_CHANGED;
			}
		} else { /* it's presumably been deleted */
			return FS_DELETED;
		}
	} else {
		if(stat(name, &new_status) == 0) { /* file now exists */
			return FS_CREATED;
		}
	}
	return FS_OK;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * save_file: store contents of a text widget into a named file
 * which will presumably already exist and may be overwritten
 * without confirmation.
 * The w argument is used as the parent for error messages dialogues
 * Implements `save' as opposed to `save as' in a file menu
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean save_file(
	Widget	text,
	Widget	w,
	char	*name)
{
	char *buf;
	Boolean success;
	static struct stat status;
	char *msg;
	if(global_options.read_only) {
		if(!file_yes_no_dialog(w, save_read_only_message, name, "Confirm Save")) {
			return False;
		}
		set_read_only(False);
	}
	switch(check_file_status(name)) {
		case FS_CHANGED: msg = save_file_changed_message; break;
		case FS_DELETED: msg = save_file_deleted_message; break;
		case FS_CREATED: msg = save_file_created_message; break;
		case FS_OK: msg = NULL; break;
	}
	if(msg != NULL) {
		if(!file_yes_no_dialog(w, msg, name, "Confirm Save")) {
			return False;
		}
	}
	if(stat(name, &status) == 0 && access(name, W_OK) != 0) {
		file_error_dialog(w, cant_write_message, name);
		return False;
	}
	buf = XmTextGetString(text);
	success = store_file_contents(w, name, buf);
	if(success) {
		if(stat(name, &status) == 0) { /* strange if this fails */
			current_file_status = &status;
		} else { /* give up on status checks if it failed */
			current_file_status = NULL;
		}
	}
	XtFree(buf);
	return success;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * save_file_as: store contents of a text widget into a named file
 * asks for confirmation if the file already exists.
 * Implements `save as' as opposed to `save' in a file menu
 * The w argument is used as the parent for error messages dialogues
 * to get the stacking order right.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean save_file_as(
	Widget	text,
	Widget	w,
	char	*name)
{
	char *buf;
	Boolean success;
	static struct stat status;

	if(stat(name, &status) == 0) { /* file exists */
		if(!S_ISREG(status.st_mode)) {
			file_error_dialog(w, save_not_reg_message, name);
			return False;
		}
		if(access(name, W_OK) != 0) {
			file_error_dialog(w, cant_write_message, name);
			return False;
		}
		if(!file_yes_no_dialog(w, overwrite_message, name, "Confirm Save As")) {
			return False;
		}
	} /* else file doesn't exist so no checks needed */
	buf = XmTextGetString(text);
	success = store_file_contents(w, name, buf);
	XtFree(buf);
	if(success && stat(name, &status) == 0) {
		current_file_status = &status;
	} else { /* bad news, give up on file status checks for now */
		current_file_status = NULL;
	}
	if(success) {
		set_read_only(False);
	}
	return success;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * save_string_as: store string given as argument into a named file.
 * Asks for confirmation if the file already exists.
 * E.g., used to implement `save selection as' in a file menu
 * Treats NULL data same as "" (just a frill).
 * The w argument is used as the parent for error messages dialogues
 * to get the stacking order right.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean save_string_as(
	Widget	w,
	char	*data,
	char	*name)
{
	Boolean success;
	struct stat status;

	if(stat(name, &status) == 0) { /* file exists */
		if(!S_ISREG(status.st_mode)) {
			file_error_dialog(w, save_not_reg_message, name);
			return False;
		}
		if(!file_yes_no_dialog(w, overwrite_message, name, "Confirm Save Selection")) {
			return False;
		}
	} /* else file doesn't exist so no checks needed */
	success = store_file_contents(w, name, (data ? data : ""));
	return success;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * is_read_only: tests for read-only files.
 * If running as root, only files that are owned by root
 * and have the write permissions set are not read-only, and
 * opening a read-only file results in a warning dialogue.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
Boolean is_read_only(
	char *name,
	char **message,
	struct stat *status)
{
	if((uid_t) 0 != geteuid()) { /* I'm not root */
		*message = 0;
		return access(name, W_OK) != 0;
	} else { /* I am root; be more careful: */
		if(status->st_uid != (uid_t) 0) {
			*message = root_not_owner_message;
				/* file is not owned by root */
			return True;
		} else if ((status->st_mode & S_IWUSR) == 0) {
			*message = root_read_only_message;
				/* owner write access bit is not set */
			return True;
		} else {
			*message = 0;
			return False;
		}
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * old_file_checks: check for anomalous conditions with the
 * current file prior to saving or reopening it or opening a new one
 * **** **** **** **** **** **** **** **** **** **** **** **** */
Boolean old_file_checks(
		Widget	text,
		char	*oldname,
		char	*continue_message,
		char	*title)
{
	char *msg_text;
	switch(oldname != NULL ? check_file_status(oldname) : FS_OK) {
		case FS_CHANGED: msg_text = old_file_changed_message; break;
		case FS_DELETED: msg_text = old_file_deleted_message; break;
		case FS_CREATED: msg_text = old_file_created_message; break;
		case FS_OK: msg_text = NULL; break;
	}
	if(msg_text != NULL) {
		Boolean reply;
		char *msg = XtMalloc(strlen(msg_text) + strlen(oldname) +
				strlen(continue_message) + 2);
		sprintf(msg, msg_text, oldname);
		strcat(msg, "\n");
		strcat(msg, continue_message);
		reply = yes_no_dialog(text, msg, title);
		XtFree(msg);
		return reply;
	} else {
		return True;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * open_file: open a file and load it into a text widget given the
 * widget and the file name
 * Implements `open' in a file menu.
 * If name is NULL or an empty string it just empties out the
 * contents of the text window and returns False.
 * E.g., this is done when opening the file named on the
 * command line.
 * If the file is read-only, the read-only option must be set and
 * unless the command-line/resource file setting and the current setting
 * of the read-only option are on, we ask the user whether to do this.
 * The w argument is used as the parent for error messages dialogues
 * to get the stacking order right.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean open_file(
		Widget	text,
		Widget	w,
		char	*name,
		Boolean cmd_line,
 		OpenOutcome *outcome)
{
	wchar_t *buf;
	static struct stat status;
	struct stat new_status;
	Boolean binary, read_only;
	char *read_only_message;
	FileType file_type;
	if(!(name && *name)) { /* NULL or empty */
		XmTextSetString(text, "");
		if (outcome != (OpenOutcome *) NULL) {
			*outcome = EMPTY_FILE;
		}
		current_file_status = NULL; /*  not known */
		return True;
	}
	if((buf = get_file_contents(w, name, cmd_line,
			False, outcome, &new_status, &binary, &file_type))
				!= NULL) {
		read_only = is_read_only(name, &read_only_message, &new_status);
		if(read_only_message && !binary) {
			if(	(	orig_global_options.read_only
				&&	global_options.read_only)
			||	file_yes_no_dialog(w, read_only_message, name, NULL)) {
				set_read_only(True);
			} else {
				XtFree((char*)buf);
				return False;
			}
		} else if (binary) {
			if (file_yes_no_dialog(w,
					read_only_message ?
						read_only_binary_message
					:	writable_binary_message,
					name, NULL)) {
				set_read_only(True);
			} else {
				XtFree((char*)buf);
				return False;
			}
		} else {
			set_read_only(read_only || orig_global_options.read_only);
		}
		XmTextDisableRedisplay(text);
		XmTextSetStringWcs(text, buf);
		XtFree((char*)buf);
/*
 * The following shouldn't be necessary according to the documentation on XmTextSetString.
 * However Shift+Button1 selections don't work right without it.
 */
		XmTextSetInsertionPosition(text, 0);
		XmTextEnableRedisplay(text);
		status = new_status;
		current_file_status = &status;
		set_file_type(file_type);
		return True;
	} else {
		return False;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include_file: open a file and include it into a text widget given the
 * widget and the file name
 * Implements `include' in the file menu.
 * The w argument is used as the parent for error messages dialogues
 * to get the stacking order right.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean include_file(
		Widget	text,
		Widget	w,
		char	*name)
{
	wchar_t *buf;
	XmTextPosition pos;
	if((buf = get_file_contents(w, name, False, True,
			NULL, NULL, NULL, NULL)) != NULL) {
		XmTextDisableRedisplay(text);
		pos = XmTextGetInsertionPosition(text);
		XmTextClearSelection(text, CurrentTime);
		XmTextInsertWcs(text, pos, buf);
		XtFree((char*)buf);
		XmTextEnableRedisplay(text);
		return True;
	} else {
		return False;
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set_panic_save_name: some users have a habit of provoking panics;
 * e.g., by using flaky X servers that crash. As a kindness to these
 * souls, we set up the name of the panic save file to include the
 * basename of the file name (or as much of that as will fit).
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void set_panic_save_name(char	*name)
{
	char *prefix= "/tmp/xpp-panic-";
	const char *suffix = "-XXXXXX";
	int prelen = strlen(prefix);
	int spare = MAX_PANIC_SAVE_NAME - prelen - strlen(suffix) - 1;
	char *base, *p, *q;
	if(name) {
		for(base = name, p = name; *p; p += 1) {
			if(*p == '/') {
				base = p + 1;
			}
		}
	} else {
		base = "no-file-name";
	}
	strcpy(panic_save_name, prefix);
	for(	q = panic_save_name + prelen, p = base;
		*p && p - base < spare;
		p += 1, q += 1) {
		*q = *p;
	}
	strcpy(q, suffix);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * panic_save: attempt to save the contents of a text widget, e.g.,
 * in the event of an Xt error. Reports success or failure
 * on standard error. N.b., all variables are static in case
 * the problem is that we've run out of stack but there's just
 * enough left to call this function and save the file. More
 * importantly, the text is read out of the text widget with
 * XmTextGetSubstring which shouldn't need to call malloc.
 * To minimise the messing around, this ignores the file type
 * and just dumps the data (i.e., Unix file type).
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void panic_save(
		Widget	text)

{
	extern char *mktemp(char *);
	static wchar_t buf[BUFSIZ + 1];
	static char *name = panic_save_name + 5; /* skip "/tmp/" */
	static int fd;
	static FILE *fp;
	static Cardinal bytes_written, success, i;
	if(!*name) { /* set_panic_save_name has not been called */
		strcpy(panic_save_name, "/tmp/xpp.panic.XXXXXX");
	}
	/* In case we have been called before, restore name for mkstemp */
	strcpy(name + strlen(name) - 6, "XXXXXX");
	if((fd = mkstemp(name)) < 0 ) {
		name = panic_save_name;
		strcpy(name + strlen(name) - 6, "XXXXXX");
		if((fd = mkstemp(name)) < 0 ) {
			fprintf(stderr, "%s", panic_file_cant_be_opened);
			return;
		}
	}
	fp = (FILE*) fdopen(fd, "w"); /* some stdio.h implementations don't declare fdopen */
	if(current_file_status != NULL) {
		fchmod(fd, current_file_status->st_mode);
	}
	i = 0;
	while((success = XmTextGetSubstringWcs(text, i,
						BUFSIZ, BUFSIZ + 1, buf))
			== XmCOPY_SUCCEEDED
		&&
		(bytes_written = fwprintf(fp, L"%S", buf))
			== BUFSIZ) {
		i += BUFSIZ;
	}
	if(success == XmCOPY_TRUNCATED) {
		i = wcslen(buf);
		if( fwprintf(fp, L"%S", buf) == i) {
			fprintf(stderr, panic_file_written, name);
		} else {
			fprintf(stderr, panic_file_error, name);
		}
	} else {
		fprintf(stderr, panic_file_error, name);
	}
	fclose(fp);
}

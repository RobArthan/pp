
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: files.c,v 2.11 2002/12/04 14:16:56 rda Exp rda $
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

#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <limits.h>

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
	"An error has occurred while taking a backup. "
	"Do you want to overwrite the file \"%s\" without a backup?";

static char *cant_open_file_to_backup_message =
	"Cannot read the file \"%s\" to take a backup. "
	"Do you want to overwrite your file without a backup?";

static char *backup_file_same_as_file_message =
	"Cannot take a backup of the file. "
	"It is probably on an MS-DOS or similar file system that will "
	"not support a file named \"%s.xpp.backup\". "
	"Do you want to overwrite your file without a backup?";

static char *cant_open_backup_message =
	"Cannot open a backup file. "
	"Do you want the file \"%s\" to be overwritten anyway?";

static char *cant_stat_message =
	 "The file \"%s\" does not seem to exist";

static char *cant_stat_message2 =
	 "The file \"%s\" does not seem to exist: edit a new empty buffer or quit?";

static char *contains_nulls_message =
	" The file \"%s\" contains binary data and cannot be edited";

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
	 "The file \"%s\" exists. Do you want to overwrite it?";

static char *panic_file_cant_be_opened =
	"xpp: sorry! cannot open a file to save the editor text\n";

static char *panic_file_error =
	"xpp: saving editor text using file type Unix to file \"%s\": not all the text was saved\n";

static char *panic_file_written =
	"xpp: editor text saved using file type Unix to file \"%s\"\n";

static char *read_error_message =
	 "Error reading the file \"%s\"";

static char *open_read_only_message =
	 "The file \"%s\" is read-only. "
	 "Do you want to open it?";

static char *save_read_only_message =
	"The read-only option is turned on. "
	"Do you really want to turn this option off "
	"and save the file \"%s\"?";

static char *save_not_reg_message =
	 "The file \"%s\" is not an ordinary file";

static char *write_error_message =
	 "Error writing the file \"%s\"";

static char *file_changed_message =
	 "The file \"%s\" appears to have been modified since it was last "
	 "opened or saved. Do you want to overwrite it?";

static char *file_created_message =
	 "The file \"%s\" appears to have been created since this "
	 "xpp session was started. Do you want to overwrite it?";

static char *file_deleted_message =
	 "The file \"%s\" appears to have been deleted since it was last "
	 "opened or saved. Do you want to create it?";

static char *mixed_file_type_message =
	 "The file \"%s\"  contains a mixture of Unix, MS-DOS or Macintosh line terminators."
	"The file type will be set to Unix. You may use the Options Tool to change the file type.";


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Static data:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static struct stat *current_file_status = NULL;

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
	reply = yes_no_dialog(w, msg);
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
 * The third parameter, cmdLine, should be set true iff. this is the call
 * to open the file named on the command line (for which it is not
 * an error if the file does not exist).
 *
 * The fourth parameter, foAction, tells caller more about what happened (supply
 * NULL if not interested).
 *
 * The fifth parameter, stat_buf, is a buffer to contain the stat of the file
 * if it already existed (supply NULL if not interested).
 * If all is well the return value is a pointer to a buffer
 * containing the contents of the file as a null-terminated
 * character array.
 *
 * NULL is returned if anything goes wrong (and if NULL is
 * returned, the user will have been presented with an error
 * message dialogue).
 * The buffer should be XtFree'd when caller is done with it
 * (if it is not NULL).
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static char *get_file_contents(
	Widget		w,
	char		*name,
	Boolean	 	cmdLine,
	Boolean		including,
	FileOpenAction 	*foAction,
	struct stat 	*stat_buf)
{
	struct stat status;
	NAT siz;
	FILE *fp;
	char *buf, *p;
	int whatgot;
	enum {FT_ANY, FT_UNIX, FT_DOS_OR_MAC, FT_DOS,  FT_MAC,
		FT_MIXED,  FT_DOS_CR, FT_MIXED_CR} ft_state;
	FileType file_type;
	if(stat(name, &status) != 0) {
		if (cmdLine) {
			if (file_quit_new_dialog(w, cant_stat_message2, name)) {
				if (foAction != (FileOpenAction *) NULL) {
					*foAction = NewFile;
				}
			}
			else {
				if (foAction != (FileOpenAction *) NULL) {
					*foAction = QuitNow;
				}
			}
			return NULL;
		}
		else {
			file_error_dialog(w, cant_stat_message, name);
			return NULL;
		}
	};
	if(!S_ISREG(status.st_mode)) {
		file_error_dialog(w, load_not_reg_message, name);
		return NULL;
	};
	siz = status.st_size;
	if(!(buf = XtMalloc(siz + 1))) { /* note some space will be unused if its an MS-DOS file */
		file_error_dialog(w, no_space_message, name);
		return NULL;
	};
	if((fp = fopen(name, "r")) == NULL) {
		if (file_quit_new_dialog(w, cant_read_message, name)) {
			if (foAction != (FileOpenAction *) NULL) {
				*foAction = EmptyFile;
			}
		}
		else {
			if (foAction != (FileOpenAction *) NULL) {
				*foAction = QuitNow;
			}
		}
		XtFree(buf);
		return NULL;
	};
	p = buf;
	ft_state = FT_ANY;
	while( (whatgot = getc(fp)) != EOF ) {
		if(whatgot >= 0 && whatgot < ' '
		&& whatgot != '\t' && whatgot != '\n' && whatgot != '\r') {
			file_error_dialog(w, contains_nulls_message, name);
			XtFree(buf);
			return NULL;

		}
		switch(ft_state) {
			case FT_ANY:
				switch(whatgot) {
					case '\r':
						ft_state = FT_DOS_OR_MAC;
						break;
					case '\n':
						ft_state = FT_UNIX; /* No break! */
					default:
						*p++ = whatgot;
						break;
				}
				break;
			case FT_UNIX:
				switch(whatgot) {
					case '\r':
						ft_state = FT_MIXED;
						*p++ = '\n';
						break;
					default:
						*p++ = whatgot;
						break;
				}
				break;
			case FT_DOS_OR_MAC:
				switch(whatgot) {
					case '\r':
						ft_state = FT_MAC;
						*p++ = '\n';
						*p++ = '\n'; /* consecutive CRs in Mac file */
						break;
					case '\n':
						ft_state = FT_DOS; /* No break! */
					default:
						*p++ = whatgot;
						break;
				}
				break;
			case FT_DOS:
				switch(whatgot) {
					case '\r':
						ft_state = FT_DOS_CR;
						break;
					case '\n':
						ft_state = FT_MIXED; /* No break! */
					default:
						*p++ = whatgot;
						break;
				}
				break;
			case FT_MAC:
				switch(whatgot) {
					case '\r':
						*p++ = '\n';
						break;
					case '\n':
						ft_state = FT_MIXED; /* No break! */
					default:
						*p++ = whatgot;
						break;
				}
				break;
			case FT_MIXED:
				switch(whatgot) {
					case '\r':
						ft_state = FT_MIXED_CR;
						break;
					default:
						*p++ = whatgot;
						break;
				}
				break;
			case FT_DOS_CR:
				switch(whatgot) {
					case '\r':
						ft_state = FT_MIXED;
						*p++ = '\n'; /* consecutive CRs */
						*p++ = '\n';
						break;
					case '\n': /* CR/LF */
						ft_state = FT_DOS; /* No break! */
						*p++ = '\n';
						break;
					default:
						ft_state = FT_MIXED;
						*p++ = '\n';
						*p++ = whatgot;
						break;
				}
				break;
			case FT_MIXED_CR:
				ft_state = FT_MIXED;
				switch(whatgot) {
					case '\r':
						*p++ = '\n'; /* consecutive CRs */
						*p++ = '\n';
						break;
					case '\n': /* CR/LF */
						*p++ = '\n';
						break;
					default:
						*p++ = '\n';
						*p++ = whatgot;
						break;
				}
				break;
		}
	}
	if(ferror(fp)) {
		file_error_dialog(w, read_error_message, name);
		XtFree(buf);
		fclose(fp);
		return NULL;
	};
	switch(ft_state) {
		case FT_MIXED:
		case FT_MIXED_CR:
		case FT_DOS_CR:
			file_error_dialog(w, mixed_file_type_message, name);
			/* No break - recover by treating as UNIX */
		case FT_UNIX:
		case FT_ANY:
			file_type = UNIX;
			break;
		case FT_MAC:
		case FT_DOS_OR_MAC: /* one line Mac file */
			file_type = MACINTOSH;
			break;
		case FT_DOS:
			file_type = MSDOS;
			break;
	}
	set_file_type(file_type);
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
	NAT siz;
	FILE *fp, *backup_fp;
	const char *suffix = ".xpp.backup";

	*backup_name = NULL;
	if(stat(name, &status) == 0) { /* file exists */
		if((fp = fopen(name, "r")) == NULL) {
			return file_yes_no_dialog(w,
			                          cant_open_file_to_backup_message,
			                          name);
		};
	} else { /* else file doesn't exist so no backup needed */
		return True;
	};

	siz = strlen(name);
	if((*backup_name = XtMalloc(siz + strlen(suffix) + 1)) == NULL) {
		file_error_dialog(w, no_backup_name_space_message, name);
		return False;
	};
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
					backup_file_same_as_file_message, name);
		}
		fclose(backup_fp);
	}
	if((backup_fp = fopen(*backup_name, "w")) == NULL) {
		fclose(fp);
		XtFree(*backup_name);
		*backup_name = NULL;
		return file_yes_no_dialog(w,
				cant_open_backup_message, name);
	} else {
		char buf[BUFSIZ];
		size_t bytes_read;
		while(bytes_read = fread(buf, 1, BUFSIZ, fp)) {
			if(fwrite(buf, 1, bytes_read, backup_fp)
					!= bytes_read) {
				Boolean reply;
				reply = file_yes_no_dialog(w,
					cant_write_backup_message, name);
				fclose(backup_fp);
				fclose(fp);
				unlink(*backup_name);
				XtFree(*backup_name);
				*backup_name = NULL;
				return reply;
			}
		}
	};
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
		};
	}
	if((fp = fopen(name, "w")) == NULL) {
		file_error_dialog(w, cant_write_message, name);
		if(backup_name) {XtFree(backup_name);}
		return False;
	};
	switch(global_options.file_type) {
		case UNIX: eoln = "\n"; break;
		case MSDOS: eoln = "\r\n"; break;
		case MACINTOSH: eoln = "\r"; break;
	}
	p = buf;
	while(*p && !ferror(fp)) {
		if(*p == '\n') {
			fprintf(fp, eoln);
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
	};
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
 * save_file: store contents of a text widget into a named file
 * which will presumably already exist and may be overwritten
 * without confirmation.
 * Implements `save' as opposed to `save as' in a file menu
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean save_file(
	Widget	text,
	char	*name)
{
	char *buf;
	Boolean success;
	static struct stat status;
	struct stat new_status;
	if(global_options.read_only) {
		if(!file_yes_no_dialog(text,
					save_read_only_message,
					name)) {
			return False;
		}
		set_read_only(False);
	}
	if(current_file_status != NULL) {
		if(stat(name, &new_status) == 0) { /* file still exists */
			if(	new_status.st_mtime != current_file_status->st_mtime
			||	new_status.st_ctime != current_file_status->st_ctime
			||	new_status.st_size != current_file_status->st_size) {
				if(!file_yes_no_dialog(text,
							file_changed_message,
							name)) {
						return False;
				}
			}
		} else { /* it's presumably been deleted */
			if(!file_yes_no_dialog(text, file_deleted_message, name)) {
					return False;
			}
		}
	} else {
		if(stat(name, &new_status) == 0) { /* file now exists */
			if(!file_yes_no_dialog(text, file_created_message, name)) {
					return False;
			}
		}
	}
	buf = XmTextGetString(text);
	success = store_file_contents(text, name, buf);
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
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean save_file_as(
	Widget	text,
	char	*name)
{
	char *buf;
	Boolean success;
	static struct stat status;

	if(stat(name, &status) == 0) { /* file exists */
		if(!S_ISREG(status.st_mode)) {
			file_error_dialog(text, save_not_reg_message, name);
			return False;
		};
		if(!file_yes_no_dialog(text, overwrite_message, name)) {
			return False;
		}
	}; /* else file doesn't exist so no checks needed */
	buf = XmTextGetString(text);
	success = store_file_contents(text, name, buf);
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
		};
		if(!file_yes_no_dialog(w, overwrite_message, name)) {
			return False;
		}
	}; /* else file doesn't exist so no checks needed */
	success = store_file_contents(w, name, (data ? data : ""));
	return success;
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
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean open_file(
		Widget	text,
		char	*name,
        Boolean cmdLine,
        FileOpenAction *foAction)
{
	char *buf;
	static struct stat status;

	if(!(name && *name)) { /* NULL or empty */
		XmTextSetString(text, "");
		if (foAction != (FileOpenAction *) NULL) {
			*foAction = EmptyFile;
		}
		return False;
	}
	if((buf = get_file_contents(text, name, cmdLine, False, foAction, &status)) != NULL) {
		if(access(name, W_OK) != 0) { /* read-only (or worse?) */
			if(	(	orig_global_options.read_only
				&&	global_options.read_only)
			||	file_yes_no_dialog(text, open_read_only_message, name)) {
				set_read_only(True);
			} else {
				XtFree(buf);
				return False;
			}
		} else if (!orig_global_options.read_only) {
			set_read_only(False);
		} /* else leave the user's setting of the read-only option */
		XmTextDisableRedisplay(text);
		XmTextSetString(text, buf);
		XtFree(buf);
		XmTextEnableRedisplay(text);
		current_file_status = &status;
		return True;
	} else {
		return False;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include_file: open a file and include it into a text widget given the
 * widget and the file name 
 * Implements `include' in the file menu.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean include_file(
		Widget	text,
		char	*name)
{
	char *buf;
	XmTextPosition pos;
	if((buf = get_file_contents(text,
	                            name,
	                            False, True,
	                            (FileOpenAction *) NULL,
				    NULL)) != NULL) {
		XmTextDisableRedisplay(text);
		pos = XmTextGetInsertionPosition(text);
		XmTextClearSelection(text, CurrentTime);
		XmTextInsert(text, pos, buf);
		XtFree(buf);
		XmTextEnableRedisplay(text);
		return True;
	} else {
		return False;
	}
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
	static char buf[BUFSIZ+1];
	const char *nameXXX = "xpp.panic.XXXXXX";
	const char *tmp = "/tmp/";
	static char name[30];
	static int fd;
	static FILE *fp;
	static NAT bytes_written, success, i;
	strcpy(name, nameXXX);
	if((fd = mkstemp(name)) < 0 ) {
		strcpy(name, tmp);
		strcat(name, nameXXX);
		if((fd = mkstemp(name)) < 0 ) {
			fprintf(stderr, panic_file_cant_be_opened);
			return;
		}
	}
	fp = fdopen(fd, "w");
	i = 0;
	while((success = XmTextGetSubstring(text, i,
						BUFSIZ, BUFSIZ + 1, buf))
			== XmCOPY_SUCCEEDED
		&&
		(bytes_written = fwrite(buf, sizeof(char), BUFSIZ, fp))
			== BUFSIZ) {
		i += BUFSIZ;
	}
	if(success == XmCOPY_TRUNCATED) {
		i = strlen(buf);
		if( fwrite(buf, sizeof(char), i, fp) == i) {
			fprintf(stderr, panic_file_written, name);
		} else {
			fprintf(stderr, panic_file_error, name);
		}
	} else {
		fprintf(stderr, panic_file_error, name);
	}
	fclose(fp);
}

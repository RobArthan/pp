/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: mainw.c,v 2.79 2004/02/10 22:43:47 rda Exp rda $
 *
 * mainw.c -  main window operations for the X/Motif ProofPower
 * Interface
 *
 * mainw.c: this file is part of the PPTex system
 *
 * Copyright (c) 2002 Lemma 1 Ltd.
 * 
 * See the file LICENSE for your rights to use and change this file.
 *
 * Contact: Rob Arthan < rda@lemma-one.com >
 * 
 * This implements the script editor, in which typically the user is building
 * a command script for an interactive program such as ProofPower, and
 * the user interface for interacting with the interactive program.
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _mainw
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#include <stdio.h>
#include <string.h>

#include "xpp.h"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macro definitions:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * global, static and external data:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


static struct {
	Boolean	new;
	Boolean changed;
} file_info; /* read-only is in the global options */

/* Messages for various purposes */


static char *changed_message =
"The text has been modified.";

static char *want_to_continue =
"Do you want to continue?";

static char *confirm_save = "Confirm Save";

static char *confirm_save_as = "Confirm Save As";

static char *confirm_open = "Confirm Open";

static char *confirm_revert = "Confirm Revert";

static char *confirm_reopen = "Confirm Reopen";

static char *confirm_empty_file = "Confirm Empty File";

static char *confirm_quit = "Confirm Quit";

static char *confirm_kill = "Confirm Kill";

static char *confirm_restart = "Confirm Restart";

static char *running_quit_message =
"The application in the journal window is still running.";

static char *file_changed_quit_message =
"The file \"%s\" you are currently editing appears to have been modified since it was last opened or saved.";

static char *file_created_quit_message =
"The file \"%s\" appears to have been created since this xpp session was started.";

static char *file_deleted_quit_message =
"The file \"%s\" appears to have been deleted since it was last opened or saved.";

static char *want_to_quit =
"Do you really want to quit?";

static char *no_selection_message =
	 "No text selection is available.";

static char* kill_message =
"Do you really want to kill the application?";

static char* not_running_message =
"The application is not running";

static char* restart_message =
"The application is running. "
"Do you want to kill it and then restart it?";

static char *add_new_line_message = 
"The selection to be executed does not end in a new-line character."
"Do you want a new-line to be added to it?";

static char *no_file_name =
	/* This message just displayed instead of the file name */
"* NO FILE NAME *";

XtAppContext app; /* global because needed in msg.c */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Widget       Parent   Purpose
 * root         -           the top level of the hierarchy
 * frame        root        main window
 * mainpanes    frame       paned window for scriptpanes and journal window
 * scriptpanes	mainpanes   paned window for infobar and script
 * infobar      scriptpanes manager form for next four
 * infolabel    infobar     label indicating if file has been modified, etc.
 * linenumber	infobar     current line number indicator
 * logo         infobar     ProofPower logo
 * filename     infobar     rowcol for the next two:
 * filelabel    filename    label for name of file being edited
 * namestring   filename    displays name of file being edited
 * lnpopup	linenumber  popup menu to enable/disable line number indicator
 * script       scriptpanes the script being edited
 * journal      mainpanes   displays application output
 * menubar      frame       the menu bar at the top of the main window
 * filemenu     menubar     the file menu
 * toolsmenu    menubar     the tools menu
 * editmenu     menubar     the edit menu
 * popupeditmenu menubar    the popup edit menu
 * cmdmenu      menubar     the command menu
 * helpmenu     menubar     the help menu
 *
 * All widgets have the same name in the widget hierarchy
 * as their C name.
 * **** **** **** **** **** **** **** **** **** **** **** **** */


Widget root;	/* global because needed in xpp.c */
Widget  script,
	journal;	/* global because needed in pterm.c */

static Widget
	frame, infobar, filelabel, filename, infolabel, newfile,
	namestring, logo, linenumber, lnpopup,
	mainpanes, scriptpanes,
	menubar, filemenu, toolsmenu, popupeditmenu, editmenu, cmdmenu, helpmenu;

XtPointer undo_ptr;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Forward declarations of menu item callback and other routines.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void
	cmd_menu_cb(CALLBACK_ARGS),
	script_undo_cb(CALLBACK_ARGS),
	script_redo_cb(CALLBACK_ARGS),
	file_menu_cb(CALLBACK_ARGS),
	help_menu_cb(CALLBACK_ARGS),
	reopen_cb(CALLBACK_ARGS),
	ln_popup_cb(CALLBACK_ARGS),
	journal_modify_cb(CALLBACK_ARGS),
	popup_search_tool_cb(CALLBACK_ARGS),
	popup_line_no_tool_cb(CALLBACK_ARGS),
	popup_palette_cb(CALLBACK_ARGS),
	popup_templates_tool_cb(CALLBACK_ARGS),
	popup_command_line_tool_cb(CALLBACK_ARGS),
	popup_options_tool_cb(CALLBACK_ARGS),
	new_editor_session_cb(CALLBACK_ARGS),
	new_command_session_cb(CALLBACK_ARGS);

static void setup_reopen_menu(char *filename);
static void defer_resize (EVENT_HANDLER_ARGS);
static void journal_resize_handler (EVENT_HANDLER_ARGS);
static Bool execute_command(void);
static void execute_action(ACTION_PROC_ARGS);

static void line_number_cb(CALLBACK_ARGS);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Menu descriptions:
 * N.b. parts of what follow (e.g., those dealing with menu item
 * sensitivity) require each item macro to be the same as the
 * position of the item in the menu; if new items are added
 * in the middle of a menu, macros for later entries should
 * be incremented accordingly.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define FILE_MENU_SAVE            0
#define FILE_MENU_SAVE_AS         1
#define FILE_MENU_SAVE_SELECTION  2
/* Item 3 is a separator */
#define FILE_MENU_OPEN            4
#define FILE_MENU_INCLUDE         5
#define FILE_MENU_REVERT          6
#define FILE_MENU_EMPTY_FILE      7
#define FILE_MENU_REOPEN          8
/* Item 9 is  separator */
#define FILE_MENU_NEW_SESSION     10
/* Item 11 is a separator */
#define FILE_MENU_QUIT            12

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * The items for the pull-right menu attached to Reopen in the
 * file menu are set up dynamically;
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define MAX_REOPEN_MENU_ITEMS    16

static MenuItem reopen_menu_items[MAX_REOPEN_MENU_ITEMS+1] = {
	{NULL}
};

static MenuItem new_session_menu_items[MAX_REOPEN_MENU_ITEMS+1] = {
    { "Editor Session", &xmPushButtonGadgetClass, 'E', NULL, NULL,
        new_editor_session_cb, (XtPointer)0, (MenuItem *)NULL, False },
    { "Command Session", &xmPushButtonGadgetClass, 'C', NULL, NULL,
        new_command_session_cb, (XtPointer)0, (MenuItem *)NULL, False },
	{NULL}
};

static MenuItem file_menu_items[] = {
    { "Save", &xmPushButtonGadgetClass, 'S', "Ctrl<Key>s", "Ctrl-S",
        file_menu_cb, (XtPointer)FILE_MENU_SAVE, (MenuItem *)NULL, False },
    { "Save as ...",  &xmPushButtonGadgetClass, 'a', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_SAVE_AS, (MenuItem *)NULL, False },
    { "Save Selection as ...",  &xmPushButtonGadgetClass, 'l', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_SAVE_SELECTION, (MenuItem *)NULL, False },
    MENU_ITEM_SEPARATOR,
    { "Open ...",  &xmPushButtonGadgetClass, 'O', "Ctrl<Key>o", "Ctrl-O",
        file_menu_cb, (XtPointer)FILE_MENU_OPEN, (MenuItem *)NULL, False },
    { "Include ...",  &xmPushButtonGadgetClass, 'I', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_INCLUDE, (MenuItem *)NULL, False },
    { "Revert",  &xmPushButtonGadgetClass, 'R', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_REVERT, (MenuItem *)NULL, False },
     { "Empty File",  &xmPushButtonGadgetClass, 'E', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_EMPTY_FILE, (MenuItem *)NULL, False },
     { "Reopen",  &xmPushButtonGadgetClass, 'p', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_REOPEN, reopen_menu_items, False },
   MENU_ITEM_SEPARATOR,
     { "New Session",  &xmPushButtonGadgetClass, 'N', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_NEW_SESSION, new_session_menu_items, False },
   MENU_ITEM_SEPARATOR,
    { "Quit",  &xmPushButtonGadgetClass, 'Q', "Ctrl<Key>q", "Ctrl-Q",
        file_menu_cb, (XtPointer)FILE_MENU_QUIT, (MenuItem *)NULL, False },
    {NULL}
};

/*
 * The following two macro must be the offsets in the edit menu of the
 * undo and redo entries. (Used to set the sensitivity).
 */

#define EDIT_MENU_UNDO  5
#define EDIT_MENU_REDO  6

static MenuItem edit_menu_items[] = {
    { "Cut", &xmPushButtonGadgetClass, 'C', NULL, NULL,
        edit_cut_cb, (XtPointer)0, (MenuItem *)NULL, False },
    { "Copy", &xmPushButtonGadgetClass, 'o', NULL, NULL,
        edit_copy_cb, (XtPointer)0, (MenuItem *)NULL, False },
    { "Paste", &xmPushButtonGadgetClass, 'P', NULL, NULL,
        edit_paste_cb, (XtPointer)0, (MenuItem *)NULL, False },
    { "Clear", &xmPushButtonGadgetClass, 'l', NULL, NULL,
        edit_clear_cb, (XtPointer)0, (MenuItem *)NULL, False },
    MENU_ITEM_SEPARATOR,
    { "Undo", &xmPushButtonGadgetClass, 'U', NULL, NULL,
        script_undo_cb, (XtPointer)0, (MenuItem *)NULL, False },
    { "Redo", &xmPushButtonGadgetClass, 'R', NULL, NULL,
        script_redo_cb, (XtPointer)0, (MenuItem *)NULL, False },
    MENU_ITEM_SEPARATOR,
    { "Search and Replace ...", &xmPushButtonGadgetClass, 'S', NULL, NULL,
        popup_search_tool_cb, (XtPointer)0, (MenuItem *)NULL, False },
    { "Goto Line ...", &xmPushButtonGadgetClass, 'G', NULL, NULL,
        popup_line_no_tool_cb, (XtPointer)0, (MenuItem *)NULL, False },
    {NULL}
};
/*
 * In the following, the templates tool item is desensitized if the tool
 * initialisation fails.
 */
#define TOOLS_MENU_TEMPLATES 1
static MenuItem tools_menu_items[] = {
    { "Palette", &xmPushButtonGadgetClass, 'P', NULL, NULL,
        popup_palette_cb, (XtPointer)0, (MenuItem *)NULL, False },
    { "Templates", &xmPushButtonGadgetClass, 'T', NULL, NULL,
        popup_templates_tool_cb, (XtPointer)0, (MenuItem *)NULL, False },
    { "Options", &xmPushButtonGadgetClass, 'O', NULL, NULL,
        popup_options_tool_cb, (XtPointer)0, (MenuItem *)NULL, False },
    {NULL}
};

#define CMD_MENU_EXECUTE    0
#define CMD_MENU_RETURN     1
#define CMD_MENU_SEMICOLON  2
/* Item 3 is a separator */
#define CMD_MENU_ABANDON    4
#define CMD_MENU_INTERRUPT  5
/* Item 6 is a separator */
#define CMD_MENU_KILL       7
#define CMD_MENU_RESTART    8

static MenuItem cmd_menu_items[] = {
    { "Execute Selection", &xmPushButtonGadgetClass, 'x', "Ctrl<Key>x", "Ctrl-X",
        cmd_menu_cb, (XtPointer)CMD_MENU_EXECUTE, (MenuItem *)NULL, False },
    { "Return", &xmPushButtonGadgetClass, 'e', "Ctrl<Key>m", "Ctrl-M",
        cmd_menu_cb, (XtPointer)CMD_MENU_RETURN, (MenuItem *)NULL, False },
    { "Semicolon", &xmPushButtonGadgetClass, 'S', "Ctrl<Key>semicolon", "Ctrl-;",
        cmd_menu_cb, (XtPointer)CMD_MENU_SEMICOLON, (MenuItem *)NULL, False },
    MENU_ITEM_SEPARATOR,
    { "Abandon", &xmPushButtonGadgetClass, 'A', "Ctrl<Key>a", "Ctrl-A",
        cmd_menu_cb, (XtPointer)CMD_MENU_ABANDON, (MenuItem *)NULL, False },
    { "Interrupt", &xmPushButtonGadgetClass, 'I', "Ctrl<Key>i", "Ctrl-I", 
        cmd_menu_cb, (XtPointer)CMD_MENU_INTERRUPT, (MenuItem *)NULL, False },
    MENU_ITEM_SEPARATOR,
    { "Kill", &xmPushButtonGadgetClass, 'K', NULL, NULL,
        cmd_menu_cb, (XtPointer)CMD_MENU_KILL, (MenuItem *)NULL, False },
    { "Restart", &xmPushButtonGadgetClass, 'R', NULL, NULL,
        cmd_menu_cb, (XtPointer)CMD_MENU_RESTART, (MenuItem *)NULL, False },
    MENU_ITEM_SEPARATOR,
    { "Command Line ...", &xmPushButtonGadgetClass, 'C', NULL, NULL,
        popup_command_line_tool_cb, (XtPointer)0, (MenuItem *)NULL, False },
    {NULL}
};

#define	HELP_MENU_ABOUT_XPP     0
#define	HELP_MENU_USING_HELP    1
#define	HELP_MENU_TUTORIAL      2
#define	HELP_MENU_FILE_NAME_BAR 3
#define	HELP_MENU_FILE_MENU     4
#define	HELP_MENU_TOOLS_MENU    5
#define	HELP_MENU_EDIT_MENU     6
#define	HELP_MENU_COMMAND_MENU  7
static MenuItem help_menu_items[] = {
    { "About Xpp", &xmPushButtonGadgetClass, 'A', NULL, NULL,
        help_menu_cb, (XtPointer)HELP_MENU_ABOUT_XPP, (MenuItem *)NULL, False },
    { "Using Help", &xmPushButtonGadgetClass, 'H', NULL, NULL,
        help_menu_cb, (XtPointer)HELP_MENU_USING_HELP, (MenuItem *)NULL, False },
    { "Tutorial", &xmPushButtonGadgetClass, 'u', NULL, NULL,
        help_menu_cb, (XtPointer)HELP_MENU_TUTORIAL, (MenuItem *)NULL, False },
    { "File Menu", &xmPushButtonGadgetClass, 'F', NULL, NULL,
        help_menu_cb, (XtPointer)HELP_MENU_FILE_MENU, (MenuItem *)NULL, False },
    { "Edit Menu", &xmPushButtonGadgetClass, 'E', NULL, NULL,
        help_menu_cb, (XtPointer)HELP_MENU_EDIT_MENU, (MenuItem *)NULL, False },
    { "Tools Menu", &xmPushButtonGadgetClass, 'T', NULL, NULL,
        help_menu_cb, (XtPointer)HELP_MENU_TOOLS_MENU, (MenuItem *)NULL, False },
    { "Command Menu", &xmPushButtonGadgetClass, 'C', NULL, NULL,
        help_menu_cb, (XtPointer)HELP_MENU_COMMAND_MENU, (MenuItem *)NULL, False },
    { "File Name Bar", &xmPushButtonGadgetClass, 'N', NULL, NULL,
        help_menu_cb, (XtPointer)HELP_MENU_FILE_NAME_BAR, (MenuItem *)NULL, False },
    {NULL}
};

#define LN_POPUP_TOGGLE 0

static MenuItem ln_popup_menu_items[] = {
    { "Stop", &xmPushButtonGadgetClass, 'S', NULL, NULL,
        ln_popup_cb, (XtPointer)NULL, (MenuItem *)NULL, False },
    {NULL}
};

static XtActionsRec actions[] = {
	{ "execute", execute_action },
	{ "command-history-up", command_history_up },
	{ "command-history-down", command_history_down}
};

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * X MANAGEMENT OF THE MAIN WINDOW
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * scroll_out: given a text buffer, buf, containing ct characters
 * of interest, write them to the journal window, journal.
 * If the insertion position is visible, then the window is scrolled,
 * otherwise the new characters are written out of sight and
 * the journal window text is left where it is. It seems to be important
 * on some systems to check for visibility before inserting the new text.
 *
 * It greatly improves performance to do the scrolling as a background
 * task. (Historical note: earlier versions of this used a more
 * complicated method to do the scrolling - this was not the performance
 * problem, using XmTextShowPosition was just as bad. The reason for
 * the earlier complexity was that XmTextShowPosition didn't work
 * properly on some ancient implementations of Motif).
 *
 * Note that the first parameter of scroll_out is not a const char *.
 * and has to be big enough for scroll_out to temporarily null-terminate
 * the string. It restores the overwritten character when the text has been written
 * to the journal window. Moreover, it will overwrite the text itself if
 * it contains control characters or carriage returns - these overwrites are not
 * restored.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static Boolean scroll_pending = False;

static void scroll_out_timeout_proc (XtPointer unused1, XtIntervalId *unused2)
{
	XmTextShowPosition(journal, XmTextGetLastPosition(journal));
	scroll_pending = False;
}

void scroll_out(char *buf, NAT ct, Boolean ignored)
{

	XmTextPosition ins_pos, last_pos;
	Position dontcare;
	char overwritten;
	Boolean visible;
	int i, j;
	static Boolean scroll_scheduled = False;
	static Boolean last_was_cr = False;
	ins_pos = XmTextGetLastPosition(journal);
	visible = XmTextPosToXY(journal, (ins_pos ? ins_pos - 1 : 0),
			&dontcare, &dontcare);
/* scan the buffer for oddities and convert them to UNIX text: */
	for(i = 0, j = 0; j < ct; ++i, ++j) {
		if(buf[j] == '\r') {
			last_was_cr = True;
			buf[i] = '\n';
		} else  if(last_was_cr && buf[j] == '\n') {
			last_was_cr = False;
			j += 1;
			if(j < ct) {
				buf[i] = buf[j];
			} else {
				break;
			}
		} else if(control_chars[buf[j] & 0xff]) {
			last_was_cr = False;
			buf[i] = '?';
		} else {
			last_was_cr = False;
			buf[i] = buf[j];
		}	
	}
/* temporarily null-terminate: */
	overwritten = buf[i];
	buf[i] = '\0';
/* write it to the journal */
	journal_editable = True;
	XmTextInsert(journal, ins_pos, buf);
	journal_editable = False;
/* undo null-termination */
	buf[i] = overwritten;
/* see where we are: */
	last_pos = XmTextGetLastPosition(journal);
/* set up time-out to scroll if insertion position was visible and not already set-up */
	if(visible && !scroll_pending) {
		XtAppAddTimeOut(app, 20, scroll_out_timeout_proc, NULL);
		scroll_pending = True;
	}
/* make sure we're positioned right for the next insertion: */
	XmTextSetInsertionPosition(journal, last_pos);
/* check size of contents & done: */
	check_text_window_limit(journal,  global_options.journal_max);

}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * get_file_name: extract the file name from the file name text field.
 * Return null if no file name (following the convention that it is the
 * string given in no
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static char *get_file_name(void)
{
	char *fname;
	fname = XmTextFieldGetString(namestring);
	if(!fname || !*fname || !strcmp(fname, no_file_name)) {
		if(fname) {XtFree(fname);}
		fname = NULL;
	}
	return fname;
}
 

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * journal_resize_handler: work-around for Motif's treatment
 * of resizing the journal window using the sash. What we want to
 * do is keep the insertion position visible after the resize if
 * it was visible before.
 * The complexity arises because by the time the journal window receives its
 * StructureNotify event, the insertion position will have moved.
 * We therefore handle ButtonPress events on the sash as well as
 * StructureNotify events on the journals window and test for visibility i
 * on the ButtonPress events.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void journal_resize_handler(
	Widget		w,
	XtPointer	x,
	XEvent		*evp,
	Boolean		*continue_dispatch)
{
	XmTextPosition last_pos;
	static Boolean visible = True;
	Position dontcare;
	if(evp->type == ButtonPress) { /* user pressed the sash button */
		last_pos = XmTextGetLastPosition(journal);
		visible = XmTextPosToXY(journal, (last_pos ? last_pos - 1 : 0),
			&dontcare, &dontcare);
	} else if(visible) { /* StructureNotify in the journal window */
		XmTextShowPosition(journal, XmTextGetLastPosition(journal));
	}
}


/* temporarily null-terminate the buffer: */
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set_icon_name_and_title: get the file name out of the script editor's
 * namestring text field; strip away any directory names and use
 * the resulting file name as the icon name for the root window (for
 * mwm-style icon boxes) and (together with the xpp title and version
 * string) as the root window title (for the title bar under most
 * window managers).
 * Relies on the no_file_name string not containing any
 * `/' characters.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void set_icon_name_and_title(void)
{
	char *fname, *p;
	char *root_title;
	int root_title_len;
	fname = XmTextGetString(namestring);
	if(!fname || !*fname) {
/* no file name; shouldn't happen; do nothing */
	} else {
		p = fname + strlen(fname) - 1;
		while (*p && p > fname && *p != '/') {
			--p;
		}
		if(p > fname) {
			++p;
		}
		XtVaSetValues(root, XmNiconName, p, NULL);
		root_title_len = strlen(title) + strlen(p) + 3; /* ": " + '0' */
		if((root_title = XtMalloc(root_title_len)) != NULL) {
			strcpy(root_title, title);
			strcat(root_title, ": ");
			strcat(root_title, p);
			XtVaSetValues(root, XmNtitle, root_title, NULL);
			XtFree(root_title);
		} /* else malloc failed - don't bother */
		XtFree(fname);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * flash_file_name: update and blink the file name displayed in
 * the script editor's namestring text field.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void flash_file_name_timeout_proc(
		XtPointer	unused1,
		XtIntervalId	*unused2)
{
	XmTextFieldSetHighlight(namestring,
		0,
		XmTextFieldGetLastPosition(namestring),
		XmHIGHLIGHT_NORMAL);
}
static void flash_file_name(char *fname)
{
	XmTextFieldSetString(namestring, fname);
	XmTextFieldShowPosition(namestring, strlen(fname));
	XmTextFieldSetHighlight(namestring,
		0,
		XmTextFieldGetLastPosition(namestring),
		XmHIGHLIGHT_SELECTED);
	XtAppAddTimeOut(app,
		500,
		(XtTimerCallbackProc)flash_file_name_timeout_proc,
		NULL);
}


void show_file_info(void)
{
	char info[sizeof "{Macintosh, New, Modified, Read only}"];
	XmString s;
	Boolean started = False;
	strcpy(info, "");
	if(file_info.new
	|| file_info.changed
	|| global_options.read_only
	|| global_options.file_type != UNIX) {
		strcat(info, "{");
		if(file_info.new) {
			strcat(info, "New");
			started = True;
		}
		if(global_options.file_type != UNIX) {
			if(started) { /* they changed the file type before putting anything in the new file */
				strcat(info, ", ");
			}
			strcat(info, file_type_names[global_options.file_type]);
			started = True;
		}
		if(file_info.changed) {
			strcat(info, started ? ", m" : "M");
			strcat(info, "odified");
			started = True;
		}
		if(global_options.read_only) {
			strcat(info, started ? ", r" : "R");
			strcat(info, "ead only");
		}
		strcat(info, "}");
	}
	s = XmStringCreateSimple(info);
	XtVaSetValues(infolabel,
		XmNlabelString,	s,
		NULL);
	XmStringFree(s);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * reinit_changed: unset changed flag and clear the modified label;
 * Also either clear the undo buffer or notify the undo packaged
 * that the file has been saved.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void reinit_changed(Boolean saving)
{
	file_info.changed = False;
	if(saving) {
		file_info.new = False;
		notify_save(undo_ptr);
	} else {
		clear_undo(undo_ptr);
	}
	show_file_info();
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * X initialisation:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static Boolean setup_main_window(
	char	*file_name)
{
	Arg args[12];
	NAT i;
	XmString s1;
	Atom WM_DELETE_WINDOW;
	void check_quit_cb(CALLBACK_ARGS);
	Widget *wp;
	FileOpenAction foAction = NoAction;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Main window setup:  (root is created in main in xpp.c)
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtVaSetValues(root,
		XmNdeleteResponse,	XmDO_NOTHING,
		XmNiconPixmap,		get_pp_pixmap(),
		NULL);

	WM_DELETE_WINDOW = XmInternAtom(XtDisplay(root),
		"WM_DELETE_WINDOW",
		False);

	XmAddWMProtocolCallback(root,
		WM_DELETE_WINDOW,
		check_quit_cb,
		root);

#ifdef EDITRES
	add_edit_res_handler(root);
#endif

	XtInsertEventHandler(root,
		StructureNotifyMask,
		False,
		defer_resize,
		NULL,
		XtListHead);

	frame = XtVaCreateWidget("frame",
		xmMainWindowWidgetClass,
		root, NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Working area: a user resizable paned window for the script and journal windows
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	mainpanes = XtVaCreateWidget("mainpanes",
		xmPanedWindowWidgetClass,
		frame, NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Menu bar:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	menubar = XmVaCreateSimpleMenuBar(frame, "menubar", NULL);

/*
 * The menus are put on the menu bar after the script text widget has been created.
 */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Paned window for info bar and script window
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	scriptpanes = XtVaCreateWidget("scriptpanes",
		xmPanedWindowWidgetClass,
		mainpanes, NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Info Bar: File-name area and logo
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	infobar = XtVaCreateWidget("infobar",
		xmFormWidgetClass, scriptpanes,
		NULL);


	filename = XtVaCreateWidget("filename",
		xmRowColumnWidgetClass, infobar,
		XmNorientation,		XmHORIZONTAL,
		XmNpacking,		XmPACK_TIGHT,
		XmNleftAttachment,	XmATTACH_FORM,
		NULL);

	s1 = XmStringCreateSimple("File Name:");
	filelabel = XtVaCreateManagedWidget("filelabel",
		xmLabelWidgetClass,	filename,
		XmNlabelString,		s1,
		NULL);

	XmStringFree(s1);

	namestring = XtVaCreateManagedWidget("namestring",
		xmTextFieldWidgetClass,		filename,
		XmNeditable,			False,
		XmNcursorPositionVisible,	False,
		XmNtraversalOn,			False,
		NULL);

	attach_ro_edit_popup(namestring);
	register_selection_source(namestring);

	s1 = XmStringCreateSimple("");
	infolabel = XtVaCreateManagedWidget("infolabel",
		xmLabelWidgetClass,	infobar,
		XmNlabelString,		s1,
		XmNtopAttachment,	XmATTACH_FORM,
		XmNbottomAttachment,	XmATTACH_FORM,
		XmNleftAttachment,	XmATTACH_WIDGET,
		XmNleftWidget,		filename,
		NULL);
	XmStringFree(s1);

	logo = XtVaCreateManagedWidget("logo",
		xmLabelWidgetClass, infobar,
		XmNlabelType,		XmPIXMAP,
		XmNlabelPixmap,		get_pp_pixmap(),
		XmNtopAttachment,	XmATTACH_FORM,
		XmNbottomAttachment,	XmATTACH_FORM,
		XmNrightAttachment,	XmATTACH_FORM,
		NULL);

	linenumber = XtVaCreateManagedWidget("linenumber",
		xmLabelWidgetClass,	infobar,
		XmNtopAttachment,	XmATTACH_FORM,
		XmNbottomAttachment,	XmATTACH_FORM,
		XmNrightAttachment,	XmATTACH_WIDGET,
		XmNrightWidget,		logo,
		NULL);

	lnpopup = setup_menu(
		linenumber, XmMENU_POPUP, "line-number-menu", ' ', False, ln_popup_menu_items);

	attach_popup_menu(linenumber, lnpopup);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Script window:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	i = 0;
	XtSetArg(args[i], XmNeditable, 			True); ++i;
	XtSetArg(args[i], XmNeditMode, 			XmMULTI_LINE_EDIT); ++i;
	XtSetArg(args[i], XmNautoShowCursorPosition, 	True); ++i;
	XtSetArg(args[i], XmNcursorPositionVisible, 	True); ++i;
	XtSetArg(args[i], XmNselectionArrayCount, 		3); ++i;

	script = XmCreateScrolledText(scriptpanes, "script", args, i);

	XtOverrideTranslations(script, text_translations);

	line_number_cb(script, NULL, NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Journal window:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	if( !global_options.edit_only ) {
		Boolean editable;
		Widget *children;
		NAT num_children;

		i = 0;
		XtSetArg(args[i], XmNeditMode,	 		XmMULTI_LINE_EDIT); ++i;
		XtSetArg(args[i], XmNautoShowCursorPosition, 	False); ++i;
		XtSetArg(args[i], XmNcursorPositionVisible, 	True); ++i;

		journal = XmCreateScrolledText(mainpanes, "journal", args, i);
		attach_ro_edit_popup(journal);
		register_selection_source(journal);
		register_palette_client(journal);

		XtVaGetValues(journal, XmNeditable, &editable, NULL);
		XtVaSetValues(journal, XmNtraversalOn, editable, NULL);
		if(editable) {
			XtOverrideTranslations(script, text_translations);
		}
		XtVaGetValues(mainpanes, XmNchildren, &children,
			XmNnumChildren, &num_children, NULL);

		for(i = 0; i < num_children; ++i) {
			if(!strcmp(XtName(children[i]), "Sash")) {
				XtInsertEventHandler(children[i],
					ButtonPressMask,
					False,
					journal_resize_handler,
					NULL,
					XtListHead);
			}
		}

		XtInsertEventHandler(journal,
			StructureNotifyMask,
			False,
			journal_resize_handler,
			NULL,
			XtListHead);

		journal_editable = False;
		XtAddCallback(journal, XmNmodifyVerifyCallback, journal_modify_cb, 0);

	}

/*
 * Now we have the script text widget, we can put up the menus
 */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * File menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	filemenu = setup_menu(
		menubar, XmMENU_PULLDOWN, "File", 'F', False, file_menu_items);
	setup_reopen_menu(NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Edit menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/*
 * edit_menu_items gets changed here and later on so be careful if moving this
 * code
 */
	for(	i = 0;
		i < sizeof(edit_menu_items)/sizeof(edit_menu_items[0]); 
		i += 1 ) {
		edit_menu_items[i].callback_data = script;
	}

	editmenu = setup_menu(
		menubar, XmMENU_PULLDOWN, "Edit", 'E', False, edit_menu_items);
	set_menu_item_sensitivity(editmenu, EDIT_MENU_UNDO, False);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Tools menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	toolsmenu = setup_menu(
		menubar, XmMENU_PULLDOWN, "Tools", 'T', False, tools_menu_items);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Command menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	if( !global_options.edit_only ) {
		cmdmenu = setup_menu(
			menubar, XmMENU_PULLDOWN, "Command", 'C', False, cmd_menu_items);
		if(!global_options.interrupt_prompt ||
		   !*global_options.interrupt_prompt) {
			/* no interrupt prompt; disable abandon menu item */
			set_menu_item_sensitivity(cmdmenu, CMD_MENU_ABANDON, False);
		}
	}
/*
 * Users have complained that the "Execute Selection" item in the command menu
 * does not work when the caps lock modifier is present; however, Motif
 * pushbuttons don't support multiple accelerators and there is no
 * syntax to say we care about Ctrl but not Lock modifiers. We have therefore
 * provided an execute action function. With no parameters this is like
 * Execute Selection; with parameters, it executes the parameters.
 */
	XtAppAddActions(app, actions, XtNumber(actions));
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Help menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	if(global_options.edit_only) {
		help_menu_items[HELP_MENU_COMMAND_MENU].label = NULL;
	}
	helpmenu = setup_menu(
		menubar, XmMENU_PULLDOWN, "Help", 'H', False, help_menu_items);


	{
		Widget *btns;
		NAT num_btns;
		XtVaGetValues(menubar,
			XmNchildren, &btns,
			XmNnumChildren, &num_btns, NULL);
		XtVaSetValues(menubar,
			XmNmenuHelpWidget, btns[num_btns-1], NULL);
	}

/*
 * The pop-up edit menu looks a bit neater if we get rid of the accelerator
 * reminder in the pull-down one.
 */
	for(	i = 0;
		i < sizeof(edit_menu_items)/sizeof(edit_menu_items[0]); 
		i += 1 ) {
		edit_menu_items[i].accelerator = NULL;
	}

	popupeditmenu = setup_menu(
		script, XmMENU_POPUP, "popup-edit-menu", ' ', False, edit_menu_items);

	wp = (Widget*) XtMalloc(3*(sizeof(Widget)));

	wp[0] = editmenu;
	wp[1] = popupeditmenu;
	wp[2] = (Widget) NULL;

	undo_ptr = add_undo(script, wp, EDIT_MENU_UNDO, EDIT_MENU_REDO);

	XtAddCallback(script,
		XmNmodifyVerifyCallback, undo_modify_cb, undo_ptr);

	XtAddCallback(script,
		XmNmotionVerifyCallback, line_number_cb, NULL);

	attach_popup_menu(script, popupeditmenu);

	register_selection_source(script);
	register_palette_client(script);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Initialise options and templates packages
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	init_options(script);

	if(!init_templates_tool(script)) {
		set_menu_item_sensitivity(toolsmenu, TOOLS_MENU_TEMPLATES, False);
	}



/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Management and Realisation:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	XtManageChild(infobar);
	XtManageChild(filename);
	XtManageChild(infolabel);
	XtManageChild(linenumber);
	show_file_info();
	XtManageChild(menubar);
	XtManageChild(script);
	if( !global_options.edit_only ) {
		XtManageChild(journal);
	}
	XtManageChild(mainpanes);
	XtManageChild(scriptpanes);
	XtManageChild(frame);

	XtRealizeWidget(root);

	fix_pane_height(infobar, infobar);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Put up the start-up dialog, if necessary to get the command line and file name
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	startup_dialog(root, &global_options.command_line, &file_name);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Open file if file_name not NULL
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	pause_undo(undo_ptr);

	if(open_file(script, file_name, True, &foAction) && file_name != NULL) {
		XmTextFieldSetString(namestring, file_name);
		XmTextFieldShowPosition(namestring, strlen(file_name));
		set_menu_item_sensitivity(filemenu, FILE_MENU_SAVE, True);
	} else {
		switch(foAction) {
			case EmptyFile:
				XmTextFieldSetString(namestring, no_file_name);
				set_menu_item_sensitivity(filemenu, FILE_MENU_SAVE, False);
				break;
			case NewFile:
				XmTextFieldSetString(namestring, file_name);
				XmTextFieldShowPosition(namestring, strlen(file_name));
				set_menu_item_sensitivity(filemenu, FILE_MENU_SAVE, True);
				file_info.new = True;
				break;
			default:	/* QuitNow */
				return False;
				break;
		}
	}

	reinit_changed(False);
	set_icon_name_and_title();

	set_menu_item_sensitivity(filemenu,
		FILE_MENU_REVERT, !file_info.new);

	return True;

}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * MENU PROCESSING
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void file_menu_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	char *fname, *oldfname;
	char *buf;
	NAT i = (NAT) cbd;
	void check_quit_cb(CALLBACK_ARGS);

	switch(i) {
	case FILE_MENU_SAVE:
		fname = get_file_name();
		if(!fname) {
/* No file name: just do nothing */
		} else {
			if(save_file(script, fname)) {
				flash_file_name(fname);
				set_icon_name_and_title();
				reinit_changed(True);
				set_menu_item_sensitivity(filemenu,
					FILE_MENU_REVERT, True);
			}
		}
		if(fname != NULL) {XtFree(fname);};
		break;
	case FILE_MENU_SAVE_AS:
		oldfname = get_file_name();
		if(old_file_checks(
			script,
			oldfname,
			NULL,
			want_to_continue,
			confirm_save_as)) {
			fname = file_dialog(frame, "Save");
			if(!fname || !*fname || !strcmp(fname, no_file_name)) {
/* No file name: just do nothing */
			} else if(save_file_as(script, fname)) {
				if(oldfname != NULL) {
					setup_reopen_menu(oldfname);
				}
				flash_file_name(fname);
				set_icon_name_and_title();
				reinit_changed(True);
				set_menu_item_sensitivity(filemenu,
					FILE_MENU_SAVE, True);
				set_menu_item_sensitivity(filemenu,
					FILE_MENU_REVERT, True);
			}
			if(fname != NULL) {XtFree(fname);}
		}
		if(oldfname) {XtFree(oldfname);}
		break;
	case FILE_MENU_SAVE_SELECTION:
		if((buf = get_selection(script, no_selection_message))
			!= NULL) {
			fname = file_dialog(frame, "Save Selection");
			if(!fname || !*fname || !strcmp(fname, no_file_name)) {
/* No file name: just do nothing */
			} else {
				save_string_as(script, buf, fname);
			}
			XtFree(buf);
			if(fname != NULL) {XtFree(fname);};
		};
		break;
	case FILE_MENU_OPEN:
		oldfname = get_file_name();
		if(old_file_checks(
			script,
			oldfname,
			file_info.changed ? changed_message : NULL,
			want_to_continue,
			confirm_open)) {
			fname = file_dialog(frame, "Open");
			if(!fname || !*fname || !strcmp(fname, no_file_name)) {
/* No file name: just do nothing */
			} else {
				pause_undo(undo_ptr);
				if(open_file(script, fname, False, (FileOpenAction *) NULL)) {
					if(oldfname && strcmp(fname, oldfname)) {
						setup_reopen_menu(oldfname);
					}
					flash_file_name(fname);
					set_icon_name_and_title();
					reinit_changed(False);
					set_menu_item_sensitivity(filemenu, FILE_MENU_SAVE, True);
				} else {
					unpause_undo(undo_ptr);
				}
			}
			if(fname != NULL) {XtFree(fname);}
		}
		if(oldfname) {XtFree(oldfname);}
		break;
	case FILE_MENU_INCLUDE:
		fname = file_dialog(frame, "Include");
		if(!fname || !*fname || !strcmp(fname, no_file_name)) {
/* No file name: just do nothing */
			break;
		};
		include_file(script, fname);
		if(fname != NULL) {XtFree(fname);};
		break;
	case FILE_MENU_REVERT:
		fname = get_file_name();
		if(old_file_checks(
			script,
			fname,
			file_info.changed ? changed_message : NULL,
			want_to_continue,
			confirm_revert)) {
			pause_undo(undo_ptr);
			if(fname == NULL) {
/* No file name: get an empty file */
				XmTextSetString(script, "");
				flash_file_name(no_file_name);
			} else if(open_file(script, fname, False,(FileOpenAction *) NULL)){
				set_icon_name_and_title();
				flash_file_name(fname);
				reinit_changed(False);
			} else  {/* Can't open it; */
				unpause_undo(undo_ptr);
			}
		};
		if(fname) {XtFree(fname);}
		break;
	case FILE_MENU_EMPTY_FILE:
		oldfname = get_file_name();
		if(old_file_checks(
			script,
			oldfname,
			file_info.changed ? changed_message : NULL,
			want_to_continue,
			confirm_empty_file)) {
			pause_undo(undo_ptr);
			if(open_file(script, NULL, False, (FileOpenAction*)NULL)) {
				XmTextFieldSetString(namestring, no_file_name);
				if(oldfname != NULL) {
					setup_reopen_menu(oldfname);
				}
				flash_file_name(no_file_name);
				set_icon_name_and_title();
				reinit_changed(False);
				set_menu_item_sensitivity(filemenu,
					FILE_MENU_SAVE, False);
			} else { /* Can't do it (very odd!) */
				unpause_undo(undo_ptr);
			}
		}
		if(oldfname) {XtFree(oldfname);}
		break;
	case FILE_MENU_QUIT:
		check_quit_cb(root, NULL, NULL);
		break;
	default:
		break;
	};
}

/*
 * setup_reopen_menu is used to set up the pull-right menu
 * attached to the Reopen item in the file menu.
 * At start-up it is called with name == NULL to disable the
 * Reopen item. When the user opens a new file it is called
 * with name == old file name (if there was an old file name);
 * it then rebuilds the pull-right menu. Note that the file
 * names are held as the labels in the array reopen_menu_items.
 * This array is managed as a "lifo-set", i.e., there are no
 * duplicates in the array, and when an entry is inserted it
 * is always at the top. The initial call with name == NULL
 * initialises this array so that only the labels need changing
 * later. Subsequent calls should supply a file name string which
 * can be feed on return from this function. Entries in the array
 * are moved down to make room for the new one at the top. If the
 * new entry is already there, we re-use it rather than freeing
 * it and allocating new space. If the new entry is not already there
 * we have to allocate space for a copy of the string, and if the
 * set was full, the last entry in the old set must be freed.
 */
static void setup_reopen_menu(char *filename)
{
	Widget pull_right_menu, *btns;
	static MenuItem item_template =
		{ NULL, &xmPushButtonGadgetClass, '\0', NULL, NULL,
        	  reopen_cb, (XtPointer)0, (MenuItem *)NULL, False };
	int i;
	char *t, *p;
	if(filename == NULL) {
		set_menu_item_sensitivity(filemenu, FILE_MENU_REOPEN, False);
		for(i = 0; i < MAX_REOPEN_MENU_ITEMS; i += 1) {
			reopen_menu_items[i] = item_template;
			reopen_menu_items[i].callback_data = (XtPointer) i;
		}
		return;
	} /* else ... */
	XtVaGetValues(filemenu, XmNchildren, &btns, NULL);
	XtVaGetValues(btns[FILE_MENU_REOPEN],
		XmNsubMenuId, &pull_right_menu, NULL);
	for(	p = NULL, i = 0, t = NULL;
		i < MAX_REOPEN_MENU_ITEMS;
		i += 1 ) {
		t = reopen_menu_items[i].label;
		reopen_menu_items[i].label = p;
		p = t;
		if(p == NULL) {
			break;
		} else if (!strcmp(p, filename)) {
			reopen_menu_items[0].label = p;
			t = NULL;
			break;
		}
	}
	if(t != NULL) {
		XtFree(t);
	}
	if(reopen_menu_items[0].label == NULL) {
		reopen_menu_items[0].label = XtMalloc(strlen(filename) + 1);
		strcpy(reopen_menu_items[0].label, filename);
	}
	resetup_menu(pull_right_menu, XmMENU_PULLDOWN, reopen_menu_items);
	set_menu_item_sensitivity(filemenu, FILE_MENU_REOPEN, True);
}

static void reopen_cb(
		Widget		w,
		XtPointer 	cbd,
		XtPointer	cbs)
{
	char *oldfname, *fname;
	NAT i = (NAT) cbd;
	oldfname = get_file_name();
	fname = reopen_menu_items[i].label;
	strcpy(fname,reopen_menu_items[i].label);
	if(old_file_checks(
		script,
		oldfname,
		file_info.changed ? changed_message : NULL,
		want_to_continue,
		confirm_reopen)) {
		pause_undo(undo_ptr);
		if(open_file(script, fname, False, (FileOpenAction *) NULL)) {
			flash_file_name(fname);
			if(oldfname && *oldfname && strcmp(oldfname, no_file_name)) {
				setup_reopen_menu(oldfname);
			}
			set_icon_name_and_title();
			reinit_changed(False);
			set_menu_item_sensitivity(filemenu,
				FILE_MENU_SAVE, True);
		} else {
			unpause_undo(undo_ptr);
		}
	}
	if(oldfname) {XtFree(oldfname);}
}

static void popup_search_tool_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
		add_search_tool(script);
}

static void popup_line_no_tool_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
		add_line_no_tool(script);
}

static void popup_palette_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	popup_palette(script);
}
static void popup_templates_tool_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	add_templates_tool(script);
}
static void popup_command_line_tool_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
		add_command_line_tool(script);
}
static void popup_options_tool_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	add_options_tool();
}
static void new_editor_session_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	new_editor_session();
}
static void new_command_session_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	new_command_session();
}

static void script_undo_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	undo_cb(script, undo_ptr, cbs);
}

static void script_redo_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	redo_cb(script, undo_ptr, cbs);
}

static void cmd_menu_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	NAT i = (NAT) cbd;
	Boolean application_alive(void);
	
	if(!application_alive() && i != CMD_MENU_RESTART) {
		ok_dialog(root, not_running_message);
		return;
	};

	switch(i) {
	case CMD_MENU_EXECUTE:
		execute_command();
		break;
	case CMD_MENU_RETURN:
		send_nl();
		break;
	case CMD_MENU_SEMICOLON:
		send_to_application(";\n", 2);
		break;
	case CMD_MENU_ABANDON:
		interrupt_and_abandon();
		break;
	case CMD_MENU_INTERRUPT:
		interrupt_application();
		break;
	case CMD_MENU_KILL:
		if(yes_no_dialog(root, kill_message, confirm_kill)) {
			kill_application();
		};
		break;
	case CMD_MENU_RESTART:
		if(!application_alive()
			|| yes_no_dialog(root, restart_message, confirm_restart)) {
			restart_application();
		};
		break;
	default:
		break;
	}
}

static void help_menu_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	NAT i = (NAT)cbd;
	switch(i) {
	case HELP_MENU_ABOUT_XPP:
		help_dialog(root, Help_About_Xpp);
		break;
	case HELP_MENU_USING_HELP:
		help_dialog(root, Help_Using_Help);
		break;
	case HELP_MENU_TUTORIAL:
		help_dialog(root, Help_Tutorial);
		break;
	case HELP_MENU_FILE_NAME_BAR:
		help_dialog(root, Help_File_Name_Bar);
		break;
	case HELP_MENU_FILE_MENU:
		help_dialog(root, Help_File_Menu);
		break;
	case HELP_MENU_TOOLS_MENU:
		help_dialog(root, Help_Tools_Menu);
		break;
	case HELP_MENU_EDIT_MENU:
		help_dialog(root, Help_Edit_Menu);
		break;
	case HELP_MENU_COMMAND_MENU:
		help_dialog(root, Help_Command_Menu);
		break;
	default:
		break;
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Tell user the file has been modified
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void show_modified(Boolean force)
{
	if(force || !file_info.changed) {
		file_info.changed = True;
		show_file_info();
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Monitor line number
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean line_number_req_pending = False;
static Boolean line_number_stopped = False;
static void line_number_timeout_proc(
		XtPointer	cbd,
		XtIntervalId	*unused)
{
	long int line_num;
	static long int last_line_num = -1;
	char buf[20];
	XmString s;

	line_number_req_pending = False;

	if(line_number_stopped) {
		return;
	}

	line_num = get_line_no((Widget) cbd);

	if(line_num != last_line_num) {
		sprintf(buf, "Line: %ld", line_num);
		s = XmStringCreateSimple(buf);
		XtVaSetValues(linenumber, XmNlabelString, s, NULL);
		XmStringFree(s);
		last_line_num = line_num;
	}
}

static void line_number_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	if(!line_number_req_pending) {
		XtAppAddTimeOut(app, 40,
			line_number_timeout_proc, w);
		line_number_req_pending = True;
	}
}

static void ln_popup_cb (
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	line_number_stopped = !line_number_stopped;
	set_menu_item_label(lnpopup, 0,
		line_number_stopped ? "Start" : "Stop");
	if(!line_number_stopped) {
		line_number_cb(script, NULL, NULL);
	}
}

static void journal_modify_cb (
		Widget		w,
		XtPointer	cbd,
		XtPointer	xtp)
{
	XmTextVerifyCallbackStruct *cbs = xtp;
	if(journal_editable) {
		return;
	} /* else */
	take_command_input(script, cbs);
	cbs->doit = False;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * HANDLING RESIZES
 *
 * The Motif text widget is rather slow at resizing when it contains
 * a lot of text. To speed things up, when the root widget receives
 * a ConfigureNotify event, we stop it being dispatched immediately
 * to the Motif handlers. If a sequence of ConfigureNotify events arrive
 * in quick succession we try only to let Motif see the last of the sequence.
 *
 * Even on quite small files, this reduces the amount of flicker if the
 * user is changing the window size continuously and rapidly. For large
 * files it greatly reduces the time taken to resize the window.
 *
 * We implement this by looking ahead in the X event queue for
 * more events of the same type and dispatching the last one found
 * (or the one passed as a parameter, if no more in the queue).
 * The variable deferring is set to make the recursive call
 * that happens indirectly as a result of XtDispatchEvent take
 * the right action (namely, just to do nothing and let Motif
 * get at the event). The outer (non-recursive) call can
 * then just suppress further processing of this event, because
 * all that needs to be done has been done already inside
 * the call of XtDispatchEvent.
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void defer_resize(
	Widget		w,
	XtPointer	x,
	XEvent		*evp,
	Boolean		*continue_dispatch)
{
	static Boolean deferring = True;
	XEvent event;
	if(evp->type == ConfigureNotify && deferring) {
		Display *d = XtDisplay(root);
		Window w = XtWindow(root);
		event = *evp;
		while(XCheckTypedWindowEvent(d, w, ConfigureNotify, &event)) {
			; /* got one, go round for another */
		}
		deferring = False;
		XtDispatchEvent(&event);
		deferring = True;
		*continue_dispatch = False; /* keep Motif out */
	} /* else, let Motif in */
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * See if the user really wants to quit, and if so do so:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void check_quit_cb (
		Widget		w,
		XtPointer	unused_cbd,
		XtPointer	unused_cbs)
{
	Boolean changed = file_info.changed;
	Boolean app_alive = application_alive();
	char *fname = get_file_name();
 	char *msg;
	if(changed || app_alive) {
		msg = XtMalloc(200);
		*msg = '\0';
		if(changed) {
			msg = XtRealloc(msg, strlen(changed_message) + 1);
			strcpy(msg, changed_message);
		}
		if(app_alive) {
			msg = XtRealloc(msg, strlen(msg) + strlen(running_quit_message) + 2);
			if(*msg) {strcat(msg, "\n");}
			strcat(msg, running_quit_message);
		}	
	} else {
		msg = NULL;
	}
	if(old_file_checks(
			script,
			fname,
			msg,
			want_to_quit,
			confirm_quit)) {
		kill_application();
#ifdef LISTWIDGETS
		list_widget_hierarchy();
#endif
		exit(0);
	};
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Executing text from the selection in a text window.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static Bool execute_command(void)
{
	char *cmd;
	NAT len;
	XmTextPosition dontcare;

	if(global_options.edit_only) {
		return False;
	}
	cmd = get_selection(script, no_selection_message);
	if(cmd != NULL) {
		len = strlen(cmd);
		if(len == 0) {
			return False;
		} else if (cmd[len-1] == '\n') {
			send_to_application(cmd, len);
		} else if (global_options.add_new_line_mode
				== EXECUTE_ADD_NEW_LINES) {
			send_to_application(cmd, len);
			send_to_application("\n", 1);
		} else if (global_options.add_new_line_mode
				== EXECUTE_IGNORE_NEW_LINES) {
			send_to_application(cmd, len);
		} else if (global_options.add_new_line_mode
					== EXECUTE_PROMPT_NEW_LINES) {
			switch(yes_no_cancel_dialog(root,
					add_new_line_message)) {
				case 1: /* yes */
					send_to_application(cmd, len);
					send_to_application("\n", 1);
					break;
				case 0: /* no */
					send_to_application(cmd, len);
					break;
				case -1: /* cancel */
					break;
			}
		}
		XtFree(cmd);
		return True;
	} else {
		return False;
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * execute action function; if no params does execute_command
 * to execute selection; else params give strings to execute;
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void execute_action(
    Widget 		widget,
    XEvent*		unused_event,
    String*		params,
    Cardinal*		num_params)
{
	if(*num_params == 0) {
		(void) execute_command();
	} else {
		int i;
		for(i = 0; i < *num_params; i += 1) {
			send_to_application(params[i], strlen(params[i]));
		}
	}
}
			
		
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * main entry point:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void main_window_go(char *file_name)
{
	if (setup_main_window(file_name)) {
		if( !global_options.edit_only ) {
			get_pty();
		}
		handle_sigs();
		XtRealizeWidget(root);
		XtAppMainLoop(app);
	}
}

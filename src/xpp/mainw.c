

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$
 *
 * mainw.c -  main window operations for the X/Motif ProofPower
 * Interface
 *
 * (c) ICL 1993, 1994
 * 
 * This implements two main functions:
 *
 *	1) A text editor (in which typically the user is building
 *	a command script for an interactive program such as ProofPower.
 *	2) A pseudo-teletype in which the interactive program can
 *	be run.
 *
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _mainw
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#include <string.h>
#include <sys/types.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/termio.h>
#include <sys/termios.h>
#include <sys/wait.h>
#include <stropts.h>

#include <signal.h>
#include <errno.h>

#include <stdio.h>
#include <X11/Xatom.h>
#include <X11/Intrinsic.h>
#include <X11/Shell.h>

#include "xpp.h"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macro definitions:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#define STDIN 0
#define STDOUT 1
#define STDERR 2

/* For the following see "Data transfer to application" below */
#define MAX_Q_LEN 40000		/* see "Data transfer to application" below */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * global, static and external data:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

extern int errno;

extern char *environ[];

/* For the following three see "Data transfer to application" below */
static char queue[MAX_Q_LEN];
static NAT q_length = 0;
static NAT q_head = 0;

/* The following is used to implement undo in the edit menu */

struct undo_details {
	Boolean can_undo;	/* true iff. can do an undo */
	Boolean moved_away;	/* true if the change is complete */
	NAT first, last;
	char *oldtext;
} undo_buffer = {False, True, 0, 0, NULL};

static Boolean undoing;

static NAT undo_redo_index;

static Boolean changed = False;

/* The following is used to circumvent the fact that cut/paste *
/* messes up non-ascii characters at the moment. */
/* if this bug is permanent, a more sophisticated */
/* scheme should be investigated, perhaps. */

static char *cut_paste_buf = NULL;

/* Messages for various purposes */

static char *undo_redo[2] = {"Undo", "Redo"};

static char* changed_message =
"The text has been edited. Do you want to throw away the changes?";

static char* changed_quit_message =
"The text has been edited. "
"Do you really want to quit?";

static char* changed_running_quit_message =
"The text has been edited and the application in the journal "
"window is still running. Do you really want to quit?";

static char *cmd_too_long_message = 
"The command is too long (%d bytes supplied; max. %d bytes).";

static char* help_message =
"The help system is not yet implemented. Sorry!";

static char *no_selection_message =
	 "No text has been selected";

static char* running_quit_message =
"The application in the journal window is still running. "
"Do you really want to quit?";

static char* signal_handled_message1 =
"system error reported";

static char* signal_handled_message2 =
"attempting to save the editor text";

static char* signal_handled_message3 =
"apparently during X initialisation";

static char* kill_message =
"Do you really want to kill the application?";

static char* not_running_message =
"The application is not running";

static char* restart_message =
"The application is running. "
"Do you want to kill it and then restart it?";

static char* revert_message =
"The text has been edited. Do you want to throw away the changes?";


static char *send_error_message = 
"A system error occurred writing to the application.";

static char *no_file_message =
	/* This message just displayed instead of the file name */
"* NO FILE NAME *";

XtAppContext app; /* global because needed in msg.c */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Widget	Parent	 Purpose
 * root		-	 the top level of the hierarchy
 * frame	root	 main window
 * work		frame	 work area
 * journal	work	 displays application output
 * filename     work     rowcol for the next two:
 * filelabel    filename label for name of file being edited
 * modified	filename	label indicating that the file has changed
 * namestring   filename displays name of file being edited
 * script	work	 the script being edited
 * menubar	frame	 the menu bar at the top of the main window
 * filemenu	menubar	 the file menu
 * toolsmenu	menubar	 the tools menu
 * editmenu	menubar	 the edit menu
 * cmdmenu	menubar	 the command menu
 * helpmenu	menubar	 the help menu
 *
 * All widgets have the same name in the widget hierarchy
 * as their C name.
 * **** **** **** **** **** **** **** **** **** **** **** **** */


Widget root;	/* global because needed in xpp.c */

static Widget
	frame, work, journal, filename, filelabel, modified, namestring, script,
	menubar, filemenu, toolsmenu, editmenu, cmdmenu, helpmenu;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * limits on text window sizes in the main window:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static int control_fd;

static pid_t child_pid;

static pid_t child_pgrp;

static XtInputId app_ip_req;

static Boolean listening;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Forward declarations of menu item and other callback routines.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void
	file_menu_cb(),
	tools_menu_cb(),
	edit_menu_cb(),
	cmd_menu_cb(),
	help_menu_cb(),
	close_down_cb(),
	script_modify_cb(),
	script_motion_cb();

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Menu descriptions:
 * N.b. parts of what follow (e.g., those dealing with menu item
 * sensitivity) require each item macro to be the same as the
 * position of the item in the menu; if new items are added
 * in the middle of a menu, macros for later entries should
 * be incremented accordingly.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define FILE_MENU_SAVE			0
#define FILE_MENU_SAVE_AS		1
#define FILE_MENU_SAVE_SELECTION	2
/* Item 3 is a separator */
#define FILE_MENU_OPEN			4
#define FILE_MENU_INCLUDE		5
#define FILE_MENU_REVERT		6
#define FILE_MENU_EMPTY_FILE		7
/* Item 8 is a separator */
#define FILE_MENU_QUIT			9

static MenuItem file_menu_items[] = {
    { "Save", &xmPushButtonGadgetClass, 'S', "Ctrl<Key>s", "Ctrl-S",
        file_menu_cb, (XtPointer)FILE_MENU_SAVE, (MenuItem *)NULL, False },
    { "Save as ...",  &xmPushButtonGadgetClass, 'a', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_SAVE_AS, (MenuItem *)NULL, False },
    { "Save Selection as ...",  &xmPushButtonGadgetClass, 'l', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_SAVE_SELECTION, (MenuItem *)NULL, False },
    MENU_ITEM_SEPARATOR,
    { "Open ...",  &xmPushButtonGadgetClass, 'O', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_OPEN, (MenuItem *)NULL, False },
    { "Include ...",  &xmPushButtonGadgetClass, 'I', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_INCLUDE, (MenuItem *)NULL, False },
    { "Revert",  &xmPushButtonGadgetClass, 'N', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_REVERT, (MenuItem *)NULL, False },
     { "Empty File",  &xmPushButtonGadgetClass, 'N', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_EMPTY_FILE, (MenuItem *)NULL, False },
   MENU_ITEM_SEPARATOR,
    { "Quit",  &xmPushButtonGadgetClass, 'Q', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_QUIT, (MenuItem *)NULL, False },
    NULL,
};
/*
 * In the following, entries after and including
 * TOOLS_MENU_JOURNAL_VIEWER are zero-ed out in an edit-only session.
 */
#define TOOLS_MENU_SEARCH_REPLACE		0
#define TOOLS_MENU_PALETTE			1
#define TOOLS_MENU_CONTROLS			2
#define TOOLS_MENU_SCRIPT_VIEWER		3
#define TOOLS_MENU_JOURNAL_VIEWER		4
#define TOOLS_MENU_CMD_LINE			5

static MenuItem tools_menu_items[] = {
    { "Search and Replace", &xmPushButtonGadgetClass, 'S', NULL, NULL,
        tools_menu_cb, (XtPointer)TOOLS_MENU_SEARCH_REPLACE, (MenuItem *)NULL, False },
    { "Palette", &xmPushButtonGadgetClass, 'P', NULL, NULL,
        tools_menu_cb, (XtPointer)TOOLS_MENU_PALETTE, (MenuItem *)NULL, False },
    { "Options", &xmPushButtonGadgetClass, 'O', NULL, NULL,
        tools_menu_cb, (XtPointer)TOOLS_MENU_CONTROLS, (MenuItem *)NULL, False },
    { "Viewer", &xmPushButtonGadgetClass, 'V', NULL, NULL,
        tools_menu_cb, (XtPointer)TOOLS_MENU_SCRIPT_VIEWER, (MenuItem *)NULL, False },
    { "Viewer (Journal)", &xmPushButtonGadgetClass, 'J', NULL, NULL,
        tools_menu_cb, (XtPointer)TOOLS_MENU_JOURNAL_VIEWER, (MenuItem *)NULL, False },
    { "Command Line", &xmPushButtonGadgetClass, 'C', NULL, NULL,
        tools_menu_cb, (XtPointer)TOOLS_MENU_CMD_LINE, (MenuItem *)NULL, False },
    NULL,
};

#define EDIT_MENU_CUT			0
#define EDIT_MENU_COPY		1
#define EDIT_MENU_PASTE		2
#define EDIT_MENU_CLEAR		3
#define EDIT_MENU_UNDO		4

static MenuItem edit_menu_items[] = {
    { "Cut", &xmPushButtonGadgetClass, 'C', NULL, NULL,
        edit_menu_cb, (XtPointer)EDIT_MENU_CUT, (MenuItem *)NULL, False },
    { "Copy", &xmPushButtonGadgetClass, 'o', NULL, NULL,
        edit_menu_cb, (XtPointer)EDIT_MENU_COPY, (MenuItem *)NULL, False },
    { "Paste", &xmPushButtonGadgetClass, 'P', NULL, NULL,
        edit_menu_cb, (XtPointer)EDIT_MENU_PASTE, (MenuItem *)NULL, False },
    { "Clear", &xmPushButtonGadgetClass, 'l', NULL, NULL,
        edit_menu_cb, (XtPointer)EDIT_MENU_CLEAR, (MenuItem *)NULL, False },
    { "Undo", &xmPushButtonGadgetClass, 'l', "<Key>Undo", NULL,
        edit_menu_cb, (XtPointer)EDIT_MENU_UNDO, (MenuItem *)NULL, False },
    NULL,
};

#define CMD_MENU_EXECUTE	0
#define CMD_MENU_RETURN	1
#define CMD_MENU_INTERRUPT	2
#define CMD_MENU_KILL		3
#define CMD_MENU_RESTART	4

static MenuItem cmd_menu_items[] = {
    { "Execute", &xmPushButtonGadgetClass, 'x', "Ctrl<Key>x", "Ctrl-X",
        cmd_menu_cb, (XtPointer)CMD_MENU_EXECUTE, (MenuItem *)NULL, False },
    { "Return", &xmPushButtonGadgetClass, 'e', "Ctrl<Key>m", "Ctrl-M",
        cmd_menu_cb, (XtPointer)CMD_MENU_RETURN, (MenuItem *)NULL, False },
    { "Interrupt", &xmPushButtonGadgetClass, 'I', "Ctrl<Key>c", "Ctrl-C",
        cmd_menu_cb, (XtPointer)CMD_MENU_INTERRUPT, (MenuItem *)NULL, False },
    { "Kill", &xmPushButtonGadgetClass, 'K', NULL, NULL,
        cmd_menu_cb, (XtPointer)CMD_MENU_KILL, (MenuItem *)NULL, False },
    { "Restart", &xmPushButtonGadgetClass, 'R', NULL, NULL,
        cmd_menu_cb, (XtPointer)CMD_MENU_RESTART, (MenuItem *)NULL, False },
    NULL,
};

#define	HELP_MENU_GENERAL	0
static MenuItem help_menu_items[] = {
    { "General", &xmPushButtonGadgetClass, 'G', "Help", "Help",
        help_menu_cb, (XtPointer)HELP_MENU_GENERAL, (MenuItem *)NULL, False },
    NULL,
};

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * X MANAGEMENT OF THE MAIN WINDOW
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * scroll_out: given a buffer, buf, containing ct characters
 * of interest, write them to the journal window, journal.
 * If the insertion position is visible, then the window is scrolled,
 * otherwise the new characters are written out of sight and
 * the journal window text is left where it is.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void scroll_out(buf, ct, ignored)
char *buf;
NAT ct;
Boolean ignored;
{

	XmTextPosition ins_pos, last_pos;
	Position dontcare;
	char *p;
	char overwritten;


	ins_pos = XmTextGetLastPosition(journal);

/* need to temporarily null-terminate the buffer: */

	overwritten = buf[ct];
	buf[ct] = '\0';

	XmTextInsert(journal, ins_pos, buf);

	buf[ct] = overwritten;

	last_pos = XmTextGetLastPosition(journal);

	if(XmTextPosToXY(journal, ins_pos, &dontcare, &dontcare)) {
		/* insertion position is visible: scroll */
		while(!XmTextPosToXY(journal, last_pos, &dontcare, &dontcare)) {
			XmTextScroll(journal, 1);
		};
	};

	XmTextSetInsertionPosition(journal, last_pos);

	check_text_window_limit(journal,  global_options.journal_max);


}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * flash_file_name: update and blink the file name displayed in
 * the script editor's namestring label.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void flash_file_name(char *fname)
{
	if(fname) { /* not NULL; i.e. not the time-out call */ 
		XmTextFieldSetString(namestring, fname);
		XmTextFieldShowPosition(namestring, strlen(fname));
		XmTextFieldSetHighlight(namestring,
			0,
			XmTextFieldGetLastPosition(namestring),
			XmHIGHLIGHT_SELECTED);
		XtAppAddTimeOut(app,
			500,
			(XtTimerCallbackProc)flash_file_name,
			NULL);
	} else { 
		XmTextFieldSetHighlight(namestring,
			0,
			XmTextFieldGetLastPosition(namestring),
			XmHIGHLIGHT_NORMAL);
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * reinit_changed: unset changed flag and do other re-initialisations
 * when a file is saved, loaded or whatever
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void reinit_changed()
{
	changed = False;
	undo_buffer.can_undo = False;
	undo_buffer.moved_away = True;
	undo_buffer.first = 0;
	undo_buffer.last = 0;
	if(undo_buffer.oldtext != NULL) {
		XtFree(undo_buffer.oldtext);
		undo_buffer.oldtext = NULL;
	}
	set_menu_item_sensitivity(editmenu, EDIT_MENU_UNDO, False);
	XtUnmanageChild(modified);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * X initialisation:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static setup_main_window(
	char	*file_name)
{
	Arg args[12];
	NAT i;
	XmString s1, s2, s3, s4, s5, s6, s7, s8;
	Atom WM_DELETE_WINDOW;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Main window setup:  (root is created in main in xpp.c)
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtVaSetValues(root,
		XmNdeleteResponse,	XmDO_NOTHING,
		NULL);

	WM_DELETE_WINDOW = XmInternAtom(XtDisplay(root),
		"WM_DELETE_WINDOW",
		False);

	XmAddWMProtocolCallback(root,
		WM_DELETE_WINDOW,
		close_down_cb,
		root);

	frame = XtVaCreateWidget("frame",
		xmMainWindowWidgetClass,
		root, NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Working area:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	work = XtVaCreateWidget("work",
		xmPanedWindowWidgetClass,
		frame, NULL);


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * File-name area:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	filename = XtVaCreateWidget("filename",
		xmRowColumnWidgetClass, work,
		XmNorientation,	XmHORIZONTAL,
		XmNpacking,	XmPACK_TIGHT,
		NULL);


	s1 = XmStringCreateSimple("File Name:");
	filelabel = XtVaCreateManagedWidget("filelabel",
		xmLabelWidgetClass, filename,
		XmNlabelString,	s1,
		NULL);
	XmStringFree(s1);

	namestring = XtVaCreateManagedWidget("namestring",
		xmTextFieldWidgetClass, filename,
		XmNeditable,			False,
		XmNcursorPositionVisible,	False,
		NULL);

	s1 = XmStringCreateSimple("(Modified)");
	modified = XtVaCreateManagedWidget("filelabel",
		xmLabelWidgetClass, filename,
		XmNlabelString,	s1,
		NULL);
	XmStringFree(s1);


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Script window:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	i = 0;
	XtSetArg(args[i], XmNeditable, 			True); ++i;
	XtSetArg(args[i], XmNeditMode, 			XmMULTI_LINE_EDIT); ++i;
	XtSetArg(args[i], XmNautoShowCursorPosition, 	True); ++i;
	XtSetArg(args[i], XmNcursorPositionVisible, 	True); ++i;
	XtSetArg(args[i], XmNselectionArrayCount, 		3); ++i;

	script = XmCreateScrolledText(work, "script", args, i);

	XtAddCallback(script,
		XmNmodifyVerifyCallback, script_modify_cb, NULL);

	XtAddCallback(script,
		XmNmotionVerifyCallback, script_motion_cb, NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Journal window:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
if( !global_options.edit_only ) {
	i = 0;
	XtSetArg(args[i], XmNeditable, 			False); ++i;
	XtSetArg(args[i], XmNeditMode,	 		XmMULTI_LINE_EDIT); ++i;
	XtSetArg(args[i], XmNautoShowCursorPosition, 	False); ++i;
	XtSetArg(args[i], XmNcursorPositionVisible, 	True); ++i;

	journal = XmCreateScrolledText(work, "journal", args, i);
	copy_font_list(journal, script);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Menu bar:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	menubar = XmVaCreateSimpleMenuBar(frame, "menubar", NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * File menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	filemenu = setup_pulldown_menu(
		menubar, "File", 'F', False, file_menu_items);
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Tools menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
if(global_options.edit_only) {
	tools_menu_items[TOOLS_MENU_JOURNAL_VIEWER].label = NULL;
}
	toolsmenu = setup_pulldown_menu(
		menubar, "Tools", 'T', False, tools_menu_items);
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Edit menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	editmenu = setup_pulldown_menu(
		menubar, "Edit", 'E', False, edit_menu_items);
	set_menu_item_sensitivity(editmenu, EDIT_MENU_UNDO, False);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Command menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
if( !global_options.edit_only ) {
	cmdmenu = setup_pulldown_menu(
		menubar, "Command", 'C', False, cmd_menu_items);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Help menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	helpmenu = setup_pulldown_menu(
		menubar, "Help", 'H', False, help_menu_items);


	{
		Widget *btns;
		NAT num_btns;
		XtVaGetValues(menubar,
			XmNchildren, &btns,
			XmNnumChildren, &num_btns, NULL);
		XtVaSetValues(menubar,
			XmNmenuHelpWidget, btns[num_btns-1], NULL);
	}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Open file if file_name not NULL
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	if(open_file(script, file_name)) {
		XmTextFieldSetString(namestring, file_name);
		XmTextFieldShowPosition(namestring, strlen(file_name));
		reinit_changed();
		set_menu_item_sensitivity(filemenu, FILE_MENU_SAVE, True);
	} else {
		XmTextFieldSetString(namestring, no_file_message);
		set_menu_item_sensitivity(filemenu, FILE_MENU_SAVE, False);
	};

/* Lines marked !!! below are a work-around for  a Motif/X bug whereby
  characters >127 are mapped to spaces during a cut/paste sequence
   Similar lines may appear elsewhere */
/* !!! */{
/* !!! */	static void do_nothing();
/* !!! */	static void do_cut();
/* !!! */	static void do_copy();
/* !!! */	static void do_paste();
/* !!! */	String trans_tab =
/* !!! */		"<Btn2Down>: my-do-nothing()\n"
/* !!! */		"<Btn2Motion>: my-do-nothing()\n"
/* !!! */		"<Btn2Up>: my-do-nothing()\n"
/* !!! */		"<Key>osfCut: my-do-cut()\n"
/* !!! */		"<Key>osfCopy: my-do-copy()\n"
/* !!! */		"<Key>osfPaste: my-do-paste()";

/* !!! */	static XtActionsRec act_tab [] = {
/* !!! */		{"my-do-nothing", do_nothing},
/* !!! */		{"my-do-cut", do_cut},
/* !!! */		{"my-do-copy", do_copy},
/* !!! */		{"my-do-paste", do_paste}};
/* !!! */	XtAppAddActions(app, act_tab, 4);
/* !!! */	XtOverrideTranslations(script,
/* !!! */		XtParseTranslationTable(trans_tab));
/* !!! */};
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Initialise options package
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	init_options(script);
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Management and Realisation:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	XtManageChild(filename);
	XtUnmanageChild(modified);
	XtManageChild(menubar);
	XtManageChild(script);
if( !global_options.edit_only ) {
	XtManageChild(journal);
}
	XtManageChild(work);
	XtManageChild(frame);

	XtRealizeWidget(root);

}

/* !!! */static void do_nothing() {
/* !!! */	return;
/* !!! */};
/* !!! */static void do_cut() {
/* !!! */	edit_menu_cb(script, EDIT_MENU_CUT, NULL);
/* !!! */};
/* !!! */static void do_copy() {
/* !!! */	edit_menu_cb(script, EDIT_MENU_COPY, NULL);
/* !!! */};
/* !!! */static void do_paste() {
/* !!! */	edit_menu_cb(script, EDIT_MENU_PASTE, NULL);
/* !!! */};
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * MENU PROCESSING
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void file_menu_cb(w, i, cbs)
Widget w;
NAT i;
XmAnyCallbackStruct *cbs;
{
	char *fname;
	char *buf;

	switch(i) {
	case FILE_MENU_SAVE:
		fname = XmTextGetString(namestring);
		if(!fname || !*fname || *fname == '*') {
/* No file name: just do nothing */
		} else {
			if(save_file(script, fname)) {
				flash_file_name(fname);
				reinit_changed();
			}
		}
		break;
	case FILE_MENU_SAVE_AS:
		fname = file_dialog(frame, "Save");
		if(!fname || !*fname || *fname == '*') {
/* No file name: just do nothing */
		} else if(save_file_as(script, fname)) {
			flash_file_name(fname);
			reinit_changed();
			set_menu_item_sensitivity(filemenu,
				FILE_MENU_SAVE, True);
			if(fname != NULL) {XtFree(fname);};
		};
		break;
	case FILE_MENU_SAVE_SELECTION:
		if((buf = XmTextGetSelection(script)) == NULL) {
			ok_dialog(script, no_selection_message);
		} else {
			fname = file_dialog(frame, "Save Selection");
			if(!fname || !*fname || *fname == '*') {
/* No file name: just do nothing */
			} else {
				save_string_as(script, buf, fname);
				XtFree(buf);
			}
			if(fname != NULL) {XtFree(fname);};
		};
		break;
	case FILE_MENU_OPEN:
		if(!changed || yes_no_dialog(root, changed_message)) {
			fname = file_dialog(frame, "Open");
			if(!fname || !*fname || *fname == '*') {
/* No file name: just do nothing */
			} else if(open_file(script, fname)) {
				flash_file_name(fname);
				reinit_changed();
				set_menu_item_sensitivity(filemenu,
					FILE_MENU_SAVE, True);
			};
			if(fname != NULL) {XtFree(fname);};
		}
		break;
	case FILE_MENU_INCLUDE:
		fname = file_dialog(frame, "Include");
		if(!fname || !*fname || *fname == '*') {
/* No file name: just do nothing */
			break;
		};
		include_file(script, fname);
		if(fname != NULL) {XtFree(fname);};
		break;
	case FILE_MENU_REVERT:
		if(!changed || yes_no_dialog(root, changed_message)) {
			fname = XmTextGetString(namestring);
			if(!fname || !*fname || *fname == '*') {
/* No file name: get an empty file */
				XmTextSetString(script, "");
			} else if(!open_file(script, fname)) {
/* Can't open it; */
				break;
			};
			flash_file_name(fname);
			reinit_changed();
			XtFree(fname);
		};
		break;
	case FILE_MENU_EMPTY_FILE:
		if(!changed || yes_no_dialog(root, revert_message)) {
			XmTextFieldSetString(namestring, no_file_message);
			XmTextSetString(script, "");
			flash_file_name(no_file_message);
			reinit_changed();
			set_menu_item_sensitivity(filemenu,
				FILE_MENU_SAVE, False);
		}
		break;
	case FILE_MENU_QUIT:
		close_down_cb(root, NULL, NULL);
		break;
	default:
		break;
	};
}

static void tools_menu_cb(w, i, cbs)
Widget w;
NAT i;
XmAnyCallbackStruct *cbs;
{

	switch(i) {
	case TOOLS_MENU_PALETTE:
		add_palette(script);
		break;
	case TOOLS_MENU_SEARCH_REPLACE:
		add_search_tool(script);
		break;
	case TOOLS_MENU_SCRIPT_VIEWER:
		add_viewer(script);
		break;
	case TOOLS_MENU_JOURNAL_VIEWER:
		add_viewer(journal);
		break;
	case TOOLS_MENU_CMD_LINE:
		add_cmd_line(script);
		break;
	case TOOLS_MENU_CONTROLS:
		add_option_tool();
		break;
	default:
		break;
	}
/* Perhaps should test for success and make menu items insensitive */
}

static void edit_menu_cb(w, i, cbs)
Widget w;
NAT i;
XmAnyCallbackStruct *cbs;
{
	static void do_undo();

	Boolean result = True;

/* Lines marked !!! below are a work-around for  a Motif/X bug whereby
  characters >127 are mapped to spaces during a cut/paste sequence
   Similar lines may appear elsewhere */

	char *p;

	switch(i) {
	case EDIT_MENU_CUT:

/* !!! */	if((p = XmTextGetSelection(script)) != NULL) {
/* !!! */		if(cut_paste_buf != NULL) {
/* !!! */			XtFree(cut_paste_buf);
/* !!! */		};
/* !!! */		cut_paste_buf = p;
/* !!! */	};

		result = XmTextCut(script, CurrentTime);
		break;

	case EDIT_MENU_COPY:

/* !!! */	if((p = XmTextGetSelection(script)) != NULL) {
/* !!! */		if(cut_paste_buf != NULL) {
/* !!! */			XtFree(cut_paste_buf);
/* !!! */		};
/* !!! */		cut_paste_buf = p;
/* !!! */	};

		result = XmTextCopy(script, CurrentTime);
		if(!result && journal) {
/* !!! */		if((p = XmTextGetSelection(journal)) != NULL) {
/* !!! */			if(cut_paste_buf != NULL) {
/* !!! */				XtFree(cut_paste_buf);
/* !!! */			};
/* !!! */			cut_paste_buf = p;
/* !!! */		};

			result = XmTextCopy(journal, CurrentTime);
		};
		break;

	case EDIT_MENU_PASTE:
/* !!! Next line commented out because of bug
		result = XmTextPaste(script);
 * !!! End of commenting out */

/* !!! */	if(cut_paste_buf != NULL) {
/* !!! */		XmTextPosition left, right;
/* !!! */		if(XmTextGetSelectionPosition(script,
/* !!! */				&left, &right) && left != right) {
/* !!! */			XmTextReplace(script,
/* !!! */				left, right, cut_paste_buf);
/* !!! */		} else {
/* !!! */			XmTextInsert(script,
/* !!! */				XmTextGetInsertionPosition(script),
/* !!! */				cut_paste_buf);
/* !!! */		}
/* !!! */	};

		break;

	case EDIT_MENU_CLEAR:
		XmTextClearSelection(script, CurrentTime);
		break;

	case EDIT_MENU_UNDO:
		do_undo(script);
		break;

	default:
		break;
	};
/* Could also test for result in cases where there is no
   selection to cut, copy or paste. */
}

static void cmd_menu_cb(w, i, cbs)
Widget w;
NAT i;
XmAnyCallbackStruct *cbs;
{
	char *cmd;
	Bool execute_command();
	Boolean application_alive();
	static void 
		kill_application(),
		send_nl(),
		restart_application(),
		interrupt_application();
	
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
	case CMD_MENU_INTERRUPT:
		interrupt_application();
		break;
	case CMD_MENU_KILL:
		if(yes_no_dialog(root, kill_message)) {
			kill_application();
		};
		break;
	case CMD_MENU_RESTART:
		if(!application_alive()
			|| yes_no_dialog(root, restart_message)) {
			restart_application();
		};
		break;
	default:
		break;
	}
}

static void help_menu_cb(w, i, cbs)
Widget w;
NAT i;
XmAnyCallbackStruct *cbs;
{
	switch(i) {
	case HELP_MENU_GENERAL:
		help_dialog(w, help_message);
		break;
	default:
		break;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * MONITORING CHANGES FOR THE UNDO COMMAND
 * **** **** **** **** **** **** **** **** **** **** **** **** */
/*
 * What follows implements a very simple undo/redo facility.
 * Undoable actions are:
 *
 *	typing a single character (possibly overstriking many others)
 *	cut
 *	paste (possibly overstriking some chars)
 *	undo/redo
 *
 * Only the last action is undoable
 */
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Monitor cursor motions:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void script_motion_cb(w, d, cbs)
Widget w;
XtPointer d;
XmTextVerifyCallbackStruct *cbs;
{
	XmTextPosition dontcare;
	undo_buffer.moved_away = True;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Reinitialise the undo buffer. N.b. initialisation of the `last'
 * component almost always has to be reassigned. Following gives
 * an undo which would not change the text.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void reinit_undo_buffer (cbs, cu)
XmTextVerifyCallbackStruct *cbs;
Boolean cu;
{
	undo_buffer.can_undo = cu;
	undo_buffer.moved_away = False;
	undo_buffer.first = cbs->startPos;
	undo_buffer.last = cbs->startPos;
	if(undo_buffer.oldtext != NULL) {
		XtFree(undo_buffer.oldtext);
		undo_buffer.oldtext = NULL;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Monitor typed input:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void script_modify_cb(w, d, cbs)
Widget w;
XtPointer d;
XmTextVerifyCallbackStruct *cbs;
{
	Boolean restart = undo_buffer.moved_away;
	NAT len;
	char *cut_chars;

	if(!changed) {	/* Only do this when change from !changed to changed */
		XtManageChild(modified);
	}
	changed = True;

/* XmGetSelection doesn't seem to work as one might like in a 
 * callback like this. However XmTextGetSubstring is just the job
 */

	if(cbs->startPos < cbs->endPos) {
		len = cbs->endPos - cbs->startPos;
		cut_chars = XtMalloc(len + 1);
		if(XmTextGetSubstring(w, cbs->startPos, len, len+1, cut_chars)
			!= XmCOPY_SUCCEEDED) {
			reinit_undo_buffer(cbs, False);
		} else {
			cut_chars[len] = '\0';
			reinit_undo_buffer(cbs, True); /* for the XtFreee */
			undo_buffer.moved_away = False;
			undo_buffer.first = cbs->startPos;
			undo_buffer.last = cbs->startPos + cbs->text->length;	
			undo_buffer.oldtext = cut_chars;
		}
	} else if (restart) {
		reinit_undo_buffer(cbs, True);
		undo_buffer.last = cbs->startPos + cbs->text->length;
	} else {
		undo_buffer.last += cbs->text->length;
	}
	set_menu_item_sensitivity(editmenu, EDIT_MENU_UNDO, undo_buffer.can_undo);
/* If this isn't the call invoked by the XmReplace in do_undo */
/* The menu label should revert to "Undo": */
	if(!undoing) {
		undo_redo_index = 0;
		set_menu_item_label(editmenu, EDIT_MENU_UNDO, undo_redo[0]);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Do an undo. Note that the text replacement will cause
 * the modify/verify call back script_modify_cb to be invoked
 * so that the next undo will undo the undo (i.e. undo + undo = redo).
 * Since this will change the undo buffer we must copy the relevant
 * fields. We must set the moved_away field to indicate that we're
 * script_modify_cb is to stop accumulating changes.
 * Any text inserted by the undo is selected and the insertion
 * position is set to the end of the undo point. The beginning
 * of the new selection (or the insertion point if no text was
 * inserted) is manoeuvred into view in the window.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void do_undo(w)
Widget w;
{
	XmTextPosition fst, lst;
	NAT len;
	char *str;
	if(undo_buffer.can_undo) {
		undoing = True;
		undo_buffer.moved_away = True;
		if(undo_buffer.oldtext == NULL) {
			len = 0;
			str = XtMalloc(len + 1);
			strcpy(str, "");
		} else {
			len = strlen(undo_buffer.oldtext);
			str = XtMalloc(len + 1);
			strcpy(str, undo_buffer.oldtext);
		};
		fst = undo_buffer.first;
		lst = undo_buffer.last;
		XmTextReplace(w, fst, lst, str);
		undo_redo_index = 1 - undo_redo_index;
		set_menu_item_label(editmenu, EDIT_MENU_UNDO,
				undo_redo[undo_redo_index]);
		if(len) {
			XmTextSetSelection(w, fst, fst+len, CurrentTime);
		} else {
			XmTextSetInsertionPosition(w, fst);
		}
		XmTextShowPosition(w, fst);
		XtFree(str);
		undoing = False;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * MANAGING THE APPLICATION
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Pseudo-terminal initialisation:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


static void get_pty()
{
	int slave_fd, tty_fd;
	char c;
	NAT i;
	char line[20];
	static void get_from_application();
	for (c = 'p'; c <= 's'; c++) {
		for(i = 0; i < 16; i++) {
			sprintf(line, "/dev/pty%c%x", c, i);
			control_fd = open(line, O_RDWR);
			if (control_fd >= 0) {
				goto gotpty;
			}
		}
	}
nopty:
	msg("system error", "no pseudo-terminal devices available");
	perror("xpp");
	exit(1);
gotpty:
	line[sizeof "/dev/" - 1] = 't';
	slave_fd = open(line, O_RDWR);
	if(slave_fd < 0) {
		msg("system error", "Pseudo-terminal slave device not available");
		perror("xpp");
		exit(4);
	};
	child_pid = fork();
	if (child_pid < 0) { /* Cannot do */
		msg("system error", "fork failed");
		perror("xpp");
		exit(5);
	} else if (child_pid > 0) { /* Parent */
		close(slave_fd);
		if(fcntl(control_fd, F_SETFL, O_NDELAY) < 0) {
			msg("system error", "fcntl on application would not permit non-blocking i/o");
			perror("xpp");
			exit(7);
		};
		i = 1;
		if(ioctl(control_fd, TIOCREMOTE, &i) < 0) {
			msg("system error", "ioctl on application failed");
			perror("xpp");
			exit(8);
		};
		child_pgrp = child_pid;
		if(setpgid(child_pid, child_pid) != 0) {
			msg("system error", " setpgid failed");
			perror("xpp");
			exit(9);
		};
		app_ip_req = XtAppAddInput(app,
			control_fd, (XtPointer) XtInputReadMask,
			get_from_application, NULL);
		listening = True;
		write(control_fd, " ", 1);	/* Tell child to exec */
	} else { /* Child */
		char	buf;
		char **arglist;
		close(control_fd);
		dup2(slave_fd, 0);
		dup2(slave_fd, 1);
		dup2(slave_fd, 2);
		if (slave_fd > 2) {
			close(slave_fd);
		};
		read(0, &buf, 1);		/* Wait until told */
		arglist = get_arg_list();
		execvp(arglist[0], arglist);
	/* **** error if reach here **** */
		msg("system error", "could not exec");
		exit(1);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Test whether the application is alive.
 * Also does some tidy-up:
 *	1) non-blocking wait to reap child if it has died.
 *	2) if child has died, and Xt is still listening for it
 *	   then tell it to stop.
 *	3) close the control_fd file descriptor.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean application_alive()
{
	if(child_pid) {
		waitpid(child_pid, NULL, WNOHANG);
		if(kill(child_pid, 0)) { /* != 0; it's died */
			if(listening) {
				XtRemoveInput(app_ip_req);
				listening = False;
			};
			close(control_fd);
			return False;
		} else {
			return True;
		}
	} else {
		return False;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Data transfer from application:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void get_from_application(unused_w, unused_p)
Widget unused_w;
XtPointer unused_p;
{
	NAT ct;
	static	char buf[1001];
	while(application_alive() &&
			(ct = read(control_fd, buf, 1000)) > 0) {
		scroll_out(buf, ct, False);
	};
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Data transfer to application:
 * To cope with executing long command line sequences, this
 * is done using a (currently fixed size) queue.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * dequeue tries to write out the command line at the head of the
 * queue. To simplify the coding and particularly the memory
 * management, if the line to be written out cross the boundary
 * at the end of the cyclic buffer containing the queue data,
 * the line is taken to end at that boundary.
 * It returns true iff. it reduced the size of the queue.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean dequeue()
{
	NAT bytes_written, line_len, i, top;
	Boolean sent_something = False;
	Boolean sys_error = False;

/* nothing to do if the queue is empty */
	if(q_length == 0) {
		return False;
	};

/* no way of emptying the queue if there's no application running: */

	if(!application_alive()) {
		return False;
	};

/* something to do; find the next command line:*/

	top = ((i = q_head + q_length) > MAX_Q_LEN ? MAX_Q_LEN : i);

	for(i = q_head; i < top && queue[i] != '\n'; ++i) {
		continue;
	};

	line_len = (i < top ? i - q_head + 1 : i - q_head);

/* try to send the command line: */
	while(!sent_something && !sys_error && line_len) {
		bytes_written = write(control_fd, queue + q_head, line_len);
		sent_something = bytes_written > 0;

		if(bytes_written < 0) {
			if(errno = EWOULDBLOCK) {
/* try to send a bit less */
				--line_len;
			} else {
				perror("xpp");
				sys_error = True;
				ok_dialog(root, send_error_message);
			}
		}
	};

/* display what was sent, if anything: */

	if(sent_something)  {
		scroll_out(queue + q_head, bytes_written, True);
		q_head = (q_head + bytes_written) % MAX_Q_LEN;
		q_length -= bytes_written;
	};

	return sent_something;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * enqueue tries to add its argument text to the queue. First
 * it attempts to dequeue things.
 * It returns true if it got its argument onto the queue.
 * **** **** **** **** **** ***. **** **** **** **** **** **** */
static Boolean enqueue(buf, siz)
char *buf;
NAT siz;
{
	NAT buf_i, q_i;
/* Make room, if we can: */

	while(dequeue()) {
		continue;
	};
/* If no room now, there's no hope: */

	if(siz > MAX_Q_LEN - q_length) {
		return False;
	};

	q_i = (q_head + q_length) % MAX_Q_LEN;

/* Put data onto the queue: */

	for(buf_i = 0; buf_i < siz && q_i < MAX_Q_LEN; ++buf_i) {
		queue[q_i++] = buf[buf_i];
	};

	for(q_i = 0; buf_i < siz; ++q_i) {
		queue[q_i] = buf[buf_i++];
	};

	q_length += siz;

/* Have a go at flushing the queue: */

	while(dequeue()) {
		continue;
	}

	return True;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Time-out function for draining the queue when it can't
 * be emptied immediately by enqueue
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void try_drain_queue(w)
Widget w;
{
/* If there's something in the queue try to process it */
	if(q_length) {
		while(dequeue()) {
			continue;
		}
	};

/* If there's still something in the queue ask to be called again: */

	if(q_length) {
		XtAppAddTimeOut(app, 25,
			(XtTimerCallbackProc)try_drain_queue, w);
	};
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * clear_queue clears out the queue by reinitialising q_length.
 * **** **** **** **** **** ***. **** **** **** **** **** **** */
static void clear_queue ()
{
	if(q_length) {
		q_length = 0;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Send commands to the application via the queue
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void send_to_application (buf, siz)
char *buf;
NAT siz;
{
	NAT bytes_written;

/* Check there's something listening: */
	if(!application_alive()) {
		return;
	};

/* Check if the command could never fit in the queue: */

	if(siz > MAX_Q_LEN) {
		char msg[256];
		sprintf(msg, cmd_too_long_message, siz, MAX_Q_LEN);
		ok_dialog(root, msg);
		return;
	};

/* Send it off: */

	enqueue(buf, siz);

/* Call the timeout function to arrange to drain the queue if needed: */

	try_drain_queue(root);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Ctrl-C Signal handling for the controller process.
 * Following treats Ctrl-C similarly to window close
 * or selection of quit from the command menu.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void sigint_handler(NAT sig)
{
	XtAppAddTimeOut(app, 0, close_down_cb, root);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * panic_exit: 
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void panic_exit(char * m, NAT code)
{
	if(script) {
		msg(m, signal_handled_message2);
		panic_save(script);
	} else {
		msg(m, signal_handled_message3);
	}
	exit(code);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Other signal handling for the controller process.
 * Try to save the editor text if the widget's there then bomb out.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void sigother_handler(NAT sig)
{
	panic_exit(signal_handled_message1, sig);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * xt_error_handler
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void xt_error_handler(char * m)
{
	panic_exit(m, 2);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * handle signals and Xt errors: the derivation of the following list
 * of OS signals to handle not very scientific, but seems to catch
 * the common problems.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void handle_sigs()
{
	sigset(SIGINT, sigint_handler);
	sigset(SIGSEGV, sigother_handler);
	sigset(SIGBUS, sigother_handler);
	sigset(SIGFPE, sigother_handler);
	sigset(SIGSYS, sigother_handler);
	XtAppSetErrorHandler(app, xt_error_handler);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Interrupt the applications (as with Cntl-C): 
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void interrupt_application ()
{
	if(application_alive()) {
		kill((pid_t)-child_pgrp, SIGINT);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Send new line to the application
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void send_nl ()
{
	char *buf = "\n";

	send_to_application(buf, 1);

}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Kill the application:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void kill_application ()
{
	if(application_alive()) {
		if(listening) {
			XtRemoveInput(app_ip_req);
			listening = False;
		};
		kill(child_pid, SIGKILL);
		close(control_fd);
		waitpid(child_pid, NULL, WUNTRACED);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Restart the application
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void restart_application () {
	kill_application();
	get_pty();
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * See if the user really wants to quit, and if so do so:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void close_down_cb (w, cd, cbs)
Widget w;
XtPointer cd;
XmAnyCallbackStruct cbs;
{
	if((!changed && !application_alive())
	||	yes_no_dialog(root,
			(	changed && application_alive()
			?	changed_running_quit_message
			:	changed
			?	changed_quit_message
			:	running_quit_message))) {
		kill_application();
		exit(0);
	};
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Executing text from the selection in a text window:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Bool execute_command()
{
	char *cmd;
	NAT len;
	XmTextPosition dontcare;
	Widget w = script;
/*
	if(XmTextGetSelectionPosition(w, &dontcare, &dontcare)) {
		w = journal;
	}
*/
	if(XmTextGetSelectionPosition(w, &dontcare, &dontcare)) {
		cmd = XmTextGetSelection(w);
		len = strlen(cmd);
		send_to_application(cmd, len);
		XtFree(cmd);
		return True;
	} else {
		return False;
	}
}
		
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * main entry point:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void main_window_go(
	char	*file_name)
{
	setup_main_window(file_name);
if( !global_options.edit_only ) {
	get_pty();
}
	handle_sigs();
	XtRealizeWidget(root);
	XtAppMainLoop(app);
}



/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$
 *
 * mainw.c -  main window operations for the X/Motif ProofPower
 * Interface
 *
 * (c) ICL 1993, 1994
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
#include <stropts.h>

#include "xpp.h"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macro definitions:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * global, static and external data:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static Boolean changed = False;

/* Messages for various purposes */


static char* changed_message =
"The text has been edited. Do you want to throw away the changes?";

static char* changed_quit_message =
"The text has been edited. "
"Do you really want to quit?";

static char* changed_running_quit_message =
"The text has been edited and the application in the journal "
"window is still running. Do you really want to quit?";

static char *no_selection_message =
	 "No text has been selected";

static char* running_quit_message =
"The application in the journal window is still running. "
"Do you really want to quit?";

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

static char *add_new_line_message = 
"The selection to be executed does not end in a new-line character."
"Do you want a new-line to be added to it?";

static char *no_file_message =
	/* This message just displayed instead of the file name */
"* NO FILE NAME *";

XtAppContext app; /* global because needed in msg.c */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Widget	Parent	 Purpose
 * root		-	  the top level of the hierarchy
 * frame	root	  main window
 * work		frame	  work area
 * journal	work	  displays application output
 * infobar	work	  manager for filename and logo
 * filename   infobar  rowcol for the next three:
 * filelabel  filename label for name of file being edited
 * namestring filename displays name of file being edited
 * modified	filename label indicating that the file has changed
 * logo		infobar	  ProofPower logo
 * script	work	  the script being edited
 * menubar	frame	  the menu bar at the top of the main window
 * filemenu	menubar	  the file menu
 * toolsmenu	menubar	  the tools menu
 * editmenu	menubar	  the edit menu
 * cmdmenu	menubar	  the command menu
 * helpmenu	menubar	  the help menu
 *
 * All widgets have the same name in the widget hierarchy
 * as their C name.
 * **** **** **** **** **** **** **** **** **** **** **** **** */


Widget root;	/* global because needed in xpp.c */
Widget  script,
	journal;	/* global because needed in pterm.c */

static Widget
	frame, work, infobar, filename, filelabel, modified,
	namestring, logo,
	menubar, filemenu, toolsmenu, editmenu, cmdmenu, helpmenu;

XtPointer undo_ptr;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Forward declarations of menu item and other callback routines.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void
	file_menu_cb(),
	tools_menu_cb(),
	edit_menu_cb(),
	cmd_menu_cb(),
	help_menu_cb(),
	script_modify_cb();

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
    { "Open ...",  &xmPushButtonGadgetClass, 'O', "Ctrl<Key>o", "Ctrl-O",
        file_menu_cb, (XtPointer)FILE_MENU_OPEN, (MenuItem *)NULL, False },
    { "Include ...",  &xmPushButtonGadgetClass, 'I', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_INCLUDE, (MenuItem *)NULL, False },
    { "Revert",  &xmPushButtonGadgetClass, 'R', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_REVERT, (MenuItem *)NULL, False },
     { "Empty File",  &xmPushButtonGadgetClass, 'E', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_EMPTY_FILE, (MenuItem *)NULL, False },
   MENU_ITEM_SEPARATOR,
    { "Quit",  &xmPushButtonGadgetClass, 'Q', NULL, NULL,
        file_menu_cb, (XtPointer)FILE_MENU_QUIT, (MenuItem *)NULL, False },
    NULL,
};
/*
 * In the following, entries after and including
 * TOOLS_MENU_CMD_LINE are zero-ed out in an edit-only session.
 */
#define TOOLS_MENU_SEARCH_REPLACE		0
#define TOOLS_MENU_PALETTE			1
#define TOOLS_MENU_TEMPLATES			2
#define TOOLS_MENU_CONTROLS			3
#define TOOLS_MENU_CMD_LINE			4

static MenuItem tools_menu_items[] = {
    { "Search and Replace", &xmPushButtonGadgetClass, 'S', NULL, NULL,
        tools_menu_cb, (XtPointer)TOOLS_MENU_SEARCH_REPLACE, (MenuItem *)NULL, False },
    { "Palette", &xmPushButtonGadgetClass, 'P', NULL, NULL,
        tools_menu_cb, (XtPointer)TOOLS_MENU_PALETTE, (MenuItem *)NULL, False },
    { "Templates", &xmPushButtonGadgetClass, 'T', NULL, NULL,
        tools_menu_cb, (XtPointer)TOOLS_MENU_TEMPLATES, (MenuItem *)NULL, False },
    { "Options", &xmPushButtonGadgetClass, 'O', NULL, NULL,
        tools_menu_cb, (XtPointer)TOOLS_MENU_CONTROLS, (MenuItem *)NULL, False },
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

#define CMD_MENU_EXECUTE		0
#define CMD_MENU_RETURN		1
#define CMD_MENU_SEMICOLON		2
/* Item 3 is a separator */
#define CMD_MENU_ABANDON		4
#define CMD_MENU_INTERRUPT		5
/* Item 6 is a separator */
#define CMD_MENU_KILL			7
#define CMD_MENU_RESTART		8

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
    { "Interrupt", &xmPushButtonGadgetClass, 'I', "Ctrl<Key>c", "Ctrl-C",
        cmd_menu_cb, (XtPointer)CMD_MENU_INTERRUPT, (MenuItem *)NULL, False },
    MENU_ITEM_SEPARATOR,
    { "Kill", &xmPushButtonGadgetClass, 'K', NULL, NULL,
        cmd_menu_cb, (XtPointer)CMD_MENU_KILL, (MenuItem *)NULL, False },
    { "Restart", &xmPushButtonGadgetClass, 'R', NULL, NULL,
        cmd_menu_cb, (XtPointer)CMD_MENU_RESTART, (MenuItem *)NULL, False },
    NULL,
};

#define	HELP_MENU_GENERAL		0
#define	HELP_MENU_FILE_MENU		1
#define	HELP_MENU_TOOLS_MENU		2
#define	HELP_MENU_EDIT_MENU		3
#define	HELP_MENU_COMMAND_MENU	4
static MenuItem help_menu_items[] = {
    { "General", &xmPushButtonGadgetClass, 'G', NULL, NULL,
        help_menu_cb, (XtPointer)HELP_MENU_GENERAL, (MenuItem *)NULL, False },
    { "File", &xmPushButtonGadgetClass, 'F', NULL, NULL,
        help_menu_cb, (XtPointer)HELP_MENU_FILE_MENU, (MenuItem *)NULL, False },
    { "Tools", &xmPushButtonGadgetClass, 'T', NULL, NULL,
        help_menu_cb, (XtPointer)HELP_MENU_TOOLS_MENU, (MenuItem *)NULL, False },
    { "Edit", &xmPushButtonGadgetClass, 'E', NULL, NULL,
        help_menu_cb, (XtPointer)HELP_MENU_EDIT_MENU, (MenuItem *)NULL, False },
    { "Command", &xmPushButtonGadgetClass, 'C', NULL, NULL,
        help_menu_cb, (XtPointer)HELP_MENU_COMMAND_MENU, (MenuItem *)NULL, False },
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

void scroll_out(char *buf, NAT ct, Boolean ignored)
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

	if(XmTextPosToXY(journal, (ins_pos ? ins_pos - 1 : 0),
			&dontcare, &dontcare)) {
		/* insertion position is visible: scroll */
		XmTextPosition old_top, new_top;
		old_top = XmTextGetTopPosition(journal);
		while(!XmTextPosToXY(journal, last_pos, &dontcare, &dontcare)
		&&	old_top != (new_top = (XmTextScroll(journal, 1),
					 XmTextGetTopPosition(journal)))) {
			old_top = new_top;
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
	clear_undo(undo_ptr);
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
	void check_quit_cb();

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
	tools_menu_items[TOOLS_MENU_CMD_LINE].label = NULL;
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
if(global_options.edit_only) {
	help_menu_items[HELP_MENU_COMMAND_MENU].label = NULL;
}
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
 * Info Bar: File-name area and logo
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	infobar = XtVaCreateWidget("filename",
		xmFormWidgetClass, work,
		NULL);

	filename = XtVaCreateWidget("filename",
		xmRowColumnWidgetClass, infobar,
		XmNorientation,	XmHORIZONTAL,
		XmNpacking,	XmPACK_TIGHT,
		XmNleftAttachment,	XmATTACH_FORM,
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
		XmNtraversalOn,			False,
		NULL);

	s1 = XmStringCreateSimple("(Modified)");
	modified = XtVaCreateManagedWidget("filelabel",
		xmLabelWidgetClass, filename,
		XmNlabelString,	s1,
		NULL);
	XmStringFree(s1);

	logo = XtVaCreateManagedWidget("logo",
		xmLabelWidgetClass, infobar,
		XmNlabelType,		XmPIXMAP,
		XmNlabelPixmap,	get_pp_pixmap(),
		XmNtopAttachment,	XmATTACH_FORM,
		XmNbottomAttachment,	XmATTACH_FORM,
		XmNrightAttachment,	XmATTACH_FORM,
		NULL);

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

	XtOverrideTranslations(script, text_translations);

	undo_ptr = add_undo(script, editmenu, EDIT_MENU_UNDO);

	XtAddCallback(script,
		XmNmodifyVerifyCallback, undo_modify_cb, undo_ptr);

	XtAddCallback(script,
		XmNmodifyVerifyCallback, script_modify_cb, undo_ptr);

	XtAddCallback(script,
		XmNmotionVerifyCallback, undo_motion_cb, undo_ptr);

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
	XtManageChild(filename);
	XtManageChild(infobar);
	XtUnmanageChild(modified);
	XtManageChild(menubar);
	XtManageChild(script);
if( !global_options.edit_only ) {
	XtManageChild(journal);
}
	XtManageChild(work);
	XtManageChild(frame);

	XtRealizeWidget(root);

	fix_pane_height(infobar, infobar);

}

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
	void check_quit_cb();

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
		check_quit_cb(root, NULL, NULL);
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
	case TOOLS_MENU_TEMPLATES:
		add_templates_tool(script);
		break;
	case TOOLS_MENU_SEARCH_REPLACE:
		add_search_tool(script);
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


	char *p;

	switch(i) {
	case EDIT_MENU_CUT:


		result = XmTextCut(script, CurrentTime);
		break;

	case EDIT_MENU_COPY:


		result = XmTextCopy(script, CurrentTime);
		if(!result && journal) {

			result = XmTextCopy(journal, CurrentTime);
		};
		break;

	case EDIT_MENU_PASTE:
		result = XmTextPaste(script);
 
		break;

	case EDIT_MENU_CLEAR:
		XmTextClearSelection(script, CurrentTime);
		break;

	case EDIT_MENU_UNDO:
		undo_cb(script, undo_ptr, cbs);
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
		help_dialog(w, Help_General_Help);
		break;
	case HELP_MENU_FILE_MENU:
		help_dialog(w, Help_File_Menu);
		break;
	case HELP_MENU_TOOLS_MENU:
		help_dialog(w, Help_Tools_Menu);
		break;
	case HELP_MENU_EDIT_MENU:
		help_dialog(w, Help_Edit_Menu);
		break;
	case HELP_MENU_COMMAND_MENU:
		help_dialog(w, Help_Command_Menu);
		break;
	default:
		break;
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
	if(!changed) {	/* Only do this when change from !changed to changed */
		XtManageChild(modified);
	}
	changed = True;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * See if the user really wants to quit, and if so do so:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void check_quit_cb (Widget w, XtPointer cd, XmAnyCallbackStruct cbs)
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
 * Executing text from the selection in a text window.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Bool execute_command()
{
	char *cmd;
	NAT len;
	XmTextPosition dontcare;
	int add_nl;
	Widget w = script;

	if(	XmTextGetSelectionPosition(script, &dontcare, &dontcare)
	&&	(cmd = XmTextGetSelection(script))) {
		len = strlen(cmd);
		add_nl =	cmd[len] == '\n'
			?	0
			:	global_options.add_new_line_mode
					== EXECUTE_ADD_NEW_LINES
			?	1
			:	global_options.add_new_line_mode
						== EXECUTE_PROMPT_NEW_LINES
			?	yes_no_cancel_dialog(root, add_new_line_message)
			:	0;
				
		if(add_nl >= 0) { /* don't cancel */
				send_to_application(cmd, len);
				if(add_nl) {
					send_to_application("\n", 1);
				}
		}
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

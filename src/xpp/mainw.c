

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$
 *
 * cmdwin.c -  main window operations for the X/Motif ProofPower
 * Interface
 *
 * (c) ICL 1993
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _cmdwin
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
	BOOL can_undo;		/* true iff. can do an undo */
	BOOL moved_away;	/* true if the change is complete */
	NAT first, last;
	char *oldtext;
} undo_buffer = {FALSE, TRUE, 0, 0, NULL};

/* Messages for various purposes */

static char *undo_redo[2] = {"Undo", "Redo"};

static NAT undo_redo_index;

static BOOL undoing;

static char* help_message =
"\
 This is a test help message which should presently be\n\
 replaced by a message amongst many introduced by\n\
 a more general mechanism";

static char* quit_message =
"Do you really want to quit?";

static char* kill_message =
"Do you really want to kill the application?";

static char* restart_message =
"The application is running. \
Do you want to kill it and then restart it?";

static char *cmd_too_long_message = 
"The command is too long (%d bytes supplied; max. %d bytes).";

static char *send_error_message = 
"A system error occurred writing to the application.";

XtAppContext app; /* global because needed in msg.c */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Widget	Parent	 Purpose
 * root		-	 the top level of the hierarchy
 * frame	root	 main window
 * work		frame	 work area
 * display	work	 displays application output
 * filename     work     rowcol for the next two:
 * filelabel    filename label for name of file being edited
 * namestring   filename displays name of file being edited
 * command	work	 command line input
 * menubar	frame	 the menu bar at the top of the main window
 * filemenu	menubar	 the file menu
 * toolsmenu	menubar	 the tools menu
 * editmenu	menubar	 the edit menu
 * cmdmenu	menubar	 the command menu
 * helpmenu	menubar	 the help menu
 *
 * All widgets except command have the same name in the
 * widget hierarchy as their C name above except:
 * 	command is called "pp_text" in the Widget hierarchy
 * 	to allow keyboard translation resources to be set up
 * 	for all text input windows at one go.
 *	all menus are called "menu" for similar reasons
 * **** **** **** **** **** **** **** **** **** **** **** **** */


Widget root;	/* global because needed in xpp.c */

static Widget
	frame, work, display, filename, filelabel, namestring, command,
	menubar, filemenu, toolsmenu, editmenu, cmdmenu, helpmenu;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * limits on text window sizes in the main window:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static NAT display_max = 2000;

static NAT command_max = 2000;

static int control_fd;

static pid_t child_pid;

static pid_t child_pgrp;

static XtInputId app_ip_req;

static BOOL listening;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * X MANAGEMENT OF THE MAIN WINDOW
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * scroll_out: given a buffer, buf, containing ct characters
 * of interest, write them to the display window, display.
 * If the insertion position is visible, then the window is scrolled,
 * otherwise the new characters are written out of sight and
 * the display window text is left where it is.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void scroll_out(buf, ct, ignored)
char *buf;
NAT ct;
BOOL ignored;
{

	XmTextPosition ins_pos, last_pos;
	Position dontcare;
	char *p;
	char overwritten;

	TRACE("scroll_out");

	ins_pos = XmTextGetLastPosition(display);

/* need to temporarily null-terminate the buffer: */

	overwritten = buf[ct];
	buf[ct] = '\0';

	XmTextInsert(display, ins_pos, buf);

	buf[ct] = overwritten;

	last_pos = XmTextGetLastPosition(display);

	if(XmTextPosToXY(display, ins_pos, &dontcare, &dontcare)) {
		/* insertion position is visible: scroll */
		while(!XmTextPosToXY(display, last_pos, &dontcare, &dontcare)) {
			XmTextScroll(display, 1);
		};
	};

	check_text_window_limit(display,  display_max);

	LEAVE("scroll_out");

}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * X initialisation:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/*
 * Forward declarations of menu item and other callback routines.
 */

static void
	file_menu_cb(),
	tools_menu_cb(),
	edit_menu_cb(),
	cmd_menu_cb(),
	help_menu_cb(),
	close_down_cb(),
	command_modify_cb(),
	command_motion_cb();

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Menu descriptions:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static MenuItem file_menu_items[] = {
    { "Save", &xmPushButtonGadgetClass, 'S', NULL, NULL,
        file_menu_cb, (XtPointer)0, (MenuItem *)NULL, False },
    { "Save as ...",  &xmPushButtonGadgetClass, 'a', NULL, NULL,
        file_menu_cb, (XtPointer)1, (MenuItem *)NULL, False },
    { "Open ...",  &xmPushButtonGadgetClass, 'O', NULL, NULL,
        file_menu_cb, (XtPointer)2, (MenuItem *)NULL, False },
    { "Include",  &xmPushButtonGadgetClass, 'I', NULL, NULL,
        file_menu_cb, (XtPointer)3, (MenuItem *)NULL, False },
    { "New",  &xmPushButtonGadgetClass, 'N', NULL, NULL,
        file_menu_cb, (XtPointer)4, (MenuItem *)NULL, False },
    { "Quit",  &xmPushButtonGadgetClass, 'Q', NULL, NULL,
        file_menu_cb, (XtPointer)5, (MenuItem *)NULL, False },
    NULL,
};

static MenuItem tools_menu_items[] = {
    { "Palette", &xmPushButtonGadgetClass, 'P', NULL, NULL,
        tools_menu_cb, (XtPointer)0, (MenuItem *)NULL, False },
    NULL,
};

static MenuItem edit_menu_items[] = {
    { "Cut", &xmPushButtonGadgetClass, 'C', NULL, NULL,
        edit_menu_cb, (XtPointer)0, (MenuItem *)NULL, False },
    { "Copy", &xmPushButtonGadgetClass, 'o', NULL, NULL,
        edit_menu_cb, (XtPointer)1, (MenuItem *)NULL, False },
    { "Paste", &xmPushButtonGadgetClass, 'P', NULL, NULL,
        edit_menu_cb, (XtPointer)2, (MenuItem *)NULL, False },
    { "Clear", &xmPushButtonGadgetClass, 'l', NULL, NULL,
        edit_menu_cb, (XtPointer)3, (MenuItem *)NULL, False },
    { "Undo", &xmPushButtonGadgetClass, 'l', "<Key>Undo", NULL,
        edit_menu_cb, (XtPointer)4, (MenuItem *)NULL, False },
    NULL,
};

static MenuItem cmd_menu_items[] = {
    { "Execute", &xmPushButtonGadgetClass, 'x', "Ctrl<Key>x", "Ctrl-X",
        cmd_menu_cb, (XtPointer)0, (MenuItem *)NULL, False },
    { "Return", &xmPushButtonGadgetClass, 'e', "Ctrl<Key>m", "Ctrl-M",
        cmd_menu_cb, (XtPointer)1, (MenuItem *)NULL, False },
    { "Interrupt", &xmPushButtonGadgetClass, 'I', NULL, NULL,
        cmd_menu_cb, (XtPointer)2, (MenuItem *)NULL, False },
    { "Kill", &xmPushButtonGadgetClass, 'K', NULL, NULL,
        cmd_menu_cb, (XtPointer)3, (MenuItem *)NULL, False },
    { "Restart", &xmPushButtonGadgetClass, 'R', NULL, NULL,
        cmd_menu_cb, (XtPointer)4, (MenuItem *)NULL, False },
    { "Quit", &xmPushButtonGadgetClass, 'Q', NULL, NULL,
        cmd_menu_cb, (XtPointer)5, (MenuItem *)NULL, False },
    NULL,
};

static MenuItem help_menu_items[] = {
    { "General", &xmPushButtonGadgetClass, 'G', "Help", "Help",
        help_menu_cb, (XtPointer)0, (MenuItem *)NULL, False },
    { "Other",  &xmPushButtonGadgetClass, 'O', NULL, NULL,
        help_menu_cb, (XtPointer)1, (MenuItem *)NULL, False },
    NULL,
};

setup_cmdwin(Bool edit_only)
{
	Arg args[12];
	NAT i;
	XmString s1, s2, s3, s4, s5, s6, s7, s8;
	Atom WM_DELETE_WINDOW;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Main window setup:  (root is created in main in xpp.c)
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	TRACE("setup_cmdwin");

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

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Command window:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	i = 0;
	XtSetArg(args[i], XmNeditable, 			True); ++i;
	XtSetArg(args[i], XmNeditMode, 			XmMULTI_LINE_EDIT); ++i;
	XtSetArg(args[i], XmNautoShowCursorPosition, 	True); ++i;
	XtSetArg(args[i], XmNcursorPositionVisible, 	True); ++i;

	command = XmCreateScrolledText(work, "pp_text", args, i);

	XtAddCallback(command,
		XmNmodifyVerifyCallback, command_modify_cb, NULL);


	XtAddCallback(command,
		XmNmotionVerifyCallback, command_motion_cb, NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Display window:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
if( !edit_only ) {
	i = 0;
	XtSetArg(args[i], XmNrows,	 		24); ++i;
	XtSetArg(args[i], XmNcolumns, 			80); ++i;
	XtSetArg(args[i], XmNeditable, 			False); ++i;
	XtSetArg(args[i], XmNeditMode,	 		XmMULTI_LINE_EDIT); ++i;
	XtSetArg(args[i], XmNautoShowCursorPosition, 	False); ++i;
	XtSetArg(args[i], XmNcursorPositionVisible, 	True); ++i;

	display = XmCreateScrolledText(work, "display", args, i);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Menu bar:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	menubar = XmVaCreateSimpleMenuBar(frame, "menubar", NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * File menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	filemenu = setup_pulldown_menu(
		menubar, "File", '\0', False, file_menu_items);
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Tools menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	toolsmenu = setup_pulldown_menu(
		menubar, "Tools", '\0', False, tools_menu_items);
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Edit menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	editmenu = setup_pulldown_menu(
		menubar, "Edit", '\0', False, edit_menu_items);
	set_menu_item_sensitivity(editmenu, 4, False);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Command menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
if( !edit_only ) {
	cmdmenu = setup_pulldown_menu(
		menubar, "Command", '\0', False, cmd_menu_items);
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
 * Management and Realisation:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	XtManageChild(filename);
	XtManageChild(menubar);
	XtManageChild(command);
if( !edit_only ) {
	XtManageChild(display);
}
	XtManageChild(work);
	XtManageChild(frame);

	XtRealizeWidget(root);

	LEAVE("setup_cmdwin");

}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * MENU PROCESSING
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void file_menu_cb(w, i, cbs)
Widget w;
NAT i;
XmAnyCallbackStruct *cbs;
{
	char *fname = NULL;

	TRACE("file_menu_cb");

	switch(i) {
	case 1:
		fname = file_dialog(frame, "Save");
		break;
	case 2:
		fname = file_dialog(frame, "Open");
		load_file(command, fname);
		break;
	default:
		break;
	};

	if(fname != NULL) {
		XmTextFieldSetString(namestring, fname);
		XtFree(fname);
	};

	LEAVE("file_menu_cb");

}

static void tools_menu_cb(w, i, cbs)
Widget w;
NAT i;
XmAnyCallbackStruct *cbs;
{

	TRACE("tools_menu_cb");

	switch(i) {
	case 0:
		add_palette(command);
/* Perhaps should test for success and make this menu item insensitive */
		break;
	default:
		break;
	}
	LEAVE("tools_menu_cb");
}

static void edit_menu_cb(w, i, cbs)
Widget w;
NAT i;
XmAnyCallbackStruct *cbs;
{
	static void do_undo();

	Boolean result = True;

	TRACE("edit_menu_cb");

	switch(i) {
	case 0:
		result = XmTextCut(command, CurrentTime);
		break;
	case 1:
		result = XmTextCopy(command, CurrentTime);
		if(!result && display) {
			result = XmTextCopy(display, CurrentTime);
		};
		break;
	case 2:
		result = XmTextPaste(command);
		break;
	case 3:
		XmTextClearSelection(command, CurrentTime);
		break;
	case 4:
		do_undo(command);
		break;
	default:
		break;
	};
/* Could also test for result in cases where there is no
   selection to cut, copy or paste. */
	LEAVE("edit_menu_cb");
}

static void cmd_menu_cb(w, i, cbs)
Widget w;
NAT i;
XmAnyCallbackStruct *cbs;
{
	char *cmd;
	Bool execute_command();
	BOOL application_alive();
	static void 
		kill_application(),
		send_nl(),
		restart_application(),
		interrupt_application(),
		close_down_cb(),
		post_mortem_tidy_up();

	TRACE("cmd_menu_cb");

	post_mortem_tidy_up();

	switch(i) {
	case 0:
		execute_command();
		break;
	case 1:
		send_nl();
		break;
	case 2:
		interrupt_application();
		break;
	case 3:
		if(yes_no_dialog(root, kill_message)) {
			kill_application();
		};
		break;
	case 4:
		if(!application_alive()
			|| yes_no_dialog(root, restart_message)) {
			restart_application();
		};
		break;
	case 5:
		close_down_cb(root, NULL, NULL);
		break;
	default:
		break;
	}

	LEAVE("cmd_menu_cb");

}

static void help_menu_cb(w, i, cbs)
Widget w;
NAT i;
XmAnyCallbackStruct *cbs;
{
	TRACE("help_menu_cb");

	switch(i) {
	case 0:
		toggle_menu_item_sensitivity(helpmenu, 1);
		help_dialog(w, help_message);
		break;
	default:
		break;
	}

	LEAVE("help_menu_cb");
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
static void command_motion_cb(w, d, cbs)
Widget w;
XtPointer d;
XmTextVerifyCallbackStruct *cbs;
{
	TRACE("command_motion_cb");

	undo_buffer.moved_away = TRUE;

	LEAVE("command_motion_cb");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Reinitialise the undo buffer. N.b. initialisation of the `last'
 * component almost always has to be reassigned. Following gives
 * an undo which would not change the text.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void reinit_undo_buffer (cbs, cu)
XmTextVerifyCallbackStruct *cbs;
BOOL cu;
{
	TRACE("reinit_undo_buffer");

	undo_buffer.can_undo = cu;
	undo_buffer.moved_away = FALSE;
	undo_buffer.first = cbs->startPos;
	undo_buffer.last = cbs->startPos;
	if(undo_buffer.oldtext != NULL) {
		XtFree(undo_buffer.oldtext);
		undo_buffer.oldtext = NULL;
	}

	LEAVE("reinit_undo_buffer");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Monitor typed input:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void command_modify_cb(w, d, cbs)
Widget w;
XtPointer d;
XmTextVerifyCallbackStruct *cbs;
{
	BOOL restart = undo_buffer.moved_away;
	NAT len;
	char *cut_chars;
	TRACE("command_modify_cb");

/* XmGetSelection doesn't seem to work as one might like in a 
 * callback like this. However XmTextGetSubstring is just the job
 */

	if(cbs->startPos < cbs->endPos) {
		len = cbs->endPos - cbs->startPos;
		cut_chars = XtMalloc(len + 1);
		if(XmTextGetSubstring(w, cbs->startPos, len, len+1, cut_chars)
			!= XmCOPY_SUCCEEDED) {
			reinit_undo_buffer(cbs, FALSE);
		} else {
			cut_chars[len] = '\0';
			reinit_undo_buffer(cbs, TRUE); /* for the XtFreee */
			undo_buffer.moved_away = FALSE;
			undo_buffer.first = cbs->startPos;
			undo_buffer.last = cbs->startPos + cbs->text->length;	
			undo_buffer.oldtext = cut_chars;
		}
	} else if (restart) {
		reinit_undo_buffer(cbs, TRUE);
		undo_buffer.last = cbs->startPos + cbs->text->length;
	} else {
		undo_buffer.last += cbs->text->length;
	}
	set_menu_item_sensitivity(editmenu, 4, undo_buffer.can_undo);
/* If this isn't the call invoked by the XmReplace in do_undo */
/* The menu label should revert to "Undo": */
	if(!undoing) {
		undo_redo_index = 0;
		set_menu_item_label(editmenu, 4, undo_redo[0]);
	}
	LEAVE("command_modify_cb");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Do an undo. Note that the text replacement will cause
 * the modify/verify call back command_modify_cb to be invoked
 * so that the next undo will undo the undo (i.e. undo + undo = redo).
 * Since this will change the undo buffer we must copy the relevant
 * fields. We must set the moved_away field to indicate that we're
 * command_modify_cb is to stop accumulating changes.
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
	TRACE("do_undo");
	if(undo_buffer.can_undo) {
		undoing = TRUE;
		undo_buffer.moved_away = TRUE;
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
		set_menu_item_label(editmenu, 4,
				undo_redo[undo_redo_index]);
		if(len) {
			XmTextSetSelection(w, fst, fst+len, CurrentTime);
		} else {
			XmTextSetInsertionPosition(w, fst);
		}
		XmTextShowPosition(w, fst);
		XtFree(str);
		undoing = FALSE;
	}
	LEAVE("do_undo");
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
	TRACE("get_pty");
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
		listening = TRUE;
	} else { /* Child */
		close(control_fd);
		dup2(slave_fd, 0);
		dup2(slave_fd, 1);
		dup2(slave_fd, 2);
		if (slave_fd > 2) {
			close(slave_fd);
		};
		if((tty_fd = open("/dev/tty", O_RDWR)) >= 0) {
			ioctl(tty_fd, TIOCNOTTY, 0);
		};
		execvp(arglist[0], arglist);
	/* **** error if reach here **** */
		msg("system error", "could not exec");
		exit(1);
	}
	LEAVE("get_pty");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Test whether the application is alive
 * **** **** **** **** **** **** **** **** **** **** **** **** */

BOOL application_alive()
{

	TRACE("application_alive");

	RETURN("application_alive", !kill(child_pid, 0));
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
	TRACE("get_from_application");
	while((ct = read(control_fd, buf, 1000)) > 0) {
		scroll_out(buf, ct, FALSE);
	};
	LEAVE("get_from_application");
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
static BOOL dequeue()
{
	NAT bytes_written, line_len, i, top;
	BOOL sent_something = FALSE;
	BOOL sys_error = FALSE;

/* nothing to do if the queue is empty */
	TRACE("dequeue");
	if(q_length == 0) {
		RETURN("dequeue", FALSE);
	};

/* no way of emptying the queue if there's no application running: */

	if(!application_alive()) {
		RETURN("dequeue", FALSE);
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
				sys_error = TRUE;
				ok_dialog(root, send_error_message);
			}
		}
	};

/* display what was sent, if anything: */

	if(sent_something)  {
		scroll_out(queue + q_head, bytes_written, TRUE);
		q_head = (q_head + bytes_written) % MAX_Q_LEN;
		q_length -= bytes_written;
	};

	RETURN("dequeue", sent_something);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * enqueue tries to add its argument text to the queue. First
 * it attempts to dequeue things.
 * It returns true if it got its argument onto the queue.
 * **** **** **** **** **** ***. **** **** **** **** **** **** */
static BOOL enqueue(buf, siz)
char *buf;
NAT siz;
{
	NAT buf_i, q_i;
	TRACE("enqueue");
/* Make room, if we can: */

	while(dequeue()) {
		continue;
	};
/* If no room now, there's no hope: */

	if(siz > MAX_Q_LEN - q_length) {
		RETURN("enqueue", FALSE);
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

	RETURN("enqueue", TRUE);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Time-out function for draining the queue when it can't
 * be emptied immediately by enqueue
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void try_drain_queue(w)
Widget w;
{
/* If there's something in the queue try to process it */
	TRACE("try_drain_queue");
	if(q_length) {
		while(dequeue()) {
			continue;
		}
	};

/* If there's still something in the queue ask to be called again: */

	if(q_length) {
		XtAppAddTimeOut(app, 25, try_drain_queue, w);
	};
	LEAVE("try_drain_queue");
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * clear_queue clears out the queue by reinitialising q_length.
 * **** **** **** **** **** ***. **** **** **** **** **** **** */
static void clear_queue ()
{
	TRACE("clear_queue");
	if(q_length) {
		q_length = 0;
	}
	LEAVE("clear_queue");
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
	TRACE("send_to_application");
	if(!application_alive()) {
		LEAVE("send_to_application");
	};

/* Check if the command could never fit in the queue: */

	if(siz > MAX_Q_LEN) {
		char msg[256];
		sprintf(msg, cmd_too_long_message, siz, MAX_Q_LEN);
		ok_dialog(root, msg);
		LEAVE("send_to_application");
	};

/* Send it off: */

	enqueue(buf, siz);

/* Call the timeout function to arrange to drain the queue if needed: */

	try_drain_queue(root);

	LEAVE("send_to_application");
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Signal handling for the controller process. SIGINT (Cntl-C)
 * on the controller process causes SIGINT to the application
 * if it's running.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void sig_handler(sig, code, scp, addr)
NAT sig, code;
struct sigcontext *scp;
char *addr;
{
	TRACE("sig_handler");
	if(application_alive()) {
		clear_queue();
		kill((pid_t)-child_pgrp, sig);
	}
	LEAVE("sig_handler");
}

static void handle_sigs()
{
	TRACE("handle_sigs");
	signal(SIGINT, sig_handler);
	LEAVE("handle_sigs");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Interrupt the applications (as with Cntl-C): 
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void interrupt_application ()
{
	TRACE("interrupt_application");
	if(application_alive()) {
		kill((pid_t)-child_pgrp, SIGINT);
	} else {
diag("interrupt_application", "application not running");
}
	LEAVE("interrupt_application");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Send new line to the application
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void send_nl ()
{
	char *buf = "\n";

	TRACE("send_nl");
	send_to_application(buf, 1);
	LEAVE("send_nl");

}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Tidy up if the application is dead
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void post_mortem_tidy_up ()
{
	TRACE("post_mortem_tidy_up");
	if(listening && !application_alive()) {
		XtRemoveInput(app_ip_req);
		listening = FALSE;
	}
	LEAVE("post_mortem_tidy_up");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Kill the application:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void kill_application ()
{
	TRACE("kill_application");
	if(application_alive()) {
		if(listening) {
			XtRemoveInput(app_ip_req);
			listening = FALSE;
		};
		kill(child_pid, SIGKILL);
		waitpid(child_pid, NULL, WNOHANG);
		close(control_fd);
	}
	LEAVE("kill_application");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Restart the application
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void restart_application () {
	TRACE("restart_application");
	kill_application();
	get_pty();
	LEAVE("restart_application");
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * See if the user really wants to quit, and if so do so:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void close_down_cb (w, cd, cbs)
Widget w;
XtPointer cd;
XmAnyCallbackStruct cbs;
{
	TRACE("close_down_cb");
	if(yes_no_dialog(root, quit_message)) {
		kill_application();
		exit(0);
	};
	LEAVE("close_down_cb");
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Executing text from the selection in a text window:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Bool execute_command()
{
	char *cmd;
	NAT len;
	XmTextPosition dontcare;
	Widget w = command;
	TRACE("execute_command");
/*
	if(XmTextGetSelectionPosition(w, &dontcare, &dontcare)) {
		w = display;
	}
*/
	if(XmTextGetSelectionPosition(w, &dontcare, &dontcare)) {
		cmd = XmTextGetSelection(w);
		len = strlen(cmd);
		send_to_application(cmd, len);
		XtFree(cmd);
		RETURN("execute_command", True);
	} else {
		RETURN("execute_command", False);
	}
}
		
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * main entry point:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void cmdwin(Bool edit_only)
{
	TRACE("cmdwin");
	setup_cmdwin(edit_only);
if( !edit_only ) {
	get_pty();
	handle_sigs();
}
	XtRealizeWidget(root);
	XtAppMainLoop(app);
	LEAVE("cmdwin");
}

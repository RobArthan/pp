

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
#include <Xm/Protocols.h>
#include <Xm/Xm.h>

#include <stdio.h>
#include<Xm/Text.h>
#include<Xm/MainW.h>
#include<Xm/PanedW.h>
#include<varargs.h>

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
static long q_length = 0;
static int q_head = 0;

/* The following is used to implement undo in the edit menu */

struct undo_details {
	BOOL can_undo;		/* true iff. can do an undo */
	BOOL moved_away;	/* true if the change is complete */
	long first, last;
	char *oldtext
} undo_buffer = {FALSE, TRUE, 0, NULL};

/* Messages for various purposes */

static char *undo_redo[2] = {"Undo", "Redo"};

static long undo_redo_index;

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
 * Widget	Parent	Purpose
 * root		-	the top level of the hierarchy
 * frame	root	main window
 * work		frame	work area
 * display	work	displays application output
 * command	work	command line input
 * menubar	frame	the menu bar at the top of the main window
 * toolsmenu	menubar	the tools menu
 * editmenu	menubar	the edit menu
 * cmdmenu	menubar	the command menu
 * helpmenu	menubar	the help menu
 *
 * All widgets except command have the same name in the
 * widget hierarchy as their C name above except command.
 * command is called "pp_text" in the Widget hierarchy
 * to allow keyboard translation resources to be set up
 * for all the text input windows at one go.
 * **** **** **** **** **** **** **** **** **** **** **** **** */


Widget root;	/* global because needed in xpp.c */

static Widget
	frame, work, display, command,
	menubar, toolsmenu, editmenu, cmdmenu, helpmenu;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * limits on text window sizes in the main window:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static long display_max = 2000;

static long command_max = 2000;

static int control_fd;

static int child_pid;

static int child_pgrp;

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
int ct;
BOOL ignored;
{
	XmTextPosition ins_pos, last_pos;
	Position dontcare;
	char *p;
	char overwritten;

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
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * X initialisation:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


setup_cmdwin()
{
	Arg args[12];
	int i;
	XmString s1, s2, s3, s4, s5, s6, s7, s8;
	Atom WM_DELETE_WINDOW;
	void 	tools_menu_cb(),
		edit_menu_cb(),
		cmd_menu_cb(),
		help_menu_cb(),
		close_down_cb(),
		command_modify_cb(),
		command_motion_cb();

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
 * Command window:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	i = 0;
	XtSetArg(args[i], XmNrows,	 		3); ++i;
	XtSetArg(args[i], XmNcolumns, 			80); ++i;
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

	i = 0;
	XtSetArg(args[i], XmNrows,	 		24); ++i;
	XtSetArg(args[i], XmNcolumns, 			80); ++i;
	XtSetArg(args[i], XmNeditable, 			False); ++i;
	XtSetArg(args[i], XmNeditMode,	 		XmMULTI_LINE_EDIT); ++i;
	XtSetArg(args[i], XmNautoShowCursorPosition, 	False); ++i;
	XtSetArg(args[i], XmNcursorPositionVisible, 	True); ++i;

	display = XmCreateScrolledText(work, "display", args, i);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Menu bar:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	s1 = XmStringCreateSimple("Tools");
	s2 = XmStringCreateSimple("Edit");
	s3 = XmStringCreateSimple("Command");
	s4 = XmStringCreateSimple("Help");
	menubar = XmVaCreateSimpleMenuBar(frame, "menubar",
		XmVaCASCADEBUTTON, s1, 'T',
		XmVaCASCADEBUTTON, s2, 'E',
		XmVaCASCADEBUTTON, s3, 'C',
		XmVaCASCADEBUTTON, s4, 'H', NULL);

	XmStringFree(s1);
	XmStringFree(s2);
	XmStringFree(s3);
	XmStringFree(s4);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Tools menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	s1 = XmStringCreateSimple("Palette");

	toolsmenu = XmVaCreateSimplePulldownMenu(
		menubar, "tools_menu", 0, tools_menu_cb,
		XmVaPUSHBUTTON, s1, 'P', NULL, NULL,
		NULL);

	XmStringFree(s1);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Edit menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	s1 = XmStringCreateSimple("Cut");
	s2 = XmStringCreateSimple("Copy");
	s3 = XmStringCreateSimple("Paste");
	s4 = XmStringCreateSimple("Clear");
	s5 = XmStringCreateSimple(undo_redo[0]);
	undo_redo_index = 0;
	undoing = FALSE;

	editmenu = XmVaCreateSimplePulldownMenu(
		menubar, "edit_menu", 1, edit_menu_cb,
		XmVaPUSHBUTTON, s1, 'C', NULL, NULL,
		XmVaPUSHBUTTON, s2, 'o', NULL, NULL,
		XmVaPUSHBUTTON, s3, 'P', NULL, NULL,
		XmVaPUSHBUTTON, s4, 'l', NULL, NULL,
		XmVaPUSHBUTTON, s5, NULL, "<Key>Undo", NULL,
		NULL);

	XmStringFree(s1);
	XmStringFree(s2);
	XmStringFree(s3);
	XmStringFree(s4);
	XmStringFree(s5);

	set_menu_item_sensitivity(editmenu, 4, False);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Command menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	s1 = XmStringCreateSimple("Execute");
	s2 = XmStringCreateSimple("Ctrl-X");
	s3 = XmStringCreateSimple("Return");
	s4 = XmStringCreateSimple("Ctrl-M");
	s5 = XmStringCreateSimple("Interrupt Application");
	s6 = XmStringCreateSimple("Kill Application");
	s7 = XmStringCreateSimple("Restart Application");
	s8 = XmStringCreateSimple("Quit");

	cmdmenu = XmVaCreateSimplePulldownMenu(
		menubar, "command_menu", 2, cmd_menu_cb,
		XmVaPUSHBUTTON, s1, 'x', "Ctrl<Key>x", s2,
		XmVaPUSHBUTTON, s3, 'x', "Ctrl<Key>m", s4,
		XmVaSEPARATOR,
		XmVaPUSHBUTTON, s5, 'I', NULL, NULL,
		XmVaPUSHBUTTON, s6, 'K', NULL, NULL,
		XmVaPUSHBUTTON, s7, 'R', NULL, NULL,
		XmVaPUSHBUTTON, s8, 'Q', NULL, NULL,
		NULL);

	XmStringFree(s1);
	XmStringFree(s2);
	XmStringFree(s3);
	XmStringFree(s4);
	XmStringFree(s5);
	XmStringFree(s6);
	XmStringFree(s7);
	XmStringFree(s8);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Help menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	s1 = XmStringCreateSimple("General");
	s2 = XmStringCreateSimple("Other");

	helpmenu = XmVaCreateSimplePulldownMenu(
		menubar, "help_menu", 3, help_menu_cb,
		XmVaPUSHBUTTON, s1, 'G', NULL, NULL,
		XmVaPUSHBUTTON, s2, 'O', NULL, NULL,
		NULL);

	XmStringFree(s1);
	XmStringFree(s2);

	{
		Widget *btns;
		int num_btns;
		XtVaGetValues(menubar,
			XmNchildren, &btns,
			XmNnumChildren, &num_btns, NULL);
		XtVaSetValues(menubar,
			XmNmenuHelpWidget, btns[num_btns-1], NULL);
	}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Management and Realisation:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	XtManageChild(menubar);
	XtManageChild(command);
	XtManageChild(display);
	XtManageChild(work);
	XtManageChild(frame);

	XtRealizeWidget(root);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * MENU PROCESSING
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void tools_menu_cb(w, i, cbs)
Widget w;
int i;
XmAnyCallbackStruct *cbs;
{

	switch(i) {
	case 0:
		add_palette(command);
/* Perhaps should test for success and make this menu item insensitive */
		break;
	default:
		break;
	}
}

static void edit_menu_cb(w, i, cbs)
Widget w;
int i;
XmAnyCallbackStruct *cbs;
{
	void do_undo();

	Boolean result = True;

	switch(i) {
	case 0:
		result = XmTextCut(command, CurrentTime);
		break;
	case 1:
		result = XmTextCopy(command, CurrentTime);
		if(!result) {
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
}

static void cmd_menu_cb(w, i, cbs)
Widget w;
int i;
XmAnyCallbackStruct *cbs;
{
	char *cmd;
	Bool execute_command();
	BOOL application_alive();
	void kill_application();
	void send_nl();
	void restart_application();
	void interrupt_application();
	void close_down_cb();
	void post_mortem_tidy_up();

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
}

static void help_menu_cb(w, i, cbs)
Widget w;
int i;
XmAnyCallbackStruct *cbs;
{
	switch(i) {
	case 0:
		toggle_menu_item_sensitivity(helpmenu, 1);
		help_dialog(w, help_message);
		break;
	default:
		break;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * MONITORING CHANGES FOR THE UNDO COMMAND
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Monitor cursor motions:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void command_motion_cb(w, d, cbs)
Widget w;
XtPointer d;
XmTextVerifyCallbackStruct *cbs;
{
	undo_buffer.moved_away = TRUE;
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
	undo_buffer.can_undo = cu;
	undo_buffer.moved_away = FALSE;
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
static void command_modify_cb(w, d, cbs)
Widget w;
XtPointer d;
XmTextVerifyCallbackStruct *cbs;
{
	BOOL restart = undo_buffer.moved_away;
	long len;
	char *text, *cut_chars;

/* XmGetSelection doesn't seem to work as one would like in a 
 * callback like this. Therefore, if a block delete is being done,
 * we have to get the entire contents of the text window to find out
 * what's being deleted */

	if(cbs->startPos < cbs->endPos) {
		text = XmTextGetString(w);
		len = cbs->endPos - cbs->startPos;
		cut_chars = XtMalloc(len + 1);
		if(text == NULL || cut_chars == NULL) {
			reinit_undo_buffer(cbs, FALSE);
		} else {
			strncpy(cut_chars, text + (cbs->startPos), len);
			cut_chars[len] = '\0';
			reinit_undo_buffer(cbs, TRUE); /* for the XtFreee */
			undo_buffer.moved_away = FALSE;
			undo_buffer.first = cbs->startPos;
			undo_buffer.last = cbs->startPos + cbs->text->length;	
			undo_buffer.oldtext = cut_chars;
			XtFree(text);
		}
	} else if (restart) {
		reinit_undo_buffer(cbs, TRUE);
		undo_buffer.last = cbs->startPos + cbs->text->length;
	} else {
		undo_buffer.last += cbs->text->length;
	}
	set_menu_item_sensitivity(editmenu, 4, undo_buffer.can_undo);
/* If this isn't the call invoked byt he XmReplace in do_undo */
/* The menu label should revert to "Undo": */
	if(!undoing) {
		undo_redo_index = 0;
		set_menu_item_label(editmenu, 4, undo_redo[0]);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Do an undo. Note that the text replacement will cause
 * the modify/verify call back monitor_typing to be invoked
 * so that the next undo will undo the undo (i.e. undo + undo = redo).
 * Since this will change the undo buffer we must copy the relevant
 * fields. We must set the moved_away field to indicate that we're
 * monitor_typing is to stop accumulating changes.
 * Any text inserted by the undo is selected and the insertion
 * position is set to the end of the undo point. The beginning
 * of the new selection (or the insertion point if no text was
 * inserted) is manoeuvred into view in the window.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void do_undo(w)
Widget w;
{
	XmTextPosition fst, lst;
	long len;
	char *str;
	if(undo_buffer.can_undo) {
		undoing = TRUE;
		undo_buffer.moved_away = TRUE;
		if(undo_buffer.oldtext == NULL) {
			len = 0;
			str = "";
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
	int i;
	char line[20];
	void get_from_application();

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
		if(fcntl(control_fd, F_SETFL, FNDELAY) < 0) {
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
		if(setpgrp(child_pid, child_pid) != 0) {
			msg("system error", " setpgrp failed");
			perror("xpp");
			exit(9);
		};
		app_ip_req = XtAppAddInput(app, control_fd, XtInputReadMask,
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
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Test whether the application is alive
 * **** **** **** **** **** **** **** **** **** **** **** **** */

BOOL application_alive()
{
	return(!kill(child_pid, 0));
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Data transfer from application:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void get_from_application(unused_w, unused_p)
Widget unused_w;
XtPointer unused_p;
{
	int ct;
	static	char buf[1001];
	while((ct = read(control_fd, buf, 1000)) > 0) {
		scroll_out(buf, ct, FALSE);
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
static BOOL dequeue()
{
	long bytes_written, line_len, i, top;
	BOOL sent_something = FALSE;
	BOOL sys_error = FALSE;

/* nothing to do if the queue is empty */

	if(q_length == 0) {
		return(FALSE);
	};

/* no way of emptying the queue if there's no application running: */

	if(!application_alive()) {
		return(FALSE);
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

	return(sent_something);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * enqueue tries to add its argument text to the queue. First
 * it attempts to dequeue things. If it succeeds in making room here
 * the text to the queue it attempts, here and now, to dequeue as
 * much as it can.
 * It returns true if it got its argument onto the queue.
 * **** **** **** **** **** ***. **** **** **** **** **** **** */
static BOOL enqueue(buf, siz)
char *buf;
int siz;
{
	int buf_i, q_i;

/* Make room, if we can: */

	while(dequeue()) {
		continue;
	};
/* If no room now, there's no hope: */

	if(siz > MAX_Q_LEN - q_length) {
		return(FALSE);
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

	return(TRUE);
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
		XtAppAddTimeOut(app, 25, try_drain_queue, w);
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
int siz;
{
	int bytes_written;

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
 * Signal handling for the controller process. SIGINT (Cntl-C)
 * on the controller process causes SIGINT to the application
 * if it's running.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void sig_handler(sig, code, scp, addr)
int sig, code;
struct sigcontext *scp;
char *addr;
{
	if(application_alive()) {
		clear_queue();
		killpg(child_pgrp, sig);
	}
}

static void handle_sigs()
{
	signal(SIGINT, sig_handler);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Interrupt the applications (as with Cntl-C): 
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void interrupt_application ()
{
	if(application_alive()) {
		killpg(child_pgrp, SIGINT);
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
 * Tidy up if the application is dead
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void post_mortem_tidy_up ()
{
	if(listening && !application_alive()) {
		XtRemoveInput(app_ip_req);
		listening = FALSE;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Kill the application:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void kill_application ()
{
	if(application_alive()) {
		if(listening) {
			XtRemoveInput(app_ip_req);
			listening = FALSE;
		};
		kill(child_pid, SIGKILL);
		waitpid(child_pid, NULL, WNOHANG);
		close(control_fd);
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
	if(yes_no_dialog(root, quit_message)) {
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
	long len;
	XmTextPosition dontcare;
	Widget w = command;
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
		return(True);
	} else {
		return(False);
	}
}
		
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * main entry point:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void cmdwin()
{
	setup_cmdwin();
	get_pty();
	handle_sigs();
	XtRealizeWidget(root);
	XtAppMainLoop(app);
}

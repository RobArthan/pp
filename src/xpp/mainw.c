

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$
 *
 * cmdwin.h -  main window operations for the X/Motif ProofPower
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

#include "xpp.h"

#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/termio.h>

#include <signal.h>
#include <errno.h>

#include <stdio.h>
#include <X11/Xatom.h>
#include <X11/Intrinsic.h>
#include <X11/Shell.h>
#include <Xm/Xm.h>

#include <stdio.h>
#include<Xm/Text.h>
#include<Xm/MainW.h>
#include<Xm/PanedW.h>
#include<varargs.h>

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macro definitions:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#define STDIN 0
#define STDOUT 1
#define STDERR 2


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * static and external data:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


extern char *environ[];


static XtAppContext app;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Widget	Parent	Purpose
 * root		-	the top level of the hierarchy
 * frame	root	main window
 * work		frame	work area
 * display	work	displays application output
 * command	work	command line input
 * menubar	frame	the menu bar at the top of the main window
 * filemenu	menubar	the file menu
 * editmenu	menubar	the edit menu
 * cmdmenu	menubar	the command menu
 * helpmenu	menubar	the help menu
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Widget
	root, frame, work, display, command,
	menubar, filemenu, editmenu, cmdmenu, helpmenu;

static int display_cursor = 0;


static char *arglist[10];

static int control_fd;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * scroll_output: given a buffer, buf, containing ct characters
 * of interest, write them to the (scrolled text) window w.
 * If the insertion position of w is visible, then w is scrolled,
 * otherwise the new characters are written out of sight and
 * the display in w is left where it is.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void scroll_out(buf, ct, w)
char *buf;
int ct;
Widget w;
{
	XmTextPosition ins_pos;
	Position dontcare;
	char *p;
	buf[ct] = '\0';

	ins_pos = XmTextGetInsertionPosition(w);

	if(XmTextPosToXY(w, ins_pos, &dontcare, &dontcare)) {
		/* insertion position is visible: scroll */
		XmTextInsert(w, display_cursor, buf);
		ins_pos = XmTextGetInsertionPosition(w);
		while(!XmTextPosToXY(w, ins_pos, &dontcare, &dontcare)) {
			XmTextScroll(w, 1);
			ins_pos = XmTextGetInsertionPosition(w);
		};
		display_cursor += ct;
		XtVaSetValues(w, XmNcursorPosition, display_cursor, NULL);
	/*	XmTextShowPosition(w, display_cursor); */
	} else {
		XmTextInsert(w, display_cursor, buf);
		display_cursor += ct;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * X initialisation:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


setup_cmdwin(argc, argv)
int argc;
char **argv;
{
	Arg args[12];
	int i;
	XmString s1, s2, s3, s4, s5, s6;
	void monitor_typing();
	void file_menu_cb(), edit_menu_cb(), cmd_menu_cb(), help_menu_cb();

	diag("cmdwin", "X initialisation");

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Top level and main windows:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	root = XtVaAppInitialize(&app,  "Xpp", NULL, 0,
		&argc, argv, NULL, NULL);

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
 * Display window:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	i = 0;
	XtSetArg(args[i], XmNrows,	 		24); ++i;
	XtSetArg(args[i], XmNcolumns, 			80); ++i;
	XtSetArg(args[i], XmNeditable, 			False); ++i;
	XtSetArg(args[i], XmNeditMode,	 		XmMULTI_LINE_EDIT); ++i;
	XtSetArg(args[i], XmNwordWrap, 			True); ++i;
	XtSetArg(args[i], XmNscrollHorizontal,		False); ++i;
	XtSetArg(args[i], XmNscrollVertical, 		True); ++i;
	XtSetArg(args[i], XmNautoShowCursorPosition, 	False); ++i;
	XtSetArg(args[i], XmNcursorPositionVisible, 	False); ++i;

	display = XmCreateScrolledText(work, "display", args, i);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Command window:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	i = 0;
	XtSetArg(args[i], XmNrows,	 		3); ++i;
	XtSetArg(args[i], XmNcolumns, 			80); ++i;
	XtSetArg(args[i], XmNeditable, 			True); ++i;
	XtSetArg(args[i], XmNeditMode, 			XmMULTI_LINE_EDIT); ++i;
	XtSetArg(args[i], XmNwordWrap, 			True); ++i;
	XtSetArg(args[i], XmNscrollHorizontal,		False); ++i;
	XtSetArg(args[i], XmNscrollVertical, 		True); ++i;
	XtSetArg(args[i], XmNautoShowCursorPosition, 	True); ++i;
	XtSetArg(args[i], XmNcursorPositionVisible, 	True); ++i;


	command = XmCreateScrolledText(work, "command", args, i);

	XtAddCallback(command, XmNmodifyVerifyCallback,
		monitor_typing, NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Menu bar:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	s1 = XmStringCreateSimple("File");
	s2 = XmStringCreateSimple("Edit");
	s3 = XmStringCreateSimple("Command");
	s4 = XmStringCreateSimple("Help");
	menubar = XmVaCreateSimpleMenuBar(frame, "menubar",
		XmVaCASCADEBUTTON, s1, 'F',
		XmVaCASCADEBUTTON, s2, 'E',
		XmVaCASCADEBUTTON, s3, 'C',
		XmVaCASCADEBUTTON, s4, 'H');

	XmStringFree(s1);
	XmStringFree(s2);
	XmStringFree(s3);
	XmStringFree(s4);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * File menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	s1 = XmStringCreateSimple("New");
	s2 = XmStringCreateSimple("Save");
	s3 = XmStringCreateSimple("Quit");
	s4 = XmStringCreateSimple("Ctrl-C");

	filemenu = XmVaCreateSimplePulldownMenu(
		menubar, "file_menu", 0, file_menu_cb,
		XmVaPUSHBUTTON, s1, 'N', NULL, NULL,
		XmVaPUSHBUTTON, s2, 'S', NULL, NULL,
		XmVaPUSHBUTTON, s3, 'Q', "Ctrl<Key>c", s4,
		NULL);

	XmStringFree(s1);
	XmStringFree(s2);
	XmStringFree(s3);
	XmStringFree(s4);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Edit menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	s1 = XmStringCreateSimple("Cut");
	s2 = XmStringCreateSimple("Copy");
	s3 = XmStringCreateSimple("Clear");
	s4 = XmStringCreateSimple("Paste");

	editmenu = XmVaCreateSimplePulldownMenu(
		menubar, "edit_menu", 1, edit_menu_cb,
		XmVaPUSHBUTTON, s1, 'u', NULL, NULL,
		XmVaPUSHBUTTON, s2, 'o', NULL, NULL,
		XmVaPUSHBUTTON, s3, 'l', NULL, NULL,
		XmVaPUSHBUTTON, s4, 'a', NULL, NULL,
		NULL);

	XmStringFree(s1);
	XmStringFree(s2);
	XmStringFree(s3);
	XmStringFree(s4);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Command menu:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	s1 = XmStringCreateSimple("Execute");
	s2 = XmStringCreateSimple("Ctrl-X");

	cmdmenu = XmVaCreateSimplePulldownMenu(
		menubar, "command_menu", 2, cmd_menu_cb,
		XmVaPUSHBUTTON, s1, 'x', "Ctrl<Key>x", s2,
		NULL);

	XmStringFree(s1);
	XmStringFree(s2);

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

	XtVaSetValues(menubar, XmNmenuHelpWidget, helpmenu, NULL);

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
 * Menu processing:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void dummy_menu_cb(w, i, cbs, s)
Widget w;
int i;
XmAnyCallbackStruct *cbs;
char *s;
{
	char buf[4];
	sprintf(buf, "%d", i);
	diag(s, buf);
}

void file_menu_cb(w, i, cbs)
Widget w;
int i;
XmAnyCallbackStruct *cbs;
{
	dummy_menu_cb(w, i, cbs, "file menu item");
}

void edit_menu_cb(w, i, cbs)
Widget w;
int i;
XmAnyCallbackStruct *cbs;
{
	dummy_menu_cb(w, i, cbs, "edit menu item");
}

void cmd_menu_cb(w, i, cbs)
Widget w;
int i;
XmAnyCallbackStruct *cbs;
{
	char *cmd;
	int len;
	void send_to_application();
	dummy_menu_cb(w, i, cbs, "command menu item");
	switch(i) {
	case 0:
		cmd = XmTextGetString(command);
		len = strlen(cmd);
/* **** complain if len = 0? **** */
		send_to_application(cmd, len);
		XmTextSetHighlight(command, 0, len, XmHIGHLIGHT_SELECTED);
		XmTextSetSelection(command, 0, len, CurrentTime);
		break;
	default:
		break;
	}
}

void help_menu_cb(w, i, cbs)
Widget w;
int i;
XmAnyCallbackStruct *cbs;
{
	dummy_menu_cb(w, i, cbs, "help menu item");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Keyboard input processing:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void monitor_typing(w, unused, cbs)
Widget w;
XtPointer unused;
XmTextVerifyCallbackStruct *cbs;
{
	static int boln_offset = 0;
	static int cursor = 0;
	static char buff[BUFSIZ];
	static char temp[BUFSIZ];
	int i, j;
	void send_to_application();
	if(cbs->startPos < boln_offset) {
		msg("user error", "attempt to insert before boln");
		cbs->doit = False;
		return;
	};
/*

fprintf(stderr,
"startPos %d; endPos %d; len %d\n",
cbs->startPos, cbs->endPos, cbs->text->length);
fprintf(stderr,
"cursor %d; boln_offset %d\n",
cursor, boln_offset);
*/

	for(i = 0; i < cbs->text->length; ++i) {
		temp[i] = cbs->text->ptr[i]; /* could overflow temp */
	};
	for(j = cbs->endPos - boln_offset; j < cursor; ++j) {
		temp[i++] = buff[j];  /* could overflow temp */
	};
	cursor = cbs->startPos - boln_offset;
	for(j = 0; j < i; ++j) {
		buff[cursor++] = temp[j]; /* could overflow buff */
		if(temp[j] == '\n') {
			send_to_application(buff, cursor);
			boln_offset += cursor;
			cursor = 0;
		}
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Pseudo-terminal initialisation:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


void get_pty(argc, argv)
int argc;
char **argv;
{
	int slave_fd, tty_fd;
	char c;
	int i, fork_success;
	char line[20];
	void get_from_application();

	if(argc < 2) {
		msg("invalid command line", "usage pty prog [args]");
		exit(10);
	};
	for(i = 0; i + 1 < argc && i < 8; ++i) {
		diag("argument", argv[i+1]);
		arglist[i] = argv[i+1];
	};
	arglist[i] = NULL;

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
	diag("get_pty", "pseudo-terminal acquired");
	line[sizeof "/dev/" - 1] = 't';
	slave_fd = open(line, O_RDWR);
	if(slave_fd < 0) {
		msg("system error", "Pseudo-terminal slave device not available");
		perror("xpp");
		exit(4);
	};
	fork_success = fork();
	if (fork_success < 0) { /* Cannot do */
		msg("system error", "fork failed");
		perror("xpp");
		exit(5);
	} else if (fork_success > 0) { /* Parent */
		diag("get_pty", "parent: forked ok");
		close(slave_fd);
		if(fcntl(control_fd, F_SETFL, FNDELAY) < 0) {
			msg("system error", "fcntl on application would not permit non-blocking i/o");
			perror("xpp");
			exit(7);
		};
		XtAppAddInput(app, control_fd, XtInputReadMask,
			get_from_application, NULL);
	} else { /* Child */
		diag("get_pty", "child: forked ok");
		close(control_fd);
		dup2(slave_fd, 0);
		dup2(slave_fd, 1);
		dup2(slave_fd, 2);
		if (slave_fd > 2) {
			close(slave_fd);
		};
		if((tty_fd = open("/dev/tty", O_RDWR)) >= 0) {
			ioctl(tty_fd, TIOCNOTTY, 0);
		}
		execvp(arglist[0], arglist);
	/* **** error if reach here **** */
		msg("system error", "could not exec");
		exit(1);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Data transfer from application:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void get_from_application(w, unused)
Widget w;
XtPointer unused;
{
	int ct;
	static	char buf[257];
	while((ct = read(control_fd, buf, 256)) > 0) {
		scroll_out(buf, ct, display);
		diag("get_from_application", buf);
	};
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Data transfer to application:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


void send_to_application (buf, siz)
char *buf;
int siz;
{
/*
	scroll_out(buf, siz, display);
*/
	if(write(control_fd, buf, siz) != siz) {
		diag("system error", "write to application failed");
		perror("xpp");
		exit(6);
	};
	diag("send_to_application", buf);
}

void cmdwin(argc, argv)
int argc;
char *argv[];
{
	diag("cmdwin", "starting");
	setup_cmdwin(argc, argv);
	diag("cmdwin", "Pseudo-terminal initialisation");
	get_pty(argc, argv);
	diag("cmdwin", "X display start-up");
	XtRealizeWidget(root);
	XtAppMainLoop(app);
}

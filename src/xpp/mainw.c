

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
#include<Xm/VendorE.h>
#include<Xm/PanedW.h>
#include<Xm/ScrolledW.h>
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

static Widget toplevel;

static Widget pp_output_w;

static Widget pp_input_s_w;

static Widget pp_input_t_w;

static Widget pp_output_s_w;

static Widget pp_output_t_w;

static int wpr_position = 0;

static int in_count = 0;

static char buff[BUFSIZ];

static int cursor = 0;

static int boln_offset = 0;

static char *arglist[10];

static int control_fd;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Miscellanea: 
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
		XmTextInsert(pp_output_t_w, wpr_position, buf);
		ins_pos = XmTextGetInsertionPosition(w);
		while(!XmTextPosToXY(w, ins_pos, &dontcare, &dontcare)) {
			XmTextScroll(w, 1);
			ins_pos = XmTextGetInsertionPosition(w);
		};
		wpr_position += ct;
		XtVaSetValues(pp_output_t_w, XmNcursorPosition, wpr_position, NULL);
	/*	XmTextShowPosition(pp_output_t_w, wpr_position); */
	} else {
		XmTextInsert(pp_output_t_w, wpr_position, buf);
		wpr_position += ct;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * X initialisation: 
 * **** **** **** **** **** **** **** **** **** **** **** **** */


setup_windows(argc, argv)
int argc;
char **argv;
{
	Arg args[9];
	void monitor_typing();


	pp_output_w = XtCreatePopupShell("output",
		topLevelShellWidgetClass,
		toplevel,
		args, 0);
		
	
	pp_output_s_w = XtVaCreateManagedWidget("pp_output_s_w",
			xmScrolledWindowWidgetClass, pp_output_w,
		XmNscrollingPolicy,	XmAPPLICATION_DEFINED,
		XmNvisualPolicy,	XmVARIABLE,
		XmNscrollBarDisplayPolicy, XmSTATIC,
		XmNshadowThickness,	0, NULL);

	pp_output_t_w = XtVaCreateManagedWidget("pp_output_t_w",
			xmTextWidgetClass, pp_output_s_w,
		XmNrows, 	24,
		XmNcolumns, 	80,
		XmNeditable, 	False,
		XmNeditMode, 	XmMULTI_LINE_EDIT,
		XmNwordWrap, 	True,
		XmNscrollHorizontal, 	False,
		XmNscrollVertical, 	True,
		XmNblinkRate, 	0,
		XmNautoShowCursorPosition, 	False,
		XmNcursorPositionVisible, 	False,
		NULL);

	pp_input_s_w = XtVaCreateManagedWidget("toplevel",
			xmScrolledWindowWidgetClass, toplevel,
		XmNscrollingPolicy,	XmAPPLICATION_DEFINED,
		XmNvisualPolicy,	XmVARIABLE,
		XmNscrollBarDisplayPolicy, XmSTATIC,
		XmNshadowThickness,	0, NULL);
	
	pp_input_t_w = XtVaCreateManagedWidget("pp_input_t_w",
			xmTextWidgetClass, pp_input_s_w,
		XmNrows, 	12,
		XmNcolumns, 	80,
		XmNeditable, 	True,
		XmNeditMode, 	XmMULTI_LINE_EDIT,
		XmNwordWrap, 	True,
		XmNscrollHorizontal, 	False,
		XmNscrollVertical, 	True,
		XmNblinkRate, 	0,
		XmNautoShowCursorPosition, 	True,
		XmNcursorPositionVisible, 	True,
		NULL);

	XtAddCallback(pp_input_t_w, XmNmodifyVerifyCallback,
		monitor_typing, NULL);

	XtRealizeWidget(toplevel);
	XtPopup(pp_output_w, XtGrabNone);


}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Keyboard input processing: 
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void monitor_typing(w, unused, cbs)
Widget w;
XtPointer unused;
XmTextVerifyCallbackStruct *cbs;
{
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
		diag("get_pty", "child: about to execve application");
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
		scroll_out(buf, ct, pp_output_t_w);
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
	scroll_out(buf, siz, pp_output_t_w);
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
	toplevel = XtVaAppInitialize(&app,  "Xpp", NULL, 0,
		&argc, argv, NULL, NULL);
	diag("cmdwin", "X initialisation");
	setup_windows(argc, argv);
	diag("cmdwin", "Pseudo-terminal initialisation");
	get_pty(argc, argv);
	diag("cmdwin", "X display start-up");
	XtRealizeWidget(toplevel);
	XtAppMainLoop(app);
}

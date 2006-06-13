
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * %Z% $Date: 2006/01/16 17:53:41 $ $Revision: 2.45 $ $RCSfile: msg.c,v $
 *
 * msg.c - support for message dialogues for the X/Motif ProofPower Interface
 *
 * msg.c: this file is part of the PPTex system
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
#define _msg
#define YES 1
#define NO 2
#define CANCEL -1
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files: 
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#include <stdio.h>
#include <ctype.h>
#include "xpp.h"

#define MSG_LINE_LEN 40
#define HELP_LINE_LEN 70
#define HELP_SCREEN_HEIGHT 24

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * The following put's copies msg to buf putting new-lines in
 * at appropriate places to fit in lines of length line-len.
 * buf should be at least as long as msg
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void c_format_msg(char *buf, char *msg, NAT line_len)
{
	char *p1, *p2, *pm;
	unsigned cursor;
	for(	p1 = buf, p2 = buf, pm = msg, cursor=0;
		*p2 = *pm;
		++p2, ++pm ) {
		if(*p2 == '\n') {
			cursor = 0;
			p1 = p2;
		} else {
			++cursor;
		};
		if(cursor >= line_len) {
			if(*p1 == ' ') {
				*p1 = '\n';
				cursor = p2 - p1 - 1;
			}
		};
		if(*p2 == ' ') {
			p1 = p2;
		}
	}
}

XmString format_msg(char *msg, NAT line_len)
{
	char *buf;
	char *p1, *p2, *pm;
	unsigned cursor;
	XmString str;
	if((buf = XtMalloc(strlen(msg) + 1)) == NULL) {
		return(XmStringCreateLtoR(buf, XmFONTLIST_DEFAULT_TAG));
	}
	c_format_msg(buf, msg, line_len);
	str = XmStringCreateLtoR(buf, XmFONTLIST_DEFAULT_TAG);
	XtFree(buf);
	return str;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * help_dialog: put up an information window without grabbing control
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void help_dialog(Widget w, char *str)
{
	Widget form, widget;
	static Widget dialog, pane, help_text;
	Atom WM_DELETE_WINDOW;
	Dimension h;
	Arg args[12];
	if(!dialog) {
		dialog = XtVaCreatePopupShell("xpp-Help",
			xmDialogShellWidgetClass, get_top_shell(w),
			XmNdeleteResponse, XmUNMAP,
			NULL);
#ifdef EDITRES
		add_edit_res_handler(dialog);
#endif
		common_dialog_setup(dialog, popdown_cb, dialog);
		pane = XtVaCreateWidget("pane", xmPanedWindowWidgetClass, dialog,
			XmNsashWidth,  1, /* PanedWindow won't let us set these to 0! */
			XmNsashHeight, 1, /* Make small so user doesn't try to resize */
			NULL);
		XtSetArg(args[0], XmNscrollVertical,        True);
		XtSetArg(args[1], XmNscrollHorizontal,      False);
		XtSetArg(args[2], XmNeditMode,              XmMULTI_LINE_EDIT);
		XtSetArg(args[3], XmNeditable,              False);
		XtSetArg(args[4], XmNcursorPositionVisible, False);
		XtSetArg(args[5], XmNwordWrap,              True);
		XtSetArg(args[6], XmNrows,                  HELP_SCREEN_HEIGHT);
		XtSetArg(args[7], XmNcolumns,               HELP_LINE_LEN);
		XtSetArg(args[8], XmNtraversalOn,             False);
		help_text = XmCreateScrolledText(pane, "help-text", args, 8);
		XtManageChild(help_text);
		form = XtVaCreateWidget("form", xmFormWidgetClass, pane,
			XmNfractionBase,    5,
			NULL);
		widget = XtVaCreateManagedWidget("Dismiss",
			xmPushButtonGadgetClass, form,
			XmNtopAttachment,        XmATTACH_FORM,
			XmNbottomAttachment,     XmATTACH_FORM,
			XmNleftAttachment,       XmATTACH_POSITION,
			XmNleftPosition,         2,
			XmNrightAttachment,      XmATTACH_POSITION,
			XmNrightPosition,        3,
			XmNshowAsDefault,        True,
			XmNdefaultButtonShadowThickness, 1,
			NULL);
		XtAddCallback(widget, XmNactivateCallback, popdown_cb, dialog);
		XtManageChild(form);
		XtVaGetValues(widget, XmNheight, &h, NULL);
		XtVaSetValues(form, XmNpaneMaximum, h, XmNpaneMinimum, h, NULL);
		attach_ro_edit_popup(help_text);
		register_selection_source(help_text);
		register_palette_client(help_text);
	}
	XmTextSetString(help_text, str);
	XtManageChild(pane);
	XtPopup(dialog, XtGrabNone);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * poll: poll for and process events; used for modal dialogs
 * in functions that are expected to return a result. We arrange
 * to delay processing keyboard events until a time-out period
 * has expired. This is to stop a repeated key-stroke causing
 * the dialog to be popped up and then dismissed by the second
 * key-stroke before the user has time to look at it.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void poll_timeout_proc(XtPointer p, XtIntervalId *unused)
{
	Boolean *flag = p;
	*flag = True;
}
static void poll(int *done){
	XEvent xev;
	Boolean listening = False;
	XtAppAddTimeOut(app, 250, poll_timeout_proc, &listening);
	while(!*done) {
		XtAppNextEvent(app, &xev);
		if(	listening ||
			(xev.type != KeyPress && xev.type != KeyRelease) ) {
			XtDispatchEvent(&xev);
		}
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * yes_no_dialog: ask a question with a mandatory yes/no answer
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void yes_no_cb(CALLBACK_ARGS), yes_no_destroy_cb(CALLBACK_ARGS);
Boolean yes_no_dialog(Widget w, char *question, char *title)
{
	static Widget dialog;
	XmString text, yes, no, confirm;
	Atom WM_DELETE_WINDOW;
	static int reply;
	/* 0 = not replied; otherwise YES/NO */
	reply = 0;
	if (!dialog) {
		dialog = XmCreateQuestionDialog(w, "yes_no", NULL, 0);
#ifdef EDITRES
		add_edit_res_handler(dialog);
#endif
		yes = XmStringCreateSimple("   Yes   ");
		no = XmStringCreateSimple("   No   ");
		XtVaSetValues(dialog,
			XmNdialogStyle,		XmDIALOG_FULL_APPLICATION_MODAL,
			XmNokLabelString,	yes,
			XmNcancelLabelString,	no,
			XmNdialogType,		XmDIALOG_QUESTION,
			NULL);
		XtUnmanageChild(
			XmMessageBoxGetChild(dialog, XmDIALOG_HELP_BUTTON));
		XtAddCallback(dialog, XmNokCallback, yes_no_cb, &reply);
		XtAddCallback(dialog, XmNcancelCallback, yes_no_cb, &reply);
		WM_DELETE_WINDOW = XmInternAtom(XtDisplay(root),
			"WM_DELETE_WINDOW",
			False);
		XmAddWMProtocolCallback(XtParent(dialog),
			WM_DELETE_WINDOW,
			yes_no_destroy_cb,
			&reply);
		XmStringFree(yes);
		XmStringFree(no);
	}
	confirm = XmStringCreateSimple(title != NULL ? title : "Confirm");
		XtVaSetValues(dialog,
			XmNdialogTitle, 	confirm,
			NULL);
	XmStringFree(confirm);
	text = format_msg(question, MSG_LINE_LEN);
	XtVaSetValues(dialog, XmNmessageString, text, NULL);
	XmStringFree(text);
	XtManageChild(dialog);
	XtVaSetValues(XtParent(dialog), XmNtransientFor, w, NULL);
	XtPopup(XtParent(dialog), XtGrabNone);
	XmProcessTraversal(dialog, XmTRAVERSE_HOME);
	beep();
	poll(&reply);
	XtPopdown(XtParent(dialog));
	return reply == YES;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * quit_new_dialog: ask a question with a mandatory quit/new answer
 * **** **** **** **** **** **** **** **** **** **** **** **** */
Boolean quit_new_dialog(Widget w, char *question)
{
	static Widget dialog;
	XmString text, new, quit, confirm;
	Atom WM_DELETE_WINDOW;
	static int reply;
	/* 0 = not replied; otherwise YES/NO */
	reply = 0;
	if (!dialog) {
		dialog  = XmCreateQuestionDialog(w, "quit_new", NULL, 0);
#ifdef EDITRES
		add_edit_res_handler(dialog);
#endif
		new     = XmStringCreateSimple("   New   ");
		quit    = XmStringCreateSimple("   Quit   ");
		confirm = XmStringCreateSimple("Confirm");
		XtVaSetValues(dialog,
			XmNdialogStyle,       XmDIALOG_FULL_APPLICATION_MODAL,
			XmNokLabelString,     new,
			XmNcancelLabelString, quit,
			XmNdialogTitle,       confirm,
			XmNdialogType,        XmDIALOG_QUESTION,
			NULL);
		XtUnmanageChild(
			XmMessageBoxGetChild(dialog, XmDIALOG_HELP_BUTTON));
		XtAddCallback(dialog, XmNokCallback, yes_no_cb, &reply);
		XtAddCallback(dialog, XmNcancelCallback, yes_no_cb, &reply);
		WM_DELETE_WINDOW = XmInternAtom(XtDisplay(root),
			"WM_DELETE_WINDOW",
			False);
		XmAddWMProtocolCallback(XtParent(dialog),
			WM_DELETE_WINDOW,
			yes_no_destroy_cb,
			&reply);
		XmStringFree(quit);
		XmStringFree(new);
		XmStringFree(confirm);
	}
	text = format_msg(question, MSG_LINE_LEN);
	XtVaSetValues(dialog, XmNmessageString, text, NULL);
	XmStringFree(text);
	XtManageChild(dialog);
	XtVaSetValues(XtParent(dialog), XmNtransientFor, w, NULL);
	XtPopup(XtParent(dialog), XtGrabNone);
	XmProcessTraversal(dialog, XmTRAVERSE_HOME);
	beep();
	poll(&reply);
	XtPopdown(XtParent(dialog));
	return reply == YES;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * yes_no_cancel_dialog: ask a question with a mandatory yes/no/cancel answer
 * By abuse of the Motif intentions, this uses the help button for cancel.
 * Return is 1 for yes; 0 for no; and -1 for cancel.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void yes_no_cb(CALLBACK_ARGS), cancel_cb(CALLBACK_ARGS);
int yes_no_cancel_dialog(Widget w, char *question)
{
	static Widget dialog;
	XmString text, yes, no, cancel, confirm;
	Atom WM_DELETE_WINDOW;
	static int reply;
	/* 0 = not replied; otherwise YES/NO/CANCEL */
	reply = 0;
	if (!dialog) {
		dialog = XmCreateQuestionDialog(w, "yes_no", NULL, 0);
#ifdef EDITRES
		add_edit_res_handler(dialog);
#endif
		yes = XmStringCreateSimple(   "   Yes   ");
		no = XmStringCreateSimple(    "   No   ");
		cancel = XmStringCreateSimple(" Cancel ");
		confirm = XmStringCreateSimple("Confirm-or-Cancel");
		XtVaSetValues(dialog,
			XmNdialogStyle,		XmDIALOG_FULL_APPLICATION_MODAL,
			XmNokLabelString,	yes,
			XmNcancelLabelString,	no,
			XmNhelpLabelString,	cancel,
			XmNdialogTitle, 	confirm,
			XmNdialogType,		XmDIALOG_QUESTION,
			NULL);
		XtAddCallback(dialog, XmNokCallback, yes_no_cb, &reply);
		XtAddCallback(dialog, XmNcancelCallback, yes_no_cb, &reply);
		XtAddCallback(dialog, XmNhelpCallback, cancel_cb, &reply);
		WM_DELETE_WINDOW = XmInternAtom(XtDisplay(root),
			"WM_DELETE_WINDOW",
			False);
		XmAddWMProtocolCallback(XtParent(dialog),
			WM_DELETE_WINDOW,
			cancel_cb,
			&reply);
		XmStringFree(yes);
		XmStringFree(no);
		XmStringFree(cancel);
		XmStringFree(confirm);
	}
	text = format_msg(question, MSG_LINE_LEN);
	XtVaSetValues(dialog, XmNmessageString, text, NULL);
	XmStringFree(text);
	XtManageChild(dialog);
	XtVaSetValues(XtParent(dialog), XmNtransientFor, w, NULL);
	XtPopup(XtParent(dialog), XtGrabNone);
	XmProcessTraversal(dialog, XmTRAVERSE_HOME);
	beep();
	poll(&reply);
	XtPopdown(XtParent(dialog));
	return (reply >= 0 ? reply == YES : -1);
}


/*
 * Call-backs for the above.
 */
static void yes_no_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	NAT *reply = cbd;
	XmAnyCallbackStruct *acbs = cbs;
	switch (acbs->reason) {
		case XmCR_OK:
			*reply = YES;
			break;
		case XmCR_CANCEL:
			*reply = NO;
			break;
		default:
			break;
	}
}
static void yes_no_destroy_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	NAT *reply = cbd;
	*reply = NO;
}

static void cancel_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	NAT *reply = cbd;
	*reply = CANCEL;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * ok_dialog: error message which the user must confirm
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void ok_cb(CALLBACK_ARGS);
void ok_dialog(Widget w, char *msg)
{
	static Widget dialog;
	XmString text, ok, error;
	Atom WM_DELETE_WINDOW;
	static int confirmed;
	confirmed = False;
	if (!dialog) {
		dialog = XmCreateQuestionDialog(w, "ok", NULL, 0);
#ifdef EDITRES
		add_edit_res_handler(dialog);
#endif
		ok = XmStringCreateSimple("   OK   ");
		error = XmStringCreateSimple("Error");
		XtVaSetValues(dialog,
			XmNdialogStyle,		XmDIALOG_FULL_APPLICATION_MODAL,
			XmNokLabelString,	ok,
			XmNdialogTitle, 	error,
			XmNdialogType,		XmDIALOG_ERROR,
			NULL);
		XtVaSetValues(XtParent(dialog),
			XmNdeleteResponse,	XmDO_NOTHING,
			NULL);
		XtUnmanageChild(
			XmMessageBoxGetChild(dialog, XmDIALOG_HELP_BUTTON));
		XtUnmanageChild(
			XmMessageBoxGetChild(dialog, XmDIALOG_CANCEL_BUTTON));
		XtAddCallback(dialog, XmNokCallback, ok_cb, &confirmed);
		/* still need to handle cancel via ESC key */
		XtAddCallback(dialog, XmNcancelCallback, ok_cb, &confirmed);
		WM_DELETE_WINDOW = XmInternAtom(XtDisplay(root),
			"WM_DELETE_WINDOW",
			False);
		XmAddWMProtocolCallback(XtParent(dialog),
			WM_DELETE_WINDOW,
			ok_cb,
			&confirmed);
		XmStringFree(ok);
		XmStringFree(error);
	}
	text = format_msg(msg, MSG_LINE_LEN);
	XtVaSetValues(dialog, XmNmessageString, text, NULL);
	XmStringFree(text);
	XtManageChild(dialog);
	XtVaSetValues(XtParent(dialog), XmNtransientFor, w, NULL);
	XtPopup(XtParent(dialog), XtGrabNone);
	XmProcessTraversal(dialog, XmTRAVERSE_HOME);
	beep();
	poll(&confirmed);
	XtPopdown(XtParent(dialog));
}


/* Similar to ok_dialog, but used when memory's
 * low, so everything's pre allocated */
void memory_warning_dialog(Widget w, Boolean show)
{
	static Widget dialog;
	char msg[] = "Memory has become very low.  You are strongly "
	             "advised to save your work and restart.";
	XmString text, ok, error;
	Atom WM_DELETE_WINDOW;
	static int confirmed;
	confirmed = False;
	if (!dialog) {
		dialog = XmCreateQuestionDialog(w, "ok", NULL, 0);
#ifdef EDITRES
		add_edit_res_handler(dialog);
#endif
		ok = XmStringCreateSimple("   OK   ");
		error = XmStringCreateSimple("Error");
		XtVaSetValues(dialog,
			XmNdialogStyle,		XmDIALOG_FULL_APPLICATION_MODAL,
			XmNokLabelString,	ok,
			XmNdialogTitle, 	error,
			XmNdialogType,		XmDIALOG_ERROR,
			NULL);
		XtVaSetValues(XtParent(dialog),
			XmNdeleteResponse,	XmDO_NOTHING,
			NULL);
		XtUnmanageChild(
			XmMessageBoxGetChild(dialog, XmDIALOG_HELP_BUTTON));
		XtUnmanageChild(
			XmMessageBoxGetChild(dialog, XmDIALOG_CANCEL_BUTTON));
		XtAddCallback(dialog, XmNokCallback, ok_cb, &confirmed);
		XtAddCallback(dialog, XmNcancelCallback, ok_cb, &confirmed);
		WM_DELETE_WINDOW = XmInternAtom(XtDisplay(root),
			"WM_DELETE_WINDOW",
			False);
		XmAddWMProtocolCallback(XtParent(dialog),
			WM_DELETE_WINDOW,
			ok_cb,
			&confirmed);
		XmStringFree(ok);
		XmStringFree(error);
		text = format_msg(msg, MSG_LINE_LEN);
		XtVaSetValues(dialog, XmNmessageString, text, NULL);
		XmStringFree(text);
	}
	if(!show) {
		return;
	}
	XtManageChild(dialog);
	XtVaSetValues(XtParent(dialog), XmNtransientFor, w, NULL);
	XtPopup(XtParent(dialog), XtGrabNone);
	XmProcessTraversal(dialog, XmTRAVERSE_HOME);
	beep();
	poll(&confirmed);
	XtPopdown(XtParent(dialog));
}

void nomemory_dialog(Widget w, Boolean show)
{
	static Widget dialog;
	char msg[] = "Memory has run out. You are strongly "
	             "advised to try to save your work and to restart.";
	XmString text, ok, error;
	Atom WM_DELETE_WINDOW;
	static int confirmed;
	confirmed = False;
	if (!dialog) {
		dialog = XmCreateQuestionDialog(w, "ok", NULL, 0);
#ifdef EDITRES
		add_edit_res_handler(dialog);
#endif
		ok = XmStringCreateSimple("   OK   ");
		error = XmStringCreateSimple("Error");
		XtVaSetValues(dialog,
			XmNdialogStyle,		XmDIALOG_FULL_APPLICATION_MODAL,
			XmNokLabelString,	ok,
			XmNdialogTitle, 	error,
			XmNdialogType,		XmDIALOG_ERROR,
			NULL);
		XtVaSetValues(XtParent(dialog),
			XmNdeleteResponse,	XmDO_NOTHING,
			NULL);
		XtUnmanageChild(
			XmMessageBoxGetChild(dialog, XmDIALOG_HELP_BUTTON));
		XtUnmanageChild(
			XmMessageBoxGetChild(dialog, XmDIALOG_CANCEL_BUTTON));
		XtAddCallback(dialog, XmNokCallback, ok_cb, &confirmed);
		XtAddCallback(dialog, XmNcancelCallback, ok_cb, &confirmed);
		WM_DELETE_WINDOW = XmInternAtom(XtDisplay(root),
			"WM_DELETE_WINDOW",
			False);
		XmAddWMProtocolCallback(XtParent(dialog),
			WM_DELETE_WINDOW,
			ok_cb,
			&confirmed);
		XmStringFree(ok);
		XmStringFree(error);
		text = format_msg(msg, MSG_LINE_LEN);
		XtVaSetValues(dialog, XmNmessageString, text, NULL);
		XmStringFree(text);
	}
	if(!show) {
		return;
	}
	XtManageChild(dialog);
	XtVaSetValues(XtParent(dialog), XmNtransientFor, w, NULL);
	XtPopup(XtParent(dialog), XtGrabNone);
	XmProcessTraversal(dialog, XmTRAVERSE_HOME);
	beep();
	poll(&confirmed);
	XtPopdown(XtParent(dialog));
}


static void ok_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	int *confirmed = cbd;
	*confirmed = True;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * file_dialog: pop up a dialog to get a file name.
 * The dialogue is the infamous Motif FileSelectionDialog.
 * The file selection widget create/used is returned in `dialog'.
 * It is caller's responsibility to pop the dialog down.
 * `opn' is the label to use on the ``OK'' button (i.e. it's
 * ``Save'' or ``Open'' or whatever.
 * reset is true if the filename text widget is to be reset
 * before bringing the dialogue up.
 * The return value is the user's chosen file name if any or NULL
 * if the user cancels. The file name will not be an empty string
 * and will not end in a "/".
 * This is an application modal dialog.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void	file_cancel_cb(CALLBACK_ARGS),
		file_ok_cb(CALLBACK_ARGS),
		file_help_cb(CALLBACK_ARGS);

char *file_dialog(Widget w, Widget *dialog, char *opn, Boolean reset)
{
	Widget dialog_text;
	XmString s, title;
	Atom WM_DELETE_WINDOW;
	static int reply;	/* 0 = not replied/YES/NO*/
	char *file_name;
	XmString dir_mask;
	XmTextPosition last_pos;
	reply = 0;

	if (!*dialog) {
		*dialog = XmCreateFileSelectionDialog(w, "filesel",
				NULL, 0);
#ifdef EDITRES
		add_edit_res_handler(*dialog);
#endif
		XtAddCallback(*dialog, XmNokCallback, file_ok_cb, &reply);
		XtAddCallback(*dialog, XmNcancelCallback, file_cancel_cb, &reply);
		XtAddCallback(*dialog, XmNhelpCallback, file_help_cb, NULL);
		WM_DELETE_WINDOW = XmInternAtom(XtDisplay(root),
			"WM_DELETE_WINDOW",
			False);
		XmAddWMProtocolCallback(XtParent(*dialog),
			WM_DELETE_WINDOW, file_cancel_cb,
			&reply);
		title = XmStringCreateSimple("Select A File");
		XtVaSetValues(*dialog,
			XmNdialogStyle,		XmDIALOG_FULL_APPLICATION_MODAL,
			XmNdialogTitle, 	title,
			NULL);
		XmStringFree(title);
	}

	dialog_text = XmFileSelectionBoxGetChild(*dialog, XmDIALOG_TEXT);

	s = XmStringCreateSimple(opn);

	XtVaSetValues(*dialog,
		XmNokLabelString,	s,
		NULL);

	XmStringFree(s);

	XtManageChild(*dialog);

	if(reset) {
		XtVaGetValues(*dialog,
			XmNdirMask,	&dir_mask,
			NULL);

		XmFileSelectionDoSearch(*dialog, dir_mask);

		XmStringFree(dir_mask);
	}

	last_pos = XmTextFieldGetLastPosition(dialog_text);
	
	XmTextFieldSetInsertionPosition(dialog_text, last_pos);

	XmTextFieldShowPosition(dialog_text, last_pos);

	XtVaSetValues(XtParent(*dialog), XmNtransientFor, w, NULL);
	XtPopup(XtParent(*dialog), XtGrabNone);

	XmProcessTraversal(dialog_text, XmTRAVERSE_CURRENT);

	while (!reply) {
		poll(&reply);
		if(reply == YES) {
			file_name = XmTextFieldGetString(dialog_text);
			if(	!*file_name
			||	file_name[strlen(file_name) - 1] == '/') {
				beep();
				reply = 0;
				continue;
			}
		}
	}
	if(reply == YES) {
		return file_name;
	} else {
		return NULL;
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * startup_dialog: dialog to get the command line to run and a file name to edit
 * interactively if required. Note that the widget cmd_form
 * is needed even if we have a command line - it becomes the unmanaged work area
 * for the file selection box which makes the Empty File button go in the right place.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void	startup_quit_cb(CALLBACK_ARGS),
		startup_help_cb(CALLBACK_ARGS);
	
void startup_dialog(Widget w, char **cmd_line, char **file_name)
{
	Widget dialog;
	Widget empty_file, cmd_form, cmd_label, cmd_text, file_text;
	XmString s;
	Atom WM_DELETE_WINDOW;
	static int reply;	/* 0 = not replied/YES/NO*/
	Boolean need_cmd_line = False, need_file_name = False;
	XmTextPosition last_pos;
	if(!global_options.edit_only && !**cmd_line) {/* explicit empty command line - put-up dialog */
		if(*cmd_line) {
			XtFree(*cmd_line);
		}
		need_cmd_line = True;
	}
	if(*file_name && !**file_name) { /* explicit empty filename - put-up file dialog */
		need_file_name = True;
	}

	if(!need_cmd_line && !need_file_name) {
		return;
	}

	reply = 0;

	if(need_file_name) {
		dialog =XmCreateFileSelectionDialog(w, "xpp-Start-up-Options", NULL, 0);
		s = XmStringCreateSimple("Please select a file to open:");
		XtVaSetValues(dialog,
			XmNselectionLabelString, 	s,
			NULL);
		XmStringFree(s);
	} else {
		dialog = XmCreateMessageDialog(w, "startup-dialog", NULL, 0);
		s = XmStringCreateSimple("   OK   ");
		XtVaSetValues(dialog,
			XmNokLabelString,	s,
			NULL);
		XmStringFree(s);
	}
#ifdef EDITRES
	add_edit_res_handler(dialog);
#endif
	XtVaSetValues(dialog,
		XmNdialogStyle,	XmDIALOG_FULL_APPLICATION_MODAL,
		NULL);


	XtAddCallback(dialog, XmNokCallback, file_ok_cb, &reply);
	XtAddCallback(dialog, XmNcancelCallback,  startup_quit_cb, &reply);
	XtAddCallback(dialog, XmNhelpCallback, need_file_name ? file_help_cb : startup_help_cb, NULL);
	WM_DELETE_WINDOW = XmInternAtom(XtDisplay(root),
		"WM_DELETE_WINDOW",
		False);
	XmAddWMProtocolCallback(XtParent(dialog),
		WM_DELETE_WINDOW, file_cancel_cb,
		&reply);
	
	s = XmStringCreateSimple("Cancel");

	XtVaSetValues(dialog,
			XmNcancelLabelString,	s,
			NULL);
	XmStringFree(s);

	cmd_form = XtVaCreateManagedWidget("command-line-form",
			xmFormWidgetClass,
			dialog,
			NULL);

	if(need_cmd_line) {

		s =XmStringCreateSimple("Please enter the command line you wish to run:");
		cmd_label =  XtVaCreateManagedWidget("command-line-label:",
			xmLabelWidgetClass,		cmd_form,
			XmNlabelString,			s,
			XmNtopAttachment,		XmATTACH_FORM,
			XmNleftAttachment,			XmATTACH_FORM,
			XmNrightAttachment,		XmATTACH_FORM,
			XmNalignment,			XmALIGNMENT_BEGINNING,
			NULL);

		if(need_file_name) {
			XtVaSetValues(dialog,
				XmNchildPlacement,		XmPLACE_BELOW_SELECTION,
				NULL);
		} else {
			XtUnmanageChild(cmd_label);
			XtVaSetValues(dialog,
				XmNmessageString,		s,
				NULL);
		}

		XmStringFree(s);

		cmd_text =  XtVaCreateManagedWidget("startup-command-line",
			xmTextFieldWidgetClass,		cmd_form,
			XmNtopAttachment,		XmATTACH_WIDGET,
			XmNtopWidget,			cmd_label,
			XmNbottomAttachment,		XmATTACH_FORM,
			XmNleftAttachment,			XmATTACH_FORM,
			XmNrightAttachment,		XmATTACH_FORM,
			XmNcolumns,			30,
			NULL);

		XtAddCallback(cmd_text, XmNactivateCallback, file_ok_cb, &reply);

	} else {
		XtUnmanageChild(cmd_form);
	}

	if(need_file_name) {
		s =XmStringCreateSimple("Empty File");
		empty_file = XtVaCreateManagedWidget("empty-file",
			xmPushButtonWidgetClass,
			dialog,
			XmNlabelString,			s,
			NULL);
		XtAddCallback(empty_file, XmNactivateCallback, file_cancel_cb, &reply);
		XmStringFree(s);
	}

	XtManageChild(dialog);


	XtPopup(XtParent(dialog), XtGrabNone);

	if(need_file_name) {
		file_text = XmFileSelectionBoxGetChild(dialog, XmDIALOG_TEXT);
		XmProcessTraversal(file_text, XmTRAVERSE_CURRENT);
		last_pos = XmTextFieldGetLastPosition(file_text);
		XmTextFieldSetInsertionPosition(file_text, last_pos);
		XmTextFieldShowPosition(file_text, last_pos);
	} else {
		XmProcessTraversal(cmd_text, XmTRAVERSE_CURRENT);
	}

	if(need_cmd_line) {
		last_pos = XmTextFieldGetLastPosition(cmd_text);
		XmTextFieldSetInsertionPosition(cmd_text, last_pos);
		XmTextFieldShowPosition(cmd_text, last_pos);
	}

	while (!reply) {
		poll(&reply);
		if(reply == YES && need_file_name)  {
			*file_name = XmTextFieldGetString(file_text);
			if(	!**file_name
			||	(*file_name)[strlen(*file_name) - 1] == '/') {
				beep();
				XmProcessTraversal(file_text, XmTRAVERSE_CURRENT);
				reply = 0;
				continue;
			}
		} else if (need_file_name) { /* REPLY = NO - user wants an empty file */
			*file_name = 0;
		}
		if(need_cmd_line) {
			*cmd_line = XmTextFieldGetString(cmd_text);
			if(!**cmd_line) {
				beep();
				reply = 0;
				XtManageChild(dialog);
				XmProcessTraversal(cmd_text, XmTRAVERSE_CURRENT);
				continue;
			}
		}
	}
#ifndef LISTWIDGETS
	XtDestroyWidget(XtParent(dialog));
#else
	XtPopdown(XtParent(dialog));
#endif

}
/*
 * Callbacks for the file and start-up dialogs:
 */

static void file_ok_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	NAT *reply = cbd;
	*reply = YES;
}

static void file_cancel_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	NAT *reply = cbd;
	*reply = NO;
}
static void file_help_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	help_dialog(root, Help_File_Selection_Box);
}

static void startup_help_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	help_dialog(root, Help_Command_Line_Dialogue);
}

static void startup_quit_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	exit(0);
}

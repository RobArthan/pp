
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$ 
 *
 * msg.c - support for message dialogues for the X/Motif ProofPower Interface
 *
 * (c) ICL 1993
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _msg
#define YES 1
#define NO 2
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files: 
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#include <stdio.h>
#include <ctype.h>
#include "xpp.h"

#define MSG_LINE_LEN 40
#define HELP_LINE_LEN 60
#define HELP_SCREEN_HEIGHT 32

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Private functions:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Widget get_top_shell(Widget w)
{
	while (w && !XtIsWMShell(w)) {
		w = XtParent(w);
	}
	return w;
}

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
static XmString format_msg(char *msg, NAT line_len)
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
	static Widget dialog_w, pane, help_text;
	static void help_cb();
	Atom WM_DELETE_WINDOW;
	Dimension h;
	Arg args[8];
	if(!dialog_w) {
		dialog_w = XtVaCreatePopupShell("xpp-Help",
			xmDialogShellWidgetClass, get_top_shell(w),
			XmNdeleteResponse, XmUNMAP,
			NULL);
		pane = XtVaCreateWidget("pane", xmPanedWindowWidgetClass, dialog_w,
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
		help_text = XmCreateScrolledText(pane, "help_text", args, 8);
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
		XtAddCallback(widget, XmNactivateCallback, help_cb, dialog_w);
		XtManageChild(form);
		XtVaGetValues(widget, XmNheight, &h, NULL);
		XtVaSetValues(form, XmNpaneMaximum, h, XmNpaneMinimum, h, NULL);
	}
	XmTextSetString(help_text, str);
	XtManageChild(pane);
	XtPopup(dialog_w, XtGrabNone);
}

static void help_cb(Widget widget, Widget shell)
{
	XtPopdown(shell);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * yes_no_dialog: ask a question with a mandatory yes/no answer
 * **** **** **** **** **** **** **** **** **** **** **** **** */
Boolean yes_no_dialog(Widget w, char *question)
{
	static Widget dialog;
	XmString text, yes, no, confirm;
	Atom WM_DELETE_WINDOW;
	static NAT reply;
	/* 0 = not replied; otherwise YES/NO */
	static void yes_no_cb(), yes_no_destroy_cb();
	reply = 0;
	if (!dialog) {
		dialog = XmCreateQuestionDialog(w, "yes_no", NULL, 0);
		yes = XmStringCreateSimple("Yes");
		no = XmStringCreateSimple("No");
		confirm = XmStringCreateSimple("Confirm");
		XtVaSetValues(dialog,
			XmNdialogStyle,		XmDIALOG_FULL_APPLICATION_MODAL,
			XmNokLabelString,	yes,
			XmNcancelLabelString,	no,
			XmNdialogTitle, 	confirm,
			XmNdialogType,		XmDIALOG_QUESTION,
			NULL);
		XtDestroyWidget(
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
		XmStringFree(confirm);
	}
	text = format_msg(question, MSG_LINE_LEN);
	XtVaSetValues(dialog, XmNmessageString, text, NULL);
	XmStringFree(text);
	XtManageChild(dialog);
	XtPopup(XtParent(dialog), XtGrabNone);
	XBell(XtDisplay(root), 50);
	while (!reply) {
		if(XtAppPending(app)) {
			XtAppProcessEvent(app, XtIMAll);
		}
	};
	XtPopdown(XtParent(dialog));
	return reply == YES;
}

static void yes_no_cb(Widget w, NAT *reply, XmAnyCallbackStruct *cbs)
{
	switch (cbs->reason) {
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
static void yes_no_destroy_cb(Widget w, NAT *reply, XmAnyCallbackStruct *cbs)
{
	*reply = NO;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * ok_dialog: error message which the user must confirm
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void ok_dialog(Widget w, char *msg)
{
	static Widget dialog;
	XmString text, ok, error;
	Atom WM_DELETE_WINDOW;
	static Bool confirmed;
	static void ok_cb();
	confirmed = False;
	if (!dialog) {
		dialog = XmCreateQuestionDialog(w, "ok", NULL, 0);
		ok = XmStringCreateSimple("OK");
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
		XtDestroyWidget(
			XmMessageBoxGetChild(dialog, XmDIALOG_HELP_BUTTON));
		XtDestroyWidget(
			XmMessageBoxGetChild(dialog, XmDIALOG_CANCEL_BUTTON));
		XtAddCallback(dialog, XmNokCallback, ok_cb, &confirmed);
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
	XtPopup(XtParent(dialog), XtGrabNone);
	XBell(XtDisplay(root), 50);
	while (!confirmed) {
		if(XtAppPending(app)) {
			XtAppProcessEvent(app, XtIMAll);
		}
	};
	XtPopdown(XtParent(dialog));
}

static void ok_cb(Widget w, Bool *confirmed, XmAnyCallbackStruct *cbs)
{
	*confirmed = True;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * file_dialog: dialog to get a file name, via a FileSelectionDialog.
 * `opn' is the label to us on the ``OK'' button (i.e. it's
 * ``Save'' or ``Open'' or whatever.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static char *file_name;

char *file_dialog(Widget w, char *opn)
{
	static Widget dialog;
	XmString ok, title;
	void file_sel_cb();
	static NAT reply;
	/* 0 = not replied; */

	reply = 0;


	if (!dialog) {
		dialog = XmCreateFileSelectionDialog(w, "filesel",
				NULL, 0);
		XtAddCallback(dialog, XmNokCallback, file_sel_cb, &reply);
		XtAddCallback(dialog, XmNcancelCallback, file_sel_cb, &reply);

		title = XmStringCreateSimple("Select A File");

		XtVaSetValues(dialog,
			XmNdialogStyle,		XmDIALOG_FULL_APPLICATION_MODAL,
			XmNdialogTitle, 	title,
			NULL);

		XmStringFree(title);

	};

	ok = XmStringCreateSimple(opn);

	XtVaSetValues(dialog,
		XmNokLabelString,	ok,
		NULL);

	XmStringFree(ok);

	XtManageChild(dialog);

	XtPopup(XtParent(dialog), XtGrabNone);

	while (!reply) {
		if(XtAppPending(app)) {
			XtAppProcessEvent(app, XtIMAll);
		}
	};

	XtPopdown(XtParent(dialog));

	if(reply == YES) {
		return file_name;
	} else {
		return NULL;
	};

}


void file_sel_cb(
	Widget w,
	NAT *reply,
	XmFileSelectionBoxCallbackStruct *cbs)
{
	switch (cbs->reason) {
		case XmCR_OK:
			(void) XmStringGetLtoR(cbs->value,
					XmSTRING_DEFAULT_CHARSET,
					&file_name);
			*reply = YES;
			break;
		case XmCR_CANCEL:
			*reply = NO;
			break;
		default:
			break;
	}
}

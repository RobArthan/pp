
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

#define MSG_LINE_LEN 50

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
 * The following put's new lines in a copy of its string argument
 * at appropriate places to fit in lines of length MSG_LINE_LEN.
 * and then makes a compound string of it with the default char set.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static XmString format_msg(char *msg)
{
	char *buf;
	char *p1, *p2, *pm;
	unsigned cursor;
	XmString str;
	if((buf = XtMalloc(strlen(msg) + 1)) == NULL) {
		return(XmStringCreateLtoR(buf, XmFONTLIST_DEFAULT_TAG));
	}
	for(	p1 = buf, p2 = buf, pm = msg, cursor=0;
		*p2 = *pm;
		++p2, ++pm ) {
		++cursor;
		if(cursor >= MSG_LINE_LEN) {
			if(*p1 == ' ') {
				*p1 = '\n';
				cursor = p2 - p1 - 1;
			}
		};
		if(*p2 == ' ') {
			p1 = p2;
		}
	}
	str = XmStringCreateLtoR(buf, XmFONTLIST_DEFAULT_TAG);
	XtFree(buf);
	return str;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * help_dialog: put up an information window without grabbing control
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void help_dialog(Widget w, char *str)
{
	Widget dialog_w, pane, help_text, form, widget;
	extern void ok_reply();
	Arg args[9];
	char buf[BUFSIZ];

	dialog_w = XtVaCreatePopupShell("Help",
		xmDialogShellWidgetClass, get_top_shell(w),
		XmNdeleteResponse, XmDESTROY,
		NULL);

	pane = XtVaCreateWidget("pane", xmPanedWindowWidgetClass, dialog_w,
		/* XmNsashWidth,  1, /* PanedWindow won't let us set these to 0! */
		/* XmNsashHeight, 1, /* Make small so user doesn't try to resize */
		NULL);


	XtSetArg(args[0], XmNscrollVertical,        True);
	XtSetArg(args[1], XmNscrollHorizontal,      False);
	XtSetArg(args[2], XmNeditMode,              XmMULTI_LINE_EDIT);
	XtSetArg(args[3], XmNeditable,              False);
	XtSetArg(args[4], XmNcursorPositionVisible, False);
	XtSetArg(args[5], XmNwordWrap,              True);
	XtSetArg(args[6], XmNvalue,                 str);
	XtSetArg(args[7], XmNrows,                  5);
	help_text = XmCreateScrolledText(pane, "help_text", args, 8);

	XtManageChild(help_text);

	form = XtVaCreateWidget("form", xmFormWidgetClass, pane,
		XmNfractionBase,    3,
		NULL);

	widget = XtVaCreateManagedWidget("Ok",
		xmPushButtonGadgetClass, form,
		XmNtopAttachment,        XmATTACH_FORM,
		XmNbottomAttachment,     XmATTACH_FORM,
		XmNleftAttachment,       XmATTACH_POSITION,
		XmNleftPosition,         1,
		XmNrightAttachment,      XmATTACH_POSITION,
		XmNrightPosition,        2,
		XmNshowAsDefault,        True,
		XmNdefaultButtonShadowThickness, 1,
		NULL);
	XtAddCallback(widget, XmNactivateCallback, ok_reply, dialog_w);

	XtManageChild(form);
	{
		Dimension h;
		XtVaGetValues(widget, XmNheight, &h, NULL);
		XtVaSetValues(form, XmNpaneMaximum, h, XmNpaneMinimum, h, NULL);
	}

	XtManageChild(pane);

	XtPopup(dialog_w, XtGrabNone);
}

void ok_reply(Widget widget, Widget shell)
{
	XtDestroyWidget(shell);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * yes_no_dialog: ask a question with a mandatory yes/no answer
 * **** **** **** **** **** **** **** **** **** **** **** **** */
Boolean yes_no_dialog(Widget w, char *question)
{
	static Widget dialog;
	XmString text, yes, no, confirm;
	static NAT reply;
	/* 0 = not replied; otherwise YES/NO */
	extern void yes_no_cb();

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
			NULL);
		XtSetSensitive(
			XmMessageBoxGetChild(dialog, XmDIALOG_HELP_BUTTON), False);
		XtAddCallback(dialog, XmNokCallback, yes_no_cb, &reply);
		XtAddCallback(dialog, XmNcancelCallback, yes_no_cb, &reply);
		XmStringFree(yes);
		XmStringFree(no);
		XmStringFree(confirm);
	}
	text = format_msg(question);
	XtVaSetValues(dialog, XmNmessageString, text, NULL);
	XmStringFree(text);
	XtManageChild(dialog);
	XtPopup(XtParent(dialog), XtGrabNone);

	while (!reply) {
		if(XtAppPending(app)) {
			XtAppProcessEvent(app, XtIMAll);
		}
	};

	XtPopdown(XtParent(dialog));

	return reply == YES;
}

void yes_no_cb(w, reply, cbs)
Widget w;
NAT *reply;
XmAnyCallbackStruct *cbs;
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

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * ok_dialog: error message which the user must confirm
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void ok_dialog(Widget w, char *msg)
{
	static Widget dialog;
	XmString text, ok, error;
	static NAT reply;
	/* 0 = not replied; */

	reply = 0;

	if (!dialog) {
		dialog = XmCreateQuestionDialog(w, "ok", NULL, 0);
		ok = XmStringCreateSimple("OK");
		error = XmStringCreateSimple("Error");
		XtVaSetValues(dialog,
			XmNdialogStyle,		XmDIALOG_FULL_APPLICATION_MODAL,
			XmNokLabelString,	ok,
			XmNdialogTitle, 	error,
			NULL);
		XtSetSensitive(
			XmMessageBoxGetChild(dialog, XmDIALOG_HELP_BUTTON), False);
		XtSetSensitive(
			XmMessageBoxGetChild(dialog, XmDIALOG_CANCEL_BUTTON), False);
		XtAddCallback(dialog, XmNokCallback, yes_no_cb, &reply);
		XmStringFree(ok);
		XmStringFree(error);
	}
	text = format_msg(msg);
	XtVaSetValues(dialog, XmNmessageString, text, NULL);
	XmStringFree(text);
	XtManageChild(dialog);
	XtPopup(XtParent(dialog), XtGrabNone);

	XBell(XtDisplay(w), 50);

	while (!reply) {
		if(XtAppPending(app)) {
			XtAppProcessEvent(app, XtIMAll);
		}
	};
	XtPopdown(XtParent(dialog));
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


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
#include <Xm/DialogS.h>
#include <Xm/MainW.h>
#include <Xm/RowColumn.h>
#include <Xm/Text.h>
#include <Xm/TextF.h>
#include <Xm/PushBG.h>
#include <Xm/Form.h>
#include <Xm/LabelG.h>
#include <Xm/MessageB.h>
#include <Xm/PanedW.h>
#include <Xm/FileSB.h>


#include "xpp.h"

Widget get_top_shell(w)
Widget w;
{
	while (w && !XtIsWMShell(w)) {
		w = XtParent(w);
	}
	return w;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * help_dialog: put up an information window without grabbing control
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void help_dialog(w, str)
Widget w;
char *str;
{
	Widget dialog_w, pane, help_text, form, widget;
	extern void ok_reply();
	Arg args[9];
	char buf[BUFSIZ];

	TRACE("help_dialog");

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

	LEAVE("help_dialog");
}

void ok_reply(widget, shell)
Widget widget, shell;
{
	TRACE("ok_reply");

	XtDestroyWidget(shell);

	LEAVE("ok_reply");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * yes_no_dialog: ask a question with a mandatory yes/no answer
 * **** **** **** **** **** **** **** **** **** **** **** **** */
BOOL yes_no_dialog(w, question)
Widget w;
char *question;
{
	static Widget dialog;
	XmString text, yes, no, confirm;
	static NAT reply;
	/* 0 = not replied; otherwise YES/NO */
	extern void yes_no_cb();

	TRACE("yes_no_dialog");

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
	text = XmStringCreateSimple(question);
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

	RETURN("yes_no_dialog", reply == YES);
}

void yes_no_cb(w, reply, cbs)
Widget w;
NAT *reply;
XmAnyCallbackStruct *cbs;
{
	TRACE("yes_no_cb");

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
	LEAVE("yes_no_cb");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * ok_dialog: error message which the user must confirm
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void ok_dialog(w, msg)
Widget w;
char *msg;
{
	static Widget dialog;
	XmString text, ok, error;
	static NAT reply;
	/* 0 = not replied; */
	TRACE("ok_dialog");

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
	text = XmStringCreateSimple(msg);
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
	LEAVE("ok_dialog");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * file_dialog: dialog to get a file name, via a FileSelectionDialog.
 * `opn' is the label to us on the ``OK'' button (i.e. it's
 * ``Save'' or ``Open'' or whatever.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static char *file_name;

char *file_dialog(w, opn)
Widget w;
char *opn;
{
	static Widget dialog;
	XmString ok, title;
	void file_sel_cb();
	static NAT reply;
	/* 0 = not replied; */

	TRACE("file_dialog");
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
		RETURN("file_dialog", file_name);
	} else {
		RETURN("file_dialog", NULL);
	};

}


void file_sel_cb(w, reply, cbs)
Widget w;
NAT *reply;
XmFileSelectionBoxCallbackStruct *cbs;
{
	TRACE("file_sel_cb");

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

	LEAVE("file_sel_sb");
}

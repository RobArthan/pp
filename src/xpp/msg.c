
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$ 
 *
 * msg.h - support for message dialogues for the X/Motif ProofPower Interface
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
#include <Xm/PushBG.h>
#include <Xm/Form.h>
#include <Xm/LabelG.h>
#include <Xm/MessageB.h>
#include <Xm/PanedW.h>


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
	Widget help_dialog, pane, help_text, form, widget;
	extern void ok_reply();
	Arg args[9];
	char buf[BUFSIZ];

	help_dialog = XtVaCreatePopupShell("Help",
		xmDialogShellWidgetClass, get_top_shell(w),
		XmNdeleteResponse, XmDESTROY,
		NULL);

	pane = XtVaCreateWidget("pane", xmPanedWindowWidgetClass, help_dialog,
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
	XtAddCallback(widget, XmNactivateCallback, ok_reply, help_dialog);

	XtManageChild(form);
	{
		Dimension h;
		XtVaGetValues(widget, XmNheight, &h, NULL);
		XtVaSetValues(form, XmNpaneMaximum, h, XmNpaneMinimum, h, NULL);
	}

	XtManageChild(pane);

	XtPopup(help_dialog, XtGrabNone);
}

void ok_reply(widget, shell)
Widget widget, shell;
{
	XtDestroyWidget(shell);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * yes_no_dialog: ask a question with a mandatory yes/no answer
 * **** **** **** **** **** **** **** **** **** **** **** **** */
BOOL yes_no_dialog(w, question)
Widget w;
char *question;
{
	static Widget dialog;
	XmString text, yes, no;
	int reply = 0;
	/* 0 = not replied; otherwise YES/NO */
	extern void yes_no_cb();

	if (!dialog) {
		dialog = XmCreateQuestionDialog(w, "dialog", NULL, 0);
		yes = XmStringCreateSimple("Yes");
		no = XmStringCreateSimple("No");
		XtVaSetValues(dialog,
			XmNdialogStyle,		XmDIALOG_FULL_APPLICATION_MODAL,
			XmNokLabelString,	yes,
			XmNcancelLabelString,	no,
			NULL);
		XtSetSensitive(
			XmMessageBoxGetChild(dialog, XmDIALOG_HELP_BUTTON), False);
		XtAddCallback(dialog, XmNokCallback, yes_no_cb, &reply);
		XtAddCallback(dialog, XmNcancelCallback, yes_no_cb, &reply);
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
	return (reply == YES);
}

void yes_no_cb(w, reply, cbs)
Widget w;
BOOL *reply;
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
			return;
	}
}

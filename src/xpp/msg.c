
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

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files: 
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#include "xpp.h"

#include <stdio.h>
#include <ctype.h>
#include <Xm/DialogS.h>
#include <Xm/MainW.h>
#include <Xm/RowColumn.h>
#include <Xm/Text.h>
#include <Xm/PushBG.h>
#include <Xm/Form.h>
#include <Xm/LabelG.h>
#include <Xm/PanedW.h>


Widget
GetTopShell(w)
Widget w;
{
	while (w && !XtIsWMShell(w)) {
		w = XtParent(w);
	}
	return w;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * msg_dialog: general message dialogue routine
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void msg_dialog(w, str)
Widget w;
char *str;
{
	Widget help_dialog, pane, help_text, form, sep, widget, label;
	extern void DestroyShell();
	Pixmap pixmap;
	Pixel fg, bg;
	Arg args[9];
	int i;
	char *p, buf[BUFSIZ];

	/* Set up a DialogShell as a popup window.  Set the delete
	 * window protocol response to XmDESTROY to make sure that
	 * the window goes away appropriately.  Otherwise, it's XmUNMAP
	 * which means it'd be lost forever, since we're not storing
	 * the widget globally or statically to this function.
	 */
	help_dialog = XtVaCreatePopupShell("Help",
		xmDialogShellWidgetClass, GetTopShell(w),
		XmNdeleteResponse, XmDESTROY,
		NULL);

	/* Create a PanedWindow to manage the stuff in this dialog. */
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

/* Create form to act as the action area for the dialog */
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
	XtAddCallback(widget, XmNactivateCallback, DestroyShell, help_dialog);

	/* Fix the action area pane to its current height -- never let it resize */
	XtManageChild(form);
	{
		Dimension h;
		XtVaGetValues(widget, XmNheight, &h, NULL);
		XtVaSetValues(form, XmNpaneMaximum, h, XmNpaneMinimum, h, NULL);
	}

	XtManageChild(pane);

	XtPopup(help_dialog, XtGrabNone);
}

void
DestroyShell(widget, shell)
Widget widget, shell;
{
	XtDestroyWidget(shell);
}

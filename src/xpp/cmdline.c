
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$
 *
 * cmdline.c -  single line command window for the X/Motif
 *		ProofPower Interface
 *
 * (c) ICL 1994
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _cmdline
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


#include <stdio.h>

#include "xpp.h"
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * static data 
 * **** **** **** **** **** **** **** **** **** **** **** **** */

typedef struct{Widget shell_w, manager_w, cmd_w;} CmdLineData;

static CmdLineData cmd_line_data;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_cmd_line: attach a tool allowing entry of single line
 * commands for execution via `send_to_application' in mainw.c.
 *
 * The tool is a popup shell looking something like:
 * -------------------------------
 * | Command:   | command string |
 * -------------------------------
 * `command string' is a text widget in which the user can
 * prepare a line of text for execution.
 * `Command' is a push button which will cause the command
 * string to be executed (with a new-line tagged on the end).
 *
 * The parameter is a widget to be the parent of the
 * popup shell. It should be a text widget from which the translations
 * and font for the text widget can be borrowed.
 *
 * Because we want to borrow the translations from a multi-line text
 * widget, it seems that we cannot make the text area here a
 * text field or single-line text widget. However, we do want
 * carriage return in the text area to cause the command to be
 * executed. The solution is: (a) to use a multi-line text widget
 * with XmNrows set to 1; (b) copy the translations from the
 * argument text widget; and (c) override the translations of
 * the resulting widget with "<Key>Return: activate()"
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void add_cmd_line(Widget text_w)
{
	Widget shell, cmd_btn, cmd_form, cmd_text;

	XtTranslations translations;
	XmFontList fontlist;

	static void
		cmd_line_cb();


	if((cmd_line_data.shell_w) != NULL) {
		XtManageChild(cmd_line_data.manager_w);
		XtPopup(cmd_line_data.shell_w, XtGrabNone);
		return;
	};

	shell = XtVaCreatePopupShell("xpp_Command_Line",
		xmDialogShellWidgetClass, root,
		NULL); 


	cmd_form = XtVaCreateWidget("command_line_form",
		xmFormWidgetClass, 		shell,
		XmNautoUnmanage,			False,
		XmNfractionBase,		12,
		NULL);

	cmd_btn = XtVaCreateManagedWidget("Command:",
		xmPushButtonWidgetClass,		cmd_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		2,
		XmNalignment,			XmALIGNMENT_BEGINNING,
		NULL);

	cmd_text = XtVaCreateManagedWidget("cmd_text",
		xmTextWidgetClass,		cmd_form,
		XmNeditMode,			XmMULTI_LINE_EDIT,
		XmNrows,			1,
		XmNcolumns,			40,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		2,
		XmNcolumns,			40,
		NULL);


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up static data to contain necessary widget handles:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	cmd_line_data.cmd_w = cmd_text;
	cmd_line_data.shell_w = shell;
	cmd_line_data.manager_w = cmd_form;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * copy various aspects of argument text widget behaviour
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtVaGetValues(text_w, XmNtranslations, &translations, NULL);
	if(translations != NULL) {
		XtUninstallTranslations(cmd_text);
		XtVaSetValues(cmd_text, XmNtranslations, translations, NULL);
	}

	XtVaGetValues(text_w, XmNfontList, &fontlist, NULL);
	if(fontlist != NULL) {
		XtVaSetValues(cmd_text, XmNfontList, fontlist, NULL);
	}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Make return in the text widget activate it
 **** **** **** **** **** **** **** **** **** **** **** **** */
	XtOverrideTranslations(cmd_text,
		XtParseTranslationTable("<Key>Return: activate()"));

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add callbacks.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtAddCallback(cmd_btn, XmNactivateCallback,
		cmd_line_cb, (XtPointer)(&cmd_line_data));

	XtAddCallback(cmd_text, XmNactivateCallback,
		cmd_line_cb, (XtPointer)(&cmd_line_data));

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Manage everything:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtManageChild(cmd_form);
	XtPopup(shell, XtGrabNone);

}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * the callback.
 * selects the command string after executing it to make it
 * easier to overtype the next command if the user is doing
 * many one line commands in a hurry.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void cmd_line_cb(
	Widget				w,
	CmdLineData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	char *cmd;
	static char *nl = "\n";
	if((cmd = XmTextGetString(cbdata->cmd_w)) != NULL) {
		send_to_application(cmd, strlen(cmd));
		send_to_application(nl, 1);
		XtFree(cmd);
		XmTextSetSelection(
			cbdata->cmd_w,
			0,
			XmTextGetLastPosition(cbdata->cmd_w),
			CurrentTime);
	}
}





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

typedef struct{Widget shell_w, manager_w, list_w, cmd_w;} CmdLineData;

static CmdLineData cmd_line_data;

char *no_command_to_add_msg =
"There is no text in the command line to add to the list.";

char *nothing_to_delete_msg =
"No item in the list has been selected.";

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_cmd_line: attach a tool allowing entry of single line
 * commands for execution via `send_to_application' in mainw.c.
 *
 * The tool is a popup shell looking something like:
 * -------------------------------
 * |  remembered command 1              |
 * |  remembered command 2              |
 * |  ...                               |
 * |  command string                    |
 * |  Execute Add Dismiss Delete Help   |
 * -------------------------------
 * `command string' is a text widget in which the user can
 * prepare a line of text for execution.
 * The `remembered commands' are in a scrolled list widget.
 * Selecting a remembered command causes it to be entered into
 * the command string.
 * `Execute' is a push button which will cause the command
 * string to be executed (with a new-line tagged on the end).
 * `Add' is a push-button which will cause the contents of the command
 * string to be added to the list.
 * The parameter is a widget to be the parent of the
 * popup shell. It should be a text widget from which the translations
 * and font for the text widget can be borrowed.
 *
 * It seems that we cannot make the text area here a
 * text field or single-line text widget, because these do not support the
 * insert-string action (?). However, we do want
 * carriage return in the text area to cause the command to be
 * executed. The solution is: (a) to use a multi-line text widget
 * with XmNrows set to 1; (b) copy the translations from the
 * argument text widget; and (c) override the translations of
 * the resulting widget with "<Key>Return: activate()"
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void add_cmd_line(Widget text_w)
{
	Widget shell, paned, list_w, cmd_text,
		btn_form, exec_btn, add_btn, delete_btn, dismiss_btn, help_btn;
	Arg args[12];
	int i;

	XmFontList fontlist;

	static void
		get_initial_command_line_list(Widget list_w),
		list_select_cb(),
		exec_cb(),
		add_cb(),
		delete_cb(),
		dismiss_cb(),
		help_cb();


	if((cmd_line_data.shell_w) != NULL) {
		XtManageChild(cmd_line_data.manager_w);
		XtPopup(cmd_line_data.shell_w, XtGrabNone);
		return;
	};

	shell = XtVaCreatePopupShell("xpp-Command-Line",
		transientShellWidgetClass,	root,
		XmNdeleteResponse,		XmUNMAP,
		NULL); 

	paned = XtVaCreateWidget("command-paned",
		xmPanedWindowWidgetClass, 	shell,
		NULL);


	i = 0;
	XtSetArg(args[i], XmNautomaticSelection,		False); ++i;
	XtSetArg(args[i], XmNscrollBarDisplayPolicy,	XmSTATIC); ++i;
	XtSetArg(args[i], XmNselectionPolicy,		XmBROWSE_SELECT); ++i;
	XtSetArg(args[i], XmNlistSizePolicy,		XmCONSTANT); ++i;
	XtSetArg(args[i], XmNvisibleItemCount,		4); ++i;

	list_w = XmCreateScrolledList(paned, "command-list", args, i);

	get_initial_command_line_list(list_w);

	cmd_text = XtVaCreateManagedWidget("cmd_text",
		xmTextWidgetClass,		paned,
		XmNeditMode,			XmMULTI_LINE_EDIT,
		XmNrows,			1,
		XmNcolumns,			40,
		NULL);


	btn_form = XtVaCreateWidget("command_line_form",
		xmFormWidgetClass, 		paned,
		XmNautoUnmanage,		False,
		XmNfractionBase,		15,
		NULL);

	exec_btn = XtVaCreateManagedWidget("Execute",
		xmPushButtonWidgetClass,	btn_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		3,
		NULL);


	add_btn = XtVaCreateManagedWidget("Add",
		xmPushButtonWidgetClass,	btn_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		3,
		XmNrightPosition,		6,
		NULL);

	delete_btn = XtVaCreateManagedWidget("Delete",
		xmPushButtonWidgetClass,	btn_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		6,
		XmNrightPosition,		9,
		NULL);

	dismiss_btn = XtVaCreateManagedWidget("Dismiss",
		xmPushButtonWidgetClass,	btn_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		9,
		XmNrightPosition,		12,
		NULL);

	help_btn = XtVaCreateManagedWidget("Help",
		xmPushButtonWidgetClass,	btn_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		12,
		NULL);


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up static data to contain necessary widget handles:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	cmd_line_data.cmd_w = cmd_text;
	cmd_line_data.shell_w = shell;
	cmd_line_data.list_w = list_w;
	cmd_line_data.manager_w = paned;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up text widget translations and font
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtOverrideTranslations(cmd_text, text_translations);

	XtVaGetValues(text_w, XmNfontList, &fontlist, NULL);


	if(fontlist != NULL) {
		XtVaSetValues(cmd_text, XmNfontList, fontlist, NULL);
		XtVaSetValues(list_w, XmNfontList, fontlist, NULL);
	}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Make return in the text widget activate it
 **** **** **** **** **** **** **** **** **** **** **** **** */
	XtOverrideTranslations(cmd_text,
		XtParseTranslationTable("<Key>Return: activate()"));

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add callbacks.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtAddCallback(exec_btn, XmNactivateCallback,
		exec_cb, (XtPointer)(&cmd_line_data));

	XtAddCallback(cmd_text, XmNactivateCallback,
		exec_cb, (XtPointer)(&cmd_line_data));

	XtAddCallback(add_btn, XmNactivateCallback,
		add_cb, (XtPointer)(&cmd_line_data));

	XtAddCallback(delete_btn, XmNactivateCallback,
		delete_cb, (XtPointer)(&cmd_line_data));

	XtAddCallback(dismiss_btn, XmNactivateCallback,
		dismiss_cb, (XtPointer)(&cmd_line_data));

	XtAddCallback(help_btn, XmNactivateCallback,
		help_cb, (XtPointer)(&cmd_line_data));

	XtAddCallback(list_w, XmNdefaultActionCallback,
		list_select_cb, (XtPointer)(&cmd_line_data));

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Manage everything:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtManageChild(btn_form);
	XtManageChild(paned);
	XtManageChild(list_w);
	XtPopup(shell, XtGrabNone);
	/*fix_pane_height(cmd_text, cmd_text);*/
	fix_pane_height(btn_form, btn_form);

}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Set up the initial list (from the commandLineList resource)
 * which xpp.c has put into command_line_list. Note that the
 * mallocing for the space here probably cannot be avoided (unless
 * one knows that the Xt resource converters always return pointers
 * to writable areas of memory).
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void get_initial_command_line_list(Widget list_w)
{
	XmString s;
	Boolean last;
	char *list_items, *p, *q;
	if( !(list_items = XtMalloc(strlen(command_line_list) + 1)) ) {
		return;
	}
	strcpy(list_items, command_line_list);
	for(p = list_items, last = False; *p; p = last ? q : q + 1) {
		q = p;
		while (*q && *q != '\n') ++q;
		if(*q) {
			*q = '\0';
		} else {
			last = True;
		}
		XmListAddItem(list_w, s = XmStringCreateSimple(p), 0);
		XtFree(s);
	}
	XtFree(list_items);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * the callback for the execute button.
 * selects the command string after executing it to make it
 * easier to overtype the next command if the user is doing
 * many one line commands in a hurry.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void exec_cb(
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
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * the callback for selection in the list.
 * replaces the command line with the selected item.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void list_select_cb(
	Widget				w,
	CmdLineData			*cbdata,
	XmListCallbackStruct		*cbs)
{
	char *cmd = NULL;
	XmStringGetLtoR(cbs->item, XmSTRING_DEFAULT_CHARSET, &cmd);
	if(cmd) {
		XmTextSetString(cbdata->cmd_w, cmd);
		XtFree(cmd);
	} 
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * the callback for the add button.
 * adds the contents of the command line to the list.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void add_cb(
	Widget				w,
	CmdLineData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	char *cmd;
	XmString item;
	if((cmd = XmTextGetString(cbdata->cmd_w)) != NULL && *cmd) {
		item = XmStringCreateSimple(cmd);
		XmListAddItem(cbdata->list_w, item, 0);
		XmListSelectPos(cbdata->list_w, 0, False);
		XmListSetBottomPos(cbdata->list_w, 0);
		XmStringFree(item);
	} else {
		ok_dialog(root, no_command_to_add_msg);
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * the callback for the delete button.
 * deletes the selected item.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void delete_cb(
	Widget				w,
	CmdLineData			*cbdata,
	XmAnyCallbackStruct		*cbs)
{
	int *posns;
	int num_posns;
	if(	XmListGetSelectedPos(cbdata->list_w, &posns, &num_posns)
	&&	num_posns) {
		XmListDeletePos(cbdata->list_w, *posns);
		XtFree((char *)posns);
	} else {
		ok_dialog(root, nothing_to_delete_msg);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * dismiss callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void dismiss_cb(
	Widget				w,
	CmdLineData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	XtPopdown(cbdata->shell_w);
}



/* **** **** **** **** **** **** **** **** **** **** **** ****
 * help callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void help_cb(
	Widget				w,
	CmdLineData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	help_dialog(cbdata->shell_w, Help_Command_Line_Tool);
}


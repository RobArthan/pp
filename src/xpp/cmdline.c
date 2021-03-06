
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: cmdline.c,v 2.37 2009/09/06 14:50:50 rda Exp rda $
 *
 * cmdline.c -  single line command window for the X/Motif
 *		ProofPower Interface
 *
 * cmdline.c: this file is part of the PPTex system
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
#define _cmdline

enum {MAX_HISTORY = 100};

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


#include <stdio.h>

#include "xpp.h"

/*
 * Forward declarations:
 */
static void
	get_initial_command_line_list(Widget list_w),
	list_select_cb(CALLBACK_ARGS),
	exec_cb(CALLBACK_ARGS),
	cmd_modify_cb(CALLBACK_ARGS),
	add_cb(CALLBACK_ARGS),
	delete_cb(CALLBACK_ARGS),
	cmd_set_cb(CALLBACK_ARGS),
	empty_cmd_cb(CALLBACK_ARGS);

static void handle_resize(EVENT_HANDLER_ARGS);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * static data
 * **** **** **** **** **** **** **** **** **** **** **** **** */

typedef struct{
	Widget shell_w, manager_w, list_w, cmd_w;
	char	*history[MAX_HISTORY];
	int	previous;
} CmdLineData;

static CmdLineData cmd_line_data;

char *no_command_to_add_msg =
"There is no text in the command line to add to the list.";

char *nothing_to_delete_msg =
"No item in the list has been selected.";

static char *no_selection_cmd =
	"No text selection is available "
	"to be copied into the command field.";

/*
 * Popup menu for the search, replace and line number text widgets:
 */
#define TEXT_EDIT_OPS 4		/* including the separator */
#define TEXT_SPECIAL_OPS 2
static MenuItem cmd_text_edit_menu_items[] = {
    { "Cut", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_cut_cb, NULL, (MenuItem *)NULL, False },
    { "Copy", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_copy_cb, NULL, (MenuItem *)NULL, False },
    { "Paste", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_paste_cb, NULL, (MenuItem *)NULL, False },
    MENU_ITEM_SEPARATOR,
    { ":= Selection", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        cmd_set_cb, NULL, (MenuItem *)NULL, False },
    { "Empty", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        empty_cmd_cb, NULL, (MenuItem *)NULL, False },
    {NULL}
};

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_command_line_tool: attach a tool allowing entry of single line
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

void add_command_line_tool(Widget text_w)
{
	Widget shell, paned, list_w, cmd_text,
		btn_form, exec_btn, add_btn, delete_btn, dismiss_btn, help_btn;
	Arg args[12];
	int i, j;

	if((cmd_line_data.shell_w) != NULL) {
		XtManageChild(cmd_line_data.manager_w);
		XtPopup(cmd_line_data.shell_w, XtGrabNone);
		XmProcessTraversal(cmd_line_data.cmd_w, XmTRAVERSE_CURRENT);
		XmTextSetSelection(cmd_line_data.cmd_w,
			0, XmTextGetLastPosition(cmd_line_data.cmd_w),
			CurrentTime);
		set_input_focus(cmd_line_data.cmd_w);
		return;
	}

	shell = XtVaCreatePopupShell("xpp-Command-Line",
		transientShellWidgetClass,	root,
		XmNdeleteResponse,		XmUNMAP,
		XmNtitle,			"Command Line",
		NULL);
#ifdef EDITRES
	add_edit_res_handler(shell);
#endif
	common_dialog_setup(shell, popdown_cb, shell);
	paned = XtVaCreateWidget("command-paned",
		XMPANEDCLASS, 	shell,
		NULL);


	i = 0;
	XtSetArg(args[i], XmNautomaticSelection,		False); ++i;
	XtSetArg(args[i], XmNscrollBarDisplayPolicy,	XmSTATIC); ++i;
	XtSetArg(args[i], XmNselectionPolicy,		XmBROWSE_SELECT); ++i;
	XtSetArg(args[i], XmNlistSizePolicy,		XmCONSTANT); ++i;
	XtSetArg(args[i], XmNvisibleItemCount,		4); ++i;

	list_w = XmCreateScrolledList(paned, "command-list", args, i);

	get_initial_command_line_list(list_w);
/*
 * cmd_text is a single line text widget, not a text field, so that it supports the
 * insert-string action used in the Xpp resource file to bind symbols to keystrokes.
 */
	cmd_text = XtVaCreateManagedWidget("command-text",
		xmTextWidgetClass,			paned,
		NULL);

	XtAddCallback(cmd_text, XmNmodifyVerifyCallback, text_field_verify_cb, NULL);
	register_selection_source(cmd_text);
	register_palette_client(cmd_text);

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
 * set up static data to contain necessary widget handles, etc.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	cmd_line_data.cmd_w = cmd_text;
	cmd_line_data.shell_w = shell;
	cmd_line_data.list_w = list_w;
	cmd_line_data.manager_w = paned;

	for(i = 0; i < XtNumber(cmd_line_data.history); i += 1) {
		cmd_line_data.history[i] = NULL;
	}

	cmd_line_data.previous = 0;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up text widget translations and font
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtOverrideTranslations(cmd_text,
		xpp_resources.text_translations);

	copy_font_list(list_w, cmd_text);

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

	XtAddCallback(cmd_text, XmNmodifyVerifyCallback,
		cmd_modify_cb, (XtPointer)(&cmd_line_data));

	XtAddCallback(add_btn, XmNactivateCallback,
		add_cb, (XtPointer)(&cmd_line_data));

	XtAddCallback(delete_btn, XmNactivateCallback,
		delete_cb, (XtPointer)(&cmd_line_data));

	XtAddCallback(dismiss_btn, XmNactivateCallback,
		popdown_cb, shell);

	XtAddCallback(help_btn, XmNactivateCallback,
		help_cb, (XtPointer)Help_Command_Line_Tool);

	XtAddCallback(list_w, XmNdefaultActionCallback,
		list_select_cb, (XtPointer)(&cmd_line_data));

	XtInsertEventHandler(list_w,
		StructureNotifyMask,
		False,
		handle_resize,
		NULL,
		XtListTail);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Set up popup edit menus.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	for(i = 0; i < TEXT_EDIT_OPS; i += 1) {
		cmd_text_edit_menu_items[i].callback_data =(XtPointer) cmd_text;
	}
	for(j = 0; j < TEXT_SPECIAL_OPS; j += 1) {
		cmd_text_edit_menu_items[i+j].callback_data = (XtPointer)(&cmd_line_data);
	}
	attach_edit_popup(cmd_text, cmd_text_edit_menu_items);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Manage everything:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtManageChild(btn_form);
	XtManageChild(paned);
	XtManageChild(list_w);
	XtPopup(shell, XtGrabNone);
	/*fix_pane_height(cmd_text, cmd_text);*/
	fix_pane_height(btn_form, btn_form);
	XmProcessTraversal(cmd_text, XmTRAVERSE_CURRENT);

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
	if( !(list_items = XtMalloc(
		strlen(xpp_resources.command_line_list) + 1)) ) {
		return;
	}
	strcpy(list_items, xpp_resources.command_line_list);
	for(p = list_items, last = False; *p; p = last ? q : q + 1) {
		q = p;
		while (*q && *q != '\n') ++q;
		if(*q) {
			*q = '\0';
		} else {
			last = True;
		}
		XmListAddItem(list_w, s = XmStringCreateSimple(p), 0);
		XmStringFree(s);
	}
	XtFree(list_items);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * .Add a command string to the history. Caller shouldn't
 * free the string - that will happen when it rolls off the
 * end of the history. Note the history is maintained as
 * a "lifo-set" - i.e., the latest entry is at position 0,
 * and when an entry is added at the top, it is deleted
 * if it appears lower down.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void record_command(char *cmd, CmdLineData *cbdata)
{
	char *p, *t;
	int i;
	for(	p = NULL, i = 0, t = NULL;
		i < MAX_HISTORY;
		i += 1 ) {
		t = cbdata->history[i];
		cbdata->history[i] = p;
		p = t;
		if(p == NULL) {
			break;
		} else if (!strcmp(p, cmd)) {
			cbdata->history[0] = p;
			t = NULL;
			break;
		}
	}
	if(t != NULL) {
		XtFree(t);
	}
	if(cbdata->history[0] == NULL) {
		cbdata->history[0] = XtMalloc(strlen(cmd) + 1);
		strcpy(cbdata->history[0], cmd);
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * the action routines for the command history list.
 * Use direct access to static data for these.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean in_history = False;
static void command_history_either(Boolean go_up)
{
	char *cmd, *new_cmd;
	char **history = cmd_line_data.history;
	int *previous = &cmd_line_data.previous;
	if(	(go_up && *previous == MAX_HISTORY)
	||	(go_up && history[*previous] == NULL)
	||	(!go_up && *previous <= 1)) {
		beep();
		return;
	}
	in_history = True;
	cmd = XmTextGetString(cmd_line_data.cmd_w);
/*
 * Now there is something in the history; if the current contents of the command line text widget
 * is not empty and we're at the top record it in the history.
 */
	if(	cmd != NULL
	&&	*cmd != '\0'
	&&	*previous == 0) {
		record_command(cmd, &cmd_line_data);
	}
/*
 * Find the new command line
 */
	if(go_up)  {
		new_cmd = history[*previous];
		*previous += 1;
/*
 * Special case mainly for when the current command line wasn't in history and has just been recorded :
*/
		if(	!strcmp(new_cmd, cmd)
		&&	*previous< MAX_HISTORY
		&&	history[*previous] != NULL) {
			new_cmd = history[*previous];
			*previous += 1;
		}
	} else {
		*previous -= 1;
		new_cmd = history[*previous-1];
	}
/*
 * Put new command line in the text field and tidy up
 */
	XmTextSetString(cmd_line_data.cmd_w, new_cmd);
	XtFree(cmd);
	in_history = False;
}
void command_history_up(
	Widget w,
	XEvent *ev,
	String *params,
	Cardinal *num_params)
{
	command_history_either(True);
}
void command_history_down(
	Widget w,
	XEvent *ev,
	String *params,
	Cardinal *num_params)
{
	command_history_either(False);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * take_command_input: if the user tries to type into
 * the journal window, divert the input into the command
 * line tool.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void take_command_input(Widget w, XmTextVerifyCallbackStruct *cbs)
{
	char *buf;
	char *p = cbs->text->ptr;
	int len = cbs->text->length;
	XmTextPosition last_pos;
	Widget cmd_w;
	if(len == 0 || cbs->text->format != XmFMT_8_BIT) {
		beep();
		return;
	} /* else */
	if(cmd_line_data.shell_w != NULL) {
		XtPopup(cmd_line_data.shell_w, XtGrabNone);
	} else {
		add_command_line_tool(w);
	}
	cmd_w = cmd_line_data.cmd_w;
	XFlush(XtDisplay(cmd_w));
	buf = XtMalloc(len+1);
	strncpy(buf, p, len);
	buf[len] = '\0';
	XmTextSetString(cmd_w, buf);
	last_pos = XmTextGetLastPosition(cmd_w);
	XmTextSetInsertionPosition(cmd_w, last_pos);
	if(get_map_state(cmd_w) == IsViewable) {
		set_input_focus(cmd_w);
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * selects the command string after executing it to make it
 * easier to overtype the next command if the user is doing
 * many one line commands in a hurry.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void exec_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	CmdLineData *cbdata = cbd;
	char *cmd;
	static char *nl = "\n";
	if(!application_alive()) {
		ok_dialog(root, not_running_message);
		return;
	} /* else */
	if((cmd = XmTextGetString(cbdata->cmd_w)) != NULL) {
		send_to_application(cmd, strlen(cmd));
		send_to_application(nl, 1);
		XmTextSetSelection(
			cbdata->cmd_w,
			0,
			XmTextGetLastPosition(cbdata->cmd_w),
			CurrentTime);
		record_command(cmd, cbdata);
		XtFree(cmd);
		cbdata->previous = 0;
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * the callback for modifications in the command line.
 * Resets history navigation (so that user's modifications won't
 * be discarded if they start navigating again).
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void cmd_modify_cb(
	Widget		w,
	XtPointer		cbd,
	XtPointer		cbs)
{
	CmdLineData *cbdata = cbd;
	if(!in_history) {
		cbdata->previous = 0;
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * the callback for selection in the list.
 * replaces the command line with the selected item.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void list_select_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	XmListCallbackStruct *lcbs = cbs;
	CmdLineData *cbdata = cbd;
	char *cmd = NULL;
	XmTextPosition last_pos;
	XmStringGetLtoR(lcbs->item, XmSTRING_DEFAULT_CHARSET, &cmd);
	if(cmd) {
		XmTextSetString(cbdata->cmd_w, cmd);
		last_pos = XmTextGetLastPosition(cbdata->cmd_w);
		XmTextSetInsertionPosition(cbdata->cmd_w, last_pos);
		XmTextShowPosition(cbdata->cmd_w, last_pos);
		XtFree(cmd);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * the callback for the add button.
 * adds the contents of the command line to the list.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void add_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	CmdLineData *cbdata = cbd;
	char *cmd;
	XmString item;
	if((cmd = XmTextGetString(cbdata->cmd_w)) != NULL && *cmd) {
		item = XmStringCreateSimple(cmd);
		XmListAddItem(cbdata->list_w, item, 0);
		XmListSelectPos(cbdata->list_w, 0, False);
		XmListSetBottomPos(cbdata->list_w, 0);
		XmStringFree(item);
		XtFree(cmd);
	} else {
		ok_dialog(root, no_command_to_add_msg);
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * the callback for the delete button.
 * deletes the selected item.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void delete_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	CmdLineData *cbdata = cbd;
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
 * command text setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void cmd_set_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	CmdLineData *cbdata = cbd;
	XmTextPosition last_pos;
	char *sel;
	if ((sel = get_selection(cbdata->shell_w, no_selection_cmd)) == NULL) {
		return;
	}
	XmTextSetString(cbdata->cmd_w, sel);
	last_pos = XmTextGetLastPosition(cbdata->cmd_w);
	XmTextSetInsertionPosition(cbdata->cmd_w, last_pos);
	XmTextShowPosition(cbdata->cmd_w, last_pos);
	XtFree(sel);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * command text empty callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void empty_cmd_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	CmdLineData *cbdata = cbd;
	XmTextSetString(cbdata->cmd_w, "");
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * list resize event handler.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void handle_resize(
	Widget		list_w,
	XtPointer	x,
	XEvent		*y,
	Boolean		*z)
{
	int num_visible, top_pos, num_entries;
	XtVaGetValues(list_w,
		XmNitemCount, &num_entries,
		XmNvisibleItemCount, &num_visible,
		XmNtopItemPosition, &top_pos,
		NULL);
	if(num_entries - top_pos + 1 < num_visible) {
		XmListSetBottomPos(list_w, 0);
	}
}



/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$
 *
 * options.c -  tools for setting up global option variables
 *
 * (c) ICL 1994
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _options
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


#include <stdio.h>

#include "xpp.h"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * init_options: create a tool allowing global options to
 * be examined and set. The tool is set-up - but not popped up
 * at the beginning of each session - this allows the user to
 * set-up some options by default - they are read out of the
 * widgets when the tool is set-up.
 *
 * The tool is a popup shell containing pushbuttons, toggle
 * buttons and text fields for the command line and numeric options.
 * Since there are fewer options in an edit-only session
 * the tool window has two framed off sections one for editing
 * options, the other for options concerned with running an
 * application. The application options do not appear in an
 * edit-only session.
 *
 * Editor Controls
 *	 [] Take backup before writing file 
 *	 [] Delete backup after successful write
 * Application Controls
 *	Command Line:		pp -d foo	
 *	Journal Length:	10000
 * Apply Reset Dismiss
 * The parameter is a widget to be the owner of the
 * popup shell. It should be the text widget from which the source
 * and font for the text widgets can be borrowed.
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static Widget
	shell,
	shell_row_col,
		edit_frame,
			edit_row_col,
				backup_toggle,
				delete_backup_toggle,
		app_frame,
			app_row_col,
				command_form,
					command_lab, command_text,
				journal_max_form,
					journal_max_lab, journal_max_text,
		button_frame,
			button_form,
				apply_btn, reset_btn, dismiss_btn;

void init_options(Widget owner_w)
{
	XmString lab;

	static void
		apply_cb(),
		reset_cb(),
		dismiss_cb(),
		journal_max_cb();

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Else ... have to create a new one 
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	shell = XtVaCreatePopupShell("xpp-Controls",
		xmDialogShellWidgetClass, owner_w,
		NULL); 

	shell_row_col = XtVaCreateWidget("shell-row-col",
		xmRowColumnWidgetClass, 	shell,
		NULL);


	edit_frame = XtVaCreateManagedWidget("edit-frame",
		xmFrameWidgetClass,		shell_row_col,
		NULL);

	edit_row_col = XtVaCreateManagedWidget("edit-row-col",
		xmRowColumnWidgetClass,	edit_frame,
		XmNorientation,		XmVERTICAL,
		NULL);

	lab = XmStringCreateSimple("Take backup before writing a file");

	backup_toggle = XtVaCreateManagedWidget("take-backups",
		xmToggleButtonWidgetClass,	edit_row_col,
		XmNlabelString,		lab,
		NULL);

	XtFree(lab);

	lab = XmStringCreateSimple("Delete backup after a successful write");

	delete_backup_toggle = XtVaCreateManagedWidget("delete-backups",
		xmToggleButtonWidgetClass,	edit_row_col,
		XmNlabelString,		lab,
		NULL);

	XtFree(lab);

if(!global_options.edit_only) {
	app_frame = XtVaCreateManagedWidget("app-frame",
		xmFrameWidgetClass,		shell_row_col,
		NULL);

	app_row_col = XtVaCreateManagedWidget("app-row-col",
		xmRowColumnWidgetClass,	app_frame,
		XmNorientation,		XmVERTICAL,
		NULL);

	command_form = XtVaCreateWidget("command-form",
		xmFormWidgetClass, 		app_row_col,
		XmNfractionBase,		10,
		NULL);

	command_lab = XtVaCreateManagedWidget("Command Line:",
		xmLabelWidgetClass,		command_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		3,
		NULL);

	command_text = XtVaCreateManagedWidget("command-line",
		xmTextWidgetClass,		command_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		3,
		XmNcolumns,			30,
		NULL);

	journal_max_form = XtVaCreateWidget("journal-form",
		xmFormWidgetClass, 		app_row_col,
		XmNfractionBase,		10,
		NULL);

	journal_max_lab = XtVaCreateManagedWidget("Journal Size:",
		xmLabelWidgetClass,		journal_max_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		3,
		NULL);

	journal_max_text = XtVaCreateManagedWidget("journal-max",
		xmTextWidgetClass,		journal_max_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		3,
		XmNcolumns,			30,
		NULL);

	copy_font_list(command_text, owner_w);
	copy_font_list(journal_max_text, owner_w);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add callbacks to restrict journal_max_text to numbers
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtAddCallback(journal_max_text, XmNmodifyVerifyCallback,
		(XtCallbackProc)number_verify_cb, (XtPointer)NULL);
}
	button_frame = XtVaCreateManagedWidget("button-frame",
		xmFrameWidgetClass,		shell_row_col,
		NULL);

	button_form = XtVaCreateManagedWidget("app-row-col",
		xmFormWidgetClass,		button_frame,
		XmNfractionBase,		3,
		NULL);

	apply_btn = XtVaCreateManagedWidget("Apply",
		xmPushButtonWidgetClass,		button_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		1,
		NULL);

	reset_btn = XtVaCreateManagedWidget("Reset",
		xmPushButtonWidgetClass,		button_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		1,
		XmNrightPosition,		2,
		NULL);

	dismiss_btn = XtVaCreateManagedWidget("Dismiss",
		xmPushButtonWidgetClass,		button_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		2,
		NULL);
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add other callbacks:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtAddCallback(apply_btn, XmNactivateCallback,
			apply_cb, (XtPointer)NULL);

	XtAddCallback(reset_btn, XmNactivateCallback,
			reset_cb, (XtPointer)NULL);

	XtAddCallback(dismiss_btn, XmNactivateCallback,
			dismiss_cb, (XtPointer)NULL);
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up initial values of global_options:
 * (edit_only and command_line should have been done already in xpp.c)
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	global_options.backup_before_save =
		XmToggleButtonGetState(backup_toggle);

	global_options.delete_backup_after_save =
		XmToggleButtonGetState(delete_backup_toggle);

	if(journal_max_text) {
		char	*journal_max_buf;
		long unsigned m;
		journal_max_buf = XmTextGetString(journal_max_text);
		sscanf(journal_max_buf, "%ul", &m);
		global_options.journal_max = (m >= 2000 ? m : 2000);
	};
	reset_cb(NULL, NULL, NULL);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * get_arg_list: function to convert the command line into argv
 * format as required by execvp.
 * Not expected to be called in an edit-only session - returns
 * null if command_text has not been set up.
 * The state variable is used as follows:
 *	state = 0	- looking for next word.
 *	state = 1	- in word looking for next space.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
char **get_arg_list() {
	static char **argv;
	static char *buf;
	char *p;
	int siz, state, argc;
	if(buf) {
		XtFree(buf);
	}
	if(argv) {
		XtFree((char *)argv);
	}
	siz = strlen(global_options.command_line);
	buf = XtMalloc(siz + 1);
	strcpy(buf, global_options.command_line);
	for(p = buf, state = 0, argc = 0; *p; ++p) {
		switch(state) {
			case 0:
				if(!isspace(*p)) {
					state = 1;
					++argc;
				};
				break;
			case 1:
				if(isspace(*p)) {
					state = 0;
				}
				break;
		}
	}
	if(!(argv = (char **)XtMalloc((argc+1) * (sizeof(char *))))) {
		return NULL;
	}
	for(p = buf, state = 0, argc = 0; *p; ++p) {
		switch(state) {
			case 0:
				if(!isspace(*p)) {
					state = 1;
					argv[argc++] = p;
				};
				break;
			case 1:
				if(isspace(*p)) {
					*p = '\0';
					state = 0;
				}
				break;
		}
	}
	argv[argc] = NULL;
	return argv;
}
void add_option_tool()
{
	if(shell) {
		XtManageChild(button_form);
		XtManageChild(button_frame);
		if(!global_options.edit_only) {
			XtManageChild(journal_max_form);
			XtManageChild(command_form);
			XtManageChild(app_row_col);
			XtManageChild(app_frame);
		}
		XtManageChild(edit_row_col);
		XtManageChild(edit_frame);
		XtManageChild(shell_row_col);
		XtPopup(shell, XtGrabNone);
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * apply callback. Calls reset_cb to tidy up display.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void apply_cb(
	Widget				u1,
	XtPointer			u2,
	XmPushButtonCallbackStruct	u3)
{
	static void reset_cb();
	global_options.backup_before_save =
		XmToggleButtonGetState(backup_toggle);
	global_options.delete_backup_after_save =
		XmToggleButtonGetState(delete_backup_toggle);
	if(command_text) {
		XtFree(global_options.command_line);
		global_options.command_line =
			XmTextGetString(command_text);
	}
	if(journal_max_text) {
		char	*journal_max_buf;
		long unsigned m;
		journal_max_buf = XmTextGetString(journal_max_text);
		sscanf(journal_max_buf, "%ul", &m);
		global_options.journal_max = (m >= 2000 ? m : 2000);
	};
	reset_cb(NULL, NULL, NULL);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * reset callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void reset_cb(
	Widget				u1,
	XtPointer			u2,
	XmPushButtonCallbackStruct	u3)
{
	XmToggleButtonSetState(backup_toggle,
		global_options.backup_before_save, False);
	XmToggleButtonSetState(delete_backup_toggle,
		global_options.delete_backup_after_save, False);
	if(command_text) {
		XmTextSetString(command_text,
			global_options.command_line);
	}
	if(journal_max_text) {
		char buf[20];
		sprintf(buf, "%ul", global_options.journal_max);
		XmTextSetString(journal_max_text, buf);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * dismiss callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void dismiss_cb(
	Widget				u1,
	XtPointer			u2,
	XmPushButtonCallbackStruct	u3)
{
	XtPopdown(shell);
}




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
 * When init_options is called (towards the beginning of a session)
 * from mainw.c, it sets up the values of the global options variable
 * whcih have not yet been fixed and stashes a copy of the result in
 * the following variable, which is used if the user wants to
 * rest the values.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

GlobalOptions	orig_global_options;

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
 * <>	`Execute' adds missing new-lines;
 * <>  `Execute' prompts for new-lines
 * <>  `Execute' ignores missing new-lines
 * Apply Reset Dismiss Help
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
		add_new_line_frame,
			add_new_line_radio_buttons,
		button_frame,
			button_form,
				apply_btn, reset_btn, dismiss_btn, help_btn;
/*
 * We use a variable to record the state of the radio buttons:
 */
static char	add_new_line_button_state;

void init_options(Widget owner_w)
{
	XmString lab;

	static void
		apply_cb(),
		reset_cb(),
		dismiss_cb(),
		journal_max_cb(),
		add_new_line_cb(),
		help_cb();

	XmString s1, s2, s3;

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

	add_new_line_frame = XtVaCreateManagedWidget(
		"execute-new-line-frame",
		xmFrameWidgetClass,		shell_row_col,
		NULL);

	s1 = XmStringCreateSimple("`Execute' adds missing new-lines");
	s2 = XmStringCreateSimple("`Execute' prompts for new-lines");
	s3 = XmStringCreateSimple("`Execute' ignores missing new-lines");

	add_new_line_button_state = global_options.add_new_line_mode;

	add_new_line_radio_buttons = XmVaCreateSimpleRadioBox(
		shell_row_col,
		"execute-new-line-frame",
		add_new_line_button_state,
		add_new_line_cb,
		XmVaRADIOBUTTON, s1, NULL, NULL, NULL,
		XmVaRADIOBUTTON, s2, NULL, NULL, NULL,
		XmVaRADIOBUTTON, s3, NULL, NULL, NULL,
		NULL);

	XmStringFree(s1);
	XmStringFree(s2);
	XmStringFree(s3);

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
		XmNfractionBase,		4,
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
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		2,
		XmNrightPosition,		3,
		NULL);

	help_btn = XtVaCreateManagedWidget("Help",
		xmPushButtonWidgetClass,		button_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		3,
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

	XtAddCallback(help_btn, XmNactivateCallback,
			help_cb, (XtPointer)NULL);
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up initial values of global_options which have not
 * been done already in xpp.c); these are the ones which the user
 * sets in the resource file by initialising option tool widgets.
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

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * save initial setting for later resets
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	orig_global_options = global_options;

	orig_global_options.command_line =
			XtMalloc(strlen(global_options.command_line) + 1);

	strcpy(orig_global_options.command_line,
			global_options.command_line);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * use reset as a handy way to store the values in the widgets
 * **** **** **** **** **** **** **** **** **** **** **** **** */

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
			XtManageChild(add_new_line_radio_buttons);
			XtManageChild(add_new_line_frame);
		}
		XtManageChild(edit_row_col);
		XtManageChild(edit_frame);
		XtManageChild(shell_row_col);
		XtPopup(shell, XtGrabNone);
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * apply callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void apply_cb(
	Widget				u1,
	XtPointer			u2,
	XmPushButtonCallbackStruct	u3)
{
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
		char buf[20];
		long unsigned m;
		journal_max_buf = XmTextGetString(journal_max_text);
		sscanf(journal_max_buf, "%ul", &m);
		global_options.journal_max = (m >= 2000 ? m : 2000);
		sprintf(buf, "%ul", global_options.journal_max);
		XmTextSetString(journal_max_text, buf);
	};

	global_options.add_new_line_mode = add_new_line_button_state;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * reset callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void reset_cb(
	Widget				u1,
	XtPointer			u2,
	XmPushButtonCallbackStruct	u3)
{
	Widget *btns;

	XtFree(global_options.command_line);

	global_options = orig_global_options;

	global_options.command_line =
			XtMalloc(strlen(orig_global_options.command_line) + 1);

	strcpy(global_options.command_line,
			orig_global_options.command_line);

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

	XtVaGetValues(add_new_line_radio_buttons,
		XmNchildren,		&btns, NULL);

	XmToggleButtonSetState(btns[orig_global_options.add_new_line_mode],
			True, True);
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


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * dismiss callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void add_new_line_cb(
	Widget				w,
	int				btn_n,
	XmAnyCallbackStruct		cbs)
{
	add_new_line_button_state = btn_n;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * help callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void help_cb(
	Widget				w,
	XtPointer			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	help_dialog(root, Help_Options_Tool);
}


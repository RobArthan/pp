
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: options.c,v 2.16 2003/02/09 17:43:37 rda Exp rda $
 *
 * options.c -  tools for setting up global option variables
 *
 * options.c: this file is part of the PPTex system
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
#define _options
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


#include <stdio.h>
#include <ctype.h>

#include "xpp.h"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * When init_options is called (towards the beginning of a session)
 * from mainw.c, it sets up the values of the global options variable
 * which have not yet been fixed and stashes a copy of the result in
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
 * the tool window has two parts sections one for editing
 * options, the other for options concerned with running an
 * application. The application options do not appear in an
 * edit-only session. Frames are used to group controls of similar types.
 *
 * Editor Controls
 * File type: Unix/MS-DOS/Macintosh
 *	 [] Take backup before writing file 
 *	 [] Delete backup after successful write
 *	 [] Read only
 * Application Controls
 *	Command Line:		pp -d foo	
 *	Journal Length:	10000
 * <>	`Execute' adds missing new-lines;
 * <>  `Execute' prompts for new-lines
 * <>  `Execute' ignores missing new-lines
 * Apply Current Original Dismiss Help
 * The parameter is a widget to be the owner of the
 * popup shell. It should be the text widget from which the source
 * and font for the text widgets can be borrowed.
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static Widget
	shell = NULL,
	shell_row_col,
		edit_frame,
			edit_row_col,
				backup_toggle,
				delete_backup_toggle,
				read_only_toggle,
		file_type_frame,
			file_type_menu,
				*file_type_buttons,
		search_replace_frame,
			search_replace_row_col,
				ignore_case_toggle,
				use_reg_exps_toggle,
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
				apply_btn, current_btn, original_btn, dismiss_btn, help_btn;

static char add_new_line_mode_mirror; /* mirrors value of the radio buttons */
static char file_type_mirror; /* mirrors value of the file type menu  */

/*
 * Call-backs:
 */
static void	apply_cb(CALLBACK_ARGS),
		reset_cb(CALLBACK_ARGS),
		dismiss_cb(CALLBACK_ARGS),
		add_new_line_cb(CALLBACK_ARGS),
		help_cb(CALLBACK_ARGS),
		file_type_cb(CALLBACK_ARGS);

void init_options(Widget owner_w)
{
	XmString lab, s1, s2, s3;
	Widget w;

	if(shell) { /* defend against being called twice */
		return;
	}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Else ... have to create a new one 
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	shell = XtVaCreatePopupShell("xpp-Options",
		xmDialogShellWidgetClass, owner_w,
		NULL); 
#ifdef EDITRES
	add_edit_res_handler(shell);
#endif
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

	XmStringFree(lab);

	lab = XmStringCreateSimple("Delete backup after a successful write");

	delete_backup_toggle = XtVaCreateManagedWidget("delete-backups",
		xmToggleButtonWidgetClass,	edit_row_col,
		XmNlabelString,		lab,
		NULL);

	XmStringFree(lab);

	lab = XmStringCreateSimple("Read only");

	read_only_toggle = XtVaCreateManagedWidget("read-only",
		xmToggleButtonWidgetClass,	edit_row_col,
		XmNlabelString,		lab,
		NULL);

	XmStringFree(lab);

	file_type_frame = XtVaCreateManagedWidget("edit-frame",
		xmFrameWidgetClass,		shell_row_col,
		NULL);

	lab = XmStringCreateSimple("File type:");
	s1 = XmStringCreateSimple((char*)file_type_names[0]);
	s2 = XmStringCreateSimple((char*)file_type_names[1]);
	s3 = XmStringCreateSimple((char*)file_type_names[2]);
	file_type_menu = XmVaCreateSimpleOptionMenu(file_type_frame, "menu", lab, 'T', 0, file_type_cb,
		XmVaPUSHBUTTON, s1, NULL, NULL, NULL,
		XmVaPUSHBUTTON, s2, NULL, NULL, NULL,
		XmVaPUSHBUTTON, s3, NULL, NULL, NULL,
		NULL);
	XtManageChild(file_type_menu);
	XmStringFree(lab);
	XmStringFree(s1);
	XmStringFree(s2);
	XmStringFree(s3);
	XtVaGetValues(file_type_menu, XmNsubMenuId, &w, NULL);
	XtVaGetValues(w,  XmNchildren, &file_type_buttons, NULL ) ;

	if(global_options.read_only) {
		XmToggleButtonSetState(read_only_toggle,True, False);
	}

	search_replace_frame = XtVaCreateManagedWidget("search-replace-frame",
		xmFrameWidgetClass,	shell_row_col,
		NULL);

	search_replace_row_col = XtVaCreateManagedWidget("search-replace-row-col",
		xmRowColumnWidgetClass,	search_replace_frame,
		XmNorientation,		XmVERTICAL,
		NULL);

	lab = XmStringCreateSimple("Ignore case in searches");

	ignore_case_toggle = XtVaCreateManagedWidget("ignore-case",
		xmToggleButtonWidgetClass,	search_replace_row_col,
		XmNlabelString,			lab,
		NULL);

	XmStringFree(lab);

	lab = XmStringCreateSimple("Treat search strings as regular expressions");

	use_reg_exps_toggle = XtVaCreateManagedWidget("use-regular-expressions",
		xmToggleButtonWidgetClass,	search_replace_row_col,
		XmNlabelString,			lab,
		NULL);

	XmStringFree(lab);

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

	attach_rw_edit_popup(command_text);
	register_selection_source(command_text);
	register_palette_client(command_text);

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

	attach_rw_edit_popup(journal_max_text);
	register_selection_source(journal_max_text);
	register_palette_client(journal_max_text);

	copy_font_list(command_text, owner_w);
	copy_font_list(journal_max_text, owner_w);

	add_new_line_frame = XtVaCreateManagedWidget(
		"add-new-line-frame",
		xmFrameWidgetClass,		shell_row_col,
		NULL);

	s1 = XmStringCreateSimple("`Execute' adds missing new-lines");
	s2 = XmStringCreateSimple("`Execute' prompts for new-lines");
	s3 = XmStringCreateSimple("`Execute' ignores missing new-lines");

	add_new_line_radio_buttons = XmVaCreateSimpleRadioBox(
		add_new_line_frame,
		"add-new-line-radio-buttons",
		global_options.add_new_line_mode,
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
} /* now stuff common to edit-only and command sessions */
	button_frame = XtVaCreateManagedWidget("button-frame",
		xmFrameWidgetClass,		shell_row_col,
		NULL);

	button_form = XtVaCreateManagedWidget("app-row-col",
		xmFormWidgetClass,		button_frame,
		XmNfractionBase,		5,
		NULL);

	apply_btn = XtVaCreateManagedWidget("Apply",
		xmPushButtonWidgetClass,		button_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		1,
		NULL);

	current_btn = XtVaCreateManagedWidget("Current",
		xmPushButtonWidgetClass,		button_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		1,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		2,
		NULL);

	original_btn = XtVaCreateManagedWidget("Original",
		xmPushButtonWidgetClass,		button_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		2,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		3,
		NULL);

	dismiss_btn = XtVaCreateManagedWidget("Dismiss",
		xmPushButtonWidgetClass,		button_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		3,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		4,
		NULL);

	help_btn = XtVaCreateManagedWidget("Help",
		xmPushButtonWidgetClass,		button_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		4,
		XmNrightAttachment,		XmATTACH_FORM,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add other callbacks:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtAddCallback(apply_btn, XmNactivateCallback,
			apply_cb, (XtPointer)NULL);

	XtAddCallback(current_btn, XmNactivateCallback,
			reset_cb, (XtPointer)&global_options);

	XtAddCallback(original_btn, XmNactivateCallback,
			reset_cb, (XtPointer)&orig_global_options);

	XtAddCallback(dismiss_btn, XmNactivateCallback,
			dismiss_cb, (XtPointer)NULL);

	XtAddCallback(help_btn, XmNactivateCallback,
			help_cb, (XtPointer)NULL);
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up initial values of global_options which have not
 * been done already in xpp.c; these are the ones which the user
 * sets in the resource file by initialising option tool widgets.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	global_options.backup_before_save =
		XmToggleButtonGetState(backup_toggle);

	global_options.delete_backup_after_save =
		XmToggleButtonGetState(delete_backup_toggle);

	global_options.read_only =
		XmToggleButtonGetState(read_only_toggle);

	global_options.ignore_case =
		XmToggleButtonGetState(ignore_case_toggle);

	global_options.use_reg_exps =
		XmToggleButtonGetState(use_reg_exps_toggle);

	if(journal_max_text) {
		char	*journal_max_buf;
		long unsigned m;
		journal_max_buf = XmTextGetString(journal_max_text);
		sscanf(journal_max_buf, "%lu", &m);
		global_options.journal_max = (m >= 2000 ? m : 2000);
	}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * save initial setting for later resets
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	orig_global_options = global_options;

	orig_global_options.command_line =
			XtMalloc(strlen(global_options.command_line) + 1);

	strcpy(orig_global_options.command_line,
			global_options.command_line);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * use callbacks  as a handy way to store the values in the widgets
 * and initialize add_new_line_mode and file type
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	reset_cb(NULL, (XtPointer)&orig_global_options, NULL);

	add_new_line_cb(NULL, NULL, NULL);

	set_file_type(UNIX);

#ifdef LISTWIDGETS
	list_widget_hierarchy(shell);
#endif
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
char **get_arg_list(void) {
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
				}
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
				}
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
void add_options_tool(void)
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
		XtManageChild(search_replace_row_col);
		XtManageChild(search_replace_frame);
		XtManageChild(shell_row_col);
		XtPopup(shell, XtGrabNone);
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set the read-only flag:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void set_read_only(Boolean read_only)
{
	global_options.read_only = read_only;
	XmToggleButtonSetState(read_only_toggle, read_only, False);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set the file type:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void set_file_type(FileType file_type)
{
	global_options.file_type = file_type;
	XtVaSetValues(file_type_menu, XmNmenuHistory, file_type_buttons[file_type], NULL);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * apply callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void apply_cb(
	Widget		u1,
	XtPointer	u2,
	XtPointer	u3)
{
	global_options.backup_before_save =
		XmToggleButtonGetState(backup_toggle);

	global_options.delete_backup_after_save =
		XmToggleButtonGetState(delete_backup_toggle);

	global_options.read_only =
		XmToggleButtonGetState(read_only_toggle);

	global_options.file_type = file_type_mirror;

	global_options.ignore_case =
		XmToggleButtonGetState(ignore_case_toggle);

	global_options.use_reg_exps =
		XmToggleButtonGetState(use_reg_exps_toggle);

	global_options.add_new_line_mode = add_new_line_mode_mirror;

	if(journal_max_text) {
		char	*journal_max_buf;
		char buf[20];
		long unsigned m;
		journal_max_buf = XmTextGetString(journal_max_text);
		sscanf(journal_max_buf, "%lu", &m);
		if (m < 2000) {m = 2000;}
		global_options.journal_max = m;
		sprintf(buf, "%lu", m);
		XmTextSetString(journal_max_text, buf);
	}

	if(command_text) {
		XtFree(global_options.command_line);
		global_options.command_line =
			XmTextGetString(command_text);
	}

	show_file_info();

}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * reset callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void reset_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	Widget *btns;
	GlobalOptions *options = cbd;

	XmToggleButtonSetState(backup_toggle,
		options->backup_before_save, False);

	XmToggleButtonSetState(delete_backup_toggle,
		options->delete_backup_after_save, False);

	XmToggleButtonSetState(read_only_toggle,
		options->read_only, False);

	XtVaSetValues(file_type_menu, XmNmenuHistory, file_type_buttons[options->file_type], NULL);

	XmToggleButtonSetState(ignore_case_toggle,
		options->ignore_case, False);

	XmToggleButtonSetState(use_reg_exps_toggle,
		options->use_reg_exps, False);

	if(command_text) {
		XmTextSetString(command_text,
			options->command_line);
	}
	if(journal_max_text) {
		char buf[20];
		unsigned long m = options->journal_max;
		sprintf(buf, "%lu", m);
		XmTextSetString(journal_max_text, buf);
	}

	if(add_new_line_radio_buttons) {
		XtVaGetValues(add_new_line_radio_buttons,
			XmNchildren,		&btns, NULL);
		XmToggleButtonSetState(
			btns[options->add_new_line_mode],
			True, True);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * dismiss callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void dismiss_cb(
	Widget		u1,
	XtPointer	u2,
	XtPointer	u3)
{
	XtPopdown(shell);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add-new-line radio buttons callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void add_new_line_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	add_new_line_mode_mirror = (int) cbd;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * help callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void help_cb(
	Widget		w,
	XtPointer	cbdata,
	XtPointer	cbs)
{
	help_dialog(root, Help_Options_Tool);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * File type callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void file_type_cb (
		Widget	w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	file_type_mirror = (int)cbd;
}

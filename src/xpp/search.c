
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: search.c,v 2.14 2002/12/12 14:06:50 rda Exp rda $ 
 *
 * search.c - support for search & replace for the X/Motif ProofPower Interface
 *
 * search.c: this file is part of the PPTex system
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
#define _search

#define NO_MEMORY		-1
#define FORWARDS		1
#define BACKWARDS		2

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files: 
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#include <stdio.h>
#include <ctype.h>

#include "xpp.h"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * messages
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static char *cant_get_line_no = 
	"Running out of memory! "
	"Not enough memory is left to calculate the line number";

static char *cant_goto_line_no = 
	"Running out of memory! "
	"Not enough memory is left to move to the line number";

static char *no_line_no = 
	"Line number to go to is missing or zero";

static char *no_room_for_global = 
	"Running out of memory! "
	"Not enough memory is left to perform the global replacement";

static char *no_search_string = 
	"There is nothing in the search field";

static char *no_selection_replace = 
	"No text is selected in this xpp session "
	"to be copied into the replacement field";

static char *no_selection_search = 
	"No text is selected in this xpp session "
	"to be copied into the search field";

static char *no_selection_to_replace = 
	"There is no selection in the text window to be replaced";

static char *not_found = 
	"Search pattern \"%s\" not found";

static char *line_no_too_big1 =
	"There is only 1 line in the file";

static char *line_no_too_big =
	"There are only %ld lines in the file";

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * static data
 * **** **** **** **** **** **** **** **** **** **** **** **** */

typedef struct {
	Widget	text_w,
		shell_w,
		manager_w,
		search_w,
		replace_w,
		line_no_w;
} SearchData;
	
static SearchData search_data;
/*
 * Forward declarations for callbacks etc.
 */
static void	search_backwards_cb(CALLBACK_ARGS),
		search_forwards_cb(CALLBACK_ARGS),
		search_set_cb(CALLBACK_ARGS),
		search_backwards_replace_cb(CALLBACK_ARGS),
		search_forwards_replace_cb(CALLBACK_ARGS),
		clear_cb(CALLBACK_ARGS),
		replace_cb(CALLBACK_ARGS),
		replace_all_cb(CALLBACK_ARGS),
		replace_set_cb(CALLBACK_ARGS),
		replace_search_backwards_cb(CALLBACK_ARGS),
		replace_search_forwards_cb(CALLBACK_ARGS),
		line_no_set_cb(CALLBACK_ARGS),
		goto_line_no_cb(CALLBACK_ARGS),
		dismiss_cb(CALLBACK_ARGS),
		help_cb(CALLBACK_ARGS);

static void line_no_set(SearchData*);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_search_tool: attach a search & replace tool to a text widget
 * This is long but only because it is repetitive.
 * The aim is a popup shell looking something like:
 *
 * | <= Search    |  <= & Replace | := Selection |
 * | Search =>    |  => & Replace | Clear        |
 * |   <text to search for >                     |
 * | Replace      |  Replace & <= | := Selection |
 * | Replace All  | Replace & =>  | Clear        |
 * |   <text to replace with >                   |
 * | Go to line:  | <line number> | := Cursor    |
 * -----------------------
 * | Dismiss    |  Help  |
 *
 * Each `<...>' here is a text field
 * The `:= ...' push-buttons can be used to
 * include the selection from the text widget in the search and
 * replacement strings or to put the line number corresponding
 * to the insertion point in the line number string.
 * The other push-buttons actually initiate searches etc.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean add_search_tool(Widget text_w)
{
	NAT cbdata;
	Widget shell, paned, search_form, replace_form, line_no_form,
		action_form,
		search_backwards_btn,
		search_forwards_btn,
		search_set_btn,
		search_backwards_replace_btn,
		search_forwards_replace_btn,
		search_clear_btn,
		search_text,
		replace_btn,
		replace_all_btn,
		replace_set_btn,
		replace_search_backwards_btn,
		replace_search_forwards_btn,
		replace_clear_btn,
		replace_text,
		goto_line_no_btn,
		line_no_text,
		line_no_set_btn,
		help_btn,
		dismiss_btn;

	char	*pattern;


	if((search_data.shell_w) != NULL) {
		XtManageChild(search_data.manager_w);
		XtPopup(search_data.shell_w, XtGrabNone);
		return True;
	}

	shell = XtVaCreatePopupShell("xpp-Search-and-Replace",
		transientShellWidgetClass, text_w,
		XmNdeleteResponse,		XmUNMAP,
		NULL); 
#ifdef EDITRES
	add_edit_res_handler(shell);
#endif
	paned = XtVaCreateWidget("search-replace-paned",
		xmPanedWindowWidgetClass, 	shell,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 1:
 * | <= Search    |  <= & Replace | := Selection |
 * | Search =>    |  => & Replace | Clear        |
 * |   <text to search for >                     |
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	search_form = XtVaCreateWidget("search-form",
		xmFormWidgetClass, 		paned,
		XmNfractionBase,		24,
		NULL);

	search_backwards_btn = XtVaCreateManagedWidget("<= Search",
		xmPushButtonWidgetClass,	search_form,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		8,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_POSITION,
		XmNbottomPosition,		12,
		NULL);

	search_forwards_btn = XtVaCreateManagedWidget("Search =>",
		xmPushButtonWidgetClass,	search_form,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		8,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,			12,
		XmNbottomAttachment,		XmATTACH_FORM,
		NULL);

	search_backwards_replace_btn = XtVaCreateManagedWidget("<= & Replace",
		xmPushButtonWidgetClass,	search_form,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		8,
		XmNrightPosition,		16,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_POSITION,
		XmNbottomPosition,		12,
		NULL);

	search_forwards_replace_btn = XtVaCreateManagedWidget("=> & Replace",
		xmPushButtonWidgetClass,	search_form,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		8,
		XmNrightPosition,		16,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,			12,
		XmNbottomAttachment,		XmATTACH_FORM,
		NULL);

	search_set_btn = XtVaCreateManagedWidget(":= Selection",
		xmPushButtonWidgetClass,	search_form,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		16,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_POSITION,
		XmNbottomPosition,		12,
		NULL);

	search_clear_btn = XtVaCreateManagedWidget("Clear",
		xmPushButtonWidgetClass,	search_form,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		16,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,			12,
		XmNbottomAttachment,		XmATTACH_FORM,
		NULL);

	search_text = XtVaCreateManagedWidget("search",
		xmTextWidgetClass,		paned,
		XmNeditMode,			XmMULTI_LINE_EDIT,
		XmNrows,			2,
		XmNcolumns,			40,
		NULL);

	attach_rw_edit_popup(search_text);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 2:
 * | Replace      | Replace & <=  | := Selection |
 * | Replace All  | Replace & =>  | Clear        |
 * |   <text to replace with >                   |
 * **** **** **** **** **** **** **** **** **** **** **** **** */


	replace_form = XtVaCreateWidget("replace-form",
		xmFormWidgetClass, 		paned,
		XmNfractionBase,		24,
		NULL);

	replace_btn = XtVaCreateManagedWidget("Replace",
		xmPushButtonWidgetClass,	replace_form,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		8,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_POSITION,
		XmNbottomPosition,		12,
		NULL);

	replace_all_btn = XtVaCreateManagedWidget("Replace All",
		xmPushButtonWidgetClass,	replace_form,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		8,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,			12,
		XmNbottomAttachment,		XmATTACH_FORM,
		NULL);

	replace_search_backwards_btn = XtVaCreateManagedWidget("Replace & <=",
		xmPushButtonWidgetClass,	replace_form,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		8,
		XmNrightPosition,		16,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_POSITION,
		XmNbottomPosition,		12,
		NULL);

	replace_search_forwards_btn = XtVaCreateManagedWidget("Replace & =>",
		xmPushButtonWidgetClass,	replace_form,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		8,
		XmNrightPosition,		16,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,			12,
		XmNbottomAttachment,		XmATTACH_FORM,
		NULL);

	replace_set_btn = XtVaCreateManagedWidget(":= Selection",
		xmPushButtonWidgetClass,	replace_form,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		16,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_POSITION,
		XmNbottomPosition,		12,
		NULL);

	replace_clear_btn = XtVaCreateManagedWidget("Clear",
		xmPushButtonWidgetClass,	replace_form,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		16,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,			12,
		XmNbottomAttachment,		XmATTACH_FORM,
		NULL);

	replace_text = XtVaCreateManagedWidget("replace",
		xmTextWidgetClass,		paned,
		XmNeditMode,			XmMULTI_LINE_EDIT,
		XmNrows,			2,
		XmNcolumns,			40,
		NULL);

	attach_rw_edit_popup(replace_text);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 4:
 * | Go to line:  | <line number> | := Cursor    |
 *
 * Do the line number first so that the buttons can be lined up with it.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	line_no_form = XtVaCreateWidget("line_number-form",
		xmFormWidgetClass, 		paned,
		XmNfractionBase,		24,
		NULL);

	line_no_text = XtVaCreateManagedWidget("line-number",
		xmTextWidgetClass,		line_no_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftPosition,		8,
		XmNrightPosition,		16,
		XmNcolumns,			8,
		NULL);

	attach_rw_edit_popup(line_no_text);

	goto_line_no_btn = XtVaCreateManagedWidget("Go to line:",
		xmPushButtonWidgetClass,	line_no_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNbottomAttachment,		XmATTACH_OPPOSITE_WIDGET,
		XmNbottomWidget,		line_no_text,
		XmNrightPosition,		8,
		NULL);

	line_no_set_btn = XtVaCreateManagedWidget(":= Cursor",
		xmPushButtonWidgetClass,	line_no_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_OPPOSITE_WIDGET,
		XmNbottomWidget,		line_no_text,
		XmNleftPosition,		16,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 5:
 * -----------------------
 * | Dismiss    |  Help  |
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	action_form = XtVaCreateWidget("search-replace-action-form",
		xmFormWidgetClass, 		paned,
		XmNfractionBase,		24,
		NULL);

	dismiss_btn = XtVaCreateManagedWidget("Dismiss",
		xmPushButtonWidgetClass,	action_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		5,
		XmNrightPosition,		11,
		NULL);


	help_btn = XtVaCreateManagedWidget("Help",
		xmPushButtonWidgetClass,	action_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		13,
		XmNrightPosition,		19,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up static data to contain necessary widget handles:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	search_data.text_w = text_w;
	search_data.shell_w = shell;
	search_data.manager_w = paned;
	search_data.search_w = search_text;
	search_data.replace_w = replace_text;
	search_data.line_no_w = line_no_text;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up the text windows in the search dialog as selection sources
 * and palette clients. (This sounds silly but is intuitively right for
 * the line number widget - if focus is in the line number pushing
 * a palette button will cause a blink or a bleat and then send focus
 * back to the line number).
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	register_selection_source(search_text);
	register_palette_client(search_text);
	register_selection_source(replace_text);
	register_palette_client(replace_text);
	register_selection_source(line_no_text);
	register_palette_client(line_no_text);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add callbacks
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtAddCallback(search_backwards_btn, XmNactivateCallback,
		search_backwards_cb, (XtPointer)(&search_data));

	XtAddCallback(search_forwards_btn, XmNactivateCallback,
		search_forwards_cb, (XtPointer)(&search_data));

	XtAddCallback(search_set_btn, XmNactivateCallback,
		search_set_cb, (XtPointer)(&search_data));

	XtAddCallback(search_backwards_replace_btn, XmNactivateCallback,
		search_backwards_replace_cb, (XtPointer)(&search_data));

	XtAddCallback(search_forwards_replace_btn, XmNactivateCallback,
		search_forwards_replace_cb, (XtPointer)(&search_data));

	XtAddCallback(search_clear_btn, XmNactivateCallback,
		clear_cb, (XtPointer)(search_text));

	XtAddCallback(replace_btn, XmNactivateCallback,
		replace_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_all_btn, XmNactivateCallback,
		replace_all_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_set_btn, XmNactivateCallback,
		replace_set_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_search_backwards_btn, XmNactivateCallback,
		replace_search_backwards_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_search_forwards_btn, XmNactivateCallback,
		replace_search_forwards_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_clear_btn, XmNactivateCallback,
		clear_cb, (XtPointer)(replace_text));

	XtAddCallback(goto_line_no_btn, XmNactivateCallback,
		goto_line_no_cb, (XtPointer)(&search_data));

	XtAddCallback(line_no_text, XmNmodifyVerifyCallback,
		(XtCallbackProc)number_verify_cb, (XtPointer)NULL);

	XtAddCallback(line_no_text, XmNactivateCallback,
		goto_line_no_cb, (XtPointer)(&search_data));

	XtAddCallback(line_no_set_btn, XmNactivateCallback,
		line_no_set_cb, (XtPointer)(&search_data));

	XtAddCallback(dismiss_btn, XmNactivateCallback,
		dismiss_cb, (XtPointer)(&search_data));

	XtAddCallback(help_btn, XmNactivateCallback,
		help_cb, (XtPointer)NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Initialise search string and line number:
 * Don't use callback for search string, since there
 * may not be a selection and don't want error message.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	if(pattern = XmTextGetSelection(text_w)) {
		XmTextSetString(search_text, pattern);
		XmTextShowPosition(search_text, strlen(pattern));
		XtFree(pattern);
	}

	line_no_set(&search_data);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 *set up text widget translations
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtOverrideTranslations(search_text, text_translations);
	XtOverrideTranslations(replace_text, text_translations);
	XtOverrideTranslations(line_no_text, text_translations);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Make return in the line number text widget activate it
 **** **** **** **** **** **** **** **** **** **** **** **** */

	XtOverrideTranslations(line_no_text,
		XtParseTranslationTable("<Key>Return: activate()"));

/* **** **** **** **** **** **** **** **** **** **** **** ****
 *set up text widget fonts
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	copy_font_list(search_text, text_w);
	copy_font_list(replace_text, text_w);
	copy_font_list(line_no_text, text_w);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Manage everything:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtManageChild(search_form);
	XtManageChild(replace_form);
	XtManageChild(line_no_form);
	XtManageChild(action_form);
	XtManageChild(paned);

	XtPopup(shell, XtGrabNone);

	fix_pane_height(search_form, search_form);
	fix_pane_height(replace_form, replace_form);
	fix_pane_height(line_no_form, line_no_form);
	fix_pane_height(action_form, action_form);

	return True;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * dismiss callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void dismiss_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	XtPopdown(cbdata->shell_w);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * help callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void help_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	help_dialog(root, Help_Search_Tool);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search forwards callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean search_either(Widget,SearchData*,NAT);
static void search_forwards_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	(void) search_either(w, cbdata, FORWARDS);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search backwards callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void search_backwards_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	(void) search_either(w, cbdata, BACKWARDS);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Support for search callbacks.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void search_string(char*,char*,long int,long int*,long int*,NAT);
static Boolean search_either(
	Widget				w,
	SearchData			*cbdata,
	NAT				dir)
{
	long int left, len;
	NAT start_point;
	char *pattern, *text_buf;
	Boolean result;
	XmTextPosition pl, pr;
	pattern = XmTextGetString(search_data.search_w);
	text_buf = XmTextGetString(search_data.text_w);
	if(XmTextGetSelectionPosition(search_data.text_w, &pl, &pr)) {
		start_point = (dir == FORWARDS ? pr : pl);
	} else {
		start_point = XmTextGetInsertionPosition(search_data.text_w);
	}
	search_string(pattern, text_buf, start_point, &left, &len, dir);
	if(left >= 0) {
		text_show_position(
			search_data.text_w,
			left);
		XmTextSetSelection(
			search_data.text_w,
			left,
			left + len,
			CurrentTime);
		result = True;
	} else if (!(*pattern)){
		ok_dialog(search_data.shell_w, no_search_string);
		result = False;
	} else {
		char *msg_buf = XtMalloc(strlen(pattern) +
					strlen(not_found) + 1);
		sprintf(msg_buf, not_found, pattern);
		ok_dialog(search_data.shell_w, msg_buf);
		result = False;
	}
	XtFree(pattern);
	XtFree(text_buf);
	return result;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replace callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean replace_selection(Widget,SearchData*);
static void replace_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	(void) replace_selection(w, cbdata);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * support for replace callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean replace_selection(
	Widget				w,
	SearchData			*cbdata)
{
	XmTextPosition left, right;
	char *replacement;
	if(XmTextGetSelectionPosition(cbdata->text_w, &left, &right)
		&& left != right ) {
		replacement = XmTextGetString(
				cbdata->replace_w);
		text_show_position(cbdata->text_w, left);
		XmTextReplace(
			cbdata->text_w,
 			left,
			right,
			replacement);
		XmTextSetSelection(
			cbdata->text_w,
			left,
			left + strlen(replacement),
			CurrentTime);
		XtFree(replacement);
		return True;
	} else {
		ok_dialog(cbdata->shell_w, no_selection_to_replace);
		return False;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replace all callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void replace_all(char*,char*,char*,char**,NAT*);
static void replace_all_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	long int left, len;
	NAT start_point;
	char *pattern, *text_buf, *replacement, *all_replaced;
	pattern = XmTextGetString(cbdata->search_w);
	text_buf = XmTextGetString(cbdata->text_w);
	start_point = XmTextGetInsertionPosition(cbdata->text_w);
	search_string(pattern, text_buf, start_point, &left, &len,FORWARDS);
	if(left >= 0) {
		replacement = XmTextGetString(
				cbdata->replace_w);
		replace_all(
			pattern,
			text_buf,
			replacement,
			&all_replaced,
			&start_point);
		if(all_replaced == NULL) {
			ok_dialog(
				cbdata->shell_w,
				no_room_for_global);
			XtFree(replacement);
		} else {
			XmTextReplace(
				cbdata->text_w,
				0,
				XmTextGetLastPosition(
					cbdata->text_w),
				all_replaced);
			XmTextSetTopCharacter(cbdata->text_w, 0);
			text_show_position(
				cbdata->text_w,
				start_point);
			XmTextSetInsertionPosition(
				cbdata->text_w,
				start_point);
			XtFree(replacement);
			XtFree(all_replaced);
		}
	} else if (!(*pattern)){
		ok_dialog(cbdata->shell_w, no_search_string);
	} else {
		char *msg_buf = XtMalloc(strlen(pattern) +
					strlen(not_found) + 1);
		sprintf(msg_buf, not_found, pattern);
		ok_dialog(cbdata->shell_w, msg_buf);
	}
	XtFree(pattern);
	XtFree(text_buf);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search backwards & replace callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void search_backwards_replace_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	if(search_either(w, cbdata, BACKWARDS)) {
		(void) replace_selection(w, cbdata);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search forwards & replace callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void search_forwards_replace_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	if(search_either(w, cbdata, FORWARDS)) {
		(void) replace_selection(w, cbdata);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replace & search backwards callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void replace_search_backwards_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	if(replace_selection(w, cbdata)) {
		(void) search_either(w, cbdata, BACKWARDS);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replace & search forwards callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void replace_search_forwards_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	if(replace_selection(w, cbdata)) {
		(void) search_either(w, cbdata, FORWARDS);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search field setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void search_set_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	char *sel;
	if ((sel = get_selection(cbdata->shell_w, no_selection_search)) == NULL) {
		return;
	}
	XmTextSetString(cbdata->search_w, sel);
	XtFree(sel);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replacement field setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void replace_set_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	char *sel;
	if ((sel = get_selection(cbdata->shell_w, no_selection_replace)) == NULL) {
		return;
	}
	XmTextSetString(cbdata->replace_w, sel);
	XtFree(sel);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * text field clear callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void clear_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	Widget text_w = cbd;
	XmTextSetString(text_w, "");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * line number setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void line_no_set_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	line_no_set(cbdata);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * go to line number callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void line_no_to_offset(Widget,NAT,long int*,long int*);
static void goto_line_no_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	long int left, right;
	long int line_no = 0;
	short nrows;
	int scroll;
	char *line_no_string;

	line_no_string = XmTextGetString(cbdata->line_no_w);

	sscanf(line_no_string, "%ld", &line_no);

	if(line_no <= 0) {
		ok_dialog(cbdata->shell_w, no_line_no);
		XtFree(line_no_string);
		return;
	}

	line_no_to_offset(cbdata->text_w, line_no, &left, &right);
	if(left == NO_MEMORY) {
		ok_dialog(cbdata->shell_w, cant_goto_line_no);
	} else if (left < 0) {
		long int lines = -left -1;
		if(lines != 1) {
			char buf[200];
			sprintf(buf, line_no_too_big, lines);
			ok_dialog(cbdata->shell_w, buf);
		} else {
			ok_dialog(cbdata->shell_w, line_no_too_big1);
		}
	} else {
		XmTextSetTopCharacter(cbdata->text_w, left);
		XtVaGetValues(cbdata->text_w, XmNrows, &nrows, NULL);
		if(line_no > (scroll = nrows / 2)) {
			XmTextScroll(cbdata->text_w, -scroll);
		}
		XmTextSetSelection(cbdata->text_w,
				left, right, CurrentTime);
	}
	XtFree(line_no_string);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * actually doing the work:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * substr: is one string a leading substring of another.
 * returns number of matching characters in text being searched
 * if substring, 0 otherwise.
 * (brought out separately for future enhancement,
 *  e.g. to add regular expression matching).
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static long int substr(
	char		*pattern,
	char		*to_search)
{
	long int len = strlen(pattern);
	return (strncmp(pattern, to_search, len) ? 0 : len);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search_string is the basic search function.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void search_string(
	char		*pattern,
	char		*text_buf,
	long int 	start_point,
	long int 	*offset,
	long int 	*length,
	NAT		direction)
{
	int i;
	*length = 0;
	if(direction == FORWARDS) {
		for(i = start_point; text_buf[i]; ++i) {
			if(*length = substr(pattern, text_buf + i)) {
				break;
			}
		}
		if(!(*length)) {
			for(i = 0;
				i < start_point; ++i) {
				if(*length = substr(pattern, text_buf + i)) {
					break;
				}
			}
		}
	} else {
		for(i = start_point - 1; i >= 0; --i) {
			if(*length = substr(pattern, text_buf + i)) {
				break;
			}
		}
		if(!(*length)) {
			for(i = strlen(text_buf) - 1;
				i >= start_point; --i) {
				if(*length = substr(pattern, text_buf + i)) {
					break;
				}
			}
		}
	}
	*offset = (*length ? i : -1);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replace_all does the text processing part of the global search
 * and replace function
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void replace_all(
	char	*pattern,
	char	*text_buf,
	char	*replacement,
	char	**result,
	NAT	*start_point)
{
	long int text_buf_len, replacement_len, extra, matched_len;
	char	*p, *q, *next_p, *sp;
	text_buf_len = strlen(text_buf);
	replacement_len = strlen(replacement);

	p = text_buf;
	extra = 0;
	while(*p) {
		if(matched_len = substr(pattern, p)) {
			extra += replacement_len - matched_len;
			p += matched_len;
		} else {
			++p;
		}
	}
	if((*result = XtMalloc(text_buf_len + extra + 1)) == NULL) {
		return;
	}
	p = text_buf;
	q = *result;
	sp = q + *start_point;
	while(*p) {
		if(matched_len = substr(pattern, p)) {
			strncpy(q, replacement, replacement_len);
			next_p = p + matched_len;
			if(next_p - text_buf <= *start_point) {
				sp += replacement_len - matched_len;
			} else if (p - text_buf <= *start_point) {
				sp = q;
			}
			p = next_p;
			q += replacement_len;
		} else {
			*q++ = *p++;
		}
	}
	*q = '\0';
	*start_point = sp - *result;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * get_line_no returns the line number of the insertion position
 * in the text widget passed as an argument. It returns -1
 * if something went wrong (e.g., because we're in a multi-byte locale).
 * **** **** **** **** **** **** **** **** **** **** **** **** */
long int get_line_no(Widget text_w)
{
	XmTextPosition ins_pos, cur_pos;
	char data[BUFSIZ+1], *p;
	long int line_ct;
	ins_pos = XmTextGetInsertionPosition(text_w);
	for(cur_pos = 0, line_ct = 1; cur_pos <= ins_pos; cur_pos += BUFSIZ) {
		if(XmTextGetSubstring(text_w, cur_pos, BUFSIZ, BUFSIZ + 1, data)
				== XmCOPY_FAILED ) {
			return -1;
		}
		for(p = data; p - data + cur_pos < ins_pos && *p; ++p) {
			if(*p == '\n') {
				++line_ct;
			}
		}
	}
	return line_ct;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * line_no_to_offset returns the character offset of the 
 * first and last characters of a given line in a text widget.
 * first is set to  -(nlines + 1), where nlines is the total number
 * of line in the file if number out of range.
 * first is set to NO_MEMORY if not enough memory to do the job.
 * last is unchanged in these two error cases.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void line_no_to_offset(
	Widget		text_w,
	NAT		line_no,
	long int	*first,
	long int	*last)
{
	char *data, *p;
	long int line_ct;

	if((data = XmTextGetString(text_w)) == NULL) {
		*first = NO_MEMORY;
		return;
	}
	for(p = data, line_ct = line_no - 1; *p && line_ct; ++p) {
		if(*p == '\n' && *(p + 1)) {
			--line_ct;
		}
	}
	if(line_ct == 0) {
		*first = p - data;
		*last = *first;
		while(*p && *p != '\n') {
			++*last;
			++p;
		}
	} else {
		*first = -(line_no - line_ct + 1);
	}
	XtFree(data);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Support for line number setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void line_no_set(SearchData *cbdata)
{
	char line_no_string[16];
	long int line_no;
	if((line_no = get_line_no(cbdata->text_w)) <= 0) {
		ok_dialog(cbdata->shell_w, cant_get_line_no);
		return;
	}
	sprintf(line_no_string, "%ld", get_line_no(cbdata->text_w));
	XmTextSetString(cbdata->line_no_w, line_no_string);
}



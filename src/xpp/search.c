
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$ 
 *
 * search.c - support for search & replace for the X/Motif ProofPower Interface
 *
 * (c) ICL 1994
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
	"There is no selection in the text window "
	"to be copied into the replacement field";

static char *no_selection_search = 
	"There is no selection in the text window "
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
		line_no_w;} SearchData;
	
static SearchData search_data;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_search_tool: attach a search & replace tool to a text widget
 * This is long but only because it is repetitive.
 * The aim is a popup shell looking something like:
 *
 * | <= Search    |  Search =>    | := Selection |
 * |   <text to search for >                     |
 * | Replace      |  Replace All  | := Selection |
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

Bool add_search_tool(Widget text_w)
{
	NAT cbdata;
	Widget shell, paned, form, action,
		search_text,
		search_set_btn,
		replace_text,
		replace_set_btn,
		line_no_text,
		line_no_set_btn,
		search_backwards_btn,
		search_forwards_btn,
		replace_btn,
		replace_all_btn,
		goto_line_no_btn,
		help_btn,
		dismiss_btn;

	char	*pattern;

	static void
		search_backwards_cb(),
		search_forwards_cb(),
		replace_cb(),
		replace_all_cb(),
		search_set_cb(),
		replace_set_cb(),
		line_no_set(),
		line_no_set_cb(),
		goto_line_no_cb(),
		dismiss_cb(),
		help_cb();


	if((search_data.shell_w) != NULL) {
		XtManageChild(search_data.manager_w);
		XtPopup(search_data.shell_w, XtGrabNone);
		return True;
	};

	shell = XtVaCreatePopupShell("xpp-Search-and-Replace",
		transientShellWidgetClass, text_w,
		XmNdeleteResponse,		XmUNMAP,
		NULL); 

	paned = XtVaCreateWidget("search-replace-paned",
		xmPanedWindowWidgetClass, 	shell,
		XmNsashWidth,			1,
		XmNsashHeight,			1,
		NULL);

	form = XtVaCreateWidget("search-replace-form",
		xmFormWidgetClass, 		paned,
		XmNfractionBase,		24,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 1:
 * | <= Search    |  Search =>    | := Selection |
 * |   <text to search for >                     |
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	search_backwards_btn = XtVaCreateManagedWidget("<= Search",
		xmPushButtonWidgetClass,	form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		8,
		NULL);

	search_forwards_btn = XtVaCreateManagedWidget("Search =>",
		xmPushButtonWidgetClass,	form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		8,
		XmNrightPosition,		16,
		NULL);

	search_set_btn = XtVaCreateManagedWidget(":= Selection",
		xmPushButtonWidgetClass,	form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		16,
		NULL);

	search_text = XtVaCreateManagedWidget("search",
		xmTextWidgetClass,		form,
		XmNeditMode,			XmMULTI_LINE_EDIT,
		XmNrows,			2,
		XmNcolumns,			32,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNtopAttachment,		XmATTACH_WIDGET,
		XmNtopWidget,			search_set_btn,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 2:
 * | Replace      |  Replace All  | := Selection |
 * |   <text to replace with >                   |
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	replace_btn = XtVaCreateManagedWidget("Replace",
		xmPushButtonWidgetClass,	form,
		XmNtopAttachment,		XmATTACH_WIDGET,
		XmNtopWidget,			search_text,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		8,
		NULL);

	replace_all_btn = XtVaCreateManagedWidget("Replace All",
		xmPushButtonWidgetClass,	form,
		XmNtopAttachment,		XmATTACH_WIDGET,
		XmNtopWidget,			search_text,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		8,
		XmNrightPosition,		16,
		NULL);

	replace_set_btn = XtVaCreateManagedWidget(":= Selection",
		xmPushButtonWidgetClass,	form,
		XmNtopAttachment,		XmATTACH_WIDGET,
		XmNtopWidget,			search_text,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		16,
		NULL);

	replace_text = XtVaCreateManagedWidget("replace",
		xmTextWidgetClass,		form,
		XmNeditMode,			XmMULTI_LINE_EDIT,
		XmNrows,			2,
		XmNcolumns,			32,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNtopAttachment,		XmATTACH_WIDGET,
		XmNtopWidget,			replace_set_btn,
		NULL);


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 4:
 * | Go to line:  | <line number> | := Cursor    |
 *
 * Do the line number first so that the buttons can be lined up with it.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	line_no_text = XtVaCreateManagedWidget("line-number",
		xmTextWidgetClass,		form,
		XmNtopAttachment,		XmATTACH_WIDGET,
		XmNtopWidget,			replace_text,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftPosition,		8,
		XmNrightPosition,		16,
		XmNcolumns,			6,
		NULL);

	goto_line_no_btn = XtVaCreateManagedWidget("Go to line:",
		xmPushButtonWidgetClass,	form,
		XmNtopAttachment,		XmATTACH_WIDGET,
		XmNtopWidget,			replace_text,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNbottomAttachment,		XmATTACH_OPPOSITE_WIDGET,
		XmNrightPosition,		8,
		XmNbottomWidget,		line_no_text,
		NULL);

	line_no_set_btn = XtVaCreateManagedWidget(":= Cursor",
		xmPushButtonWidgetClass,	form,
		XmNtopAttachment,		XmATTACH_WIDGET,
		XmNtopWidget,			replace_text,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_OPPOSITE_WIDGET,
		XmNleftPosition,		16,
		XmNbottomWidget,		line_no_text,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 5:
 * -----------------------
 * | Dismiss    |  Help  |
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	action = XtVaCreateWidget("search-replace-action",
		xmFormWidgetClass, 		paned,
		XmNfractionBase,		24,
		NULL);

	dismiss_btn = XtVaCreateManagedWidget("Dismiss",
		xmPushButtonWidgetClass,	action,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		5,
		XmNrightPosition,		11,
		NULL);


	help_btn = XtVaCreateManagedWidget("Help",
		xmPushButtonWidgetClass,	action,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		13,
		XmNrightPosition,		19,
		NULL);

	fix_pane_height(action, dismiss_btn);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up static data to contain necessary widget handles:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	search_data.text_w = text_w;
	search_data.shell_w = shell;
	search_data.manager_w = form;
	search_data.search_w = search_text;
	search_data.replace_w = replace_text;
	search_data.line_no_w = line_no_text;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add callbacks (top to bottom then left to right).
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtAddCallback(search_set_btn, XmNactivateCallback,
		search_set_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_set_btn, XmNactivateCallback,
		replace_set_cb, (XtPointer)(&search_data));

	XtAddCallback(line_no_text, XmNmodifyVerifyCallback,
		(XtCallbackProc)number_verify_cb, (XtPointer)NULL);

	XtAddCallback(line_no_set_btn, XmNactivateCallback,
		line_no_set_cb, (XtPointer)(&search_data));

	XtAddCallback(search_backwards_btn, XmNactivateCallback,
		search_backwards_cb, (XtPointer)(&search_data));

	XtAddCallback(search_forwards_btn, XmNactivateCallback,
		search_forwards_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_btn, XmNactivateCallback,
		replace_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_all_btn, XmNactivateCallback,
		replace_all_cb, (XtPointer)(&search_data));

	XtAddCallback(goto_line_no_btn, XmNactivateCallback,
		goto_line_no_cb, (XtPointer)(&search_data));

	XtAddCallback(dismiss_btn, XmNactivateCallback,
		dismiss_cb, (XtPointer)(&search_data));

	XtAddCallback(help_btn, XmNactivateCallback,
		help_cb, (XtPointer)(&search_data));

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
 *set up text widget translations and font
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtOverrideTranslations(search_text, text_translations);
	XtOverrideTranslations(replace_text, text_translations);
	XtOverrideTranslations(line_no_text, text_translations);

	copy_font_list(search_text, text_w);
	copy_font_list(replace_text, text_w);
	copy_font_list(line_no_text, text_w);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Manage everything:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtManageChild(form);
	XtManageChild(action);
	XtManageChild(paned);
	XtPopup(shell, XtGrabNone);

	return True;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * dismiss callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void dismiss_cb(
	Widget				w,
	SearchData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	XtPopdown(cbdata->shell_w);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * help callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void help_cb(
	Widget				w,
	SearchData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	help_dialog(cbdata->shell_w, Help_Search_Tool);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search forwards callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void search_forwards_cb(
	Widget				w,
	SearchData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	static void search_either();
	search_either(w, cbdata, FORWARDS);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search backwards callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void search_backwards_cb(
	Widget				w,
	SearchData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	static void search_either();
	search_either(w, cbdata, BACKWARDS);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Support for search callbacks.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void search_either(
	Widget				w,
	SearchData			*cbdata,
	NAT				dir)
{
	long int left, len;
	NAT start_point;
	static long int search_string();
	char *pattern, *text_buf;
	XmTextPosition pl, pr;
	pattern = XmTextGetString(search_data.search_w);
	text_buf = XmTextGetString(search_data.text_w);
	if(XmTextGetSelectionPosition(search_data.text_w, &pl, &pr)) {
		start_point = (dir == FORWARDS ? pr : pl);
	} else {
		start_point = XmTextGetInsertionPosition(search_data.text_w);
	};
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
	} else if (!(*pattern)){
		ok_dialog(search_data.shell_w, no_search_string);
	} else {
		char *msg_buf = XtMalloc(strlen(pattern) +
					strlen(not_found));
		sprintf(msg_buf, not_found, pattern);
		ok_dialog(search_data.shell_w, msg_buf);
	}
	XtFree(pattern);
	XtFree(text_buf);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replace callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void replace_cb(
	Widget				w,
	SearchData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
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
	} else {
		ok_dialog(cbdata->shell_w, no_selection_to_replace);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replace all callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void replace_all_cb(
	Widget				w,
	SearchData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	long int left, len;
	NAT start_point;
	static long int search_string();
	static void replace_all();
	char *pattern, *text_buf, *replacement, *all_replaced;
	pattern = XmTextGetString(cbdata->search_w);
	text_buf = XmTextGetString(cbdata->text_w);
	start_point = XmTextGetInsertionPosition(cbdata->text_w);
	search_string(pattern, text_buf, start_point, &left, &len);
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
					strlen(not_found));
		sprintf(msg_buf, not_found, pattern);
		ok_dialog(cbdata->shell_w, msg_buf);
	}
	XtFree(pattern);
	XtFree(text_buf);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search field setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void search_set_cb(
	Widget				w,
	SearchData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	char *sel;
	if((sel = XmTextGetSelection(cbdata->text_w)) == NULL) {
		ok_dialog(cbdata->shell_w, no_selection_search);
		return;
	};
	XmTextSetString(cbdata->search_w, sel);
	XtFree(sel);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replacement field setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void replace_set_cb(
	Widget				w,
	SearchData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	char *sel;
	if((sel = XmTextGetSelection(cbdata->text_w)) == NULL) {
		ok_dialog(cbdata->shell_w, no_selection_replace);
		return;
	};
	XmTextSetString(cbdata->replace_w, sel);
	XtFree(sel);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * line number setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void line_no_set_cb(
	Widget				w,
	SearchData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	static void line_no_set();
	line_no_set(cbdata);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * go to line number callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void goto_line_no_cb(
	Widget				w,
	SearchData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	static void line_no_to_offset();
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
		};		
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

static char * replace_all(
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
	if((*result = XtMalloc(text_buf_len + extra)) == NULL) {
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
			};
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
 * in the text widget passed as an argument. It returns NO_MEMORY
 * if it could not allocate enough memory to do the calculation.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static long int get_line_no(Widget text_w)
{
	XmTextPosition ins_pos;
	char *data, *p;
	long int line_ct;
	ins_pos = XmTextGetInsertionPosition(text_w);
	if((data = XtMalloc(ins_pos + 1)) == NULL) {
		return 0;
	};
	if(XmTextGetSubstring(text_w, 0, ins_pos, ins_pos + 1, data)
			!= XmCOPY_SUCCEEDED ) {
		return NO_MEMORY;
	};
	for(p = data, line_ct = 1; *p; ++p) {
		if(*p == '\n') {
			++line_ct;
		}
	};
	XtFree(data);
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
static void line_no_to_offset (
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
	};
	for(p = data, line_ct = line_no - 1; *p && line_ct; ++p) {
		if(*p == '\n' && *(p + 1)) {
			--line_ct;
		}
	};
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
	sprintf(line_no_string, "%d", get_line_no(cbdata->text_w));
	XmTextSetString(cbdata->line_no_w, line_no_string);
}



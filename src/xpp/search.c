
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$ 
 *
 * find.c - support for find & replace for the X/Motif ProofPower Interface
 *
 * (c) ICL 1994
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _find

#define DO_FIND		0
#define DO_REPLACE	1
#define DO_REPLACE_ALL	2

#define NO_MEMORY	-1

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

static char *no_room_for_global = 
	"Running out of memory! "
	"Not enough memory is left to perform the global replacement";

static char *no_selection_find = 
	"There is no selection in the text window "
	"to be copied into the find field";

static char *no_selection_replace = 
	"There is no selection in the text window "
	"to be copied into the replacement field";

static char *not_found = 
	"Search pattern \"%s\" not found";

static char *line_no_too_big =
	"There are only %ld lines in the file";

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * static data
 * **** **** **** **** **** **** **** **** **** **** **** **** */

typedef struct {
	Widget	text_w,
		shell_w,
		manager_w,
		find_w,
		replace_w,
		line_no_w;} FindData;
	
static FindData find_data;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_find_tool: attach a find & replace tool to a text widget
 * This is long but only because it is repetitive.
 * The aim is a popup shell looking something like:
 *
 * | Search for:   | search string                    | Selection |
 * | Replace with: | replacement string               | Selection |
 * | Line Number:  | line number string               | Cursor |
 * |  Search   | Find & Replace | Replace All | Go to line number |
 *
 * Each `xyz' string here is a text field, labelled by the label to
 * its left. One its right is a push-button which can be used to
 * include the selection from the text widget in the search and
 * replacement strings or to put the line number corresponding
 * to the insertion point in the line number string.
 * The bottom row contains push-buttons which actually initiate the
 * searches etc.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Bool add_find_tool(Widget text_w)
{
	NAT cbdata;
	Widget shell, rowcol,
		find_form,
		find_lab,
		find_text,
		find_set_btn,
		replace_form,
		replace_lab,
		replace_text,
		replace_set_btn,
		line_no_form,
		line_no_lab,
		line_no_text,
		line_no_set_btn,
		button_form,
		find_btn,
		replace_btn,
		replace_all_btn,
		goto_line_no_btn;

	char	*pattern;

	static void
		find_cb(),
		find_set_cb(),
		replace_set_cb(),
		line_no_set(),
		line_no_set_cb(),
		goto_line_no_cb();


	if((find_data.shell_w) != NULL) {
		XtManageChild(find_data.manager_w);
		XtPopup(find_data.shell_w, XtGrabNone);
		return True;
	};


	shell = XtVaCreatePopupShell("Find a String",
		xmDialogShellWidgetClass, text_w,
		NULL); 

	rowcol = XtVaCreateWidget("rowcolumn",
		xmRowColumnWidgetClass, shell,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Row 1:  | Search for: | search string | Selection
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	find_form = XtVaCreateWidget("find form",
		xmFormWidgetClass, rowcol,
		XmNfractionBase,	12,
		NULL);

	find_lab = XtVaCreateManagedWidget("Search for:",
		xmLabelWidgetClass,	find_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		2,
		XmNalignment,			XmALIGNMENT_BEGINNING,
		NULL);

	find_text = XtVaCreateManagedWidget("pp_text",
		xmTextFieldWidgetClass,	find_form,
		XmNtraversalOn,			True,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		2,
		XmNrightPosition,		10,
		XmNcolumns,			40,
		NULL);

	find_set_btn = XtVaCreateManagedWidget("Selection",
		xmPushButtonWidgetClass,	find_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		10,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Row 2:  | Replace with: | replacement string | Selection
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	replace_form = XtVaCreateWidget("replace form",
		xmFormWidgetClass, rowcol,
		XmNfractionBase,	12,
		NULL);

	replace_lab = XtVaCreateManagedWidget("Replace with:",
		xmLabelWidgetClass,	replace_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		2,
		XmNalignment,			XmALIGNMENT_BEGINNING,
		NULL);

	replace_text = XtVaCreateManagedWidget("pp_text",
		xmTextFieldWidgetClass,	replace_form,
		XmNtraversalOn,			True,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		2,
		XmNrightPosition,		10,
		XmNcolumns,			40,
		NULL);

	replace_set_btn = XtVaCreateManagedWidget("Selection",
		xmPushButtonWidgetClass,	replace_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		10,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Row 3:  | Line Number: | line number string | Cursor
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	line_no_form = XtVaCreateWidget("line number form",
		xmFormWidgetClass, rowcol,
		XmNfractionBase,	12,
		NULL);

	line_no_lab = XtVaCreateManagedWidget("Line number:",
		xmLabelWidgetClass,		line_no_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		2,
		XmNalignment,			XmALIGNMENT_BEGINNING,
		NULL);

	line_no_text = XtVaCreateManagedWidget("pp_text",
		xmTextFieldWidgetClass,		line_no_form,
		XmNtraversalOn,			True,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		2,
		XmNrightPosition,		10,
		XmNcolumns,			40,
		NULL);

	line_no_set_btn = XtVaCreateManagedWidget("Cursor",
		xmPushButtonWidgetClass,	line_no_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		10,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Row 4:  | Search | Find & Replace | Replace All | Go to line number
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	button_form = XtVaCreateWidget("button form",
		xmFormWidgetClass, rowcol,
		XmNfractionBase,	16,
		NULL);

	find_btn = XtVaCreateManagedWidget("Search",
		xmPushButtonWidgetClass,	button_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		3,
		NULL);

	replace_btn = XtVaCreateManagedWidget("Search & Replace",
		xmPushButtonWidgetClass,	button_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		3,
		XmNrightPosition,		7,
		NULL);

	replace_all_btn = XtVaCreateManagedWidget("Replace All",
		xmPushButtonWidgetClass,	button_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		7,
		XmNrightPosition,		11,
		NULL);

	goto_line_no_btn = XtVaCreateManagedWidget("Go to line number",
		xmPushButtonWidgetClass,	button_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		11,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up static data to contain necessary widget handles:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	find_data.text_w = text_w;
	find_data.shell_w = shell;
	find_data.manager_w = rowcol;
	find_data.find_w = find_text;
	find_data.replace_w = replace_text;
	find_data.line_no_w = line_no_text;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add callbacks (top to bottom then left to right).
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtAddCallback(find_set_btn, XmNactivateCallback,
		find_set_cb, (XtPointer)(&find_data));

	XtAddCallback(replace_set_btn, XmNactivateCallback,
		replace_set_cb, (XtPointer)(&find_data));

	XtAddCallback(line_no_set_btn, XmNactivateCallback,
		line_no_set_cb, (XtPointer)(&find_data));

	XtAddCallback(find_btn, XmNactivateCallback,
		find_cb, (XtPointer)DO_FIND);

	XtAddCallback(replace_btn, XmNactivateCallback,
		find_cb, (XtPointer)DO_REPLACE);

	XtAddCallback(replace_all_btn, XmNactivateCallback,
		find_cb, (XtPointer)DO_REPLACE_ALL);

	XtAddCallback(goto_line_no_btn, XmNactivateCallback,
		goto_line_no_cb, (XtPointer)(&find_data));

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Initialise search string and line number:
 * Don't use callback for search string, since there
 * may not be a selection and don't want error message.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	if(pattern = XmTextGetSelection(text_w)) {
		XmTextSetString(find_text, pattern);
		XmTextShowPosition(find_text, strlen(pattern));
		XtFree(pattern);
	}

	line_no_set(&find_data);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Manage everything:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtManageChild(find_form);
	XtManageChild(replace_form);
	XtManageChild(line_no_form);
	XtManageChild(button_form);
	XtManageChild(rowcol);
	XtPopup(shell, XtGrabNone);

	return True;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * find callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void find_cb(
	Widget				w,
	NAT				cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	long int left, len;
	NAT start_point;
	static long int find_string();
	static void replace_all();
	char *pattern, *text_buf, *replacement, *all_replaced;
	pattern = XmTextGetString(find_data.find_w);
	text_buf = XmTextGetString(find_data.text_w);
	start_point = XmTextGetInsertionPosition(find_data.text_w);
	find_string(pattern, text_buf, start_point, &left, &len);
	if(left >= 0) {
		switch(cbdata) {
			case DO_FIND:
				XmTextSetSelection(
					find_data.text_w,
					left,
					left + len,
					CurrentTime);
				XmTextShowPosition(
					find_data.text_w,
					left);
				break;
			case DO_REPLACE:
				replacement = XmTextGetString(
						find_data.replace_w);
				XmTextReplace(
					find_data.text_w,
 					left,
					left + strlen(pattern),
					replacement);
				XmTextSetSelection(
					find_data.text_w,
					left,
					left + strlen(replacement),
					CurrentTime);
				XmTextShowPosition(
					find_data.text_w,
					left);
				XtFree(replacement);
				break;
			case DO_REPLACE_ALL:
				replacement = XmTextGetString(
						find_data.replace_w);
				replace_all(
					pattern,
					text_buf,
					replacement,
					&all_replaced,
					&start_point);
				if(all_replaced == NULL) {
					ok_dialog(
						find_data.shell_w,
						no_room_for_global);
					XtFree(replacement);
					break;
				}
				XmTextReplace(
					find_data.text_w,
					0,
					XmTextGetLastPosition(
						find_data.text_w),
					all_replaced);
				XmTextSetInsertionPosition(
					find_data.text_w,
					start_point);
				XmTextShowPosition(
					find_data.text_w,
					start_point);
				XtFree(replacement);
				XtFree(all_replaced);
				break;
			default:
				break;
		}
	} else {
		char *msg_buf = XtMalloc(strlen(pattern) +
					strlen(not_found));
		sprintf(msg_buf, not_found, pattern);
		ok_dialog(find_data.shell_w, msg_buf);
	}
	XtFree(pattern);
	XtFree(text_buf);

}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * find field setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void find_set_cb(
	Widget				w,
	FindData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	char *sel;
	XmTextPosition ins_pos;
	if((sel = XmTextGetSelection(cbdata->text_w)) == NULL) {
		ok_dialog(cbdata->shell_w, no_selection_find);
		return;
	};
	ins_pos = XmTextFieldGetInsertionPosition(cbdata->find_w);
	XmTextFieldInsert(cbdata->find_w, ins_pos, sel);
	XtFree(sel);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replacement field setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void replace_set_cb(
	Widget				w,
	FindData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	char *sel;
	XmTextPosition ins_pos;
	if((sel = XmTextGetSelection(cbdata->text_w)) == NULL) {
		ok_dialog(cbdata->shell_w, no_selection_replace);
		return;
	};
	ins_pos = XmTextFieldGetInsertionPosition(cbdata->replace_w);
	XmTextFieldInsert(cbdata->replace_w, ins_pos, sel);
	XtFree(sel);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * line number setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void line_no_set_cb(
	Widget				w,
	FindData			*cbdata,
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
	FindData			*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	static long int line_no_to_offset();
	long int offset;
	long int line_no;
	char *line_no_string;

	line_no_string = XmTextGetString(cbdata->line_no_w);

	sscanf(line_no_string, "%ld", &line_no);

	offset = line_no_to_offset(cbdata->text_w, line_no);
	if(offset == NO_MEMORY) {
		ok_dialog(cbdata->shell_w, cant_goto_line_no);
	} else if (offset < 0) {
		char buf[200];
		sprintf(buf, line_no_too_big, -offset - 1);
		ok_dialog(cbdata->shell_w, buf);
	} else {
		XmTextSetTopCharacter(cbdata->text_w, offset);
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
 * find_string is the basic search function.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void find_string(
	char		*pattern,
	char		*text_buf,
	NAT		start_point,
	long int 	*offset,
	long int 	*length)
{
	char *p;
	*length = 0;
	for(p = text_buf + start_point; *p; ++p) {
		if(*length = substr(pattern, p)) {
			break;
		}
	}
	if(!(*length)) {
		for(p = text_buf;
			p < text_buf + start_point; ++p) {
			if(*length = substr(pattern, p)) {
				break;
			}
		}
	};
	*offset = (*length ? p - text_buf : -1);
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
 * first character of a given line in a text widget.
 * returns -(nlines + 1), where nlines is the total number
 * of line in the file if number out of range.
 * returns NO_MEMORY if could not allocate memory to do the job.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static long int line_no_to_offset (Widget text_w, NAT line_no)
{
	XmTextPosition ins_pos;
	char *data, *p;
	long int line_ct;

	XmTextPosition res;
	if((data = XmTextGetString(text_w)) == NULL) {
		return NO_MEMORY;
	};
	for(p = data, line_ct = line_no - 1; *p && line_ct; ++p) {
		if(*p == '\n' && *(p + 1)) {
			--line_ct;
		}
	};
	res =  (line_ct == 0 ? p - data : -(line_no - line_ct + 1));
	XtFree(data);
	return res;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Support for line number setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void line_no_set(FindData *cbdata)
{
	char line_no_string[16];
	long int line_no;
	if((line_no = get_line_no(cbdata->text_w)) <= 0) {
		ok_dialog(cbdata->shell_w, cant_get_line_no);
		return;
	}
	sprintf(line_no_string, "%d", get_line_no(cbdata->text_w));
	XmTextFieldSetString(cbdata->line_no_w, line_no_string);
}



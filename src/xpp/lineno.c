
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: lineno.c,v 2.44 2004/02/09 16:43:33 rda Exp rda $ 
 *
 * lineno.c - support for search & replace for the X/Motif ProofPower Interface
 *
 * lineno.c: this file is part of the PPTex system
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

#define CHECK_MAP_STATE(SDP) \
	{if (get_map_state((SDP)->text_w) != IsViewable) { beep(); return; }}

#include <stdio.h>
#include <ctype.h>
#include <sys/types.h>

#include "xpp.h"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * typedefs
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/*
 * The following struct includes the various widgets that
 * act as parameters to the various search and replace
 * operations.
 */
typedef struct {
	Widget	text_w,
		shell_w,
		manager_w,
		line_no_w,
		default_focus_w;
} LineNoData;

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
	"Line number to go to is missing or zero.";

static char *line_no_too_big1 =
	"There is only 1 line in the file.";

static char *line_no_too_big =
	"There are only %ld lines in the file.";

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * static data
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	
static LineNoData line_no_data;
/*
 * Forward declarations for callbacks etc.
 */
static void	line_no_set_cb(CALLBACK_ARGS),
		goto_line_no_cb(CALLBACK_ARGS),
		dismiss_cb(CALLBACK_ARGS),
		help_cb(CALLBACK_ARGS);

static void line_no_set(LineNoData*);

/*
 * Popup menu for the search, replace and line number text widgets:
 */
#define TEXT_EDIT_OPS 4		/* including the separator */
#define LINE_NO_SPECIAL_OPS 1

static MenuItem line_no_edit_menu_items[] = {
    { "Cut", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_cut_cb, NULL, (MenuItem *)NULL, False },
    { "Copy", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_copy_cb, NULL, (MenuItem *)NULL, False },
    { "Paste", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_paste_cb, NULL, (MenuItem *)NULL, False },
    MENU_ITEM_SEPARATOR,
    { ":= Cursor", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        line_no_set_cb, NULL, (MenuItem *)NULL, False },
    {NULL}
};

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_line_no_tool: attach a search & replace tool to a text widget
 * This is long but only because it is repetitive.
 * The aim is a popup shell looking something like:
 *
 * | Go to line:  | <line number> | := Cursor    |
 * -----------------------
 * | Dismiss    |   | Help  |
 *
 * Each `<...>' here is a text field
 * The `:= ...' push-button can be used to put the line number corresponding
 * to the insertion point in the line number string.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean add_line_no_tool(Widget text_w)
{
	NAT cbdata;
	Widget shell, 
		line_no_form,
		goto_line_no_btn,
		line_no_text,
		line_no_set_btn,
		dismiss_btn,
		help_btn;

	char	*pattern;
	int	i, j;

	XmString s;

	if((line_no_data.shell_w) != NULL) {
		XtManageChild(line_no_data.manager_w);
		XtPopup(line_no_data.shell_w, XtGrabNone);
		return True;
	}

	shell = XtVaCreatePopupShell("xpp-Line-Number",
		transientShellWidgetClass, text_w,
		XmNdeleteResponse,		XmUNMAP,
		NULL); 
#ifdef EDITRES
	add_edit_res_handler(shell);
#endif
	common_dialog_setup(shell, dismiss_cb,  (XtPointer)(&line_no_data));

	line_no_form = XtVaCreateWidget("line-number-form",
		xmFormWidgetClass, 		shell,
		XmNfractionBase,		24,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 4:
 * | Go to line:  | <line number> | := Cursor    |
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */


	s = XmStringCreateSimple("Go to line:");
	goto_line_no_btn = XtVaCreateManagedWidget("go-to-line",
		xmPushButtonWidgetClass,	line_no_form,
		XmNlabelString,		s,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNleftAttachment,	XmATTACH_FORM,
		XmNrightAttachment,	XmATTACH_POSITION,
		XmNrightPosition,		8,
		XmNbottomAttachment,	XmATTACH_POSITION,
		XmNbottomPosition,	12,
		NULL);
	XmStringFree(s);

	line_no_text = XtVaCreateManagedWidget("line-number",
		xmTextWidgetClass,	line_no_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNleftAttachment,	XmATTACH_POSITION,
		XmNleftPosition,		8,
		XmNrightAttachment,	XmATTACH_POSITION,
		XmNrightPosition,		16,
		XmNbottomAttachment,	XmATTACH_POSITION,
		XmNbottomPosition,	12,
		NULL);

	s = XmStringCreateSimple(":= Cursor");
	line_no_set_btn = XtVaCreateManagedWidget("becomes-cursor",
		xmPushButtonWidgetClass,	line_no_form,
		XmNlabelString,		s,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNleftAttachment,	XmATTACH_POSITION,
		XmNleftPosition,		16,
		XmNrightAttachment,	XmATTACH_FORM,
		XmNbottomAttachment,	XmATTACH_POSITION,
		XmNbottomPosition,	12,
		NULL);
	XmStringFree(s);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 2:
 * -----------------------
 * | Dismiss    |  Options | Help  |
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	s = XmStringCreateSimple("Dismiss");
	dismiss_btn = XtVaCreateManagedWidget("dismiss",
		xmPushButtonWidgetClass,	line_no_form,
		XmNlabelString,		s,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,		12,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		1,
		XmNrightPosition,		7,
		NULL);
	XmStringFree(s);


	s = XmStringCreateSimple("Help");
	help_btn = XtVaCreateManagedWidget("help",
		xmPushButtonWidgetClass,	line_no_form,
		XmNlabelString,		s,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,		12,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		17,
		XmNrightPosition,		23,
		NULL);
	XmStringFree(s);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up static data to contain necessary widget handles:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	line_no_data.text_w = text_w;
	line_no_data.shell_w = shell;
	line_no_data.manager_w = line_no_form;
	line_no_data.line_no_w = line_no_text;
	line_no_data.default_focus_w = goto_line_no_btn;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up the text windows in the search dialog as selection sources
 * and palette clients. (This sounds silly but is intuitively right for
 * the line number widget - if focus is in the line number pushing
 * a palette button will cause a blink or a bleat and then send focus
 * back to the line number).
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	register_selection_source(line_no_text);
	register_palette_client(line_no_text);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add callbacks
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtAddCallback(goto_line_no_btn, XmNactivateCallback,
		goto_line_no_cb, (XtPointer)(&line_no_data));

	XtAddCallback(line_no_text, XmNmodifyVerifyCallback,
		(XtCallbackProc)number_verify_cb, (XtPointer)NULL);

	XtAddCallback(line_no_text, XmNactivateCallback,
		goto_line_no_cb, (XtPointer)(&line_no_data));

	XtAddCallback(line_no_set_btn, XmNactivateCallback,
		line_no_set_cb, (XtPointer)(&line_no_data));

	XtAddCallback(dismiss_btn, XmNactivateCallback,
		dismiss_cb, (XtPointer)(&line_no_data));

	XtAddCallback(help_btn, XmNactivateCallback,
		help_cb, (XtPointer)NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Set up popup edit menus.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	for(i = 0; i < TEXT_EDIT_OPS; i += 1) {
		line_no_edit_menu_items[i].callback_data =(XtPointer) line_no_text;
	}
	for(j = 0; j < LINE_NO_SPECIAL_OPS; j += 1) {
		line_no_edit_menu_items[i+j].callback_data = (XtPointer)(&line_no_data);
	}
	attach_edit_popup(line_no_text, line_no_edit_menu_items);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Initialise line number:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	line_no_set(&line_no_data);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 *set up text widget translations
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtOverrideTranslations(line_no_text, text_translations);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Make return in the line number text widget activate it
 **** **** **** **** **** **** **** **** **** **** **** **** */

	XtOverrideTranslations(line_no_text,
		XtParseTranslationTable("<Key>Return: activate()"));

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Manage everything:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtManageChild(line_no_form);

	XtPopup(shell, XtGrabNone);

	XmProcessTraversal(goto_line_no_btn, XmTRAVERSE_CURRENT);

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
	LineNoData *cbdata = cbd;
	XmProcessTraversal(cbdata->default_focus_w, XmTRAVERSE_CURRENT);
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
	help_dialog(root, Help_Line_Number_Tool);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * line number setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void line_no_set_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	LineNoData *cbdata = cbd;
	cbdata->default_focus_w = w;
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
	LineNoData *cbdata = cbd;
	long int left, right;
	long int line_no = 0;
	short nrows;
	int scroll;
	char *line_no_string;
	cbdata->default_focus_w = w;
	CHECK_MAP_STATE(cbdata)

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
 * get_line_no returns the line number of the insertion position
 * in the text widget passed as an argument. It returns -1
 * if something went wrong (e.g., because we're in a multi-byte locale).
. * **** **** **** **** **** **** **** **** **** **** **** **** */
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

static void line_no_set(LineNoData *cbdata)
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


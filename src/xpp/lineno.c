
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: lineno.c,v 1.6 2004/11/20 12:11:32 rda Exp rda $ 
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
		line_no_w;
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
 * | Go to line:  | <line number>  |
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
		paned,
		top_form,
		bottom_form,
		goto_line_no_btn,
		line_no_text,
		dismiss_btn,
		help_btn;

	char	*pattern;
	int	i, j, num_children;
	Widget	*children;

	XmString s;
	XmTextPosition last_pos;

	if((line_no_data.shell_w) != NULL) {
		XtManageChild(line_no_data.manager_w);
		XtPopup(line_no_data.shell_w, XtGrabNone);
		line_no_text = line_no_data.line_no_w;
		XmProcessTraversal(line_no_text, XmTRAVERSE_CURRENT);
		last_pos = XmTextGetLastPosition(line_no_text);
		XmTextSetInsertionPosition(line_no_text, last_pos);
		XmTextShowPosition(line_no_text, last_pos);
		XmTextSetSelection(line_no_text, 0, last_pos, CurrentTime);
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

	paned = XtVaCreateWidget("paned",
		xmPanedWindowWidgetClass, 		shell,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 4:
 * | Go to line:  | <line number>  |
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	top_form = XtVaCreateWidget("top-form",
		xmFormWidgetClass, 		paned,
		XmNfractionBase,		24,
		NULL);

	s = XmStringCreateSimple("Go to line:");
	goto_line_no_btn = XtVaCreateManagedWidget("go-to-line",
		xmPushButtonWidgetClass,	top_form,
		XmNlabelString,		s,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNleftAttachment,	XmATTACH_FORM,
		XmNrightAttachment,	XmATTACH_POSITION,
		XmNrightPosition,		12,
		XmNbottomAttachment,	XmATTACH_FORM,
		NULL);
	XmStringFree(s);

	line_no_text = XtVaCreateManagedWidget("line-number",
		xmTextWidgetClass,	top_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNleftAttachment,	XmATTACH_POSITION,
		XmNleftPosition,		12,
		XmNrightAttachment,	XmATTACH_FORM,
		XmNbottomAttachment,	XmATTACH_FORM,
		XmNbottomPosition,	12,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 2:
 * -----------------------
 * | Dismiss    | Help  |
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	bottom_form = XtVaCreateWidget("bottom-form",
		xmFormWidgetClass, 		paned,
		XmNfractionBase,		24,
		NULL);

	s = XmStringCreateSimple("Dismiss");
	dismiss_btn = XtVaCreateManagedWidget("dismiss",
		xmPushButtonWidgetClass,	bottom_form,
		XmNlabelString,		s,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		2,
		XmNrightPosition,		11,
		NULL);
	XmStringFree(s);


	s = XmStringCreateSimple("Help");
	help_btn = XtVaCreateManagedWidget("help",
		xmPushButtonWidgetClass,	bottom_form,
		XmNlabelString,		s,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		13,
		XmNrightPosition,		22,
		NULL);
	XmStringFree(s);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up static data to contain necessary widget handles:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	line_no_data.text_w = text_w;
	line_no_data.shell_w = shell;
	line_no_data.manager_w = paned;
	line_no_data.line_no_w = line_no_text;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up the text windows in the search dialog as selection sources
 * and palette clients. (This sounds silly but is intuitively right for
 * the line number widget - if focus is in the line number, pushing
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

	XtManageChild(top_form);
	XtManageChild(bottom_form);
	XtManageChild(paned);

	XtPopup(shell, XtGrabNone);

	fix_pane_height(bottom_form, bottom_form);

	XtVaGetValues(paned,
		XmNchildren,		&children,
		XmNnumChildren,		&num_children,
		NULL);

	for(i = 0; i < num_children; ++i) {
		if(!strcmp(XtName(children[i]), "Sash")) {
			XtVaSetValues(children[i],
				XmNheight,	1,
				XmNwidth,	1,
				XmNsensitive,	False,
				NULL);
		}
	}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Select all the text in the text window and give it the focus
 * (so if the user just types it replaces what's there).
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	XmTextSetSelection(
		line_no_text,
		0, XmTextGetLastPosition(line_no_text),
		CurrentTime);
	XmProcessTraversal(line_no_text, XmTRAVERSE_CURRENT);

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
	CHECK_MAP_STATE(cbdata)

	line_no_string = XmTextGetString(cbdata->line_no_w);

	sscanf(line_no_string, "%ld", &line_no);

	XtFree(line_no_string);

	if(line_no <= 0) {
		ok_dialog(cbdata->shell_w, no_line_no);
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

	XmTextSetSelection(
		cbdata->line_no_w,
		0, XmTextGetLastPosition(cbdata->line_no_w),
		CurrentTime);
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
	XmTextPosition last_pos;
	long int line_no;
	if((line_no = get_line_no(cbdata->text_w)) <= 0) {
		ok_dialog(cbdata->shell_w, cant_get_line_no);
		return;
	}
	sprintf(line_no_string, "%ld", get_line_no(cbdata->text_w));
	XmTextSetString(cbdata->line_no_w, line_no_string);
	last_pos = XmTextGetLastPosition(line_no_data.line_no_w);
	XmTextSetInsertionPosition(line_no_data.line_no_w, last_pos);
	XmTextShowPosition(line_no_data.line_no_w, last_pos);
}



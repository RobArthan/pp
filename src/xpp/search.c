
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$ 
 *
 * find.c - support for dfind & replace for the X/Motif ProofPower Interface
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

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files: 
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#include <stdio.h>
#include <ctype.h>

#include "xpp.h"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * static data
 * **** **** **** **** **** **** **** **** **** **** **** **** */

typedef struct {Widget text_w, shell_w, manager_w, find_w, replace_w;} FindData;

static FindData find_data;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_find_tool: attach a find & replace tool to a text widget
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Bool add_find_tool(Widget text_w)
{
	NAT cbdata;
	Widget shell, rowcol, find_form, replace_form,
		find_text, replace_text, find_btn, replace_btn,
		find_lab, replace_lab, button_form;

	static void find_cb(), replace_cb();


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

	find_form = XtVaCreateWidget("find form",
		xmFormWidgetClass, rowcol,
		XmNfractionBase,	10,
		NULL);

	replace_form = XtVaCreateWidget("replace form",
		xmFormWidgetClass, rowcol,
		XmNfractionBase,	10,
		NULL);

	button_form = XtVaCreateWidget("button form",
		xmFormWidgetClass, rowcol,
		XmNfractionBase,	10,
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

	find_text = XtVaCreateManagedWidget("find string",
		xmTextFieldWidgetClass,	find_form,
		XmNtraversalOn,			True,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		2,
		XmNcolumns,			40,
		NULL);

	replace_lab = XtVaCreateManagedWidget("Replace With:",
		xmLabelWidgetClass,	replace_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		2,
		XmNalignment,			XmALIGNMENT_BEGINNING,
		NULL);

	replace_text = XtVaCreateManagedWidget("replacement string",
		xmTextFieldWidgetClass,	replace_form,
		XmNtraversalOn,			True,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		2,
		XmNcolumns,			40,
		NULL);

	find_btn = XtVaCreateManagedWidget("Find",
		xmPushButtonWidgetClass,	button_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		4,
		NULL);

	replace_btn = XtVaCreateManagedWidget("Find and Replace",
		xmPushButtonWidgetClass,	button_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		5,
		NULL);

	XtAddCallback(find_btn, XmNactivateCallback,
		find_cb, (XtPointer)DO_FIND);

	XtAddCallback(find_text, XmNactivateCallback,
		find_cb, (XtPointer)DO_FIND);

	XtAddCallback(replace_btn, XmNactivateCallback,
		find_cb, (XtPointer)DO_REPLACE);

	XtAddCallback(replace_text, XmNactivateCallback,
		find_cb, (XtPointer)DO_REPLACE);

	find_data.text_w = text_w;
	find_data.shell_w = shell;
	find_data.manager_w = rowcol;
	find_data.find_w = find_text;
	find_data.replace_w = replace_text;


	XtManageChild(find_form);
	XtManageChild(replace_form);
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
	int left, len;
	NAT start_point;
	static int find_string();
	char *to_find, *to_search, *replacement;
	to_find = XmTextGetString(find_data.find_w);
	to_search = XmTextGetString(find_data.text_w);
	start_point = XmTextGetInsertionPosition(find_data.text_w);
	left = find_string(to_find, to_search, start_point);
	if(left > 0) {
		switch(cbdata) {
			case DO_FIND:
				XmTextSetSelection(
					find_data.text_w,
					left,
					left + strlen(to_find),
					CurrentTime);
				break;
			case DO_REPLACE:
				replacement = XmTextGetString(
						find_data.replace_w);
				XmTextReplace(
					find_data.text_w,
 					left,
					left + strlen(to_find),
					replacement);
				XmTextSetSelection(
					find_data.text_w,
					left,
					left + strlen(replacement),
					CurrentTime);
				XtFree(replacement);
				break;
			default:
				break;
		}
	}
		
	XtFree(to_find);
	XtFree(to_search);

}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * actually doing the work:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


static int find_string(
	char	*to_find,
	char	*to_search,
	NAT	start_point)
{
	int find_len;
	char *p;
	Boolean got_it = False;
	find_len = strlen(to_find);
	for(p = to_search + start_point; *p; ++p) {
		if(!strncmp(p, to_find, find_len)) {
			got_it = True;
			break;
		}
	}
	if(!got_it) {
		for(p = to_search;
			p < to_search + start_point; ++p) {
			if(!strncmp(p, to_find, find_len)) {
				got_it = True;
				break;
			}
		}
	};
	return (got_it ? p - to_search : -1);
}
	


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$ 
 *
 * templates.c - support for templates for the X/Motif ProofPower Interface
 *
 * (c) ICL 1994
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _templates
#define MAX_TEMPLATES_FORMS 4
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files: 
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#include <stdio.h>
#include <ctype.h>
#include <Xm/DialogS.h>
#include <Xm/MainW.h>
#include <Xm/RowColumn.h>
#include <Xm/Text.h>
#include <Xm/PushBG.h>
#include <Xm/Form.h>
#include <Xm/LabelG.h>
#include <Xm/MessageB.h>
#include <Xm/PushB.h>

#include "xpp.h"


typedef struct {
	Widget text_w; Widget templates_w;
} TemplatesData;

static TemplatesData templates_data[MAX_TEMPLATES_FORMS];

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * get_templates_data: get template information from the resource
 * **** **** **** **** **** **** **** **** **** **** **** **** */

typedef struct {
	char * bitmap_file;
	char * expansion;
} TemplateEntry;

typedef struct {
	NAT text_index;
	char * expansion;
} TemplateCallbackData;

#define MAX_TEMPLATES 100

static TemplateCallbackData template_callback_data[MAX_TEMPLATES];

static TemplateEntry template_table[MAX_TEMPLATES];
static NAT template_table_size;

Bool get_templates_data()
{
	char *ptr = templates;
	NAT i;

	while (*ptr != '/' && *ptr != '\0') ptr++;
	for (	i = 0;
		i < MAX_TEMPLATES && *++ptr != '\0';
		i++) {
			template_table[i].bitmap_file = ptr;
			while (*ptr != '/' && *ptr != '\0') ptr++;
			if (*ptr == '/') {
				*ptr = '\0';
			} else {
				break;
			};
			template_table[i].expansion = ++ptr;
			while (*ptr != '/' && *ptr != '\0') ptr++;
			if (*ptr == '/') {
				*ptr = '\0';
			} else {
				break;
			};
	};
	template_table_size = i + 1;
	return True;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_templates: attach templates to a text widget
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Bool add_templates(w)
Widget w;
{
	XmString lab;
	NAT i, x, y, twi, fbase;
	Widget shell, form, button;
	void templates_cb();

	for(	twi= 0;
		twi< MAX_TEMPLATES_FORMS &&
		templates_data[twi].text_w != w &&
		templates_data[twi].templates_w != NULL ;
		++twi) {
		continue;
	};

	if(twi>= MAX_TEMPLATES_FORMS) {
		msg("templates creation", "no more space for templates");
		return False;
	};

	if((form = templates_data[twi].templates_w) != NULL) {
		XtManageChild(form);
		XtPopup(XtParent(form), XtGrabNone);
		return True;
	};

	get_templates_data();

	fbase = (template_table_size + 1) & ~0x01;

	shell = XtVaCreatePopupShell("xpp-Templates",
			xmDialogShellWidgetClass, w,
		NULL); 

	form = XtVaCreateWidget("form",
			xmFormWidgetClass,	shell,
			XmNfractionBase, 	fbase,
			XmNautoUnmanage,	False,
		NULL);

	templates_data[twi].text_w = w;
	templates_data[twi].templates_w = form;

	for(i = 0; i < template_table_size; ++i) {

		lab = XmStringCreateSimple(template_table[i].bitmap_file);
		x = (fbase / 2) * (i % 2);
		y = 2 * (i / 2);
		button = XtVaCreateManagedWidget("button",
			xmPushButtonGadgetClass, form,
			XmNlabelString,	lab, 
			XmNleftAttachment,	XmATTACH_POSITION,
			XmNleftPosition,	x,
			XmNrightAttachment,	XmATTACH_POSITION,
			XmNrightPosition,	x + (fbase / 2),
			XmNtopAttachment,	XmATTACH_POSITION,
			XmNtopPosition,	y,
			XmNbottomAttachment,	XmATTACH_POSITION,
			XmNbottomPosition,	y + 2,
			NULL);
/*		copy_font_list(button, w); */
		XmStringFree(lab);
		template_callback_data[i].text_index = twi;
		template_callback_data[i].expansion = template_table[i].expansion;
		XtAddCallback(button, XmNactivateCallback, templates_cb,
			(XtPointer) &(template_callback_data[i]) );
	};

	XtManageChild(form);
	XtPopup(shell, XtGrabNone);

	return True;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * templates_cb: simulate typing of a character into a text widget
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void templates_cb(w, cbdata, cbs)
Widget w;
TemplateCallbackData * cbdata;
XmPushButtonCallbackStruct *cbs;
{
	NAT text_index = cbdata->text_index;
	XmTextPosition start, end;
	Widget text_w;

	if(text_index >= MAX_TEMPLATES_FORMS ||
		!(text_w = templates_data[text_index].text_w)) {
		char *m = "unexpected argument 0xXXXXXXXX";
		sprintf(m, "unexpected argument 0x%x", cbdata);
		msg("template handler", m);
		return;
	};

	if(XmTextGetSelectionPosition(text_w, &start, &end)) {
		XmTextReplace(text_w, start, end, cbdata->expansion);
		XmTextClearSelection(text_w, CurrentTime);
	} else {
		start = XmTextGetInsertionPosition(text_w);
		XmTextInsert(text_w, start, cbdata->expansion);
	};

	XmTextSetInsertionPosition(text_w, start);
	XmTextShowPosition(text_w, start);
}



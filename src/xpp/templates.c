
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

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * static data:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


typedef struct {
	Widget text_w; Widget templates_w;
} TemplatesData;

static TemplatesData templates_data[MAX_TEMPLATES_FORMS];

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

static char *bad_templates_msg =
"An error was detected while setting up the templates tool. "
"It was not possible to generate any templates from the templates resource. "
"The templates tool will not be available in this session.";

static char *bad_pixmap_msg =
"An error was detected while setting up the templates tool. "
"The image name \"%s\" could not be used to make a label for a push-button.";

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * get_templates_data: get template information from the resource
 * **** **** **** **** **** **** **** **** **** **** **** **** */


static void get_templates_data()
{
	char *ptr = templates;
	NAT i;

	while (*ptr != '/' && *ptr != '\0') ptr++;
	template_table_size = 0;
	if(!*ptr) {
		return;
	}
	for (	i = 0;
		i < MAX_TEMPLATES && *++ptr;
		i++) {
			++template_table_size;
			template_table[i].bitmap_file = ptr;
			while (*ptr != '/' && *ptr) ptr++;
			if (*ptr == '/') {
				*ptr = '\0';
			} else {
				template_table[i].expansion = "";
				return;
			};
			template_table[i].expansion = *++ptr ? ptr : "";
			while (*ptr != '/' && *ptr) ptr++;
			if (*ptr == '/') {
				*ptr = '\0';
			} else {
				return;
			};
	};
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * get_pixmap: get pixmap to use as a label on one of the push-buttons
 * inform the user if something goes wrong.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static Pixmap get_pixmap (Widget w, char *name)
{	Pixmap result;
	result = XmGetPixmap(XtScreen(w), name, (Pixel) 1, (Pixel) 0);
	if(result == XmUNSPECIFIED_PIXMAP) {
		char *msg;
		msg = XtMalloc(strlen(name) + strlen(bad_pixmap_msg) + 1);
		if(msg) {
			sprintf(msg, bad_pixmap_msg, name);
			ok_dialog(w, msg);
		}
	}
	return result;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * init_templates_tool: setup templates tool to a text widget, but do
 * not display it yet. Do this in order to decide whether or not to
 * enable the menu item for the tool; if the user hasn't specified
 * template resources, the menu item won't be enabled. Also can
 * notify user of errors in the template resource early.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Bool init_templates_tool(Widget w)
{
	NAT i, x, y, twi, fbase;
	Widget shell, form, button;
	static void templates_cb();

	if(!templates || !*templates) { /* resource not set up */
		return False;
	};

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

	get_templates_data();

	if(!template_table_size) {	/* Couldn't parse anything */
		ok_dialog(w, bad_templates_msg);
		return False;
	};

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

		x = (fbase / 2) * (i % 2);
		y = 2 * (i / 2);

		button = XtVaCreateManagedWidget("button",
			xmPushButtonGadgetClass, form,
			XmNlabelPixmap,	get_pixmap(w,
						   template_table[i].bitmap_file),
			XmNlabelType,		XmPIXMAP,
			XmNleftAttachment,	XmATTACH_POSITION,
			XmNleftPosition,	x,
			XmNrightAttachment,	XmATTACH_POSITION,
			XmNrightPosition,	x + (fbase / 2),
			XmNtopAttachment,	XmATTACH_POSITION,
			XmNtopPosition,	y,
			XmNbottomAttachment,	XmATTACH_POSITION,
			XmNbottomPosition,	y + 2,
			XmNtraversalOn,	False,
			NULL);
		template_callback_data[i].text_index = twi;
		template_callback_data[i].expansion =
						template_table[i].expansion;
		XtAddCallback(button, XmNactivateCallback, templates_cb,
			(XtPointer) &(template_callback_data[i]) );
	};

	return True;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_templates_tool: pop up the templates tool.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void add_templates_tool(Widget w)
{
	NAT twi;
	Widget form;

	for(	twi= 0;
		twi< MAX_TEMPLATES_FORMS &&
		templates_data[twi].text_w != w &&
		templates_data[twi].templates_w != NULL ;
		++twi) {
		continue;
	};

	if(	twi < MAX_TEMPLATES_FORMS
	&&	(form = templates_data[twi].templates_w) != NULL) {
		XtManageChild(form);
		XtPopup(XtParent(form), XtGrabNone);
	};
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * templates_cb: simulate typing of a character into a text widget
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void templates_cb(w, cbdata, cbs)
Widget w;
TemplateCallbackData * cbdata;
XmPushButtonCallbackStruct *cbs;
{
	NAT text_index = cbdata->text_index;
	XmTextPosition start, end, after;
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

	after = start + strlen (cbdata->expansion);
	XmTextSetInsertionPosition(text_w, after);
	XmTextShowPosition(text_w, after);
}




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

/*
 * The following definitions are based on those in msg.c
 */

#define MSG_LINE_LEN 40
#define HELP_LINE_LEN 80
#define HELP_SCREEN_HEIGHT 24

typedef struct {
	char * bitmap_file;
	char * expansion;
	char * help_text;
} TemplateEntry;

typedef char * TemplateCallbackData;

#define MAX_TEMPLATES 100

static TemplateEntry template_table[MAX_TEMPLATES];
static NAT template_table_size;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * the static Widgets for the template tool
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static Widget	shell,
		template_pane,
		template_form,
		other_btn_area,
		dismiss_btn,
		help_btn,
		text_w;



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
				template_table[i].help_text = "";
				return;
			};
			template_table[i].help_text = *++ptr ? ptr : "";

			while (*ptr != '/' && *ptr) ptr++;
			if (*ptr == '/') {
				*ptr = '\0';
			} else {
				return;
			};
	};
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * get_pixmap: get pixmap to use as a label on one of the
 * push-buttons inform the user if something goes wrong.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static Pixmap get_pixmap (Widget w, char *name)
{	Pixmap result;
	result = XmGetPixmap(XtScreen(w), name,
		BlackPixelOfScreen(XtScreen(root)),
		WhitePixelOfScreen(XtScreen(root)));
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
	NAT i, x, y, fbase;
	Widget template_btn;

	static void	help_cb(),
			dismiss_cb(),
			templates_cb();

	if(!templates || !*templates) {
		/* resource not set up */
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

	template_pane = XtVaCreateWidget("template-pane",
		xmPanedWindowWidgetClass, 	shell,
		NULL);

	template_form = XtVaCreateWidget("template_form",
			xmFormWidgetClass,	template_pane,
			XmNfractionBase, 	fbase,
			XmNautoUnmanage,	False,
		NULL);

	text_w = w;

	for(i = 0; i < template_table_size; ++i) {

		x = (fbase / 2) * (i % 2);
		y = 2 * (i / 2);

		template_btn = XtVaCreateManagedWidget("template_btn",
			xmPushButtonGadgetClass, template_form,
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


		XtAddCallback(template_btn, XmNactivateCallback,
			templates_cb,
			(XtPointer) &(template_table[i].expansion) );

	};

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up help button in the middle of the lower part of tool:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	other_btn_area = XtVaCreateWidget("help-form",
		xmFormWidgetClass, 		template_pane,
		XmNfractionBase, 		25,
		NULL);

	dismiss_btn = XtVaCreateManagedWidget("Dismiss",
		xmPushButtonWidgetClass,	other_btn_area,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		2,
		XmNrightPosition,		12,
		NULL);


	help_btn = XtVaCreateManagedWidget("Help",
		xmPushButtonWidgetClass,	other_btn_area,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		13,
		XmNrightPosition,		23,
		NULL);

	XtAddCallback(help_btn, XmNactivateCallback,
		help_cb, (XtPointer) &template_table);

	XtAddCallback(dismiss_btn, XmNactivateCallback,
		dismiss_cb, shell);

	return True;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_templates_tool: pop up the templates tool.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void add_templates_tool(Widget w)
{
	if(template_form != NULL) {
		XtManageChild(template_form);
		XtManageChild(other_btn_area);
		XtManageChild(template_pane);
		XtPopup(shell, XtGrabNone);
		fix_pane_height(template_form, template_form);
		fix_pane_height(other_btn_area, other_btn_area);
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
	XmTextPosition start, end, after;

	if(!text_w) {
		char *m = "unexpected argument 0xXXXXXXXX";
		sprintf(m, "unexpected argument 0x%x", cbdata);
		msg("template handler", m);
		return;
	};

	if(XmTextGetSelectionPosition(text_w, &start, &end)) {
		XmTextReplace(text_w, start, end, *cbdata);
		XmTextClearSelection(text_w, CurrentTime);
	} else {
		start = XmTextGetInsertionPosition(text_w);
		XmTextInsert(text_w, start, *cbdata);
	};

	after = start + strlen (*cbdata);
	XmTextSetInsertionPosition(text_w, after);
	XmTextShowPosition(text_w, after);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * templates_help_dialog: put up an information window without grabbing control
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void templates_help_dialog(Widget w)
{
	Widget dismiss_btn_area, dismiss_btn;
	static Widget	help_shell,
			help_pane;
	Widget		row_col,
			help_item,
			introduction,
			separator,
			template_icon,
			template_text;
	static void dismiss_cb();
	Dimension h;
	int i;
	if(!help_shell) {

		help_shell = XtVaCreatePopupShell("xpp-Help",
			xmDialogShellWidgetClass,	w,
			XmNdeleteResponse,		XmUNMAP,
			NULL);

		help_pane = XtVaCreateWidget("help-pane",
			xmPanedWindowWidgetClass,	help_shell,
			XmNsashWidth,			1,
				/* PanedWindow won't let us set these to 0! */
			XmNsashHeight,			1,
				/* Make small so user doesn't try to resize */
			NULL);

		introduction = XtVaCreateManagedWidget("introduction",
			xmLabelGadgetClass,	help_pane,
			XmNlabelString,		format_msg(Help_Templates_Tool,
							HELP_LINE_LEN),
			XmNalignment,		XmALIGNMENT_CENTER,
			NULL);

		XtManageChild(introduction);

		XtVaGetValues(introduction, XmNheight, &h, NULL);

		XtVaSetValues(introduction,
			XmNpaneMaximum,	h,
			XmNpaneMinimum,	h,
			NULL);

		row_col = XtVaCreateWidget("help-form",
			xmRowColumnWidgetClass,	help_pane,
			XmNorientation,		XmVERTICAL,
			XmNpacking,		XmPACK_TIGHT,
			NULL);

		for (i=0; i < template_table_size; i++) {

			help_item = XtVaCreateWidget("help-item",
				xmRowColumnWidgetClass,		row_col,
				XmNorientation,			XmHORIZONTAL,
				XmNpacking,			XmPACK_TIGHT,
				NULL);

			template_icon = XtVaCreateManagedWidget("template-icon",
				xmLabelWidgetClass,		help_item,
				XmNlabelPixmap,
					get_pixmap(w,
						template_table[i].bitmap_file),
				XmNlabelType,			XmPIXMAP,
				NULL);

			template_text = XtVaCreateManagedWidget("template-text",
				xmLabelGadgetClass,		help_item,
				XmNlabelString,		
					format_msg (template_table[i].help_text,
									MSG_LINE_LEN),
				NULL);

			XtManageChild(help_item);

		}

		XtVaSetValues(help_item,
			XmNbottomAttachment,	XmATTACH_FORM,
			NULL);

		XtManageChild(row_col);

		XtVaGetValues(row_col, XmNheight, &h, NULL);

		XtVaSetValues(row_col,
			XmNpaneMinimum,	h,
			NULL);

		dismiss_btn_area = XtVaCreateWidget("dismiss_btn_area",
				xmFormWidgetClass,	help_pane,
				XmNfractionBase,	30,
				NULL);

		dismiss_btn = XtVaCreateManagedWidget("Dismiss",
			xmPushButtonGadgetClass, dismiss_btn_area,
			XmNtopAttachment,		XmATTACH_FORM,
			XmNbottomAttachment,		XmATTACH_FORM,
			XmNleftAttachment,		XmATTACH_POSITION,
			XmNleftPosition,		10,
			XmNrightAttachment,		XmATTACH_POSITION,
			XmNrightPosition,		20,
			XmNshowAsDefault,		True,
			XmNdefaultButtonShadowThickness, 1,
			NULL);

		XtAddCallback(dismiss_btn, XmNactivateCallback,
				dismiss_cb, help_shell);

		XtManageChild(dismiss_btn_area);

		XtVaGetValues(dismiss_btn, XmNheight, &h, NULL);

		XtVaSetValues(dismiss_btn_area,
			XmNpaneMaximum,	h,
			XmNpaneMinimum,	h,
			NULL);
	}

	XtManageChild(help_pane);
	XtPopup(help_shell, XtGrabNone);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * help callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void help_cb(
	Widget				w,
	TemplateCallbackData		*cbdata,
	XmPushButtonCallbackStruct	cbs)
{
	templates_help_dialog(root);
}

static void dismiss_cb(Widget widget, Widget shell)
{
	XtPopdown(shell);
}




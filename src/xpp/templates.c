
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: templates.c,v 2.22 2003/07/23 14:02:14 rda Exp rda $ 
 *
 * templates.c - support for templates for the X/Motif ProofPower Interface
 *
 * templates.c: this file is part of the PPTex system
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
static NAT template_table_bitmaps_size;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * the static Widgets for the template tool
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static Widget	shell,
		outer_form,
		inner_form,
		other_btn_area,
		dismiss_btn,
		help_btn,
		text_w;



static char *bad_templates_msg =
"An error was detected while setting up the templates tool. "
"It was not possible to generate any templates from the templates resource. "
"The templates tool will not be available in this session.";

static char *bad_pixmap_msg =
"An error was detected while setting up the templates tool.  "
"The image name%s %s could not be used to make %slabel%s for %spush-button%s.";

static char *bad_pixmap_nomalloc_msg =
"An error was detected while setting up the templates tool.  One "
"or more image files could not be used to make label(s) for push-button(s).";

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * get_templates_data: get template information from the resource
 * **** **** **** **** **** **** **** **** **** **** **** **** */


static void get_templates_data(void)
{
	char *ptr = templates;
	NAT i;

	while (*ptr != '/' && *ptr != '\0') ptr++;
	template_table_size = 0;
	template_table_bitmaps_size = 0;
	if(!*ptr) {
		return;
	}
	for (	i = 0;
		i < MAX_TEMPLATES && *++ptr;
		i++) {
			++template_table_size;
			template_table[i].bitmap_file = ptr;
			template_table_bitmaps_size += strlen(ptr);

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

static Pixmap get_pixmap (Widget   w,
                          char    *name,
                          Boolean  notLast)
{	static char *names = (char *) NULL;
	static int nFailures = 0;
	Pixmap result;

	result = XmGetPixmap(XtScreen(w),
	                     name,
	                     BlackPixelOfScreen(XtScreen(root)),
	                     WhitePixelOfScreen(XtScreen(root)));
	if (result == XmUNSPECIFIED_PIXMAP) {
		nFailures++;
		if (nFailures == 1) {
			names = XtMalloc(template_table_bitmaps_size +
			                 (template_table_size * 4) + 4);
			if (names) {
				sprintf(names, "\"%s\"", name);
			}
			else {
				nFailures = 0;
			}
		}
		else {
			char *newNames;
			newNames = XtMalloc(template_table_bitmaps_size +
			                    (template_table_size * 4) + 4);
			if (newNames) {
				sprintf(newNames,
				        "\"%s\"%s %s",
				        name,
				        (nFailures == 2) ? " and" : ",",
				        names);
				strcpy(names, newNames);
				XtFree(newNames);
			}
			else {
				nFailures--;
			}
		}
	}
	if (! notLast && nFailures > 0) {
		char *msg;
		msg = XtMalloc(strlen(names) + strlen(bad_pixmap_msg));
		if (msg) {
			sprintf(msg,
			        bad_pixmap_msg,
			        (nFailures == 1) ? ""   : "s",
			        names,
			        (nFailures == 1) ? "a " : "",
			        (nFailures == 1) ? ""   : "s",
			        (nFailures == 1) ? "a " : "",
			        (nFailures == 1) ? ""   : "s");
			ok_dialog(w, msg);
			XtFree(msg);
		} else {
			ok_dialog(w, bad_pixmap_nomalloc_msg);
		}

		XtFree(names);
		names = (char *) NULL;
		nFailures = 0;
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
static void	help_cb(CALLBACK_ARGS),
		dismiss_cb(CALLBACK_ARGS),
		templates_cb(CALLBACK_ARGS);


Boolean init_templates_tool(Widget w)
{
	NAT i, x, y, fbase;
	Widget template_btn;

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
#ifdef EDITRES
	add_edit_res_handler(shell);
#endif
	common_dialog_setup(shell, 0, 0);
	outer_form = XtVaCreateWidget("outer-form",
		xmFormWidgetClass, 	shell,
			XmNfractionBase, 	25,
			XmNautoUnmanage,	False,
		NULL);

	inner_form = XtVaCreateWidget("inner-form",
			xmFormWidgetClass,	outer_form,
			XmNfractionBase, 	fbase,
			XmNleftAttachment,	XmATTACH_FORM,
			XmNrightAttachment,	XmATTACH_FORM,
			XmNtopAttachment,	XmATTACH_FORM,
			XmNautoUnmanage,	False,
		NULL);

	text_w = w;

	for(i = 0; i < template_table_size; ++i) {
		x = (fbase / 2) * (i % 2);
		y = 2 * (i / 2);

		template_btn = XtVaCreateManagedWidget("template_btn",
			xmPushButtonGadgetClass, inner_form,
			XmNlabelPixmap,	get_pixmap(w,
			                           template_table[i].bitmap_file,
			                           i < template_table_size - 1),
			XmNlabelType,		XmPIXMAP,
			XmNleftAttachment,	XmATTACH_POSITION,
			XmNleftPosition,	x,
			XmNrightAttachment,	XmATTACH_POSITION,
			XmNrightPosition,	x + (fbase / 2),
			XmNtopAttachment,	XmATTACH_POSITION,
			XmNtopPosition,	y,
			XmNbottomAttachment,	XmATTACH_POSITION,
			XmNbottomPosition,	y + 2,
			NULL);


		XtAddCallback(template_btn, XmNactivateCallback,
			templates_cb,
			(XtPointer) &(template_table[i].expansion) );

	};

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up help and dismiss buttons in the lower part of tool:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	dismiss_btn = XtVaCreateManagedWidget("Dismiss",
		xmPushButtonWidgetClass,	outer_form,
		XmNtopAttachment,		XmATTACH_WIDGET,
		XmNtopWidget,			inner_form,
		XmNtopOffset,		4,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNbottomOffset,		4,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		2,
		XmNrightPosition,		12,
		XmNtraversalOn,		False,
		NULL);

	XtVaSetValues(outer_form,
		XmNcancelButton,	dismiss_btn,
		NULL);

	help_btn = XtVaCreateManagedWidget("Help",
		xmPushButtonWidgetClass,	outer_form,
		XmNtopAttachment,		XmATTACH_WIDGET,
		XmNtopWidget,			inner_form,
		XmNtopOffset,		4,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNbottomOffset,		4,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		13,
		XmNrightPosition,		23,
		XmNtraversalOn,		False,
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
	if(inner_form != NULL) {
		XtManageChild(inner_form);
		XtManageChild(outer_form);
		XtPopup(shell, XtGrabNone);
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * templates_cb: simulate typing of a character into a text widget
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void templates_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	TemplateCallbackData *cbdata = cbd;
	XmTextPosition start, end, after;

	if(!text_w) {
		char m[80];
		sprintf(m, "unexpected argument %p", cbdata);
		msg("template handler", m);
		return;
	};

	if(get_map_state(text_w) != IsViewable) {
		beep();
		return;
	}

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
	set_input_focus(text_w);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * templates_help_dialog: put up an information window without grabbing control
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void dismiss_cb(CALLBACK_ARGS);
static void templates_help_dialog(Widget w)
{
	Widget dismiss_btn_area, dismiss_btn;
	static Widget	shell,
			help_pane;
	Widget		form,
			help_item,
			introduction,
			template_icon,
			template_text;
	Dimension h;
	int i, fbase, x, y;
	if(shell) {
		XtPopup(shell, XtGrabNone);
		return;
	} /* else */

	shell = XtVaCreatePopupShell("xpp-Help",
		xmDialogShellWidgetClass,	w,
		XmNdeleteResponse,		XmUNMAP,
		NULL);
#ifdef EDITRES
	add_edit_res_handler(shell);
#endif
	common_dialog_setup(shell, 0, 0);
	help_pane = XtVaCreateWidget("help-pane",
		xmPanedWindowWidgetClass,	shell,
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

	fbase = (template_table_size + 1) & ~0x01;

	form = XtVaCreateWidget("help-form",
		xmFormWidgetClass,	help_pane,
		XmNfractionBase,		fbase,
		NULL);

	for (i=0; i < template_table_size; i++) {
		x = (fbase / 2) * (i % 2);
		y = 2 * (i / 2);

		help_item = XtVaCreateWidget("help-item",
			xmRowColumnWidgetClass,		form,
			XmNorientation,			XmHORIZONTAL,
			XmNpacking,			XmPACK_TIGHT,
			XmNleftAttachment,	XmATTACH_POSITION,
			XmNleftPosition,	x,
			XmNrightAttachment,	XmATTACH_POSITION,
			XmNrightPosition,	x + (fbase / 2),
			XmNtopAttachment,	XmATTACH_POSITION,
			XmNtopPosition,	y,
			XmNbottomAttachment,	XmATTACH_POSITION,
			XmNbottomPosition,	y + 2,
			NULL);

		template_icon = XtVaCreateManagedWidget("template-icon",
			xmLabelWidgetClass,		help_item,
			XmNlabelPixmap, get_pixmap(w,
			                           template_table[i].bitmap_file,
			                           i < template_table_size - 1),
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

	XtManageChild(form);

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
			dismiss_cb, shell);

	XtManageChild(dismiss_btn_area);

	XtVaGetValues(dismiss_btn, XmNheight, &h, NULL);

	XtVaSetValues(dismiss_btn_area,
		XmNpaneMaximum,	h,
		XmNpaneMinimum,	h,
		NULL);

	XtManageChild(help_pane);
	XtPopup(shell, XtGrabNone);
	fix_pane_height(introduction, introduction);
	fix_pane_height(form, form);
	fix_pane_height(dismiss_btn_area, dismiss_btn_area);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * help callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void help_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	templates_help_dialog(root);
}

static void dismiss_cb(
	Widget		w,
	XtPointer	shell,
	XtPointer	cbs)
{
	XtPopdown((Widget)shell);
}




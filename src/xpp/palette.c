
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: palette.c,v 2.22 2004/08/06 15:20:36 rda Exp rda $ 
 *
 * palette.c - support for palettes for the X/Motif ProofPower Interface
 *
 * palette.c: this file is part of the PPTex system
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
#define _palette
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
 * forward declarations of callbacks:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void type_char_cb(CALLBACK_ARGS);
static void focus_cb(CALLBACK_ARGS);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * static data:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#include "paletteconf.h"

typedef struct {
	Widget text_w, palette_w;
} PaletteData;

static PaletteData palette_info = { NULL, NULL };


static void dismiss_cb(CALLBACK_ARGS);
static void help_cb(CALLBACK_ARGS);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * popup_palette: pop up the palette widget (creating it if
 * necessary). The widget argument is the text widget to
 * which the palette will write in the first instance (see
 * register_palette_client for how this changes when input focus
 * transfers to a different text widget client).
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void popup_palette(Widget w)
{
	XmString lab;
	char label_buf[2], name_buf[sizeof "charXX"];
	NAT i, j, x, y;
	NAT cbdata;
	Widget shell, outer_form, inner_form, button, dismiss_btn, help_btn;

	palette_info.text_w = w;
	if((outer_form = palette_info.palette_w) != NULL) {
		XtManageChild(outer_form);
		XtPopup(XtParent(outer_form), XtGrabNone);
		return;
	} /* else ... */

	shell = XtVaCreatePopupShell("xpp-Palette",
		xmDialogShellWidgetClass, w,
		NULL); 
#ifdef EDITRES
	add_edit_res_handler(shell);
#endif
	common_dialog_setup(shell, 0, 0);

	outer_form = XtVaCreateWidget("outer-form",
		xmFormWidgetClass, shell,
		XmNfractionBase, 	17,
		XmNautoUnmanage,	False,
		NULL);

	inner_form = XtVaCreateWidget("inner-form",
		xmFormWidgetClass, outer_form,
		XmNfractionBase, 	FRACTION_BASE,
		XmNtopAttachment,	XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,	XmATTACH_FORM,
		XmNautoUnmanage,	False,
		NULL);

	palette_info.palette_w = outer_form;

	label_buf[1] = '\0';

	for(i = 0; i < NROWS; i += 1) {
		for(j = 0; prettychars[i][j] != 0 && j < NCOLS; j += 1) {
			if(prettychars[i][j] == '.') {
				continue;
			} /* else */
			label_buf[0] = prettychars[i][j];
			sprintf(name_buf, "char%02X", prettychars[i][j]);
			lab = XmStringCreateSimple(label_buf);
			x = XUNITS*j;
			y = YUNITS*i;
			button = XtVaCreateManagedWidget(name_buf,
				xmPushButtonGadgetClass, inner_form,
				XmNlabelString, lab,
				XmNleftAttachment,	XmATTACH_POSITION,
				XmNleftPosition,	x,
				XmNrightAttachment,	XmATTACH_POSITION,
				XmNrightPosition,	x + XUNITS,
				XmNtopAttachment,	XmATTACH_POSITION,
				XmNtopPosition,		y,
				XmNbottomAttachment,	XmATTACH_POSITION,
				XmNbottomPosition,	y + YUNITS,
				NULL);
			copy_font_list(button, w);
			XmStringFree(lab);
			cbdata = prettychars[i][j];
			XtAddCallback(button, XmNactivateCallback, type_char_cb,
				(XtPointer) cbdata);
		}
	}

	lab = XmStringCreateSimple("Dismiss");
	dismiss_btn = XtVaCreateManagedWidget("dismiss",
		xmPushButtonWidgetClass,	outer_form,
		XmNlabelString,		lab,
		XmNtopAttachment,		XmATTACH_WIDGET,
		XmNtopWidget,		inner_form,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		2,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		6,
		XmNtraversalOn,	False,
		NULL);
	XmStringFree(lab);

	XtVaSetValues(outer_form,
		XmNcancelButton,	dismiss_btn,
		NULL);

	lab = XmStringCreateSimple("Help");
	help_btn = XtVaCreateManagedWidget("help",
		xmPushButtonWidgetClass,	outer_form,
		XmNlabelString,		lab,
		XmNtopAttachment,		XmATTACH_WIDGET,
		XmNtopWidget,		inner_form,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		11,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		15,
		XmNtraversalOn,	False,
		NULL);
	XmStringFree(lab);

	XtAddCallback(dismiss_btn, XmNactivateCallback, dismiss_cb, 0);
	XtAddCallback(help_btn, XmNactivateCallback,help_cb, 0);

	XtManageChild(inner_form);
	XtManageChild(outer_form);
	XtPopup(shell, XtGrabNone);

}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * register_palette_client: add a new client text widget (caller
 * must ensure the argument is a text or text field widget).
 * Just adds the focus callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void register_palette_client(Widget w)
{
	XtAddCallback(w, XmNfocusCallback, focus_cb, NULL);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * focus_cb: when a client text widget gains focus redirect
 * the palette to it.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void focus_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	palette_info.text_w = w;
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * type_char_cb: simulate typing of a character into a text widget
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void type_char_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	NAT cbdata = (NAT) cbd;
	char buf[2];
	XmTextPosition start, end;
	Widget text_w = palette_info.text_w;
	Boolean editable;

	if(get_map_state(text_w) != IsViewable) {
		beep();
		return;
	}
	if( !text_w ) {
		return;
	} /* else ... */

	XtVaGetValues(text_w,
			XmNeditable, &editable,
			NULL);
	if(!editable) {
		beep();
		return;
	} /* else ... */

	buf[0] = cbdata;
	buf[1] = '\0';

	if(XmTextGetSelectionPosition(text_w, &start, &end)) {
		XmTextReplace(text_w, start, end, buf);
		XmTextClearSelection(text_w, CurrentTime);
	} else {
		start = XmTextGetInsertionPosition(text_w);
		XmTextInsert(text_w, start, buf);
	}

	XmTextSetInsertionPosition(text_w, start + 1);
	XmTextShowPosition(text_w, start);
/*
 * On early versions of Motif, the next line worked OK with keyboardFocusPolicy
 * EXPLICIT (i.e., click-to-type), but not with POINTER (i.e., focus follows mouse)
 * (with POINTER it made the the keyboard focus stick in the text window regardless
 * of where the pointer was moved to). It seems to work OK in 21st century versions
 * of Motif (although there are a lot of OS/Window manager combinations to test).
 */
	set_input_focus(text_w);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * dismiss callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void dismiss_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	XtPopdown(XtParent(palette_info.palette_w));
}



/* **** **** **** **** **** **** **** **** **** **** **** ****
 * help callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void help_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	help_dialog(root, Help_Palette_Tool);
}



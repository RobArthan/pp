
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: palette.c,v 2.23 2004/08/06 16:23:19 rda Exp rda $ 
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
	int i, j, x, y, num_children;
	int cbdata;
	Widget shell, paned, top_form, bottom_form, button, dismiss_btn, help_btn;
	Widget *children;
	
	palette_info.text_w = w;
	if((paned = palette_info.palette_w) != NULL) {
		XtManageChild(paned);
		XtPopup(XtParent(paned), XtGrabNone);
		return;
	} /* else ... */

	shell = XtVaCreatePopupShell("xpp-Palette",
		xmDialogShellWidgetClass, w,
		NULL); 
#ifdef EDITRES
	add_edit_res_handler(shell);
#endif
	common_dialog_setup(shell, 0, 0);

	paned = XtVaCreateWidget("paned",
		xmPanedWindowWidgetClass, 	shell,
		NULL);

	palette_info.palette_w = paned;

	top_form = XtVaCreateWidget("top-form",
		xmFormWidgetClass, paned,
		XmNfractionBase, 	FRACTION_BASE,
		NULL);

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
				xmPushButtonGadgetClass, top_form,
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

	bottom_form = XtVaCreateWidget("bottom-form",
		xmFormWidgetClass, paned,
		XmNfractionBase, 	16,
		XmNautoUnmanage,	False,
		NULL);

	lab = XmStringCreateSimple("Dismiss");
	dismiss_btn = XtVaCreateManagedWidget("dismiss",
		xmPushButtonWidgetClass,	bottom_form,
		XmNlabelString,		lab,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		1,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		5,
		XmNtraversalOn,	False,
		NULL);
	XmStringFree(lab);

	XtVaSetValues(bottom_form,
		XmNcancelButton,	dismiss_btn,
		NULL);

	lab = XmStringCreateSimple("Help");
	help_btn = XtVaCreateManagedWidget("help",
		xmPushButtonWidgetClass,	bottom_form,
		XmNlabelString,		lab,
		XmNtopAttachment,		XmATTACH_FORM,
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



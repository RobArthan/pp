
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: palette.c,v 2.16 2003/07/18 13:25:25 rda Exp rda $ 
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
static unsigned char prettychars[] = {
0xb1, 0xb2, 0xb3, 0xb5, 0xb6, 0xb7, 0xb8, 0xbc, 
0xbd, 0xbe, 0x8d, 0x8e, 0xa4, 0xb4, 0xad, 0x8f, 
0x9e, 0x9f, 0xaa, 0xcf, 0xdf, 0xe0, 0xed, 0xef, 
0xfe, 0xac, 0x94, 0x91, 0xf1, 0xae, 0xb9, 0xf7, 
0xb0, 0xff, 0x88, 0x9d, 0xdc, 0xfc, 0x9c, 0xdb, 
0xdd, 0xa7, 0xa2, 0xfb, 0xfd, 0xa8, 0xa9, 0x89, 
0x9b, 0xe7, 0xe8, 0xea, 0xe6, 0xee, 0xf0, 0xfa, 
0x80, 0x9a, 0xa0, 0xa1, 0xa5, 0xc0, 0xde, 0x81, 
0x92, 0xe1, 0xf2, 0xeb, 0x8b, 0xf9, 0xab, 0x82, 
0xf4, 0xbb, 0xba, 0xa6, 0xe2, 0xa3, 0x84, 0x86, 
0x87, 0x8a, 0x8c, 0x90, 0x93, 0x95, 0x97, 0x98, 
0x99, 0xc1, 0xc2, 0xc4, 0xc5, 0xc6, 0xc7, 0xc8, 
0xc9, 0xca, 0xcb, 0xcc, 0xcd, 0xce, 0xd0, 0xd1, 
0xd2, 0xd3, 0xd4, 0xd5, 0xd7, 0xd8, 0xd9, 0xda, 
0xc3, 0xe9, 0xaf, 0xe3, 0xe4, 0xe5, 0x83, 0x85,
0x96, 0xbf, 0xd6, 0xec, 0xf3, 0xf5, 0xf6, 0xf8,
0x00} ;

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
	NAT i, n_chars, x, y;
	NAT cbdata;
	Widget shell, outer_form, inner_form, button, dismiss_btn, help_btn;

	palette_info.text_w = w;
	if((outer_form = palette_info.palette_w) != NULL) {
		XtManageChild(outer_form);
		XtPopup(XtParent(outer_form), XtGrabNone);
		return;
	} /* else ... */

	n_chars = strlen((char*)prettychars);

	shell = XtVaCreatePopupShell("xpp-Palette",
		xmDialogShellWidgetClass, w,
		NULL); 
#ifdef EDITRES
	add_edit_res_handler(shell);
#endif
	common_dialog_setup(shell);

	outer_form = XtVaCreateWidget("outer-form",
		xmFormWidgetClass, shell,
		XmNfractionBase, 	17,
		XmNautoUnmanage,	False,
		NULL);

	inner_form = XtVaCreateWidget("inner-form",
		xmFormWidgetClass, outer_form,
		XmNfractionBase, 	16,
		XmNtopAttachment,	XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,	XmATTACH_FORM,
		XmNbottomAttachment,	XmATTACH_POSITION,
		XmNbottomPosition,	16,
		XmNautoUnmanage,	False,
		NULL);

	palette_info.palette_w = outer_form;

	label_buf[1] = '\0';

	for(i = 0; i < n_chars; ++i) {

		label_buf[0] = prettychars[i];
		sprintf(name_buf, "char%02X", prettychars[i]);
		lab = XmStringCreateSimple(label_buf);
		x = 2 * (i % 8);
		y = i / 8;
		button = XtVaCreateManagedWidget(name_buf,
			xmPushButtonGadgetClass, inner_form,
			XmNlabelString, lab,
			XmNleftAttachment,	XmATTACH_POSITION,
			XmNleftPosition,	x,
			XmNrightAttachment,	XmATTACH_POSITION,
			XmNrightPosition,	x + 2,
			XmNtopAttachment,	XmATTACH_POSITION,
			XmNtopPosition,		y,
			XmNbottomAttachment,	XmATTACH_POSITION,
			XmNbottomPosition,	y + 1,
			NULL);
		copy_font_list(button, w);
		XmStringFree(lab);
		cbdata = prettychars[i];
		XtAddCallback(button, XmNactivateCallback, type_char_cb,
			(XtPointer) cbdata);
	}

	lab = XmStringCreateSimple("Dismiss");
	dismiss_btn = XtVaCreateManagedWidget("dismiss",
		xmPushButtonWidgetClass,	outer_form,
		XmNlabelString,		lab,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,		16,
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
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,		16,
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
	XSetInputFocus(XtDisplay(text_w), XtWindow(text_w), RevertToParent, CurrentTime);

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



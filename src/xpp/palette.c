
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: palette.c,v 2.2 1997/12/03 17:19:57 rda Rel rda $ 
 *
 * palette.c - support for palettes for the X/Motif ProofPower Interface
 *
 * (c) ICL 1993
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _palette
#define MAX_PALETTES 4
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
static char prettychars[] = {
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

static PaletteData palette_info[MAX_PALETTES];

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_palette: attach a palette to a text widget
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Bool add_palette(w)
Widget w;
{
	XmString lab;
	char buf[2];
	NAT i, n_chars, x, y, twi;
	NAT cbdata;
	Widget shell, form, button;
	void type_char_cb();

	for(	twi= 0;
		twi< MAX_PALETTES &&
		palette_info[twi].text_w != w &&
		palette_info[twi].palette_w != NULL ;
		++twi) {
		continue;
	};

	if(twi>= MAX_PALETTES) {
		msg("palette creation", "no more space for palettes");
		return False;
	};

	if((form = palette_info[twi].palette_w) != NULL) {
		XtManageChild(form);
		XtPopup(XtParent(form), XtGrabNone);
		return True;
	};

	n_chars = strlen(prettychars);

	shell = XtVaCreatePopupShell("xpp-Palette",
		xmDialogShellWidgetClass, w,
		NULL); 

	form = XtVaCreateWidget("form",
		xmFormWidgetClass, shell,
		XmNfractionBase, 	16,
		XmNautoUnmanage,	False,
		NULL);

	palette_info[twi].text_w = w;
	palette_info[twi].palette_w = form;

	buf[1] = '\0';

	for(i = 0; i < n_chars; ++i) {

		buf[0] = prettychars[i];
		lab = XmStringCreateSimple(buf);
		x = 2 * (i % 8);
		y = i / 8;
		button = XtVaCreateManagedWidget("button",
			xmPushButtonGadgetClass, form,
			XmNlabelString, lab,
			XmNleftAttachment,	XmATTACH_POSITION,
			XmNleftPosition,	x,
			XmNrightAttachment,	XmATTACH_POSITION,
			XmNrightPosition,	x + 2,
			XmNtopAttachment,	XmATTACH_POSITION,
			XmNtopPosition,		y,
			XmNbottomAttachment,	XmATTACH_POSITION,
			XmNbottomPosition,	y + 1,
			XmNtraversalOn,	False,
			NULL);
		copy_font_list(button, w);
		XmStringFree(lab);
		cbdata = (twi << 8) | (prettychars[i] & 0xff);
		XtAddCallback(button, XmNactivateCallback, type_char_cb,
			(XtPointer) cbdata);
	};

	XtManageChild(form);
	XtPopup(shell, XtGrabNone);

	return True;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * type_char_cb: simulate typing of a character into a text widget
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void type_char_cb(w, cbdata, cbs)
Widget w;
NAT cbdata;
XmPushButtonCallbackStruct *cbs;
{
	char buf[2];
	NAT text_index = cbdata >> 8;
	XmTextPosition start, end;
	Widget text_w;

	if(text_index >= MAX_PALETTES ||
		!(text_w = palette_info[text_index].text_w)) {
		char m [sizeof("unexpected argument 0xXXXXXXXX")];
		sprintf(m, "unexpected argument 0x%x", cbdata);
		msg("palette handler", m);
		return;
	};

	buf[0] = cbdata & 0xff;
	buf[1] = '\0';

	if(XmTextGetSelectionPosition(text_w, &start, &end)) {
		XmTextReplace(text_w, start, end, buf);
		XmTextClearSelection(text_w, CurrentTime);
	} else {
		start = XmTextGetInsertionPosition(text_w);
		XmTextInsert(text_w, start, buf);
	};

	XmTextSetInsertionPosition(text_w, start + 1);
	XmTextShowPosition(text_w, start);
/*
 * Next line works OK with keyboarFocusPolicy EXPLICIT, but not with POINTER
 * (with POINTER it makes the text window gets the keyboard focus regardless of where
 * the pointer is).
	XSetInputFocus(XtDisplay(text_w), XtWindow(text_w), RevertToParent, CurrentTime);
 */

}




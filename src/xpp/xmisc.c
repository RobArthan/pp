

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$
 *
 * xmisc.c -  miscellaneous X/Motif routines for the X/Motif ProofPower
 * Interface
 *
 * (c) ICL 1993
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _xmisc
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


#include <stdio.h>
#include <X11/Xatom.h>
#include <X11/Intrinsic.h>
#include <X11/Shell.h>
#include <Xm/Xm.h>

#include<Xm/Text.h>
#include<varargs.h>

#include "xpp.h"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * toggle_menu_item_sensitivity: given a menu w toggle the
 * sensitivity of the i-th item in the menu.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void toggle_menu_item_sensitivity(w, i)
Widget w;
NAT i;
{
	Widget *btns;
	NAT num_btns;
	Bool sens;

	XtVaGetValues(w, XmNchildren, &btns,
		XmNnumChildren, &num_btns, NULL);
	if (0 <= i && i < num_btns) {
		XtSetSensitive(btns[i], !XtIsSensitive(btns[i]));
	};
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set_menu_item_sensitivity: given a menu w set the
 * sensitivity of the i-th item in the menu to a given value.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void set_menu_item_sensitivity(w, i, b)
Widget w;
NAT i;
Bool b;
{
	Widget *btns;
	NAT num_btns;
	Bool sens;

	XtVaGetValues(w, XmNchildren, &btns,
		XmNnumChildren, &num_btns, NULL);
	if (0 <= i && i < num_btns) {
		XtSetSensitive(btns[i], b);
	};
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set_menu_item_label: given a menu w change the
 * label of the i-th item in the menu.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void set_menu_item_label(w, i, lab)
Widget w;
NAT i;
char *lab;
{
	Widget *btns;
	NAT num_btns;
	XmString str;
	Bool sens;

	XtVaGetValues(w, XmNchildren, &btns,
		XmNnumChildren, &num_btns, NULL);
	if (0 <= i && i < num_btns) {
		str = XmStringCreateSimple(lab);
		XtVaSetValues(btns[i], 
			XmNlabelString, str,
			NULL);
		XmStringFree(str);
	};

}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * check_text_window_limit: helps to manage the text windows
 * which may have a size limit. Limits less than 1000 are
 * ignored. If the text needs to be truncated, tries to remove about
 * 5% of it, and removes a whole number of lines if that can be
 * done without deleting more than 10%. Expects to be called *after*
 * the new text has been inserted.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void check_text_window_limit(w, max)
Widget w;
NAT max;
{
	XmTextPosition siz;
	NAT bytes_to_go;

	char *text, *p;
	const char *fmt =
	"**** Text lost when buffer exceeded %ld bytes ****\n";
	char msg[80]; /* enough for fmt with %ld expanded */

	if(max < 1000) {
		return;
	};

	siz = XmTextGetLastPosition(w);

	if(siz <= max) {
		return;
	};

	bytes_to_go = siz / 20;

	text = XmTextGetString(w);

	for(p = text + bytes_to_go; p - text < 2*bytes_to_go; ++p) {
		if(*p == '\n') {
			break;
		}
	};

	if(*p == '\n') {
		bytes_to_go = p - text + 1;
	};

	sprintf(msg, fmt, max);

	XmTextReplace(w, 0, bytes_to_go, msg);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * copy_font_list: copy the font list resource from one text
 * widget to another.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void copy_font_list (
	Widget	to_w,
	Widget from_w)
{
	XmFontList fontlist;

	XtVaGetValues(from_w, XmNfontList, &fontlist, NULL);
	if(fontlist != NULL) {
		XtVaSetValues(to_w,
		XmNfontList, fontlist, NULL);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * blink owner callback: this callback expects the callback data to
 * be a text widget. It arranges for the text widget to blink for
 * a while.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void blink_owner_cb(
	Widget					w,
	Widget					text_w,
	XmPushButtonCallbackStruct		*unused)
{
	static void unhighlight();
	XmTextSetHighlight(text_w,
		0,
		XmTextGetLastPosition(text_w),
		XmHIGHLIGHT_SELECTED);
	XtAppAddTimeOut(app,
		500,
		(XtTimerCallbackProc)unhighlight,
		text_w);

}

static void unhighlight(
	Widget			text_w,
	XtIntervalId		*unused)
{
	XmTextPosition left, right;
	XmTextSetHighlight(text_w,
			0,
			XmTextGetLastPosition(text_w),
			XmHIGHLIGHT_NORMAL);
	if(XmTextGetSelectionPosition(text_w, &left, &right) &&
		left != right) {
		XmTextSetHighlight(text_w,
			left, right, XmHIGHLIGHT_SELECTED);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * number_verify_cb: callback to be used as a modify/verify
 * callback to a text (field) widget to ensure that
 * the text field contains only a number.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void number_verify_cb(
	Widget				unused1,
	XtPointer			unused2,
	XmTextVerifyCallbackStruct	*cbs)
{
	int i, j;
	char *p = cbs->text->ptr; /* Not modified later */
	for(i = 0; i < cbs->text->length; ++i) {
		if(!isdigit(p[i])) {
			for(j = i; j < cbs->text->length; ++j) {
				p[j] = p[j+1];
				--cbs->text->length;
				--i;
			}
		}
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * text_show_position: like XmTextShowPosition but centres the
 * position if it's not on the screen to start with. 
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void text_show_position(
	Widget	text_w,
	XmTextPosition pos)
{
	XmTextPosition old_top;
	short nrows;
	old_top = XmTextGetTopCharacter(text_w);
	XmTextDisableRedisplay(text_w);
	XmTextShowPosition(text_w, pos);
	if(old_top != XmTextGetTopCharacter(text_w)) {
		XmTextSetTopCharacter(text_w, pos);
		XtVaGetValues(text_w, XmNrows, &nrows, NULL);
		XmTextScroll(text_w, -(nrows / 2));
	};
	XmTextEnableRedisplay(text_w);
}
	




/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: xmisc.c,v 2.2 2001/11/16 17:20:38 rda Exp rda $
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
#include <ctype.h>
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
void toggle_menu_item_sensitivity(Widget w, NAT i)
{
	Widget *btns;
	NAT num_btns;

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
void set_menu_item_sensitivity(Widget w, NAT i, Boolean b)
{
	Widget *btns;
	NAT num_btns;

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
void set_menu_item_label(Widget w, NAT i, char *lab)
{
	Widget *btns;
	NAT num_btns;
	XmString str;

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
void check_text_window_limit(Widget w, NAT max)
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
static void unhighlight(Widget,XtIntervalId*);
void blink_owner_cb(
	Widget					w,
	Widget					text_w,
	XmPushButtonCallbackStruct		*unused)
{
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
	int i;
	char *p = cbs->text->ptr;
	for(i = 0; i < cbs->text->length; ++i) {
		if((p[i] & 0x80) || !isdigit(p[i] & 0x7f)) {
			cbs->doit = False;
			return;
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
	
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * fix_pane_height: fix the height of a child pane in a paned widget.
 * scale_w is a widget from which to take the height. Often the two
 * arguments will be the same widget, viz., the manager widget for
 * the widgets in the pane. However, in that case, fix_pane_height
 * has to be called after the shell containing the pane widget has been
 * realized (or popped up), it would seem in most cases.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void fix_pane_height(
	Widget child_w,
	Widget scale_w)
{
	Dimension height;
	XtVaGetValues(scale_w,
		XmNheight, 		&height,
		NULL);
	XtVaSetValues(child_w,
		XmNpaneMaximum,	height,
		XmNpaneMinimum,	height,
		NULL);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * attach_edit_popup: attach a popup edit menu to a text widget
 * with menu items given as parameter:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void post_popupeditmenu(EVENT_HANDLER_ARGS);
static void attach_edit_popup(Widget text_w, MenuItem *menu_items)
{
	MenuItem *mip = menu_items;
	Widget menu_w;
	while(mip->label != NULL) {
		(mip++)->callback_data = text_w;
	}
	menu_w = setup_menu(
		text_w, XmMENU_POPUP, "", ' ', False, menu_items);
	XtAddEventHandler(text_w, ButtonPressMask, False,
		post_popupeditmenu, menu_w);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * attach_rw_edit_popup: attach a popup edit menu to a read-write
 * (i.e., editable) text widget. Supported functions are
 * Cut, Copy, Paste & Clear:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void
	edit_cut_cb(CALLBACK_ARGS),
	edit_copy_cb(CALLBACK_ARGS),
	edit_paste_cb(CALLBACK_ARGS),
	edit_clear_cb(CALLBACK_ARGS);
static MenuItem rw_edit_menu_items[] = {
    { "Cut", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_cut_cb, NULL, (MenuItem *)NULL, False },
    { "Copy", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_copy_cb, NULL, (MenuItem *)NULL, False },
    { "Paste", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_paste_cb, NULL, (MenuItem *)NULL, False },
    { "Clear", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_clear_cb, NULL, (MenuItem *)NULL, False },
    {NULL}
};
void attach_rw_edit_popup(Widget text_w)
{
	attach_edit_popup(text_w, rw_edit_menu_items);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * attach_ro_edit_popup: attach a popup edit menu to a read-only
 * (i.e., uneditable) text widget. Supported functions are
 * Copy & Clear:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static MenuItem ro_edit_menu_items[] = {
    { "Copy", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_copy_cb, NULL, (MenuItem *)NULL, False },
    { "Clear", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_clear_cb, NULL, (MenuItem *)NULL, False },
    {NULL}
};
void attach_ro_edit_popup(Widget text_w)
{
	attach_edit_popup(text_w, ro_edit_menu_items);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Callback routines for the popup edit menus:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void edit_cut_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	Widget text_w = (Widget) cbd;
	(void) XmTextCut(text_w, CurrentTime);
}
static void edit_copy_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	Widget text_w = (Widget) cbd;
	(void) XmTextCopy(text_w, CurrentTime);
}
static void edit_paste_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	Widget text_w = (Widget) cbd;
	(void) XmTextPaste(text_w);
}
static void edit_clear_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	Widget text_w = (Widget) cbd;
	(void) XmTextClearSelection(text_w, CurrentTime);
}
static void post_popupeditmenu(
	Widget		w,
	XtPointer	cd,
	XEvent		*ev,
	Boolean		*unused)
{
	XButtonPressedEvent *event = &(ev->xbutton);
	if (event->button == 3) {
		Widget menu_w = (Widget) cd;
		XmMenuPosition(menu_w, event);
		XtManageChild(menu_w);
	}
}

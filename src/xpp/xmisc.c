

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: xmisc.c,v 2.24 2003/07/24 10:46:50 rda Exp rda $
 *
 * xmisc.c -  miscellaneous X/Motif routines for the X/Motif ProofPower
 * Interface
 *
 * xmisc.c: this file is part of the PPTex system
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
#define _xmisc
/*
 * The following gives the bound of the static array that
 * contains text widgets in which the ":= Selection" callbacks
 * and certain other operations on selections
 * look for selections to copy into the search or replace windows.
 */
#define MAX_SELECTION_SOURCES 10
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files:
 * **** **** **** **** **** **** **** **** **** **** **** **** */


#include "xpp.h"

#include <stdio.h>
#include <ctype.h>
#include <X11/Xatom.h>
#include <X11/Intrinsic.h>
#include <X11/Shell.h>
#include <Xm/Xm.h>
#ifdef EDITRES
#include <X11/Xmu/Editres.h>
#endif

#include<Xm/Text.h>

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * messages
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static char *too_many_selection_sources = 
	"DESIGN ERROR: too many attempts to register a text selection source";

static char *selection_timeout_message =
	 "%s The application owning the selection did not respond.";

static char *binary_data_message =
	 "The text you are trying to enter contains binary data."
	" Uneditable characters have been replaced by question marks.";

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * static data
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static int num_selection_sources;
static Widget selection_sources[MAX_SELECTION_SOURCES];
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * beep: ring the bell, typically as a lightweight error report.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void beep(void)
{
	 XBell(XtDisplay(root), 50);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * get_map_state: get the map state of a window (IsUnmapped/IsUnviewable/IsViewable)
 * **** **** **** **** **** **** **** **** **** **** **** **** */
int get_map_state(Widget w)
{
	XWindowAttributes attrs;
	(void) XGetWindowAttributes(XtDisplay(w), XtWindow(w), &attrs);
	return attrs.map_state;
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * get_top_shell - find the window manager shell containing a widget.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
Widget get_top_shell(Widget w)
{
	while (w && !XtIsWMShell(w)) {
		w = XtParent(w);
	}
	return w;
}
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

	journal_editable = True;
	XmTextReplace(w, 0, bytes_to_go, msg);
	journal_editable = False;
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
	Widget				w,
	XtPointer				cbd,
	XtPointer				cbs)
{
	Widget text_w = cbd;
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
	Widget		unused1,
	XtPointer		unused2,
	XtPointer		xtp)
{
	XmTextVerifyCallbackStruct *cbs = xtp;
	int i;
	char *p = cbs->text->ptr;
	if(cbs->text->format != XmFMT_8_BIT) {
		cbs -> doit = False;
		return;
	}
	for(i = 0; i < cbs->text->length; ++i) {
		if((p[i] & 0x80) || !isdigit(p[i] & 0x7f)) {
			cbs->doit = False;
			return;
		}
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * text_verify_cb: callback to be used as a modify/verify
 * callback to a text (field) widget to ensure that
 * the text doesn't contain control characters or carriage returns.
 * It maps DOS and MacOS line terminators to new-lines.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void text_verify_cb(
	Widget		text_w,
	XtPointer		unused2,
	XtPointer		xtp)
{
	XmTextVerifyCallbackStruct *cbs = xtp;
	int i, j;
	char *p = cbs->text->ptr;
	Boolean has_crs = False, has_controls = False;
	if(cbs->text->format != XmFMT_8_BIT) {
		cbs -> doit = False;
		return;
	}
	for(i = 0; i < cbs->text->length; ++i) {
		if(p[i] == '\r') {
			has_crs = True;
		} else if(control_chars[p[i] & 0xff]) {
			has_controls = True;
			p[i] = '?';
		}
	}
	if(has_crs) {
		for(i = 0, j = 0; j < cbs->text->length; ++i, ++j) {
			if(p[j] == '\r') {
				if(j + 1 < cbs->text->length && p[j+1] == '\n') {
					j += 1;
				} else {
					p[j] = '\n';
				}
			}
			p[i] = p[j];
		}
		cbs->text->length = i;
	}
	if(has_controls) {
		ok_dialog(text_w, binary_data_message);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * text_field_verify_cb: callback to be used as a modify/verify
 * callback to a text (field) widget to ensure that
 * the text doesn't contain control characters and to map
 * Unix, DOS and MacOS line terminators to spaces.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void text_field_verify_cb(
	Widget		text_w,
	XtPointer		unused2,
	XtPointer		xtp)
{
	XmTextVerifyCallbackStruct *cbs = xtp;
	int i, j;
	char *p = cbs->text->ptr;
	Boolean has_crs = False, has_controls = False;
	if(cbs->text->format != XmFMT_8_BIT) {
		cbs -> doit = False;
		return;
	}
	for(i = 0; i < cbs->text->length; ++i) {
		if(p[i] == '\r') {
			has_crs = True;
		} else if(control_chars[p[i] & 0xff]) {
			has_controls = True;
			p[i] = '?';
		}
	}
	for(i = 0, j = 0; j < cbs->text->length; ++i, ++j) {
		if(p[j] == '\r') {
			if(j + 1 < cbs->text->length && p[j+1] == '\n') {
				j += 1;
			} else {
				p[j] = ' ';
			}
		} else if (p[j] == '\n') {
			p[j] = ' ';
		}
		p[i] = p[j];
	}
	cbs->text->length = i;
	if(has_controls) {
		ok_dialog(text_w, binary_data_message);
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Common set-up for custom dialogues:
 * Deals with initial positioning of the dialogues and with
 * mimicking Motif's behaviour for subclasses of bulletin
 * board when the user types osfCancel
 * in a dialogue whose outermost container widget is not
 * subclassed from bulletin board (e.g., a paned
 * window).
 * **** **** **** **** **** **** **** **** **** **** **** **** */
typedef struct {
	void	(*cancel_cb)(CALLBACK_ARGS);
	XtPointer	cancel_cbd;
} cancel_info;

static void cancel_handler (
	Widget		w,
	XtPointer	x,
	XEvent		*evp,
	Boolean		*continue_dispatch)
{
	KeySym keysym;
	Modifiers modifiers;
	XKeyPressedEvent *kpe;
	cancel_info *info = x;
	char *str;
	if(evp->type != KeyRelease) {
		return;
	} /* else */
	kpe = &(evp->xkey);
	XmTranslateKey(XtDisplay(root),
		kpe->keycode,
		kpe->state,
		&modifiers,
		&keysym);
	if(keysym ==  osfXK_Cancel) {
		info->cancel_cb(w, info->cancel_cbd, 0);
		*continue_dispatch = False;
	}
}
static void add_cancel_handlers(Widget w, XtPointer cbd)
{
	Widget *children;
	int i, num_children;
	if(XtIsComposite(w)) {
		XtVaGetValues(w,
			XmNchildren,		&children,
			XmNnumChildren,		&num_children,
			NULL);
		for(i = 0; i < num_children; i += 1) {
			add_cancel_handlers(children[i], cbd);
		}
	}
	if (XtIsWidget(w)) {
		XtInsertEventHandler(w,
			KeyReleaseMask,
			False,
			cancel_handler,
			cbd,
			XtListHead);
	} /* else it's a gadget and they don't handle events - the handler on the container will do the job */
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * setup_popup_cb: XmNpopupCallback callback that
 * sets up a popup-shell. Most of the code is concerned
 * with attempt to centre a popup-shell relative to the root
 * window. If this would come within 10 pixels of
 * obscuring the root window, it places the top left-hand
 * corner of the popup 10 pixels south and west of
 * that of the root window. In any case, if either of the resulting
 * absolute coordinates would be negative, set it to 10.
 * The callback removes itself from the list - if the user moves
 * the pop-up after it has first been seen, then we don't want to
 * interfere.
 * Finally, if the caller of common_setup_dialog has asked for it
 * the cancel event handler is registered for each valid widget
 * in the widget hierarchy under the popup-shell.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void  setup_popup_cb(
	Widget		popup,
	XtPointer		cbd,
	XtPointer		unused2)
{
	Position popup_rel_x, popup_rel_y, popup_abs_x, popup_abs_y;
	Dimension root_wd, root_ht, popup_wd, popup_ht;
	if(!XtIsRealized(popup)) {
	/* XtPopup spec says callback could be called before realization. */
		XtRealizeWidget(popup);
	}
	XtVaGetValues(popup,
		XmNwidth,	&popup_wd,
		XmNheight,	&popup_ht,
		NULL);
	XtVaGetValues(root,
		XmNwidth,	&root_wd,
		XmNheight,	&root_ht,
		NULL);
	popup_rel_x = (root_wd - popup_wd) / 2;
	popup_rel_y = (root_ht - popup_ht) / 2;
	if(popup_rel_x <= 10 && popup_rel_y <= 10) {
		popup_rel_x = 10;
		popup_rel_y = 10;
	}
	XtTranslateCoords(root, popup_rel_x, popup_rel_y, &popup_abs_x, &popup_abs_y);
	if(popup_abs_x <= 10) {popup_abs_x = 10;}
	if(popup_abs_y <= 10) {popup_abs_y = 10;}
	XtVaSetValues(popup,
		XmNx,	popup_abs_x,
		XmNy,	popup_abs_y,
		NULL);
	XtRemoveCallback(popup, XmNpopupCallback, setup_popup_cb, cbd);
	if(cbd != 0) {
		add_cancel_handlers(popup, cbd);
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Interface to the common dialog set-up
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void common_dialog_setup(
	Widget shell,
	void cancel_cb(CALLBACK_ARGS),
	XtPointer cancel_cbd)
{
	cancel_info *cbd;
	if(cancel_cb != 0) {
		cbd = (cancel_info*)XtMalloc(sizeof(*cbd));
		cbd -> cancel_cb = cancel_cb;
		cbd -> cancel_cbd = cancel_cbd;
	} else {
		cbd = (cancel_info*) 0;
	}
	XtAddCallback(shell, XmNpopupCallback, setup_popup_cb, cbd);
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
		text_w, XmMENU_POPUP, "popup-edit-menu", ' ', False, menu_items);
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
	XmTextCopy(text_w, CurrentTime);	
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
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * register_selection_source: add an entry to the list of
 * text selection sources
 * **** **** **** **** **** **** **** **** **** **** **** ****/
void register_selection_source(Widget w)
{
	if (num_selection_sources == MAX_SELECTION_SOURCES) {
		ok_dialog(root, too_many_selection_sources);
		return;
	} /* else */
	selection_sources[num_selection_sources++] = w;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * get_selection: find a selection using the list of
 * text selection sources first and if that fails using
 * the Xt interfaces to get it from elsewhere.
 * get_remote_selection does the last bit.
 * **** **** **** **** **** **** **** **** **** **** **** ****/
static char *get_remote_selection(Boolean *timed_out);
char *get_selection(Widget w, char *err_msg)
{
	char *sel;
	int i;
	Boolean timed_out = False;
	for(	i = 0, sel = NULL;
		sel == NULL && i < num_selection_sources;
		i += 1) {
		sel = XmTextGetSelection(selection_sources[i]);
	}
	if(sel == NULL) {
		sel = get_remote_selection(&timed_out);
		if(sel != NULL && *sel == '\0') {/* empty selection */
			XtFree(sel);
			sel = NULL;
		}
	}
	if(sel == NULL) {
		if(timed_out) {
			char *err_buf = XtMalloc(strlen(err_msg) + strlen(selection_timeout_message));
			if(err_buf != 0) {
				sprintf(err_buf, selection_timeout_message, err_msg);
				ok_dialog(w, err_buf);
				XtFree(err_buf);
			} else {
				ok_dialog(w, err_msg);
			}
		} else {
			ok_dialog(w, err_msg);
		}
	}
	return sel;
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * get_remote_selection: use XtGetSelectionValue to get the selection.
 * **** **** **** **** **** **** **** **** **** **** **** ****/
static struct {
	char		*data;
	Boolean		failed;}
	sel_req_info;
static void selection_cb (
	Widget		w,
	XtPointer		cbd,
	Atom*		selection,
	Atom*		type,
	XtPointer		value,
	unsigned long*	length,
	int*		format)
{
	if(*type != XT_CONVERT_FAIL) {
		char *buf = XtMalloc(*length + 1);
		memmove(buf, (char*) value, *length);
		buf[*length] = '\0';
		sel_req_info.data = buf;
		XtFree(value);
	} else {
		sel_req_info.failed = True;
	}
}
static char *get_remote_selection(Boolean *timed_out)
{
	Boolean timeout_proc_registered;
	sel_req_info.data = NULL;
	sel_req_info.failed = False;
	XtGetSelectionValue(root,
		XA_PRIMARY,
		XA_STRING,
		selection_cb,
		0,
		XtLastTimestampProcessed(XtDisplay(root)));
	while(sel_req_info.data == 0 && !sel_req_info.failed) {
		XEvent xev;
		XtAppNextEvent(app, &xev);
		if(	xev.type != KeyPress /* discard things that could interfere with caller */
		&&	xev.type != KeyRelease
		&&	xev.type != ButtonPress
		&&	xev.type != ButtonRelease) {
			XtDispatchEvent(&xev);
		}
	}
	*timed_out = sel_req_info.failed;
	return sel_req_info.data;
}


#ifdef LISTWIDGETS
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * register_shell: register the shell ancestor of a widget for inclusion in the hierarchy listing
 * list_widget_hierarchy: output listing of widget hierarchy to standard error.
 * **** **** **** **** **** **** **** **** **** **** **** ****/
#include <X11/IntrinsicP.h> /* to let us look at widget class names */
typedef struct _path
{
	Widget		w;
	struct _path	*link;
} path_cell, *path;
static Boolean print_path(path list)
{
	char *name;
	Boolean head;
	if(list == 0) {
		return True;
	} /* else */
	head = print_path(list->link);
	name = XtName(list->w);
	fprintf(stderr, head ? "%s" : ".%s", *name == '\0' ? "\"\"" : name);
	return False;
}
static void list_widget_and_descendants(Widget w, path p)
{
	char *class_name;
	path_cell cell;
	Widget menu;
	cell.w = w;
	cell.link = p;
	fprintf(stderr, "%s ", (XtClass(w))->core_class.class_name);
	(void)print_path(&cell);
	fprintf(stderr, "\n");
	if(XtIsComposite(w)) {
		Widget *children;
		int i, num_children;
		XtVaGetValues(w,
			XmNchildren,		&children,
			XmNnumChildren,		&num_children,
			NULL);
		for(i = 0; i < num_children; i += 1) {
			list_widget_and_descendants(children[i], &cell);
		}
	}
}
static void get_ancestors_and_list(Widget w, Widget anc, path p)
{
	path_cell cell;
	Widget parent = XtParent(anc);
	if(parent != (Widget)0) {
		cell.w = parent;
		if(p != 0) {
			cell.link = p->link;
			p-> link = &cell;
		} else {
			cell.link = &cell;
		}
		get_ancestors_and_list(w, parent, &cell);
	} else {
		path ancs;
		if(p != 0) {
			ancs = p-> link;
			p->link = 0;
		} else {
			ancs = p;
		}		
		list_widget_and_descendants(w, ancs);
	}
}
#define MAX_SHELLS 100
static Widget shells[MAX_SHELLS];
static int num_shells = 0;
void register_shell(Widget w)
{
	Widget sh, parent;
	int i;
	parent = w;
	do {
		sh = parent;
		parent = XtParent(sh);
	} while(!XtIsShell(sh));
	for(i = 0; i < num_shells; i += 1) {
		if(shells[i] == sh) {
			return;
		}
	}
	shells[num_shells++] = sh;
}
#define REGISTER_SHELL(sh)   {register_shell(sh);}
void list_widget_hierarchy(void)
{
	int i;
	for(i = 0; i < num_shells; ++i) {
		get_ancestors_and_list(shells[i], shells[i], 0);
	}
}
#else
#define REGISTER_SHELL(sh)
#endif
#ifdef EDITRES
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_edit_res_handler: add support for editres to a shell widget
 * **** **** **** **** **** **** **** **** **** **** **** ****/
void add_edit_res_handler(Widget w)
{
	Widget sh, parent;
	parent = w;
	do {
		sh = parent;
		parent = XtParent(sh);
	} while(!XtIsShell(sh));
	REGISTER_SHELL(sh)
	XtAddEventHandler(sh,
			(EventMask) 0,
			True,
			_XEditResCheckMessages,
			NULL);
}
#endif

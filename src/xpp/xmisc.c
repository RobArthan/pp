

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
	TRACE("toggle_menu_item_sensitivity");

	XtVaGetValues(w, XmNchildren, &btns,
		XmNnumChildren, &num_btns, NULL);
	if (0 <= i && i < num_btns) {
		XtSetSensitive(btns[i], !XtIsSensitive(btns[i]));
	};

	LEAVE("toggle_menu_item_sensitivity");
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
	TRACE("set_menu_item_sensitivity");

	XtVaGetValues(w, XmNchildren, &btns,
		XmNnumChildren, &num_btns, NULL);
	if (0 <= i && i < num_btns) {
		XtSetSensitive(btns[i], b);
	};

	LEAVE("set_menu_item_sensitivity");
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
	TRACE("set_menu_item_label");

	XtVaGetValues(w, XmNchildren, &btns,
		XmNnumChildren, &num_btns, NULL);
	if (0 <= i && i < num_btns) {
		str = XmStringCreateSimple(lab);
		XtVaSetValues(btns[i], 
			XmNlabelString, str,
			NULL);
		XmStringFree(str);
	};

	LEAVE("set_menu_item_label");
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

	TRACE("check_text_window_limit");

	if(max < 1000) {
		LEAVE("check_text_window_limit");
	};

	siz = XmTextGetLastPosition(w);

	if(siz <= max) {
		LEAVE("check_text_window_limit");
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

	LEAVE("check_text_window_limit");
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: xmisc.c,v 2.42 2012/12/11 12:00:25 rda Exp rda $
 *
 * ucdnames.c -  support for the Identify Unicode menu item
 *
 * ucdnames.c: this file is part of the PPTex system
 *
 * Copyright (c) 2019 Lemma 1 Ltd.
 *
 * See the file LICENSE for your rights to use and change this file.
 *
 * Contact: Rob Arthan < rda@lemma-one.com >
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _ucdnames
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
#include <stdlib.h>
#include <ctype.h>
#include <wctype.h>
#include <Xm/Xm.h>
#include<Xm/Text.h>
#include "ucdnames.h"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * messages
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static char *no_selection =
	"No text selection is available in this text window";
static char *banner =
	"==== Unicode Identification ====\n\n";
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * identify_ucd_cb: callback routine that brings up a
 * dialogue giving the name used inthe Unicode Code Database
 * for the wie characters in the current selection.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static ucd_name unknown_name = {0, "<non-standard codepoint>"};
int compare_ucd_names(const void *vp1, const void *vp2)
{
	const ucd_name *n1 = vp1, *n2 = vp2;
	return n1->codepoint - n2->codepoint;
}
static void append_ucd_name(char **buf, wchar_t wc)
{
	static Boolean sorted = False;
	int lwb, upb, line_len;
	ucd_name un;
	char *line;
	if(!sorted) {
		qsort((void*)ucd_names,
			XtNumber(ucd_names),
			sizeof(ucd_names[0]),
			compare_ucd_names);
		sorted = True;
	}
	lwb = 0;
	upb = XtNumber(ucd_names) - 1;
	un = unknown_name;
	while(lwb <= upb) {
		int i = (lwb + upb) / 2;
		wchar_t codepoint = ucd_names[i].codepoint;
		if(codepoint == wc) {
			un = ucd_names[i];
			lwb = upb + i;
		} else if(codepoint < wc) {
			lwb = i + 1;
		} else {
			upb = i - 1;
		}
	}
	line_len =  10 + strlen(un.name);
	line = XtMalloc(line_len + 1);
	sprintf(line, "0x%06X %s\n", (unsigned)wc, un.name); 
	*buf = XtRealloc(*buf, strlen(*buf) + line_len + 1);
	(void) strcat(*buf, line);
	XtFree(line);
}
void identify_unicode_cb(
		Widget		w,
		XtPointer	cbd,
		XtPointer	cbs)
{
	Widget text_w = (Widget)cbd;
	wchar_t *sel, *p;
	sel = XmTextGetSelectionWcs(text_w);
	if(sel != 0) {
		char *buf = XtMalloc(strlen(banner) + 1);
		strcpy(buf, banner);
		for(p = sel; *p; p += 1) {
			append_ucd_name(&buf, *p);
		}
		help_dialog(w, buf);
		XtFree(buf);
		XtFree((char*)sel);
	} else {
		ok_dialog(text_w, no_selection);
	}
}

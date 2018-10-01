
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: palette.c,v 2.36 2011/02/12 10:17:57 rda Exp rda $
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
#include <stdint.h>
#include <stdlib.h>
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
 * Manifest constants and typedefs:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
enum {MAX_ROWS = 100, MAX_COLS = 100};
typedef struct {
	int 	num_rows, num_cols, fraction_base, x_units, y_units;
	wchar_t	labels[MAX_ROWS][MAX_COLS+1];
}	PaletteConfig;

typedef struct {
	Widget text_w, palette_w;
} PaletteData;

char *too_many_rows_msg = "too many rows in the palette (maximum is %d)";
char *too_many_cols_msg = "too many columns in the palette (maximum is %d)";
char *binary_data_msg = "Binary data in palette resource at row %d column %d";
static char *no_config_msg = "Unable to set up the palette";

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * static data:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static PaletteData palette_info = { NULL, NULL };

static int gcd(int x, int y)
{
	if(x > y) {
		return gcd(y, x);
	}
	if(x == 0) {
		return y;
	}
	return gcd(x, y - x);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Functions to parse the required contents of the palette out of
 * the applications resource (Xpp.palette).
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static int lcm(int x, int y)
{
	return (x*y) / gcd(x, y);
}

static Boolean check_limits(int row, int col)
{
	if(row >= MAX_ROWS || col >= MAX_COLS) {
		char buf[100];
		sprintf(buf, too_many_rows_msg, MAX_ROWS);
		ok_dialog(root, buf);
		return False;
	} else if(col >= MAX_COLS) {
		char buf[100];
		sprintf(buf, too_many_cols_msg, MAX_COLS);
		ok_dialog(root, buf);
		return False;
	} else {
		return True;
	}
}

static void get_labels(PaletteConfig *palette_config)
{
	wchar_t wc;
	int col = 0;
	char *p = xpp_resources.palette;
	int r, l = strlen(p);
	palette_config->num_rows = 0;
	palette_config->num_cols = 0;
	while(l) {
		r = mbtowc(&wc, p, l);
		if(r == -1) {
			char buf[100];
			sprintf(buf, binary_data_msg,
				palette_config->num_rows + 1, col + 1);
			ok_dialog(root, buf);
			break;
		}
		switch(wc) {
			case L'\n': /* end of row */
				palette_config->labels
					[palette_config->num_rows]
						[col] = L'\0';
				if(col > 0) {
					palette_config->num_rows += 1;
				}
				if(palette_config->num_cols < col) {
					palette_config->num_cols = col;
				}
				col = 0;
				break; /* just for form's sake */
			case ' ':
			case '\t':
				break;
			default:
				if(!check_limits(palette_config->num_rows, col)) {
					return;
				}
				palette_config->labels
					[palette_config->num_rows]
						[col] = wc;
				col += 1;
				break;
		}
		p += r;
		l -= r;
	}
	if(palette_config->num_rows == 0 && col > 0) {
/* Single row with no terminating new-line */
		palette_config->num_rows = 1;
		palette_config->num_cols = col;
	}
}

static PaletteConfig *get_palette_config(void)
{
	PaletteConfig *palette_config =
		(void *)XtMalloc(sizeof(PaletteConfig));
	if(palette_config == 0) { /* out of memory */
		return 0;
	} /* else */
	get_labels(palette_config);
	if(	palette_config->num_rows == 0
	|| 	palette_config->num_cols == 0) {
		XtFree((char*)palette_config);
		return 0;
	}
	palette_config->fraction_base =
		lcm(palette_config->num_rows, palette_config->num_cols);
	palette_config->x_units =
		palette_config->fraction_base / palette_config->num_cols;
	palette_config->y_units =
		palette_config->fraction_base / palette_config->num_rows;
	return palette_config;
}

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
	char *label_buf, name_buf[sizeof "glyphXXXXXXXX"];
	int i, j, x, y;
	Widget shell, paned, palette_form, bottom_form,
			button, dismiss_btn, help_btn;
	PaletteConfig *palette_config;
	wchar_t wc, cbdata;
	
	palette_info.text_w = w;
	if((paned = palette_info.palette_w) != NULL) {
		XtManageChild(paned);
		XtPopup(XtParent(paned), XtGrabNone);
		set_input_focus(paned);
		return;
	} /* else ... */

	shell = XtVaCreatePopupShell("xpp-Palette",
		xmDialogShellWidgetClass, w,
		XmNtitle,			"Palette",
		NULL);
#ifdef EDITRES
	add_edit_res_handler(shell);
#endif
	common_dialog_setup(shell, popdown_cb, shell);

	paned = XtVaCreateWidget("paned",
		XMPANEDCLASS, 	shell,
		NULL);

	palette_info.palette_w = paned;

	palette_config = get_palette_config();

	if(palette_config == 0) {
		lab = XmStringCreateSimple(no_config_msg);
		palette_form = XtVaCreateWidget("message",
			xmLabelWidgetClass, paned,
			XmNlabelString, lab,
			NULL);
		XmStringFree(lab);
	} else {

		palette_form = XtVaCreateWidget("palette-buttons",
			xmFormWidgetClass, paned,
			XmNfractionBase, 	palette_config->fraction_base,
			NULL);

		label_buf = XtMalloc(MB_CUR_MAX + 1);

		for(i = 0; i < palette_config->num_rows; i += 1) {
			for(	j = 0;
					palette_config->labels[i][j] != 0
				&&	j < palette_config->num_cols;
				j += 1) {
				wc = palette_config->labels[i][j];
				if(wc == '.') {
					continue;
				} /* else */
				(void) wctomb(label_buf, wc);
				sprintf(name_buf, "glyph%08X", wc);
				lab = XmStringCreateSimple(label_buf);
				x = (palette_config->x_units)*j;
				y = (palette_config->y_units)*i;
				button = XtVaCreateManagedWidget(name_buf,
					xmPushButtonGadgetClass, palette_form,
					XmNlabelString, lab,
					XmNleftAttachment,	XmATTACH_POSITION,
					XmNleftPosition,	x,
					XmNrightAttachment,	XmATTACH_POSITION,
					XmNrightPosition,	x + palette_config->x_units,
					XmNtopAttachment,	XmATTACH_POSITION,
					XmNtopPosition,		y,
					XmNbottomAttachment,	XmATTACH_POSITION,
					XmNbottomPosition,	y + palette_config->y_units,
					NULL);
				XmStringFree(lab);
				cbdata = wc;
				XtAddCallback(button, XmNactivateCallback, type_char_cb,
					(XtPointer) (uintptr_t) cbdata);
			}
		}
		XtFree((void*)palette_config);
		XtFree(label_buf);
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

	XtAddCallback(dismiss_btn, XmNactivateCallback, popdown_cb, shell);
	XtAddCallback(help_btn, XmNactivateCallback,help_cb, (XtPointer) Help_Palette_Tool);

	XtManageChild(palette_form);
	XtManageChild(bottom_form);
	XtManageChild(paned);
	XtPopup(shell, XtGrabNone);

	fix_pane_height(bottom_form, bottom_form);

	remove_sashes(paned);

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
	wchar_t cbdata = (wchar_t) cbd, buf[2];
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
	buf[1] = L'\0';

	if(	XmTextGetSelectionPosition(text_w, &start, &end)
	&&	start < end) {
		XmTextReplaceWcs(text_w, start, end, buf);
		XmTextClearSelection(text_w, CurrentTime);
	} else {
		start = XmTextGetInsertionPosition(text_w);
		XmTextInsertWcs(text_w, start, buf);
	}

	XmTextSetInsertionPosition(text_w, start + 1);
	XmTextShowPosition(text_w, start);
/*
 * On early versions of Motif, the next line worked OK with keyboardFocusPolicy
 * EXPLICIT (i.e., click-to-type), but not with POINTER (i.e., focus follows mouse)
 * (with POINTER it made the keyboard focus stick in the text window regardless
 * of where the pointer was moved to). It seems to work OK in 21st century versions
 * of Motif (although there are a lot of OS/Window manager combinations to test).
 */
	set_input_focus(text_w);
}

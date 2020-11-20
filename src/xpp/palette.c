
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: palette.c,v 2.36 2011/02/12 10:17:57 rda Exp rda $
 *
 * palette.c - support for palettes for the X/Motif ProofPower Interface
 *
 * palette.c: this file is part of the PPXpp package
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
	Widget text_w;
	int num_palettes;
	struct {char *title; Widget w;} palettes [MAXPALETTES];
} PaletteData;

static char *too_many_rows_msg = "too many rows in the palette (maximum is %d)";
static char *too_many_cols_msg = "too many columns in the palette (maximum is %d)";
static char *binary_data_msg = "Binary data in palette resource at row %d column %d";
static char *no_config_msg = "unable to set up the palette with title \"%s\"; this palette will be ignored";
static char *missing_palette_msg = "missing palette data for palette with title \"%s\"; this palette will be ignored";

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * static data:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static PaletteData palette_info = { NULL, 0 };

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
		msg("xpp", buf);
		return False;
	} else if(col >= MAX_COLS) {
		char buf[100];
		sprintf(buf, too_many_cols_msg, MAX_COLS);
		msg("xpp", buf);
		return False;
	} else {
		return True;
	}
}

static void get_labels(
	char *p,
	PaletteConfig *palette_config)
{
	wchar_t wc;
	int col = 0;
	int r, l = strlen(p);
	palette_config->num_rows = 0;
	palette_config->num_cols = 0;
	while(l) {
		r = mbtowc(&wc, p, l);
		if(r == -1) {
			char buf[100];
			sprintf(buf, binary_data_msg,
				palette_config->num_rows + 1, col + 1);
			msg("xpp palette set", buf);
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

static PaletteConfig *get_palette_config(
	char *palette)
{
	PaletteConfig *palette_config =
		(void *)XtMalloc(sizeof(PaletteConfig));
	if(palette_config == 0) { /* out of memory */
		return 0;
	} /* else */
	get_labels(palette, palette_config);
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
 * setup_palette: set up one palette widget.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void setup_palette(
	char *title,
	char *palette,
	Widget w)
{
	XmString lab;
	char *label_buf, name_buf[sizeof "glyphXXXXXXXX"];
	int i, j, x, y;
	Widget shell, paned, palette_form, bottom_form,
			button, dismiss_btn, help_btn;
	PaletteConfig *palette_config;
	wchar_t wc, cbdata;

	shell = XtVaCreatePopupShell("xpp-Palette",
		xmDialogShellWidgetClass,	w,
		XmNtitle,			title,
		NULL);
#ifdef EDITRES
	add_edit_res_handler(shell);
#endif
	common_dialog_setup(shell, popdown_cb, shell);

	paned = XtVaCreateWidget("paned",
		XMPANEDCLASS, 	shell,
		NULL);

	palette_config = get_palette_config(palette);

	if(palette_config == 0) {
		char *buf = XtMalloc(strlen(no_config_msg) + strlen(title));
		sprintf(buf, no_config_msg, title);
		msg("xpp", buf);
		XtFree(buf);
		return;
	}

	palette_info.palettes[palette_info.num_palettes].title = title;
	palette_info.palettes[palette_info.num_palettes].w = paned;
	palette_info.num_palettes += 1;

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
	XtPopup(shell, XtGrabNone); /* to ensure fix_pane_height works */

	fix_pane_height(bottom_form, bottom_form);

	remove_sashes(paned);

	XtPopdown(shell); /* don't want it popped up till user asks */
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * setup_palettes: set up the palette widgets.
 * The widget argument is the text widget to
 * which the palettes will write in the first instance (see
 * register_palette_client for how this changes when input focus
 * transfers to a different text widget client).
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void setup_palettes(Widget w) {
	enum {IN_TITLE, AFTER_TITLE, BEGINNING_ROW, IN_ROW, AFTER_DOT} state;
	char *q, *last_nl, *title, *palette;
	palette_info.text_w = w;
	title = q = xpp_resources.palette;
	palette = last_nl = 0;
	state = IN_TITLE;
	while(*q != '\0') {
		switch(state) {
			case IN_TITLE:
				if(*q == '\n') {
					*q = '\0';
					q += 1;
					palette = q;
					state = AFTER_TITLE;
				} else {
					q += 1;
				}
				break;
			case AFTER_TITLE:
			case BEGINNING_ROW:
				if(*q == '.') {
					state = AFTER_DOT;
					q += 1;
				} else if (*q == '\n') {
					last_nl = q;
					q += 1;
				} else {
					q += 1;
					state = IN_ROW;
				}
				break;
			case IN_ROW:
				if (*q == '\n') {
					last_nl = q;
					q += 1;
					state = BEGINNING_ROW;
				} else if (*q != 0) {
					q += 1;
				}
				if (*q == '\0') {
					if(*title != '!') {
						setup_palette(title, palette, w);
					}
					title = palette = 0;
				}
				break;
			case AFTER_DOT:
				if(*q == '\n') {
					if(last_nl != 0) *last_nl = '\0';
					last_nl = 0;
					if(*title != '!') {
						setup_palette(title, palette, w);
					}
					q += 1;
					title = q;
					palette = 0;
					state = IN_TITLE;
				} else {
					q += 1;
					state = IN_ROW;
				}
				break;
		}
	}
	if(title != 0 && *title != '!' && palette != 0) {
		setup_palette(title, palette, w);
		title = palette = 0;
	}
	if(title != 0 && *title != '\0' && palette == 0) {
		char *buf = XtMalloc(strlen(missing_palette_msg) + strlen(title));
		sprintf(buf, missing_palette_msg, title);
		msg("xpp", buf);
		XtFree(buf);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * get_palette_title: pop up the title of a palette identified
 * by its index. setup_palettes should be called before calling this.
 * The returned value should not be freed. The return value is 0
 * if the index is out of range.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

char * get_palette_title(int i)
{
	if(i >= 0 && i < palette_info.num_palettes)  {
		return palette_info.palettes[i].title;
	} else {
		return 0;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * popup_palette: pop up the palette widget identified by
 * by its index. setup_palettes should be called before calling this.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void popup_palette(int i)
{
	Widget paned;
	if(i >= 0 && i < palette_info.num_palettes &&
		(paned = palette_info.palettes[i].w) != NULL) {
		XtManageChild(paned);
		XtPopup(XtParent(paned), XtGrabNone);
		set_input_focus(paned);
		return;
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

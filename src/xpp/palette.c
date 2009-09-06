
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * palette.c,v 2.32 2009/06/20 14:35:30 rda Exp 
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
	char	pretty_chars[MAX_ROWS][MAX_COLS+1];
}	PaletteConfig;

typedef struct {
	Widget text_w, palette_w;
} PaletteData;

static char *no_config_msg =
	"Unable to set up the palette";

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
		sprintf(buf, "too many rows in the palette (maximum is %d)", MAX_ROWS);
		ok_dialog(root, buf);
		return False;
	} else if(col >= MAX_COLS) {
		char buf[100];
		sprintf(buf, "too many columns in the palette (maximum is %d)", MAX_COLS);
		ok_dialog(root, buf);
		return False;
	} else {
		return True;
	}
}

static void get_pretty_chars(PaletteConfig *palette_config)
{
	char ch;
	int i = 0, col = 0;
	do {
		ch = palette[i];
		switch(ch) {
			case '\n':
				palette_config->pretty_chars
					[palette_config->num_rows]
						[col] = '\0';
				if(col > 0) {
					palette_config->num_rows += 1;
				}
				if(palette_config->num_cols < col) {
					palette_config->num_cols = col;
				}
				col = 0;
				break;
			case '\0':
				palette_config->pretty_chars
					[palette_config->num_rows]
						[col] = '\0';
				if(col > 0) {
					palette_config->num_rows += 1;
				}
				if(palette_config->num_cols < col) {
					palette_config->num_cols = col;
				}
				return;
				break;
			case ' ':
			case '\t':
				break;
			default:
				if(!check_limits(palette_config->num_rows, col)) {
					return;
				}
				palette_config->pretty_chars
					[palette_config->num_rows]
						[col] = ch;
				col += 1;
				break;
		}
		i += 1; /* N.b. don't get here if last ch was '\0' */
	} while(1);
}

static PaletteConfig *get_palette_config(void)
{
	PaletteConfig *palette_config =
		(void *)XtMalloc(sizeof(PaletteConfig));
	if(palette_config == 0) { /* out of memory */
		return 0;
	} /* else */
	palette_config->num_rows = 0;
	palette_config->num_cols = 0;
	get_pretty_chars(palette_config);
	if(	palette_config->num_rows == 0
	|| 	palette_config->num_cols == 0) {
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
	char label_buf[2], name_buf[sizeof "charXX"];
	int i, j, x, y;
	int cbdata;
	Widget shell, paned, top_form, bottom_form, button, dismiss_btn, help_btn;
	PaletteConfig *palette_config;
	char pretty_char;
	
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
		top_form = XtVaCreateWidget("message",
			xmLabelWidgetClass, paned,
			XmNlabelString, lab,
			NULL);
		XmStringFree(lab);
	} else {

		top_form = XtVaCreateWidget("top-form",
			xmFormWidgetClass, paned,
			XmNfractionBase, 	palette_config->fraction_base,
			NULL);

		label_buf[1] = '\0';

		for(i = 0; i < palette_config->num_rows; i += 1) {
			for(	j = 0;
					palette_config->pretty_chars[i][j] != 0
				&&	j < palette_config->num_cols;
				j += 1) {
				pretty_char = palette_config->pretty_chars[i][j];
				if(pretty_char == '.') {
					continue;
				} /* else */
				label_buf[0] = pretty_char;
				sprintf(name_buf, "char%02X", pretty_char & 0xff);
				lab = XmStringCreateSimple(label_buf);
				x = (palette_config->x_units)*j;
				y = (palette_config->y_units)*i;
				button = XtVaCreateManagedWidget(name_buf,
					xmPushButtonGadgetClass, top_form,
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
				copy_font_list(button, w);
				XmStringFree(lab);
				cbdata = pretty_char;
				XtAddCallback(button, XmNactivateCallback, type_char_cb,
					(XtPointer) (uintptr_t) cbdata);
			}
		}
		XtFree((void*)palette_config);
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

	XtManageChild(top_form);
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
	Cardinal cbdata = (uintptr_t) cbd;
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

	if(	XmTextGetSelectionPosition(text_w, &start, &end)
	&&	start < end) {
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

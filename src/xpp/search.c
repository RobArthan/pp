
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: search.c,v 2.40 2003/07/23 14:02:14 rda Exp rda $ 
 *
 * search.c - support for search & replace for the X/Motif ProofPower Interface
 *
 * search.c: this file is part of the PPTex system
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
#define _search

#define NO_MEMORY		-1
enum {FORWARDS, BACKWARDS};

#define CHECK_MAP_STATE(SDP) \
	{if (get_map_state((SDP)->text_w) != IsViewable) { beep(); return; }}

#include <stdio.h>
#include <ctype.h>
#include <sys/types.h>
#include <regex.h>

#include "xpp.h"

#ifdef SLOWREGEXEC
#define INITCHUNK 1000
#define REGEXEC fast_regexec
#else
#define REGEXEC regexec
#endif

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * typedefs
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/*
 * The following struct includes the various widgets that
 * act as parameters to the various search and replace
 * operations.
 */
typedef struct {
	Widget	text_w,
		shell_w,
		manager_w,
		search_w,
		replace_w,
		line_no_w,
		default_focus_w;
} SearchData;
/*
 * The following represents a substring of a C string, e.g.,
 * for use in representing the result of a search operation.
 * Use offset = -1 to represent "no such substring".
 */
typedef struct {
	long int	offset;
	long int	length;
} Substring;
/*
 * The following type represents the results of "compiling" a search pattern
 * for use in the Boyer-Moore string search algorithm used when regular
 * expression matching is turned off.
 */
typedef struct {
	long int	index[256];
	long int	length; /* of the search pattern */
	char	pattern[0];
} bm_search_t;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * messages
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static char *cant_get_line_no = 
	"Running out of memory! "
	"Not enough memory is left to calculate the line number";

static char *cant_goto_line_no = 
	"Running out of memory! "
	"Not enough memory is left to move to the line number";

static char *no_line_no = 
	"Line number to go to is missing or zero.";

static char *no_room_for_search_op = 
	"Running out of memory! "
	"Not enough memory is left to perform this search operation.";

static char *no_search_string = 
	"There is nothing in the search field.";

static char *no_selection_replace = 
	"No text selection is available "
	"to be copied into the replacement field.";

static char *no_selection_search = 
	"No text is available "
	"to be copied into the search field.";

static char *no_selection_to_replace = 
	"There is no selection in the text window to be replaced.";

static char *not_found = 
	"Search pattern \"%s\" not found.";

static char *re_error = 
	"Error in regular expression \"%s\": %s";

static char *line_no_too_big1 =
	"There is only 1 line in the file.";

static char *line_no_too_big =
	"There are only %ld lines in the file.";

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * static data
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	
static SearchData search_data;
/*
 * Forward declarations for callbacks etc.
 */
static void	search_backwards_cb(CALLBACK_ARGS),
		search_forwards_cb(CALLBACK_ARGS),
		search_set_cb(CALLBACK_ARGS),
		search_backwards_replace_cb(CALLBACK_ARGS),
		search_forwards_replace_cb(CALLBACK_ARGS),
		clear_search_cb(CALLBACK_ARGS),
		clear_replace_cb(CALLBACK_ARGS),
		replace_cb(CALLBACK_ARGS),
		replace_all_cb(CALLBACK_ARGS),
		replace_set_cb(CALLBACK_ARGS),
		replace_search_backwards_cb(CALLBACK_ARGS),
		replace_search_forwards_cb(CALLBACK_ARGS),
		line_no_set_cb(CALLBACK_ARGS),
		goto_line_no_cb(CALLBACK_ARGS),
		dismiss_cb(CALLBACK_ARGS),
		options_cb(CALLBACK_ARGS),
		help_cb(CALLBACK_ARGS);

static void line_no_set(SearchData*);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_search_tool: attach a search & replace tool to a text widget
 * This is long but only because it is repetitive.
 * The aim is a popup shell looking something like:
 *
 * | <= Search    |  <= & Replace | := Selection |
 * | Search =>    |  => & Replace | Clear        |
 * |   <text to search for >                     |
 * | Replace      |  Replace & <= | := Selection |
 * | Replace All  | Replace & =>  | Clear        |
 * |   <text to replace with >                   |
 * | Go to line:  | <line number> | := Cursor    |
 * -----------------------
 * | Dismiss    |  Options | Help  |
 *
 * Each `<...>' here is a text field
 * The `:= ...' push-buttons can be used to
 * include the selection from the text widget in the search and
 * replacement strings or to put the line number corresponding
 * to the insertion point in the line number string.
 * The other push-buttons actually initiate searches etc.
 * The options button pops up the options tool.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean add_search_tool(Widget text_w)
{
	NAT cbdata;
	Widget shell, paned, search_form, replace_form, line_no_form,
		action_form,
		search_backwards_btn,
		search_forwards_btn,
		search_set_btn,
		search_backwards_replace_btn,
		search_forwards_replace_btn,
		search_clear_btn,
		search_text,
		replace_btn,
		replace_all_btn,
		replace_set_btn,
		replace_search_backwards_btn,
		replace_search_forwards_btn,
		replace_clear_btn,
		replace_text,
		goto_line_no_btn,
		line_no_text,
		line_no_set_btn,
		dismiss_btn,
		options_btn,
		help_btn;

	char	*pattern;

	XmString s;
/*
 * The following are used to record what sashes in paned before the
 * replacement text pane is added. This then allows us to remove the unwanted
 * sash underneath the replacement text.
 */
	Widget	*children_before, *children;
	int	num_children_before, num_children, i, j;

	if((search_data.shell_w) != NULL) {
		XtManageChild(search_data.manager_w);
		XtPopup(search_data.shell_w, XtGrabNone);
		return True;
	}

	shell = XtVaCreatePopupShell("xpp-Search-and-Replace",
		transientShellWidgetClass, text_w,
		XmNdeleteResponse,		XmUNMAP,
		NULL); 
#ifdef EDITRES
	add_edit_res_handler(shell);
#endif
	common_dialog_setup(shell, dismiss_cb,  (XtPointer)(&search_data));
	paned = XtVaCreateWidget("search-replace-paned",
		xmPanedWindowWidgetClass, 	shell,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 1:
 * | <= Search    |  <= & Replace | := Selection |
 * | Search =>    |  => & Replace | Clear        |
 * |   <text to search for >                     |
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	search_form = XtVaCreateWidget("search-form",
		xmFormWidgetClass, 		paned,
		XmNfractionBase,		24,
		NULL);

	s = XmStringCreateSimple("<= Search");
	search_backwards_btn = XtVaCreateManagedWidget("backwards",
		xmPushButtonWidgetClass,	search_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		8,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_POSITION,
		XmNbottomPosition,		12,
		NULL);
	XmStringFree(s);

	s = XmStringCreateSimple("Search =>");
	search_forwards_btn = XtVaCreateManagedWidget("forwards",
		xmPushButtonWidgetClass,	search_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		8,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,			12,
		XmNbottomAttachment,		XmATTACH_FORM,
		NULL);
	XmStringFree(s);

	s = XmStringCreateSimple("<= & Replace");
	search_backwards_replace_btn = XtVaCreateManagedWidget("backwards-and-replace",
		xmPushButtonWidgetClass,	search_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		8,
		XmNrightPosition,		16,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_POSITION,
		XmNbottomPosition,		12,
		NULL);
	XmStringFree(s);

	s = XmStringCreateSimple("=> & Replace");
	search_forwards_replace_btn = XtVaCreateManagedWidget("forwards-and-replace",
		xmPushButtonWidgetClass,	search_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		8,
		XmNrightPosition,		16,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,			12,
		XmNbottomAttachment,		XmATTACH_FORM,
		NULL);
	XmStringFree(s);

	s = XmStringCreateSimple(":= Selection");
	search_set_btn = XtVaCreateManagedWidget("becomes-selection",
		xmPushButtonWidgetClass,	search_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		16,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_POSITION,
		XmNbottomPosition,		12,
		NULL);
	XmStringFree(s);

	s = XmStringCreateSimple("Clear");
	search_clear_btn = XtVaCreateManagedWidget("clear",
		xmPushButtonWidgetClass,	search_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		16,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,			12,
		XmNbottomAttachment,		XmATTACH_FORM,
		NULL);
	XmStringFree(s);

	search_text = XtVaCreateManagedWidget("search-text",
		xmTextWidgetClass,		paned,
		XmNeditMode,			XmMULTI_LINE_EDIT,
/*
		XmNrows,			2,
		XmNcolumns,			40,
*/
		NULL);

	XtAddCallback(search_text, XmNmodifyVerifyCallback, text_verify_cb, NULL);

	attach_rw_edit_popup(search_text);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 2:
 * | Replace      | Replace & <=  | := Selection |
 * | Replace All  | Replace & =>  | Clear        |
 * |   <text to replace with >                   |
 * **** **** **** **** **** **** **** **** **** **** **** **** */


	replace_form = XtVaCreateWidget("replace-form",
		xmFormWidgetClass, 		paned,
		XmNfractionBase,		24,
		NULL);

	s = XmStringCreateSimple("Replace");
	replace_btn = XtVaCreateManagedWidget("replace",
		xmPushButtonWidgetClass,	replace_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		8,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_POSITION,
		XmNbottomPosition,		12,
		NULL);
	XmStringFree(s);

	s = XmStringCreateSimple("Replace All");
	replace_all_btn = XtVaCreateManagedWidget("replace-all",
		xmPushButtonWidgetClass,	replace_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		8,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,			12,
		XmNbottomAttachment,		XmATTACH_FORM,
		NULL);
	XmStringFree(s);

	s = XmStringCreateSimple("Replace & <=");
	replace_search_backwards_btn = XtVaCreateManagedWidget("replace-and-backwards",
		xmPushButtonWidgetClass,	replace_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		8,
		XmNrightPosition,		16,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_POSITION,
		XmNbottomPosition,		12,
		NULL);
	XmStringFree(s);

	s = XmStringCreateSimple("Replace & =>");
	replace_search_forwards_btn = XtVaCreateManagedWidget("replace-and-forwards",
		xmPushButtonWidgetClass,	replace_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		8,
		XmNrightPosition,		16,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,			12,
		XmNbottomAttachment,		XmATTACH_FORM,
		NULL);
	XmStringFree(s);

	s = XmStringCreateSimple(":= Selection");
	replace_set_btn = XtVaCreateManagedWidget("becomes-selection",
		xmPushButtonWidgetClass,	replace_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		16,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_POSITION,
		XmNbottomPosition,		12,
		NULL);
	XmStringFree(s);

	s = XmStringCreateSimple("Clear");
	replace_clear_btn = XtVaCreateManagedWidget("clear",
		xmPushButtonWidgetClass,	replace_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		16,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,			12,
		XmNbottomAttachment,		XmATTACH_FORM,
		NULL);
	XmStringFree(s);

/*
 * Now take a snapshot of the children before creating the replacement text widget.
 */
	XtVaGetValues(paned,
		XmNchildren,		&children,
		XmNnumChildren,		&num_children_before,
		NULL);
	children_before = (Widget*) XtMalloc(num_children_before * sizeof(Widget));
	for(i = 0; i < num_children_before; ++i) {
		children_before[i] = children[i];
	}

	replace_text = XtVaCreateManagedWidget("replace",
		xmTextWidgetClass,		paned,
		XmNeditMode,			XmMULTI_LINE_EDIT,
/*
		XmNrows,			2,
		XmNcolumns,			40,
*/
		NULL);

	XtAddCallback(replace_text, XmNmodifyVerifyCallback, text_verify_cb, NULL);

	attach_rw_edit_popup(replace_text);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 4:
 * | Go to line:  | <line number> | := Cursor    |
 *
 * Do the line number first so that the buttons can be lined up with it.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	line_no_form = XtVaCreateWidget("line-number-form",
		xmFormWidgetClass, 		paned,
		XmNfractionBase,		24,
		NULL);

	line_no_text = XtVaCreateManagedWidget("line-number",
		xmTextWidgetClass,		line_no_form,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftPosition,		8,
		XmNrightPosition,		16,
		XmNcolumns,			8,
		NULL);

	attach_rw_edit_popup(line_no_text);

	s = XmStringCreateSimple("Go to line:");
	goto_line_no_btn = XtVaCreateManagedWidget("go-to-line",
		xmPushButtonWidgetClass,	line_no_form,
		XmNlabelString,		s,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNbottomAttachment,		XmATTACH_OPPOSITE_WIDGET,
		XmNbottomWidget,		line_no_text,
		XmNrightPosition,		8,
		NULL);
	XmStringFree(s);

	s = XmStringCreateSimple(":= Cursor");
	line_no_set_btn = XtVaCreateManagedWidget("becomes-cursor",
		xmPushButtonWidgetClass,	line_no_form,
		XmNlabelString,		s,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_OPPOSITE_WIDGET,
		XmNbottomWidget,		line_no_text,
		XmNleftPosition,		16,
		NULL);
	XmStringFree(s);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 5:
 * -----------------------
 * | Dismiss    |  Options | Help  |
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	action_form = XtVaCreateWidget("search-replace-action-form",
		xmFormWidgetClass, 		paned,
		XmNfractionBase,		24,
		NULL);

	s = XmStringCreateSimple("Dismiss");
	dismiss_btn = XtVaCreateManagedWidget("dismiss",
		xmPushButtonWidgetClass,	action_form,
		XmNlabelString,		s,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		1,
		XmNrightPosition,		7,
		NULL);
	XmStringFree(s);

	s = XmStringCreateSimple("Options");
	options_btn = XtVaCreateManagedWidget("options",
		xmPushButtonWidgetClass,	action_form,
		XmNlabelString,		s,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		9,
		XmNrightPosition,		15,
		NULL);
	XmStringFree(s);


	s = XmStringCreateSimple("Help");
	help_btn = XtVaCreateManagedWidget("help",
		xmPushButtonWidgetClass,	action_form,
		XmNlabelString,		s,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		17,
		XmNrightPosition,		23,
		NULL);
	XmStringFree(s);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up static data to contain necessary widget handles:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	search_data.text_w = text_w;
	search_data.shell_w = shell;
	search_data.manager_w = paned;
	search_data.search_w = search_text;
	search_data.replace_w = replace_text;
	search_data.line_no_w = line_no_text;
	search_data.default_focus_w = search_forwards_btn;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up the text windows in the search dialog as selection sources
 * and palette clients. (This sounds silly but is intuitively right for
 * the line number widget - if focus is in the line number pushing
 * a palette button will cause a blink or a bleat and then send focus
 * back to the line number).
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	register_selection_source(search_text);
	register_palette_client(search_text);
	register_selection_source(replace_text);
	register_palette_client(replace_text);
	register_selection_source(line_no_text);
	register_palette_client(line_no_text);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add callbacks
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtAddCallback(search_backwards_btn, XmNactivateCallback,
		search_backwards_cb, (XtPointer)(&search_data));

	XtAddCallback(search_forwards_btn, XmNactivateCallback,
		search_forwards_cb, (XtPointer)(&search_data));

	XtAddCallback(search_set_btn, XmNactivateCallback,
		search_set_cb, (XtPointer)(&search_data));

	XtAddCallback(search_backwards_replace_btn, XmNactivateCallback,
		search_backwards_replace_cb, (XtPointer)(&search_data));

	XtAddCallback(search_forwards_replace_btn, XmNactivateCallback,
		search_forwards_replace_cb, (XtPointer)(&search_data));

	XtAddCallback(search_clear_btn, XmNactivateCallback,
		clear_search_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_btn, XmNactivateCallback,
		replace_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_all_btn, XmNactivateCallback,
		replace_all_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_set_btn, XmNactivateCallback,
		replace_set_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_search_backwards_btn, XmNactivateCallback,
		replace_search_backwards_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_search_forwards_btn, XmNactivateCallback,
		replace_search_forwards_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_clear_btn, XmNactivateCallback,
		clear_replace_cb, (XtPointer)(&search_data));

	XtAddCallback(goto_line_no_btn, XmNactivateCallback,
		goto_line_no_cb, (XtPointer)(&search_data));

	XtAddCallback(line_no_text, XmNmodifyVerifyCallback,
		(XtCallbackProc)number_verify_cb, (XtPointer)NULL);

	XtAddCallback(line_no_text, XmNactivateCallback,
		goto_line_no_cb, (XtPointer)(&search_data));

	XtAddCallback(line_no_set_btn, XmNactivateCallback,
		line_no_set_cb, (XtPointer)(&search_data));

	XtAddCallback(dismiss_btn, XmNactivateCallback,
		dismiss_cb, (XtPointer)(&search_data));

	XtAddCallback(options_btn, XmNactivateCallback,
		options_cb, (XtPointer)(&search_data));

	XtAddCallback(help_btn, XmNactivateCallback,
		help_cb, (XtPointer)NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Initialise search string and line number:
 * Don't use callback for search string, since there
 * may not be a selection and don't want error message.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	if(pattern = XmTextGetSelection(text_w)) {
		XmTextSetString(search_text, pattern);
		XmTextShowPosition(search_text, strlen(pattern));
		XtFree(pattern);
	}

	line_no_set(&search_data);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 *set up text widget translations
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtOverrideTranslations(search_text, text_translations);
	XtOverrideTranslations(replace_text, text_translations);
	XtOverrideTranslations(line_no_text, text_translations);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Make return in the line number text widget activate it
 **** **** **** **** **** **** **** **** **** **** **** **** */

	XtOverrideTranslations(line_no_text,
		XtParseTranslationTable("<Key>Return: activate()"));

/* **** **** **** **** **** **** **** **** **** **** **** ****
 *set up text widget fonts
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	copy_font_list(search_text, text_w);
	copy_font_list(replace_text, text_w);
	copy_font_list(line_no_text, text_w);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Manage everything:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtManageChild(search_form);
	XtManageChild(replace_form);
	XtManageChild(line_no_form);
	XtManageChild(action_form);
	XtManageChild(paned);

	XtPopup(shell, XtGrabNone);

	fix_pane_height(search_form, search_form);
	fix_pane_height(replace_form, replace_form);
	fix_pane_height(line_no_form, line_no_form);
	fix_pane_height(action_form, action_form);
/*
 * Now remove any sashes introduced while or since the replacement text pane
 * was added.
 */	XtVaGetValues(paned,
		XmNchildren,		&children,
		XmNnumChildren,		&num_children,
		NULL);

	for(i = 0; i < num_children; ++i) {
		if(!strcmp(XtName(children[i]), "Sash")) {
			Boolean unwanted = True;
			for(j = 0; j < num_children_before; ++j) {
				if(children[i] == children_before[j]) {
					unwanted = False;
					break;
				}
			}
			if(unwanted) {
				XtVaSetValues(children[i],
					XmNheight,	1,
					XmNwidth,	1,
					XmNsensitive,	False,
					NULL);
			}
		}
	}
	XtFree((char*)children_before);

	XmProcessTraversal(search_forwards_btn, XmTRAVERSE_CURRENT);

	return True;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * dismiss callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void dismiss_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	XmProcessTraversal(cbdata->default_focus_w, XmTRAVERSE_CURRENT);
	XtPopdown(cbdata->shell_w);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * options callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void options_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	add_options_tool();
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * help callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void help_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	help_dialog(root, Help_Search_and_Replace_Tool);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search forwards callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean search_either(Widget,SearchData*,NAT);
static void search_forwards_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	cbdata->default_focus_w = w;
	CHECK_MAP_STATE(cbdata)
	(void) search_either(w, cbdata, FORWARDS);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search backwards callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void search_backwards_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	cbdata->default_focus_w = w;
	CHECK_MAP_STATE(cbdata)
	(void) search_either(w, cbdata, BACKWARDS);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Support for search callbacks.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Substring search_string(char*,char*,long int,NAT);
static Boolean report_re_error(Widget, char*);
static Boolean search_either(
	Widget				w,
	SearchData			*cbdata,
	NAT				dir)
{
	Substring ss;
	NAT start_point;
	char *pattern, *text_buf;
	Boolean result;
	XmTextPosition pl, pr;
	pattern = XmTextGetString(search_data.search_w);
	text_buf = XmTextGetString(search_data.text_w);
	if(XmTextGetSelectionPosition(search_data.text_w, &pl, &pr)) {
		start_point = (dir == FORWARDS ? pr : pl);
	} else {
		start_point = XmTextGetInsertionPosition(search_data.text_w);
	}
	if(*pattern) {
		ss = search_string(pattern, text_buf, start_point, dir);
	} else { /* bypass the much slower detection of this case by re_search_exec */
		ss.offset = -1;
	}
	if(ss.offset >= 0) {
		text_show_position(
			search_data.text_w,
			ss.offset);
		XmTextSetSelection(
			search_data.text_w,
			ss.offset,
			ss.offset + ss.length,
			CurrentTime);
		result = True;
	} else if (!(*pattern)){
		ok_dialog(search_data.shell_w, no_search_string);
		result = False;
	} else if(!report_re_error(search_data.shell_w, pattern)) {
		char *msg_buf = XtMalloc(strlen(pattern) +
					strlen(not_found) + 1);
		sprintf(msg_buf, not_found, pattern);
		ok_dialog(search_data.shell_w, msg_buf);
		XtFree(msg_buf);
		result = False;
	}
	XtFree(pattern);
	XtFree(text_buf);
	return result;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replace callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean replace_selection(Widget,SearchData*);
static void replace_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	cbdata->default_focus_w = w;
	CHECK_MAP_STATE(cbdata)
	(void) replace_selection(w, cbdata);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * support for replace callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static long int re_replacement_text(char*, char*,Substring*,char*);
static Boolean replace_selection(
	Widget				w,
	SearchData			*cbdata)
{
	XmTextPosition left, right;
	char *replacement, *rep_pattern;
	if(XmTextGetSelectionPosition(cbdata->text_w, &left, &right)
		&& left != right ) {
		rep_pattern  = XmTextGetString(cbdata->replace_w);
		if(!global_options.use_reg_exps) {
			replacement = rep_pattern;
		} else {
			long int text_len =right - left, rep_len;
			char *text_buf = XtMalloc(text_len+1), *rep_buf;
			Substring ss;
			if(	text_buf == 0 
			||	XmTextGetSubstring(cbdata->text_w, left, text_len,
					text_len + 1, text_buf)
					== XmCOPY_FAILED ) {
				XtFree(rep_pattern);
				if(text_buf != 0) {
					XtFree(text_buf);
				}
				ok_dialog( cbdata->shell_w,
					no_room_for_search_op);
				return False;
			}
			ss.offset = 0;
			ss.length = text_len;
			rep_len = re_replacement_text(rep_pattern,
					text_buf, &ss, 0);
			rep_buf = XtMalloc(rep_len + 1);
			if(rep_buf == 0) {
				XtFree(rep_pattern);
				if(text_buf != 0) {
					XtFree(text_buf);
				}
				ok_dialog( cbdata->shell_w,
					no_room_for_search_op);
				return False;
			}
			(void) re_replacement_text(rep_pattern, text_buf, &ss, rep_buf);
			rep_buf[rep_len] = '\0';
			XtFree(rep_pattern);
			XtFree(text_buf);
			replacement  = rep_buf;
		}
		text_show_position(cbdata->text_w, left);
		XmTextReplace(
			cbdata->text_w,
 			left,
			right,
			replacement);
		XmTextSetSelection(
			cbdata->text_w,
			left,
			left + strlen(replacement),
			CurrentTime);
		XtFree(replacement);
		return True;
	} else {
		ok_dialog(cbdata->shell_w, no_selection_to_replace);
		return False;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replace all callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void replace_all(char*,char*,char*,char**,NAT*);
static void replace_all_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	Substring ss;
	NAT start_point;
	char *pattern, *text_buf, *replacement, *all_replaced;
	cbdata->default_focus_w = w;
	CHECK_MAP_STATE(cbdata)
	pattern = XmTextGetString(cbdata->search_w);
	text_buf = XmTextGetString(cbdata->text_w);
	start_point = XmTextGetInsertionPosition(cbdata->text_w);
	if(*pattern) {
		ss = search_string(pattern, text_buf, start_point, FORWARDS);
	} else { /* bypass the much slower detection of this case by re_search_exec */
		ss.offset = -1;
	}
	if(ss.offset >= 0) {
		replacement = XmTextGetString(
				cbdata->replace_w);
		replace_all(
			pattern,
			text_buf,
			replacement,
			&all_replaced,
			&start_point);
		if(all_replaced == NULL) {
			ok_dialog(
				cbdata->shell_w,
				no_room_for_search_op);
			XtFree(replacement);
		} else {
			XmTextReplace(
				cbdata->text_w,
				0,
				XmTextGetLastPosition(
					cbdata->text_w),
				all_replaced);
			XmTextSetTopCharacter(cbdata->text_w, 0);
			text_show_position(
				cbdata->text_w,
				start_point);
			XmTextSetInsertionPosition(
				cbdata->text_w,
				start_point);
			XtFree(replacement);
			XtFree(all_replaced);
		}
	} else if (!(*pattern)){
		ok_dialog(cbdata->shell_w, no_search_string);
	} else if (!report_re_error(search_data.shell_w, pattern)) {
		char *msg_buf = XtMalloc(strlen(pattern) +
					strlen(not_found) + 1);
		sprintf(msg_buf, not_found, pattern);
		ok_dialog(cbdata->shell_w, msg_buf);
		XtFree(msg_buf);
	}
	XtFree(pattern);
	XtFree(text_buf);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search backwards & replace callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void search_backwards_replace_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	cbdata->default_focus_w = w;
	CHECK_MAP_STATE(cbdata)
	if(search_either(w, cbdata, BACKWARDS)) {
		(void) replace_selection(w, cbdata);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search forwards & replace callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void search_forwards_replace_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	cbdata->default_focus_w = w;
	CHECK_MAP_STATE(cbdata)
	if(search_either(w, cbdata, FORWARDS)) {
		(void) replace_selection(w, cbdata);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replace & search backwards callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void replace_search_backwards_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	cbdata->default_focus_w = w;
	CHECK_MAP_STATE(cbdata)
	if(replace_selection(w, cbdata)) {
		(void) search_either(w, cbdata, BACKWARDS);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replace & search forwards callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void replace_search_forwards_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	cbdata->default_focus_w = w;
	CHECK_MAP_STATE(cbdata)
	if(replace_selection(w, cbdata)) {
		(void) search_either(w, cbdata, FORWARDS);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search field setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void search_set_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	char *sel;
	cbdata->default_focus_w = w;
	if ((sel = get_selection(cbdata->shell_w, no_selection_search)) == NULL) {
		return;
	}
	XmTextSetString(cbdata->search_w, sel);
	XtFree(sel);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replacement field setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void replace_set_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	char *sel;
	cbdata->default_focus_w = w;
	if ((sel = get_selection(cbdata->shell_w, no_selection_replace)) == NULL) {
		return;
	}
	XmTextSetString(cbdata->replace_w, sel);
	XtFree(sel);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search field clear callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void clear_search_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	cbdata->default_focus_w = w;
	XmTextSetString(cbdata->search_w, "");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search field clear callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void clear_replace_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	cbdata->default_focus_w = w;
	XmTextSetString(cbdata->replace_w, "");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * line number setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void line_no_set_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	cbdata->default_focus_w = w;
	line_no_set(cbdata);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * go to line number callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void line_no_to_offset(Widget,NAT,long int*,long int*);
static void goto_line_no_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	long int left, right;
	long int line_no = 0;
	short nrows;
	int scroll;
	char *line_no_string;
	cbdata->default_focus_w = w;
	CHECK_MAP_STATE(cbdata)

	line_no_string = XmTextGetString(cbdata->line_no_w);

	sscanf(line_no_string, "%ld", &line_no);

	if(line_no <= 0) {
		ok_dialog(cbdata->shell_w, no_line_no);
		XtFree(line_no_string);
		return;
	}

	line_no_to_offset(cbdata->text_w, line_no, &left, &right);
	if(left == NO_MEMORY) {
		ok_dialog(cbdata->shell_w, cant_goto_line_no);
	} else if (left < 0) {
		long int lines = -left -1;
		if(lines != 1) {
			char buf[200];
			sprintf(buf, line_no_too_big, lines);
			ok_dialog(cbdata->shell_w, buf);
		} else {
			ok_dialog(cbdata->shell_w, line_no_too_big1);
		}
	} else {
		XmTextSetTopCharacter(cbdata->text_w, left);
		XtVaGetValues(cbdata->text_w, XmNrows, &nrows, NULL);
		if(line_no > (scroll = nrows / 2)) {
			XmTextScroll(cbdata->text_w, -scroll);
		}
		XmTextSetSelection(cbdata->text_w,
				left, right, CurrentTime);
	}
	XtFree(line_no_string);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * actually doing the work:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
/*
 * Pre-processing for the Boyer-Moore search algorithm.
 * The memory allocation here is relying on long int being
 * at least as aligned as char.
 */

static bm_search_t *bm_search_comp(char *pattern)
{
	long int len = strlen(pattern);
	int i;
	bm_search_t *bm;
	bm = (bm_search_t *) XtMalloc(sizeof(bm_search_t) + len + 1);
	if(bm == 0) { /* malloc failed */
		return bm;
	}
	strcpy(&(bm->pattern)[0], pattern);
	if(global_options.ignore_case) {
		for(i = 0; i < len; ++i) {
			(bm->pattern)[i]= toupper((bm->pattern)[i]);
		}
	}
	for(i = 0; i < 256; ++i) {
		(bm->index)[i] = -1;
	}
	for(i = len - 1; i >= 0; --i) {
		if( (bm->index)[(bm->pattern)[i]] == -1 ) {
			(bm->index)[(bm->pattern)[i]] = i;
		}
	}
	bm->length = len;
	return bm;
}
/*
 * The Boyer-Moore search algorithm:
 */
static Substring bm_search_exec(bm_search_t *bm, char *text)
{
	int cursor, i, next;
	Substring result;
	result.offset = -1; /* assume no match until we get one */
	if(bm->length == 0) {
		return result;
	}
	cursor = 0;
	i = bm->length - 1;
	while(i >= 0 && text[cursor]) {
		char ch = global_options.ignore_case ? toupper(text[cursor+i]) : text[cursor+i];
		if(ch == (bm->pattern)[i]) { /* possible match at cursor */
			i -= 1;
		} else { /* no match at cursor; slide up according to index value: */
			next = cursor + i - (bm->index)[ch];
			cursor += 1;
			while(text[cursor] && cursor < next) {
				cursor += 1;
			}
			i = bm->length - 1;
		}
	}
	if(i < 0) { /* match at cursor */
		result.offset = cursor;
		result.length = bm->length;
	}
	return result;
}
/*
 * Pre-processing for regular expression searching.
 * The regular expression could contain a syntax error in which case
 * re_error_text will point to a malloc-ed buffer containing the
 * error message text from regerror and the returned regex_t * will
 * be 0. Someone up the calling chain
 * is expected to call re_report_error (see below) to check for
 * this and report the error (and free re_error_text).
 */
static char *re_error_text = 0;
static regex_t *re_search_comp(char *pattern)
{
	static regex_t preg;
	int cflags = REG_EXTENDED | REG_NEWLINE;
	int error_code;
	if(global_options.ignore_case) {
		cflags |= REG_ICASE;
	}
	error_code = regcomp(&preg, pattern, cflags);
	if(error_code == 0) {
		return &preg;
	} else {
		char *errbuf;
		int errbufsize = regerror(error_code, &preg, 0, 0);
		errbuf = XtMalloc(errbufsize);
		if(errbuf == 0) {
			ok_dialog(root, no_room_for_search_op);
		} else {
			(void) regerror(error_code, &preg, errbuf, errbufsize);
			re_error_text = errbuf;
		}
		return 0;
	}
}
#ifdef SLOWREGEXEC
/*
 * Some implementations of regexec call strlen on the text: if the
 * text has length N, say, this introduces an O(N) overhead that can
 * make replace-all operations into an N^2*K operation (where K is some
 * factor dependent on the average length of the matches and on the
 * complexity of the regular expression. To workaround this, we use
 * a "double-and-conquer" approach that makes the cost N*K.
 */
int fast_regexec(
	const regex_t *preg,
	char *string,
	size_t nmatch,
	regmatch_t pmatch[],
	int eflags)
{
	char *q, overwritten;
	int curr_chunk, error_code;
	Boolean matched;
	q = string;
	overwritten = *q;
	matched = False;
	for(	curr_chunk = INITCHUNK;
		!matched && overwritten != '\0';
		curr_chunk *= 2) {
		*q = overwritten;
		while(*q && q - string < curr_chunk) {
			q += 1;
		}
		overwritten = *q;
		*q = '\0';
		error_code = regexec(preg, string, 1, pmatch, eflags);
		if(error_code == 0) {
			matched = pmatch[0].rm_eo < q - string;
		} else {
			matched = False;
		}
	}
	*q = overwritten;
	return error_code;
}
#endif
/*
 * The regular expression search algorithm.
 * The while loop is looking for a non-empty match.
 */
static Substring re_search_exec(regex_t *preg, char *text, Boolean bol)
{
	Substring result;
	regmatch_t pmatch[1];
	int eflags = bol ? 0 : REG_NOTBOL;
	int error_code;
	char *p;
	result.offset = -1; /* assume no match until we get one */
	p = text;
	while(*p) {
		error_code = REGEXEC(preg, p, 1, pmatch, eflags);
		if(error_code == 0) {
			result.length = pmatch[0].rm_eo - pmatch[0].rm_so;
			if(result.length != 0) {
				result.offset = pmatch[0].rm_so + (p - text);
				break;
			} else { /* found only 0-length match, go round again: */
				p += pmatch[0].rm_so;
				if(!*p) {
					break;
				}/* else */
				p += 1;
				eflags = *(p-1) == '\n' ? 0 : REG_NOTBOL;
			}
		} else {
			break;
		}
	}
	return result;
}
/*
 * Error reporting for regular expression searching:
 */
static Boolean report_re_error(Widget shell_w, char *pattern)
{
	if(re_error_text == 0) {
		return False;
	} else {
		char *msg_buf = XtMalloc(strlen(re_error) +
					strlen(pattern) +
					strlen(re_error_text) + 1);
		sprintf(msg_buf, re_error, pattern, re_error_text);
		ok_dialog(shell_w, msg_buf);
		XtFree(msg_buf);
		XtFree(re_error_text);
		re_error_text = 0;
		return True;
	}	
}

/*
 * Calculating replacement for regular expression searching.
 * If buf is 0 it just returns the length of the
 * the replacement string (without a null-terminator). If  buf is not 0 the replacement
 * string is copied into it (not null-terminated).
 */
static long int re_replacement_text(
	char		*rep_pattern,
	char		*text,
	Substring		*match,
	char		*buf)
{
	char	*p, *q;
	Boolean	escaped = False;
	long int result;
	for(p = rep_pattern, q = buf, result = 0; *p; p += 1) {
		if(!escaped) {
			if(*p == '\\') { /* backslash - escape */
				escaped = True;
			} else if (*p == '&') { /*ampersand - insert copy of match */
				result += match->length;
				if(buf) {
					strncpy(q, text + match->offset, match->length);
					q += match->length;
				}
			} else { /* anything else - just copy */
				result += 1;
				if(buf) {
					*q++ = *p;
				}
			}
		} else { /* anything escaped - just copy */
			result += 1;
			if(buf) {
				*q++ = *p;
			}
			escaped = False;
		}
	}
	if(escaped) { /* ends in unescaped backslash - treat as backslash */
		result += 1;
		if(buf) {
			*q++ = '\\';
		}
	}
	return result;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search_forwards: search a substring matching a pattern
 * in a string starting at a given offset. If pattern is 0, then use the pattern
 * from the previous call, if any.  If the text to be
 * searched is 0, just set up static data for future use.
 * If both pattern and text are 0, reset static data and free any malloced space;
 * Make sure to reset before returning control to the user, else they might
 * change the value of global_options.use_reg_exps or global_options.ignore_case.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Substring search_forwards(
	char		*pattern,
	char		*text,
	long int		offset)
{
	static void  *last_comp = 0;
	void * comp;
	Substring result;
	if(pattern == 0) {
		comp = last_comp;
	} else {
		if(last_comp != 0) {
			if(global_options.use_reg_exps) {
				regfree((regex_t *)comp);
			} else {
	 			XtFree((char*)last_comp);
			}
		}
		if (global_options.use_reg_exps) {
			comp = re_search_comp(pattern);
		} else {
			comp = bm_search_comp(pattern);
		}
		last_comp = comp;
	}
	if(pattern == 0 && text == 0) {
		if(last_comp != 0) {
			if(global_options.use_reg_exps) {
				regfree((regex_t *)comp);
			} else {
	 			XtFree((char*)last_comp);
			}
		}
		result.offset = -1;
		last_comp = 0;
	} else if (text == 0 || comp == 0) { /* this is were syntax errors in reg. exps. show up */
		result.offset = -1;
	} else {
		if(global_options.use_reg_exps) {
			result = re_search_exec(comp, text + offset,
				offset == 0 || text[offset-1] == '\n');
		} else {
			result = bm_search_exec(comp, text + offset);
		}
	}
	return result;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search_string is the search function that can search cyclically in both directions.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static Substring search_string(
	char		*pattern,
	char		*text_buf,
	long int 	start_point,
	NAT		direction)
{
	Substring ss;
	if(direction == FORWARDS) {
		ss = search_forwards(pattern, text_buf, start_point);
		if(ss.offset < 0) {
			ss = search_forwards(0, text_buf, 0);
		} else {
			ss.offset += start_point;
		}
	} else { /* Do binary chop to search backwards: */
		int upb, i;
		Substring t;
		ss = search_forwards(pattern, text_buf, 0);
		if(ss.offset >=  0) {
			if(ss.offset < start_point) {
				upb = start_point;
			} else {
				upb = strlen(text_buf);
			}
			for(i = (upb - ss.offset) / 2; i > 0; i = (upb - ss.offset) / 2) {
				t = search_forwards(0, text_buf, ss.offset + i);
				if(t.offset >= 0 && t.offset + ss.offset + i <  upb) {
					ss.offset = t.offset + ss.offset + i;
					ss.length = t.length;
				} else {
					upb = ss.offset + i;
				}
			}
		}
	}
	search_forwards(0, 0, 0);
	return ss;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replace_all does the text processing part of the global search
 * and replace function
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void replace_all(
	char	*pattern,
	char	*text_buf,
	char	*rep_pattern,
	char	**result,
	NAT	*start_point)
{
	long int text_buf_len, rep_pattern_len, rep_len, extra;
	Substring ss;
	char	*p, *q, *next_p, *sp;
	text_buf_len = strlen(text_buf);
	rep_pattern_len = strlen(rep_pattern);

	p = text_buf;
	extra = 0;
	(void) search_forwards(pattern, 0, 0);
	while(*p) {
		ss = search_forwards(0, text_buf, p - text_buf);
		if(ss.offset >= 0) {
			if(global_options.use_reg_exps) {
				rep_len = re_replacement_text(rep_pattern, p, &ss, 0);
				extra += rep_len - ss.length;
			} else {
				extra += rep_pattern_len - ss.length;
			}
			p += ss.offset + ss.length;
		} else {
			break;
		}
	}
	if((*result = XtMalloc(text_buf_len + extra + 1)) == NULL) {
		search_forwards(0, 0, 0); /* it _might_ help! */
		return;
	}
	p = text_buf;
	q = *result;
	sp = q + *start_point;
	while(*p) {
		ss = search_forwards(0, text_buf, p - text_buf);
		if(ss.offset >= 0) {
			strncpy(q, p, ss.offset);
			if(global_options.use_reg_exps) {
				rep_len = re_replacement_text(rep_pattern, p, &ss, q+ss.offset);
			} else {
				strncpy(q + ss.offset, rep_pattern, rep_pattern_len);
				rep_len = rep_pattern_len;
			}
			next_p = p + ss.offset + ss.length;
			if(next_p - text_buf <= *start_point) {
				sp += rep_len - ss.length;
			} else if (p + ss.offset - text_buf <= *start_point) {
				sp = q + ss.offset;
			}
			p = next_p;
			q += ss.offset + rep_len;
		} else {
			strcpy(q, p);
			q += strlen(p);
			break;
		}
	}
	*q = '\0'; /* in case last match reached to end of text_buf */
	*start_point = sp - *result;
	search_forwards(0, 0, 0);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * get_line_no returns the line number of the insertion position
 * in the text widget passed as an argument. It returns -1
 * if something went wrong (e.g., because we're in a multi-byte locale).
. * **** **** **** **** **** **** **** **** **** **** **** **** */
long int get_line_no(Widget text_w)
{
	XmTextPosition ins_pos, cur_pos;
	char data[BUFSIZ+1], *p;
	long int line_ct;
	ins_pos = XmTextGetInsertionPosition(text_w);
	for(cur_pos = 0, line_ct = 1; cur_pos <= ins_pos; cur_pos += BUFSIZ) {
		if(XmTextGetSubstring(text_w, cur_pos, BUFSIZ, BUFSIZ + 1, data)
				== XmCOPY_FAILED ) {
			return -1;
		}
		for(p = data; p - data + cur_pos < ins_pos && *p; ++p) {
			if(*p == '\n') {
				++line_ct;
			}
		}
	}
	return line_ct;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * line_no_to_offset returns the character offset of the 
 * first and last characters of a given line in a text widget.
 * first is set to  -(nlines + 1), where nlines is the total number
 * of line in the file if number out of range.
 * first is set to NO_MEMORY if not enough memory to do the job.
 * last is unchanged in these two error cases.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void line_no_to_offset(
	Widget		text_w,
	NAT		line_no,
	long int	*first,
	long int	*last)
{
	char *data, *p;
	long int line_ct;

	if((data = XmTextGetString(text_w)) == NULL) {
		*first = NO_MEMORY;
		return;
	}
	for(p = data, line_ct = line_no - 1; *p && line_ct; ++p) {
		if(*p == '\n' && *(p + 1)) {
			--line_ct;
		}
	}
	if(line_ct == 0) {
		*first = p - data;
		*last = *first;
		while(*p && *p != '\n') {
			++*last;
			++p;
		}
	} else {
		*first = -(line_no - line_ct + 1);
	}
	XtFree(data);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Support for line number setting callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void line_no_set(SearchData *cbdata)
{
	char line_no_string[16];
	long int line_no;
	if((line_no = get_line_no(cbdata->text_w)) <= 0) {
		ok_dialog(cbdata->shell_w, cant_get_line_no);
		return;
	}
	sprintf(line_no_string, "%ld", get_line_no(cbdata->text_w));
	XmTextSetString(cbdata->line_no_w, line_no_string);
}



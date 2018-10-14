
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: search.c,v 2.78 2012/12/11 12:00:25 rda Exp rda $
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
#include <stdlib.h>
#include <ctype.h>
#include <sys/types.h>
#include <regex.h>
#include <wctype.h>

#include "xpp.h"

#define INITCHUNK 4
#define REGEXEC my_regwexec
/* If we don't have REG_INVARG use the glibc non-standard error code instead */
#ifndef REG_INVARG
#define REG_INVARG REG_EEND
#endif

/*
 * The number of submatches that we record when we do RE matching.
 * Includes the overall match \0 and 9 proper submatches \1 .. \9
 */
#define NSUBMATCHES 10

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * typedefs
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/*
 * The following struct includes most of the data needed by the
 * search and replace operations.
 *  * the widgets involved
 *  * flags
 *  * saved results from the last search (an array of submatch strings)
 *  * status of those results (never initialised, good, or stale, i.e.
 *  * something else has changed the selection since the last search.
 */
typedef enum {SM_UNITIALISED, SM_GOOD, SM_STALE} SubmatchStatus;
typedef struct {
	Widget	text_w,
			shell_w,
			manager_w,
			search_w,
			replace_w;
	Boolean 	ignore_case, use_wildcards;
	wchar_t		*submatches[NSUBMATCHES];
	SubmatchStatus	submatch_status;
} SearchData;
/*
 * The following represents a substring of a wide character string, e.g.,
 * for use in representing the result of a search operation.
 * Use offset = -1 to represent "no such substring".
 */
typedef struct {
	long int	offset;
	long int	length;
} Substring;
/*
 * The following type represents the results of "compiling" a search pattern
 * for use in the simple wide character string search algorithm used
 * when regular expression matching is turned off.
 */
typedef struct {
	int	length;
	wchar_t	pattern[0];
} simple_search_t;

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * messages
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static char *no_room_for_search_op =
	"Running out of memory! "
	"Not enough memory is left to perform this search operation.";

static char *no_search_string =
	"There is nothing in the search field.";

static char *no_selection_replace =
	"No text selection is available "
	"to be copied into the replacement field.";

static char *no_selection_search =
	"No text selection is available "
	"to be copied into the search field.";

static char *no_selection_to_replace =
	"There is no selection in the text window to be replaced.";

static char *not_found =
	"Search pattern not found.";

static char *re_error =
	"Error in search pattern: %s";

static char *submatch_stale =
	"The selection may have changed since the last search.\n"
	"Do you wish to continue?";

static char *submatch_unitialised =
	"You have not yet done a search so the replacement "
	"registers are empty.\n"
	"Do you wish to continue?";

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * static data: this is what would need to be encapsulated to
 * have separate search tools attached to separate text widgets.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	
static SearchData search_data;

/*
 * Forward declarations for callbacks etc.
 */
static void	toggle_button_cb(CALLBACK_ARGS),
		search_backwards_cb(CALLBACK_ARGS),
		search_forwards_cb(CALLBACK_ARGS),
		search_set_cb(CALLBACK_ARGS),
		empty_search_cb(CALLBACK_ARGS),
		empty_replace_cb(CALLBACK_ARGS),
		replace_cb(CALLBACK_ARGS),
		replace_all_cb(CALLBACK_ARGS),
		replace_set_cb(CALLBACK_ARGS),
		replace_search_backwards_cb(CALLBACK_ARGS),
		replace_search_forwards_cb(CALLBACK_ARGS),
		submatch_status_cb(CALLBACK_ARGS);

/*
 * Popup menu for the search, replace and line number text widgets:
 */
#define TEXT_EDIT_OPS 4		/* including the separator */
#define TEXT_SPECIAL_OPS 2
static MenuItem search_text_edit_menu_items[] = {
    { "Cut", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_cut_cb, NULL, (MenuItem *)NULL, False },
    { "Copy", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_copy_cb, NULL, (MenuItem *)NULL, False },
    { "Paste", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_paste_cb, NULL, (MenuItem *)NULL, False },
    MENU_ITEM_SEPARATOR,
    { ":= Selection", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        search_set_cb, NULL, (MenuItem *)NULL, False },
    { "Empty", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        empty_search_cb, NULL, (MenuItem *)NULL, False },
    {NULL}
};

static MenuItem replace_text_edit_menu_items[] = {
    { "Cut", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_cut_cb, NULL, (MenuItem *)NULL, False },
    { "Copy", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_copy_cb, NULL, (MenuItem *)NULL, False },
    { "Paste", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        edit_paste_cb, NULL, (MenuItem *)NULL, False },
    MENU_ITEM_SEPARATOR,
    { ":= Selection", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        replace_set_cb, NULL, (MenuItem *)NULL, False },
    { "Empty", &xmPushButtonGadgetClass, '\0', NULL, NULL,
        empty_replace_cb, NULL, (MenuItem *)NULL, False },
    {NULL}
};

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_search_tool: attach a search & replace tool to a text widget
 * This is long but only because it is repetitive.
 * The aim is a popup shell looking something like:
 *
 * | <= Search    Search =>        |
 * |-------------------------------|
 * |   <text to search for >       |
 * |-----------------------------+-|
 * | Replace      |  Replace All   |
 * | Replace & <= | Replace & =>   |
 * |-------------------------------|
 * |   <text to replace with >     |
 * |-------------------------------|
 * | * Ignore case * Use wildcards |
 * | Dismiss     | Help            |
 *
 * Each `<...>' here is a text field
 * The '*'s are toggle buttons. The + is a paned window sash control.
 * Pull-right menus can be used for standard edit operations
 * and to clear the contents of the text widgets
 * or to replace their contents with the current selection.
 * The other push-buttons actually initiate searches etc.
 * The options button pops up the options tool.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

Boolean add_search_tool(Widget text_w)
{
	Widget shell,
		paned,
		search_form,
			search_backwards_btn,
			search_forwards_btn,
		search_text,
		replace_form,
			replace_btn,
			replace_all_btn,
			replace_search_backwards_btn,
			replace_search_forwards_btn,
		replace_text,
		toggle_form,
			ignore_case_toggle,
			use_wildcards_toggle,
		action_form,
			dismiss_btn,
			help_btn;

	XmString s;
	int	i, j;
#ifdef USEPANEDW
/*
 * The following are used to record what sashes in paned before the
 * replacement text pane is added. This then allows us to remove the unwanted
 * sash underneath the replacement text.
 */
	Widget *children_before, *children;
	Cardinal num_children_before, num_children;
#endif
	if((search_data.shell_w) != NULL) {
		XmTextPosition last_pos;
		XtManageChild(search_data.manager_w);
		XtPopup(search_data.shell_w, XtGrabNone);
		XmProcessTraversal(search_data.search_w, XmTRAVERSE_CURRENT);
		last_pos = XmTextGetLastPosition(search_data.search_w);
		XmTextSetInsertionPosition(search_data.search_w, last_pos);
		XmTextShowPosition(search_data.search_w, last_pos);
		set_input_focus(search_data.search_w);
		return True;
	}
	shell = XtVaCreatePopupShell("xpp-Search-and-Replace",
		transientShellWidgetClass, text_w,
		XmNdeleteResponse,		XmUNMAP,
		XmNtitle,			"Search and Replace",
		NULL);
#ifdef EDITRES
	add_edit_res_handler(shell);
#endif
	common_dialog_setup(shell, popdown_cb, shell);
	paned = XtVaCreateWidget("search-replace-paned",
		XMPANEDCLASS, 	shell,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 1:
 * | <= Search    | Search =>    |
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
		XmNrightPosition,		12,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		NULL);
	XmStringFree(s);

	s = XmStringCreateSimple("Search =>");
	search_forwards_btn = XtVaCreateManagedWidget("forwards",
		xmPushButtonWidgetClass,	search_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		12,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		NULL);
	XmStringFree(s);

	search_text = XtVaCreateManagedWidget("search-text",
		xmTextWidgetClass,		paned,
		XmNeditMode,			XmMULTI_LINE_EDIT,
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 2:
 * | Replace      | Replace All  |
 * | Replace & <=  | Replace & =>  |
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
		XmNrightPosition,		12,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_POSITION,
		XmNbottomPosition,		12,
		NULL);
	XmStringFree(s);

	s = XmStringCreateSimple("Replace All");
	replace_all_btn = XtVaCreateManagedWidget("replace-all",
		xmPushButtonWidgetClass,	replace_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		12,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_POSITION,
		XmNbottomPosition,			12,
		NULL);
	XmStringFree(s);

	s = XmStringCreateSimple("Replace & <=");
	replace_search_backwards_btn = XtVaCreateManagedWidget("replace-and-backwards",
		xmPushButtonWidgetClass,	replace_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		12,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,		12,
		XmNbottomAttachment,		XmATTACH_FORM,
		NULL);
	XmStringFree(s);

	s = XmStringCreateSimple("Replace & =>");
	replace_search_forwards_btn = XtVaCreateManagedWidget("replace-and-forwards",
		xmPushButtonWidgetClass,	replace_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNleftPosition,		12,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNtopAttachment,		XmATTACH_POSITION,
		XmNtopPosition,			12,
		XmNbottomAttachment,		XmATTACH_FORM,
		NULL);
	XmStringFree(s);
#ifdef USEPANEDW
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
#endif
	replace_text = XtVaCreateManagedWidget("replace-text",
		xmTextWidgetClass,		paned,
		XmNeditMode,			XmMULTI_LINE_EDIT,
#ifndef USEPANEDW
		XmNshowSash,			False,
#endif
		NULL);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Part 4:
 * -----------------------
* | * Ignore case * Use wildcards |
 * | Dismiss    |  Help  |
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	toggle_form = XtVaCreateWidget("search-replace-toggle-form",
		xmFormWidgetClass, 		paned,
		XmNfractionBase,		24,
		NULL);


	s = XmStringCreateSimple("Ignore case");

	ignore_case_toggle = XtVaCreateManagedWidget("ignore-case",
		xmToggleButtonWidgetClass,	toggle_form,
		XmNlabelString,			s,
		XmNleftAttachment,		XmATTACH_FORM,
		XmNrightAttachment,		XmATTACH_POSITION,
		XmNrightPosition,		12,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNalignment,			XmALIGNMENT_BEGINNING,
		NULL);

	XmStringFree(s);

	s = XmStringCreateSimple("Use wildcards");

	use_wildcards_toggle = XtVaCreateManagedWidget("use-wildcards",
		xmToggleButtonWidgetClass,		toggle_form,
		XmNlabelString,		s,
		XmNleftAttachment,		XmATTACH_POSITION,
		XmNrightAttachment,		XmATTACH_FORM,
		XmNleftPosition,		12,
		XmNtopAttachment,		XmATTACH_FORM,
		XmNbottomAttachment,		XmATTACH_FORM,
		XmNalignment,			XmALIGNMENT_BEGINNING,
		NULL);

	XmStringFree(s);

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
		XmNleftPosition,		3,
		XmNrightPosition,		9,
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
		XmNleftPosition,		15,
		XmNrightPosition,		21,
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

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * initialise saved results from last search to empty strings
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	for(i = 0; i < NSUBMATCHES; i += 1) {
		search_data.submatches[i] =
				(wchar_t*)XtMalloc(sizeof(wchar_t));
		search_data.submatches[i][0] = L'\0';
	}
	search_data.submatch_status = SM_UNITIALISED;
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

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add callbacks
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtAddCallback(search_text, XmNmodifyVerifyCallbackWcs,
						text_verify_cb, NULL);

	XtAddCallback(replace_text, XmNmodifyVerifyCallbackWcs,
						text_verify_cb, NULL);

	XtAddCallback(ignore_case_toggle, XmNvalueChangedCallback,
		toggle_button_cb, (XtPointer)(&search_data.ignore_case));

	XtAddCallback(use_wildcards_toggle, XmNvalueChangedCallback,
		toggle_button_cb, (XtPointer)(&search_data.use_wildcards));

	XtAddCallback(search_backwards_btn, XmNactivateCallback,
		search_backwards_cb, (XtPointer)(&search_data));

	XtAddCallback(search_forwards_btn, XmNactivateCallback,
		search_forwards_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_btn, XmNactivateCallback,
		replace_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_all_btn, XmNactivateCallback,
		replace_all_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_search_backwards_btn, XmNactivateCallback,
		replace_search_backwards_cb, (XtPointer)(&search_data));

	XtAddCallback(replace_search_forwards_btn, XmNactivateCallback,
		replace_search_forwards_cb, (XtPointer)(&search_data));

	XtAddCallback(dismiss_btn, XmNactivateCallback,
		popdown_cb, shell);

	XtAddCallback(help_btn, XmNactivateCallback,
		help_cb, (XtPointer)Help_Search_and_Replace_Tool);

	XtAddCallback(text_w, XmNmotionVerifyCallback,
		submatch_status_cb, (XtPointer)(&search_data));

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * set up initial values of search-replace options which the user
 * sets in the resource file by initialising search-replace tool widgets.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	search_data.ignore_case = XmToggleButtonGetState(ignore_case_toggle);

	search_data.use_wildcards = XmToggleButtonGetState(use_wildcards_toggle);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Set up popup edit menus.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
	for(i = 0; i < TEXT_EDIT_OPS; i += 1) {
		search_text_edit_menu_items[i].callback_data =(XtPointer) search_text;
	}
	for(j = 0; j < TEXT_SPECIAL_OPS; j += 1) {
		search_text_edit_menu_items[i+j].callback_data = (XtPointer)(&search_data);
	}
	attach_edit_popup(search_text, search_text_edit_menu_items);
	for(i = 0; i < TEXT_EDIT_OPS; i += 1) {
		replace_text_edit_menu_items[i].callback_data =(XtPointer) replace_text;
	}
	for(j = 0; j < TEXT_SPECIAL_OPS; j += 1) {
		replace_text_edit_menu_items[i+j].callback_data = (XtPointer)(&search_data);
	}
	attach_edit_popup(replace_text, replace_text_edit_menu_items);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 *set up text widget translations
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtOverrideTranslations(search_text,
		xpp_resources.text_translations);
	XtOverrideTranslations(replace_text,
		xpp_resources.text_translations);

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Manage everything:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

	XtManageChild(search_form);
	XtManageChild(replace_form);
	XtManageChild(toggle_form);
	XtManageChild(action_form);
	XtManageChild(paned);

	XtPopup(shell, XtGrabNone);

	fix_pane_height(search_form, search_form);
	fix_pane_height(replace_form, replace_form);
	fix_pane_height(toggle_form, toggle_form);
	fix_pane_height(action_form, action_form);
#ifdef USEPANEDW
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
#endif
	XmProcessTraversal(search_text, XmTRAVERSE_CURRENT);

	return True;
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Toggle button callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void toggle_button_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	Boolean *flag = cbd;
	*flag = XmToggleButtonGetState(w);
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search forwards callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void search_and_show(Widget, SearchData*, Cardinal);
static void search_forwards_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	CHECK_MAP_STATE(cbdata)
	search_and_show(w, cbdata, FORWARDS);
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
	CHECK_MAP_STATE(cbdata)
	search_and_show(w, cbdata, BACKWARDS);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Support for regular expression searches in wide character strings.
 * In their wisdom, the POSIX people only defined the regex facilities
 * for multi-byte strings. Free BSD has the obvious extensions 
 * regwcomp and regwexec, but the GNU implementation is pedantically
 * POSIX compliant. At the expense of some memory, we simulate
 * the wide character interface,
 * **** **** **** **** **** **** **** **** **** **** **** **** */
int my_regwcomp(regex_t *preg, const wchar_t *widepat, int cflags)
{
	char *pattern;
	size_t cr;
	int len, rcr;
	len = wcslen(widepat) * MB_CUR_MAX;
	pattern = XtMalloc(len + 1);
	if(pattern == 0) return REG_ESPACE;
	cr = wcstombs(pattern, widepat, len + 1);
	if(cr == (size_t)-1) return REG_INVARG;
	rcr = regcomp(preg, pattern, cflags);
	XtFree(pattern);
	return rcr;
}
/*
 * Some implementations of regexec call strlen on the text: if the
 * text has length N, say, this introduces an O(N) overhead that can
 * make replace-all operations into an N^2*K operation (where K is some
 * factor dependent on the average length of the matches and on the
 * complexity of the regular expression. Moreover as we have to
 * convert the wide character string into a multi-byte string 
 * the conversion would involve a similar O(N) overhead. To avoid
 * this, we use a "double-and-conquer" approach that makes the cost N*K.
 *
 * An earlier version of this just did two XtMalloc calls for enough
 * memory to accommodate all of widestr before the the main loop.
 * On big files this resulted in very poor  performance on replace_all
 * operations. The approach that allocates just enough for the
 * current chunk is 3 or 4 orders of magnitude faster on a 10Mb file.
 * 
 */
int my_regwexec(const regex_t *preg, const wchar_t *widestr,
	size_t nmatch, regmatch_t pmatch[], int eflags)
{
	char *str;
	const wchar_t *pwc;
	int *offset_to_woffset, i, str_i, curr_chunk, len, cr, rer;
	len = INITCHUNK  * MB_CUR_MAX;
	str = XtMalloc(len + 1);
	if(str == 0) return REG_ESPACE;
	offset_to_woffset = (int*)XtMalloc(sizeof(int)*(len + 1));
	if(offset_to_woffset == 0) { XtFree(str); return REG_ESPACE; }
	for(	curr_chunk = INITCHUNK,
		pwc = widestr,
		str_i = 0,
		rer = REG_NOMATCH;
		*pwc != 0;
		curr_chunk *= 2) {
/* convert up to curr_chunk elements from widestr into str */
		len = curr_chunk * MB_CUR_MAX;
		str = XtRealloc(str, len + 1);
		if(str == 0) return REG_ESPACE;
		offset_to_woffset = (int*)XtRealloc((char*)offset_to_woffset,
							sizeof(int)*(len + 1));
		if(offset_to_woffset == 0) { XtFree(str); return REG_ESPACE; }
		while(pwc - widestr < curr_chunk && *pwc !=0) {
			cr = wctomb(str + str_i, *pwc);
			if(cr == -1) {
				XtFree(str);
				XtFree((char*)offset_to_woffset);
				return REG_INVARG;
			}
/* record offset of current element of widestr against this index in str */
			offset_to_woffset[str_i] = pwc - widestr;
/* mark remaining chars in this multi-byte char as invalid offsets */
			for(i = 1; i < cr; i += 1) {
				offset_to_woffset[str_i + i] = -1;
			}
			str_i += cr;
			pwc += 1;
		}
		str[str_i] = 0;
		offset_to_woffset[str_i] = pwc - widestr;
/* try to match */
		rer = regexec(preg, str, nmatch, pmatch, eflags);
		if(rer == 0 && (pmatch[0].rm_eo < str_i || *pwc == L'\0')) {
			/* match */
			break;
		} else if (rer != 0 && rer != REG_NOMATCH) {
			/* error */
			break;
		} /* else not matched yet; go round for more */
	}
	if(rer != 0) {
		XtFree(str);
		XtFree((char*)offset_to_woffset);
		return rer;
	}
	for(i = 0; i < nmatch; i += 1) {
		if(0 <= pmatch[i].rm_so && pmatch[i].rm_so < len + 1 && offset_to_woffset[pmatch[i].rm_so] >= 0) {
			pmatch[i].rm_so = offset_to_woffset[pmatch[i].rm_so];
		}
		if(0 <= pmatch[i].rm_eo && pmatch[i].rm_eo < len + 1 && offset_to_woffset[pmatch[i].rm_eo] >= 0) {
			pmatch[i].rm_eo = offset_to_woffset[pmatch[i].rm_eo];
		}
		if((pmatch[i].rm_so < 0) != (pmatch[i].rm_eo < 0)) {
			XtFree(str);
			XtFree((char*)offset_to_woffset);
			return REG_INVARG;
		}
	}
	XtFree(str);
	XtFree((char*)offset_to_woffset);
	return 0;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Support for search callbacks.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Substring search_cyclic(wchar_t*, wchar_t*, long int,
						Cardinal, SearchData*);
static Boolean report_re_error(Widget);
static void search_and_show(
	Widget				w,
	SearchData			*cbdata,
	Cardinal			dir)
{
	Substring ss;
	Cardinal start_point;
	wchar_t *pattern, *text_buf;
	XmTextPosition pl, pr;
	pattern = XmTextGetStringWcs(search_data.search_w);
	text_buf = XmTextGetStringWcs(search_data.text_w);
	if(	XmTextGetSelectionPosition(search_data.text_w, &pl, &pr)
	&&	pl < pr) {
		start_point = (dir == FORWARDS ? pr : pl);
	} else {
		start_point = XmTextGetInsertionPosition(search_data.text_w);
	}
	if(*pattern) {
		ss = search_cyclic(pattern, text_buf, start_point, dir, cbdata);
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
		cbdata->submatch_status = SM_GOOD;
	} else if (!(*pattern)){
		ok_dialog(search_data.shell_w, no_search_string);
	} else if(!report_re_error(search_data.shell_w)) {
		ok_dialog(search_data.shell_w, not_found);
	}
	XtFree((char*)pattern);
	XtFree((char*)text_buf);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replace callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean replace_selection(Widget, SearchData*);
static void replace_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	CHECK_MAP_STATE(cbdata)
	(void) replace_selection(w, cbdata);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * support for replace callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static long int re_replacement_text(wchar_t*, wchar_t*,
					Substring*, wchar_t*, SearchData*);
static Boolean replace_selection(
	Widget				w,
	SearchData			*cbdata)
{
	XmTextPosition left, right;
	wchar_t *replacement, *rep_pattern;
	if(	XmTextGetSelectionPosition(cbdata->text_w, &left, &right)
	&&	left < right ) {
		rep_pattern  = XmTextGetStringWcs(cbdata->replace_w);
		if(cbdata->use_wildcards) {
			long int text_len =right - left, rep_len;
			wchar_t *text_buf, *rep_buf;
			text_buf = (wchar_t*)
					XtMalloc((text_len+1)*sizeof(wchar_t));
			Substring ss;
			if(	text_buf == 0
			||	XmTextGetSubstringWcs(cbdata->text_w,
					left, text_len, text_len + 1, text_buf)
					== XmCOPY_FAILED ) {
				XtFree((char*)rep_pattern);
				if(text_buf != 0) {
					XtFree((char*)text_buf);
				}
				ok_dialog( cbdata->shell_w,
					no_room_for_search_op);
				return False;
			}
			ss.offset = 0;
			ss.length = text_len;
			rep_len = re_replacement_text(rep_pattern,
					text_buf, &ss, 0, cbdata);
			if(rep_len == -1) { /* user cancelled */
				XtFree((char*)rep_pattern);
				if(text_buf != 0) {
					XtFree((char*)text_buf);
				}
				return False;
			}
			rep_buf = (wchar_t*)
					XtMalloc((rep_len + 1)*sizeof(wchar_t));
			if(rep_buf == 0) {
				XtFree((char*)rep_pattern);
				if(text_buf != 0) {
					XtFree((char*)text_buf);
				}
				ok_dialog( cbdata->shell_w,
					no_room_for_search_op);
				return False;
			}
			(void) re_replacement_text(rep_pattern, text_buf,
						   &ss, rep_buf, cbdata);
			rep_buf[rep_len] = L'\0';
			XtFree((char*)rep_pattern);
			XtFree((char*)text_buf);
			replacement  = rep_buf;
		} else {
			replacement = rep_pattern;
		}
		text_show_position(cbdata->text_w, left);
		XmTextReplaceWcs(
			cbdata->text_w,
 			left,
			right,
			replacement);
		XmTextSetSelection(
			cbdata->text_w,
			left,
			left + wcslen(replacement),
			CurrentTime);
		XtFree((char*)replacement);
		return True;
	} else {
		ok_dialog(cbdata->shell_w, no_selection_to_replace);
		return False;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replace all callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void replace_all(wchar_t*, wchar_t*, wchar_t*, wchar_t**,
						Cardinal*, SearchData*);
static void replace_all_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	Substring ss;
	Cardinal start_point;
	wchar_t *pattern, *text_buf, *replacement, *all_replaced;
	CHECK_MAP_STATE(cbdata)
	pattern = XmTextGetStringWcs(cbdata->search_w);
	text_buf = XmTextGetStringWcs(cbdata->text_w);
	start_point = XmTextGetInsertionPosition(cbdata->text_w);
	if(*pattern) {
		ss = search_cyclic(pattern, text_buf, start_point, FORWARDS, cbdata);
	} else { /* bypass the much slower detection of this case by re_search_exec */
		ss.offset = -1;
	}
	if(ss.offset >= 0) {
		replacement = XmTextGetStringWcs(
				cbdata->replace_w);
		replace_all(
			pattern,
			text_buf,
			replacement,
			&all_replaced,
			&start_point,
			cbdata);
		if(all_replaced == NULL) {
			ok_dialog(
				cbdata->shell_w,
				no_room_for_search_op);
			XtFree((char*)replacement);
		} else {
			XmTextSetStringWcs(cbdata->text_w, all_replaced);
			XmTextSetTopCharacter(cbdata->text_w, 0);
			text_show_position(
				cbdata->text_w,
				start_point);
			XmTextSetInsertionPosition(
				cbdata->text_w,
				start_point);
			XtFree((char*)replacement);
			XtFree((char*)all_replaced);
		}
	} else if (!(*pattern)){
		ok_dialog(cbdata->shell_w, no_search_string);
	} else if (!report_re_error(search_data.shell_w)) {
		ok_dialog(cbdata->shell_w, not_found);
	}
	XtFree((char*)pattern);
	XtFree((char*)text_buf);
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
	CHECK_MAP_STATE(cbdata)
	if(replace_selection(w, cbdata)) {
		search_and_show(w, cbdata, BACKWARDS);
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
	CHECK_MAP_STATE(cbdata)
	if(replace_selection(w, cbdata)) {
		search_and_show(w, cbdata, FORWARDS);
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
	XmTextPosition last_pos;
	char *sel;
	if ((sel = get_selection(cbdata->shell_w, no_selection_search)) == NULL) {
		return;
	}
	XmTextSetString(cbdata->search_w, sel);
	last_pos = XmTextGetLastPosition(cbdata->search_w);
	XmTextSetInsertionPosition(cbdata->search_w, last_pos);
	XmTextShowPosition(cbdata->search_w, last_pos);
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
	XmTextPosition last_pos;
	char *sel;
	if ((sel = get_selection(cbdata->shell_w, no_selection_replace)) == NULL) {
		return;
	}
	XmTextSetString(cbdata->replace_w, sel);
	last_pos = XmTextGetLastPosition(cbdata->replace_w);
	XmTextSetInsertionPosition(cbdata->replace_w, last_pos);
	XmTextShowPosition(cbdata->replace_w, last_pos);
	XtFree(sel);
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search field empty callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void empty_search_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	XmTextSetString(cbdata->search_w, "");
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replacement field empty callback.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void empty_replace_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	XmTextSetString(cbdata->replace_w, "");
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * submatch_status_cb: flag that the selection may have changed.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void submatch_status_cb(
	Widget		w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	SearchData *cbdata = cbd;
	cbdata->submatch_status = SM_STALE;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * actually doing the work:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
/*
 * Pre-processing for the Boyer-Moore search algorithm.
 */

static simple_search_t *simple_search_comp(wchar_t *pattern)
{
	long int len = wcslen(pattern);
	int i;
	simple_search_t *ss;
	ss = (simple_search_t *) XtMalloc(sizeof(simple_search_t) +
						(len + 1)*sizeof(wchar_t));
	if(ss == 0) { /* malloc failed */
		return ss;
	}
	wcscpy(&(ss->pattern)[0], pattern);
	if(search_data.ignore_case) {
		for(i = 0; i < len; ++i) {
			(ss->pattern)[i] = towupper((ss->pattern)[i]);
		}
	}
	ss->length = len;
	return ss;
}
/*
 * The simple search algorithm:
 * If offset_limit is positive, then a match that starts at text+offset_limit
 * or greater is rejected (used to do backwards search by binary chop).
 */
static Substring simple_search_exec(
	simple_search_t *ss,
	wchar_t *text,
	long int offset_limit,
	SearchData *cbdata)
{
	int cursor, i;
	Boolean matched;
	Substring result;
	result.offset = -1; /* no match yet */
	if(ss->length == 0) {
		return result;
	}
	matched = False;
	for(cursor = 0; text[cursor] != L'\0'; cursor += 1) {
		for(i = 0; i < ss->length &&
				text[cursor + i] != L'\0'; i += 1) {
			wchar_t w = search_data.ignore_case ?
					towupper(text[cursor + i]) :
					text[cursor + i];
			if(w != ss->pattern[i]) {
				break;
			}
		}
		if(i == ss->length) {
			matched = True;
			break;
		}
	}
	if(matched && (offset_limit < 0 || cursor < offset_limit)) {
		/* match at cursor */
		int j;
		cbdata->submatch_status = SM_GOOD;
		wchar_t **sm = &cbdata->submatches[0];
		result.offset = cursor;
		result.length = ss->length;
		*sm = (wchar_t*)XtRealloc((char*)*sm,
				(ss->length + 1)*sizeof(wchar_t));
		wcscpy(*sm, ss->pattern);
		for(j = 1; j < NSUBMATCHES; j += 1) {
			sm = &cbdata->submatches[j];
			if(**sm) {
				*sm = (wchar_t*)XtRealloc((char*)*sm, 1);
				(*sm)[0] = L'\0';
			}
		}
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
static regex_t *re_search_comp(wchar_t *pattern)
{
	static regex_t preg;
	int cflags = REG_EXTENDED | REG_NEWLINE;
	int error_code;
	if(search_data.ignore_case) {
		cflags |= REG_ICASE;
	}
	error_code = my_regwcomp(&preg, pattern, cflags);
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

/*
 * The regular expression search algorithm.
 * If offset_limit is positive, then a match that starts at text+offset_limit
 * or greater is rejected (this is used to do backwards search by binary chop).
 */
static Substring re_search_exec(
		regex_t *preg,
		wchar_t *text,
		long int offset_limit,
		Boolean bol,
		SearchData *cbdata)
{
	Substring result;
	regmatch_t pmatch[NSUBMATCHES];
	int eflags = bol ? 0 : REG_NOTBOL;
	int error_code;
	long int len, offset;
	wchar_t *p;
	len = 0; /* assume no match until we get one */
	p = text; /* start at the beginning */
	while(*p) { /* look for a non-empty match */
		error_code = REGEXEC(preg, p, NSUBMATCHES, pmatch, eflags);
		if(error_code == 0) {
			len = pmatch[0].rm_eo - pmatch[0].rm_so;
			offset = pmatch[0].rm_so + (p - text);
			if(len != 0) {
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
			len = 0;
			break;
		}
	}
	if(len > 0 && (offset_limit < 0 || offset < offset_limit)) {
		/* got a match */
		int j;
		result.length = len;
		result.offset = offset;
		cbdata->submatch_status = SM_GOOD;
		for(j = 0; j < NSUBMATCHES; j += 1) {
			wchar_t **sm = &cbdata->submatches[j];
			if(pmatch[j].rm_so >= 0) {/* got a submatch */
				int smlen = pmatch[j].rm_eo - pmatch[j].rm_so;
				*sm = (wchar_t*)XtRealloc((char*)*sm, 
					(smlen + 1)*sizeof(wchar_t));
				wcsncpy(*sm, p + pmatch[j].rm_so, smlen);
				(*sm)[smlen] = '\0';
			} else if (**sm) { /* no submatch now; had one before */
				*sm = (wchar_t*)XtRealloc((char*)*sm, 1);
				(*sm)[0] = L'\0';
			} /* else no submatch before or now */
		}
	} else {
		result.offset = -1; /* tell caller no match*/
	}
	return result;
}
/*
 * Error reporting for regular expression searching:
 */
static Boolean report_re_error(Widget shell_w)
{
	if(re_error_text == 0) {
		return False;
	} else {
		char *msg_buf = XtMalloc(strlen(re_error) +
					strlen(re_error_text) + 1);
		sprintf(msg_buf, re_error, re_error_text);
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
 * Returns -1 if the user has cancelled the operation (only occurs
 * when buf == 0 and when control has left this module since the last search).
 */
static long int re_replacement_text(
	wchar_t		*rep_pattern,
	wchar_t		*text,
	Substring	*match,
	wchar_t		*buf,
	SearchData	*cbdata)
{
	wchar_t	*p, *q;
	Boolean	escaped = False;
	long int result;
	Boolean confirmed = buf != 0;
	for(p = rep_pattern, q = buf, result = 0; *p; p += 1) {
		if(!escaped) {
			if(*p == L'\\') {
				/* backslash - escape */
				escaped = True;
			} else if (*p == L'&') {
				/*ampersand - insert copy of matching substring */
				result += match->length;
				if(buf) {
					wcsncpy(q, text + match->offset, match->length);
					q += match->length;
				}
			} else {
				/* anything else - just copy */
				result += 1;
				if(buf) {
					*q++ = *p;
				}
			}
		} else if (L'0' <= *p && *p <= L'9') {
			/* \0 .. \9 submatch replacement */
			if(	!confirmed
			&&	cbdata->submatch_status != SM_GOOD
			&&	!yes_no_dialog(cbdata->shell_w,
					cbdata->submatch_status == SM_STALE ?
					submatch_stale :
					submatch_unitialised,
					"Confirm")) {
				return -1;
			} else {
				confirmed = True;
			}
			wchar_t *repl = cbdata->submatches[*p - L'0'];
			int len = wcslen(repl);
			result += len;
			if(buf) {
				wcscpy(q, repl);
				q += len;
			}
			escaped = False;
		} else {
			/* anything else escaped - just copy */
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
 * in a string starting at a given offset and ending at offset+limit
 * (or null-terminated if limit < 1). If pattern is 0, then use the pattern
 * from the previous call, if any.  If the text to be
 * searched is 0, just set up static data for future use.
 * If both pattern and text are 0, reset static data and free any malloced space;
 * Make sure to reset before returning control to the user, else they might
 * change the value of use_wildcards or ignore_case.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Substring search_forwards(
	wchar_t		*pattern,
	wchar_t		*text,
	long int	offset,
	long int	limit,
	SearchData	*cbdata)
{
	static void  *last_comp = 0;
	void * comp;
	Substring result;
	if(pattern == 0) {
		comp = last_comp;
	} else {
		if(last_comp != 0) {
			if(cbdata->use_wildcards) {
				regfree((regex_t *)last_comp);
			} else {
	 			XtFree((char*)last_comp);
			}
		}
		if (cbdata->use_wildcards) {
			comp = re_search_comp(pattern);
		} else {
			comp = simple_search_comp(pattern);
		}
		last_comp = comp;
	}
	if(pattern == 0 && text == 0) {
		if(last_comp != 0) {
			if(cbdata->use_wildcards) {
				regfree((regex_t *)last_comp);
			} else {
	 			XtFree((char*)last_comp);
			}
		}
		result.offset = -1;
		last_comp = 0;
	} else if (text == 0 || comp == 0) {
		/* this is where syntax errors in reg. exps. show up */
		result.offset = -1;
	} else {
		if(cbdata->use_wildcards) {
			result = re_search_exec(comp, text + offset, limit,
				offset == 0 || text[offset-1] == L'\n',
				cbdata);
		} else {
			result = simple_search_exec(comp, text + offset, limit, cbdata);
		}
	}
	return result;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * search_cyclic is the search function that can search cyclically in both directions.
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static Substring search_cyclic(
	wchar_t		*pattern,
	wchar_t		*text_buf,
	long int 	start_point,
	Cardinal	direction,
	SearchData	*cbdata)
{
	Substring ss;
	if(direction == FORWARDS) {
		ss = search_forwards(pattern, text_buf, start_point, -1, cbdata);
		if(ss.offset < 0) {
			ss = search_forwards(0, text_buf, 0, -1, cbdata);
		} else {
			ss.offset += start_point;
		}
	} else { /* Do binary chop to search backwards: */
		int upb, i;
		Substring t;
		ss = search_forwards(pattern, text_buf, 0, -1, cbdata);
		if(ss.offset >=  0) {
			if(ss.offset < start_point) {
				upb = start_point;
			} else {
				upb = wcslen(text_buf);
			}
			for(i = (upb - ss.offset) / 2; i > 0; i = (upb - ss.offset) / 2) {
				t = search_forwards(0, text_buf, ss.offset + i, upb - (ss.offset + i), cbdata);
				if(t.offset >= 0) {
					ss.offset = t.offset + ss.offset + i;
					ss.length = t.length;
				} else {
					upb = ss.offset + i;
				}
			}
		}
	}
	search_forwards(0, 0, 0, -1, cbdata);
	return ss;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * replace_all does the text processing part of the global search
 * and replace function
 * **** **** **** **** **** **** **** **** **** **** **** **** */

static void replace_all(
	wchar_t		*pattern,
	wchar_t		*text_buf,
	wchar_t		*rep_pattern,
	wchar_t		**result,
	Cardinal	*start_point,
	SearchData 	*cbdata)
{
	long int text_buf_len, rep_pattern_len, rep_len, extra;
	Substring ss;
	wchar_t	*p, *q, *next_p, *sp;
	text_buf_len = wcslen(text_buf);
	rep_pattern_len = wcslen(rep_pattern);

	p = text_buf;
	extra = 0;
	(void) search_forwards(pattern, 0, 0, -1, cbdata);
	while(*p) {
		ss = search_forwards(0, text_buf, p - text_buf, -1, cbdata);
		if(ss.offset >= 0) {
			if(cbdata->use_wildcards) {
				rep_len = re_replacement_text(rep_pattern, p,
						&ss, 0, cbdata);
				extra += rep_len - ss.length;
			} else {
				extra += rep_pattern_len - ss.length;
			}
			p += ss.offset + ss.length;
		} else {
			break;
		}
	}
	if((*result = (wchar_t*)XtMalloc(
			(text_buf_len + extra + 1)*sizeof(wchar_t)))
		== NULL) {
		search_forwards(0, 0, 0, -1, cbdata); /* it _might_ help! */
		return;
	}
	p = text_buf;
	q = *result;
	sp = q + *start_point;
	while(*p) {
		ss = search_forwards(0, text_buf, p - text_buf, -1, cbdata);
		if(ss.offset >= 0) {
			wcsncpy(q, p, ss.offset);
			if(cbdata->use_wildcards) {
				rep_len = re_replacement_text(rep_pattern, p,
						&ss, q+ss.offset, cbdata);
			} else {
				wcsncpy(q + ss.offset, rep_pattern, rep_pattern_len);
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
			wcscpy(q, p);
			q += wcslen(p);
			break;
		}
	}
	*q = L'\0'; /* in case last match reached to end of text_buf */
	*start_point = sp - *result;
	search_forwards(0, 0, 0, -1, cbdata);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: xpp.h,v 2.21 2002/03/18 19:14:49 phil Exp phil "
 *
 * xpp.h - main include file for the X/Motif ProofPower Interface
 *
 * xpp.h: this file is part of the PPTex system
 *
 * Copyright (c) 2002 Lemma 1 Ltd.
 * 
 * See the file LICENSE for your rights to use and change this file.
 *
 * Contact: Rob Arthan < rda@lemma-one.com >
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */


/* Build switches */

/* If defined this will enable a more advanced *
 * way to deal with a lack of memory.          */
/*#define HANDLE_NO_MEMORY*/

/* If HANDLE_NO_MEMORY isn't defined defining  this *
 * will disable undo/redo if memory does run out.   */
#define HANDLE_NO_MEMORY_DISABLE


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * MACROS
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define NAT Cardinal
#define INT long int

#include <X11/Intrinsic.h>
#include <Xm/XmAll.h>

#define CALLBACK_ARGS Widget,XtPointer,XtPointer
#define EVENT_HANDLER_ARGS Widget,XtPointer,XEvent*,Boolean*
#define INPUT_CALLBACK_ARGS XtPointer,int*,XtInputId*

/* See the typedef for MenuItem for the following */

#define MENU_ITEM_SEPARATOR	\
	{ "", &xmSeparatorGadgetClass, \
		'\0', NULL, NULL, NULL, NULL, NULL, False}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * TYPE DEFS
 * **** **** **** **** **** **** **** **** **** **** **** **** */
typedef struct {
	Boolean			edit_only;
	Boolean			backup_before_save;
	Boolean			delete_backup_after_save;
	char			add_new_line_mode;
	NAT			journal_max;
	String			command_line;
	String			interrupt_prompt;
	String			abandon_reply;}
		GlobalOptions;	
/*
 * The following are the values of execute_new_line_mode:
 * (they are in the order that the buttons appear in the
 * radio box in the options tool).
 */
#define EXECUTE_ADD_NEW_LINES 0
#define EXECUTE_PROMPT_NEW_LINES 1
#define EXECUTE_IGNORE_NEW_LINES 2

/*
 * The following is based on the ideas in Heller's
 * `Motif Programming Manual'. See menus.c for the implementation.
 */
typedef struct menu_item {
	char		*label;		/* label for this item */
					/* NULL means last item */
	WidgetClass	*class;		/* pushbutton, separator etc. */
	char		mnemonic;	/* '\0' if no mnemonic */
	char		*accelerator;	/* NULL if no accelerator */
	char		*accelerator_text;
	XtCallbackProc	callback;	/* NULL if no callback */
	XtPointer	callback_data;
	struct menu_item
			*pullright;	/* NULL if not submenu */
	Boolean		pullright_tear_off_enabled;}
					/* Ignored if not submenu */
		MenuItem;
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * GLOBAL DATA: for no particular reason, the source file
 * options.c which constructs the tool for setting the controls
 * is chosen to define the global data (other files get it as
 * external data).
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#ifndef _options
	extern
#endif
	GlobalOptions		global_options;
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * EXTERNS
 * **** **** **** **** **** **** **** **** **** **** **** **** */
/*
 * For each module there is a section below to generate
 * extern declarations for its external interfaces (with the
 * exception of `main' in xpp.c).
 * N.B. the sections below are in alphabetical order of module name.
 */
/* Module: cmdline */
	extern void add_cmd_line(
		Widget	text_w);
/* Module: diag */
	extern void msg(
		char	*s1,	/* title: ... */
		char	*s2	/* ...: message */);
/* Module: files */
	/* what to do if the file's not there, or has funny permisions */
	typedef enum {
		NoAction,
		QuitNow,
		NewFile,
		EmptyFile
	} FileOpenAction;
	extern Boolean open_file(
		Widget	text,
		char	*name,
		Boolean cmdLine,
		FileOpenAction *foAction);
	extern Boolean save_file(
		Widget	text,
		char	*name);
	extern Boolean save_file_as(
		Widget	text,
		char	*name);
	extern Boolean save_string_as(
		Widget	w,
		char	*data,
		char	*name);
	extern Boolean include_file(
		Widget	text,
		char	*name);
	extern void panic_save(
		Widget text);
/* Module: help.c (automatically generated during build) */
	#include "help.h"
/* Module: mainw */
	extern void main_window_go(
		char	*file_name);
	extern XtAppContext app;
	extern Widget root;
	extern Widget script;
	extern Widget journal;
	extern void check_quit_cb (
		Widget w,
		XtPointer cbd,
		XtPointer cbs);
	extern void scroll_out(char *buf, NAT ct, Boolean ignored);
/* Module: menus */
	extern	Widget setup_menu(
		Widget		parent,
		int		type,
		char		*menu_title,
		char		menu_mnemonic,
		Boolean		tear_off_enabled,
		MenuItem	*items);
	extern void resetup_menu(
		Widget		menu,
		int		type,
		MenuItem	*items);
/* Module: msg */
	extern XmString format_msg(
		char *msg,
		NAT line_len);
	extern void help_dialog(
		Widget	w,
		char	*msg);
	extern Boolean yes_no_dialog(
		Widget	w,
		char	*question);
	extern int yes_no_cancel_dialog(
		Widget	w,
		char	*question);
	extern void ok_dialog(
		Widget	w,
		char	*msg);
	extern char *file_dialog(
		Widget	w,
		char	*opn    /* Save/Open/... */);
	extern void memory_warning_dialog(
		Widget  w,
		Boolean show);     /* Used when memory's very low */
#	ifdef HANDLE_NO_MEMORY
		extern Boolean ok_cancel_dialog(
			Widget	w,
			Boolean show);     /* Used when memory's run out */
		extern Boolean ok_cancel_dialog1(
			Widget	w,
			Boolean show);     /*              "             */
#	else
		extern void nomemory_dialog(
			Widget  w,
			Boolean show);     /* Also for lack of memory, but nothing's *
			                    * going to be done about it              */
#	endif
/* Module: options */
	extern void init_options(
		Widget	owner_w);
	extern void add_option_tool(void);
	extern char **get_arg_list(void);
/* Module: palette */
	extern Boolean add_palette(
		Widget	w);
/* Module: pixmaps */
	extern Pixmap get_pp_pixmap(void);
/* Module: pterm */
	extern void get_pty(void);
	extern Boolean application_alive(void);
	extern void handle_sigs(void);
	extern void interrupt_and_abandon(void);
	extern void interrupt_application(void);
	extern void kill_application(void);
	extern void restart_application(void);
	extern void send_nl(void);
	extern void send_to_application(
		char	*buf,
		NAT	siz);
/* Module: search */
	extern Boolean add_search_tool(
		Widget	w);
	extern long int get_line_no(
		Widget text_w);
/* Module: templates */
	extern Boolean init_templates_tool(
		Widget	w);
	extern void add_templates_tool(Widget w);
/* Module: undo */
	extern void clear_undo(
		XtPointer undo_ptr);
	extern void pause_undo(
		XtPointer undo_ptr);
	extern void unpause_undo(
		XtPointer undo_ptr);
	extern void notify_save(XtPointer xtp);
	extern XtPointer add_undo(
		Widget	text_w,
		Widget	*menu_w,
		NAT	undo_menu_entry_offset,
		NAT	redo_menu_entry_offset);
	extern void undo_modify_cb(CALLBACK_ARGS);
	extern void undo_cb(CALLBACK_ARGS);
	extern void redo_cb(CALLBACK_ARGS);
/* Module: xmisc */
	extern void set_menu_item_sensitivity(
		Widget	w,	/* menu widget */
		NAT	i,	/* i-th menu entry */
		Boolean	b	/* true => sensitise */);
	extern void toggle_menu_item_sensitivity(
		Widget	w,	/* menu widget */
		NAT	i	/* i-th menu entry */);
	extern void set_menu_item_label(
		Widget	w,	/* menu widget */
		NAT	i,	/* i-th menu entry */
		char	*lab);
	extern void check_text_window_limit(
		Widget	w,
		NAT	max);
	extern void copy_font_list(
		Widget	to_w,
		Widget	from_w);
	extern void text_show_position(
		Widget text_w,
		XmTextPosition pos);
	extern void fix_pane_height(
			Widget child_w,
			Widget scale_w);
	extern void blink_owner_cb(
		Widget					w,
		Widget					text_w,
		XmPushButtonCallbackStruct		*unused);
	extern	void number_verify_cb(
		Widget				unused1,
		XtPointer			unused2,
		XmTextVerifyCallbackStruct	*cbs);
	extern	void attach_rw_edit_popup(Widget text_w);
	extern	void attach_ro_edit_popup(Widget text_w);
	extern	void register_selection_source(
		Widget w);
	extern	char *get_selection(Widget w, char *err_msg);
/* Module: xpp */
#ifndef _xpp
	extern
#endif
	XtTranslations text_translations;
#ifndef _xpp
	extern
#endif
	char *templates;
#ifndef _xpp
	extern
#endif
	char *command_line_list;
#ifndef _xpp
	extern
#endif
	char *title;


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$ 
 *
 * xpp.h - main include file for the X/Motif ProofPower Interface
 *
 * (c) ICL 1993, 1994
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * MACROS
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define NAT Cardinal
#define INT long int

#define STDIN 0
#define STDOUT 1
#define STDERR 2

#include <X11/Intrinsic.h>
#include <Xm/XmAll.h>

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
	NAT			journal_max;
	String			command_line;}
		GlobalOptions;	
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
	void		(*callback)();	/* NULL if no callback */
	XtPointer	callback_data;
	struct menu_item
			*pullright;	/* NULL if not submenu */
	Bool		pullright_tear_off_enabled;}
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
#ifndef _cmdline
	extern void add_cmd_line(
		Widget	text_w);
#endif
#ifndef _diag
	extern void msg(
		char	*s1,	/* title: ... */
		char	*s2	/* ...: message */);
#endif
#ifndef _edit
	extern void *setup_edit(
		Widget	owner,
		char	*name,
		void	(*exec)());
#endif
#ifndef _files
	extern Boolean *open_file(
		Widget	text,
		char	*name);
	extern Boolean *save_file(
		Widget	text,
		char	*name);
	extern Boolean *save_file_as(
		Widget	text,
		char	*name);
	extern Boolean save_string_as(
		Widget	w,
		char	*data,
		char	*name);
	extern Boolean *include_file(
		Widget	text,
		char	*name);
	extern void panic_save(Widget text);
#endif
#ifndef _help
	#include "help.h"
#endif
#ifndef _mainw
	extern void main_window_go(
		char	*file_name);
	extern XtAppContext app;
	extern Widget root;
	extern Widget script;
	extern void check_quit_cb (
		Widget w,
		XtPointer cd,
		XmAnyCallbackStruct cbs);
	extern void scroll_out(char *buf, NAT ct, Boolean ignored);
#endif
#ifndef _menus
	extern	Widget setup_pulldown_menu(
		Widget	parent,
		char	*menu_title,
		char	menu_mnemonic,
		Bool	tear_off_enabled,
		MenuItem	*items);
#endif
#ifndef _msg
	extern void help_dialog(
		Widget	w,
		char	*msg);
	extern Boolean yes_no_dialog(
		Widget	w,
		char	*question);
	extern void ok_dialog(
		Widget	w,
		char	*msg);
	extern char *file_dialog(
		Widget	w,
		char	*opn	/* Save/Open/... */);
#endif
#ifndef _options
	extern void init_options(
		Widget	owner_w);
	extern void add_option_tool();
	extern char **get_arg_list();
#endif
#ifndef _palette
	extern Boolean add_palette(
		Widget	w);
#endif
#ifndef _pixmaps
	extern Pixmap get_pp_pixmap();
#endif
#ifndef _pterm
	extern void get_pty();
	extern Boolean application_alive();
	extern void handle_sigs();
	extern void interrupt_application();
	extern void kill_application();
	extern void restart_application();
	extern void send_nl();
	extern void send_to_application(
		char	*buf,
		NAT	siz);
#endif
#ifndef _search
	extern Boolean add_search_tool(
		Widget	w);
#endif
#ifndef _templates
	extern Boolean add_templates(
		Widget	w);
#endif
#ifndef _undo
	extern void clear_undo(
		XtPointer undo_ptr);
	extern XtPointer add_undo(
		Widget	text_w,
		Widget	menu_w,
		NAT	menu_entry_offset);
	extern void undo_motion_cb();
	extern void undo_modify_cb();
	extern void undo_cb();
#endif
#ifndef _xmisc
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
void blink_owner_cb(
	Widget					w,
	Widget					text_w,
	XmPushButtonCallbackStruct		*unused);
void number_verify_cb(
	Widget				unused1,
	XtPointer			unused2,
	XmTextVerifyCallbackStruct	*cbs);
#endif
#ifndef _xpp
	extern XtTranslations text_translations;
	extern char * templates;
#endif

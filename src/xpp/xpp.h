
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$ 
 *
 * xpp.h - main include file for the X/Motif ProofPower Interface
 *
 * (c) ICL 1993
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
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * TYPE DEFS
 * **** **** **** **** **** **** **** **** **** **** **** **** */
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * The following is based on the ideas in Heller's
 * `Motif Programming Manual'.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
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
 * EXTERNS
 * **** **** **** **** **** **** **** **** **** **** **** **** */
/*
 * For each module there is a section below to generate
 * extern declarations for its external interfaces (with the
 * exception of `main' in xpp.c).
 */
#ifndef _mainw
	extern void main_window_go(
		Bool edit_only,
		char	*file_name);
	extern XtAppContext app;
	extern Widget root;
	extern void send_to_application(
		char	*buf,
		NAT	siz);
#endif
#ifndef _diag
	extern void msg(
		char	*s1,	/* title: ... */
		char	*s2	/* ...: message */);
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
#ifndef _palette
	extern Boolean add_palette(
		Widget	w);
#endif
#ifndef _search
	extern Boolean add_search_tool(
		Widget	w);
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
#endif
#ifndef _xpp
	extern char *cmd_buf;
	extern char *arglist[];
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
#endif
#ifndef _cmdline
	extern void add_cmd_line(
		Widget	text_w);
#endif

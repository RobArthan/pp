
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
#define BOOL char
#define TRUE 1
#define FALSE 0

#define NAT Cardinal
#define INT long int

#define STDIN 0
#define STDOUT 1
#define STDERR 2

/*
 * bit masks for diagnostic functions:
 */

#define MESSAGE 1
#define TRACING 2

#define TRACE(X) {gen_diag(TRACING, "ENTERED", X);}
#define	RETURN(X,V) {gen_diag(TRACING, "LEAVING", X); return(V);}
#define LEAVE(X) {gen_diag(TRACING, "LEAVING", X); return;}

#include <X11/Intrinsic.h>
/*
 * For each module there is a section below to generate
 * extern declarations for its external interfaces (with the
 * exception of `main' in xpp.c).
 */
#ifndef _cmdwin
	extern void setup_cmdwin(Bool edit_only);
	extern XtAppContext app;
	extern Widget root;
	extern void send_to_application(
		char	*buf,
		NAT	siz);
#endif
#ifndef _diag
	extern void gen_diag(
		NAT	mask,
		char	*s1,	/* title: ... */
		char	*s2	/* ...: message */);
	extern void diag(
		char	*s1,	/* title: ... */
		char	*s2	/* ...: message */);
	extern NAT debug;
	extern void msg(
		char	*s1,	/* title: ... */
		char	*s2	/* ...: message */);
#endif
#ifndef _msg
	extern void help_dialog(
		Widget	w,
		char	*msg);
	extern BOOL yes_no_dialog(
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
	extern BOOL add_palette(
		Widget	w);
#endif
#ifndef _xmisc
	extern void set_menu_item_sensitivity(
		Widget	w,	/* menu widget */
		NAT	i,	/* i-th menu entry */
		BOOL	b	/* true => sensitise */);
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
	extern void *load_file(
		Widget	text,
		char	*name);
#endif


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

#define STDIN 0
#define STDOUT 1
#define STDERR 2

#include <X11/Intrinsic.h>
/*
 * For each module there is a section below to generate
 * extern declarations for its external interfaces (with the
 * exception of `main' in xpp.c).
 */
#ifndef _cmdwin
	extern void cmdwin();
	extern XtAppContext app;
#endif
#ifndef _diag
	extern void diag();
	extern BOOL debug;
	extern void msg();
#endif
#ifndef _msg
	extern void help_dialog();
	extern BOOL yes_no_dialog();
	extern void ok_dialog();
#endif
#ifndef _palette
	extern BOOL add_palette();
#endif
#ifndef _palette
	extern BOOL add_palette();
#endif
#ifndef _xmisc
	extern void set_menu_item_sensitivity();
	extern void toggle_menu_item_sensitivity();
	extern void set_menu_item_label();
	extern void check_text_window_limit();
#endif

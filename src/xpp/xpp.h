
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
#define ACTION_PROC_ARGS Widget,XEvent*,String*,Cardinal*

#define APP_CLASS "Xpp"

/* See the typedef for MenuItem for the following */

#define MENU_ITEM_SEPARATOR	\
	{ "", &xmSeparatorGadgetClass, \
		'\0', NULL, NULL, NULL, NULL, NULL, False}

#ifdef LISTWIDGETS
#define EDITRES
#endif

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * TYPE DEFS
 * **** **** **** **** **** **** **** **** **** **** **** **** */
/* Note the following are used as indices into the array file_type_names */
typedef enum {UNIX = 0, MSDOS = 1, MACINTOSH = 2} FileType;
typedef struct {
/* session type: */
	Boolean			edit_only;
/* file save options: */
	Boolean			backup_before_save;
	Boolean			delete_backup_after_save;
	Boolean			read_only;
	FileType		file_type;
/* search-replace options: */
	Boolean			ignore_case;
	Boolean			use_reg_exps;
/* journal option: */
	NAT			journal_max;
/* command menu options: */
	char			add_new_line_mode;
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
/* action being taken in sync_file */
typedef enum {
	FS_OK,
	FS_CHANGED,
	FS_DELETED,
	FS_CREATED}
	file_status;
/* what to do in open_file if the file's not there, or has funny permisions */
typedef enum {
	NoAction,
	QuitNow,
	NewFile,
	EmptyFile
} FileOpenAction;

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
	extern void add_command_line_tool(
		Widget	text_w);
	extern void command_history_up(ACTION_PROC_ARGS);
	extern void command_history_down(ACTION_PROC_ARGS);
	extern void take_command_input(Widget w, XmTextVerifyCallbackStruct *cbs);
/* Module: diag */
	extern void msg(
		char	*s1,	/* title: ... */
		char	*s2	/* ...: message */);
	extern void env_diag(
		char	*fmt,
		char	*value);
/* Module: files */
	extern Boolean old_file_checks(
		Widget	text,
		char	*oldname,
		char	*extra_message,
		char	*continue_message,
		char	*title);
	extern Boolean open_file(
		Widget	text,
		char	*name,
		Boolean cmdLine,
		FileOpenAction *foAction);
	extern file_status check_status(
		char	*name);
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
/* Module: findfile (generated from imp096.doc during build); only list interfaces actually used here */
	extern char *get_real_name (
		char * name);
	extern voidsplit_file_name(
		char *name,
		char **dir,
		char **base);
	char * find_file(
		char *name,
		char *dirs,
		int is_reg);
/* Module: help.c (automatically generated during build) */
	#include "help.h"
/* Module: mainw */
	extern void main_window_go(
		char	*file_name);
	extern XtAppContext app;
	extern Widget root;
	extern Widget script;
	extern Widget journal;
	extern void check_quit_cb(CALLBACK_ARGS);
	extern void scroll_out(char *buf, NAT ct, Boolean ignored);
	extern void show_modified(Boolean force);
	extern void show_file_info(void);
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
		char	*question,
		char	*title);
	extern int yes_no_cancel_dialog(
		Widget	w,
		char	*question);
	extern void ok_dialog(
		Widget	w,
		char	*msg);
	extern char *file_dialog(
		Widget	w,
		char	*opn);
	extern void startup_dialog(
		Widget	w,
		char	**cmd_line,
		char	**file_name);
	extern void memory_warning_dialog(
		Widget  w,
		Boolean show);     /* Used when memory's very low */
	extern void nomemory_dialog(
		Widget  w,
		Boolean show);     /* Also for lack of memory, but nothing's *
		                    * going to be done about it              */
/* Module: options */
	extern void init_options(
		Widget	owner_w);
	extern void add_options_tool(void);
	extern char **get_arg_list(void);
	extern void set_read_only(Boolean read_only);
	extern void set_file_type(FileType file_type);
	extern GlobalOptions orig_global_options;
/* Module: palette */
	extern void popup_palette(Widget w);
	extern void register_palette_client(Widget w);
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
	extern void new_session(char *argv[], Boolean async);
	extern void new_editor_session(void);
	extern void new_command_session(void);
	extern void run_in_background(void);
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
	extern void beep(void);
	extern int get_map_state(Widget w); /* From XGetWindowAttributes */
	Widget get_top_shell(Widget w);
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
	extern void blink_owner_cb(CALLBACK_ARGS);
	extern	void number_verify_cb(CALLBACK_ARGS);
	extern	void text_verify_cb(CALLBACK_ARGS);
	extern	void text_field_verify_cb(CALLBACK_ARGS);
	extern	void common_dialog_setup(
			Widget shell,
			void cancel_cb(CALLBACK_ARGS),
			XtPointer cancel_cbd);
	extern	void set_input_focus(Widget w);
	extern	void attach_edit_popup(Widget text_w, MenuItem *menu_items);
	extern	void attach_rw_edit_popup(Widget text_w);
	extern	void attach_ro_edit_popup(Widget text_w);
	void	edit_cut_cb(CALLBACK_ARGS);
	void	edit_copy_cb(CALLBACK_ARGS);
	void	edit_paste_cb(CALLBACK_ARGS);
	void	edit_clear_cb(CALLBACK_ARGS);
	extern	void register_selection_source(
		Widget w);
	void	attach_popup_menu(Widget work_w, Widget menu_w);
	extern	char *get_selection(Widget w, char *err_msg);
#ifdef EDITRES
	extern	void add_edit_res_handler(Widget shell);
#endif
#ifdef LISTWIDGETS
	extern	void register_shell(Widget w);
	extern	void list_widget_hierarchy(void);
#endif
/* Module: xpp */
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * GLOBAL DATA: the source file xpp.c which contains main is
 * chosen to define the global data. It does not export any functions.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#ifdef _xpp
#define	extern
#endif
	GlobalOptions		global_options;
	extern XtTranslations text_translations;
	extern char *templates;
	extern char *command_line_list;
	extern char *title;
	extern char *argv0;
	extern char *pp_home;
	extern Boolean pp_env_debug;
	extern Boolean journal_editable;
	extern const char *const file_type_names[]
#ifdef _xpp
	= {"Unix", "MS-DOS", "Macintosh" };
#else
	;
#endif
	extern const char control_chars[256]
#ifdef _xpp
	= {
/*00*/ 1, /*01*/ 1, /*02*/ 1, /*03*/ 1, /*04*/ 1, /*05*/ 1, /*06*/ 1, /*07*/ 1,
/*08*/ 1, /*09*/ 0, /*0a*/ 0, /*0b*/ 1, /*0c*/ 1, /*0d*/ 0, /*0e*/ 1, /*0f*/ 1, /* TAB, LF, CR */
/*10*/ 1, /*11*/ 1, /*12*/ 1, /*13*/ 1, /*14*/ 1, /*15*/ 1, /*16*/ 1, /*17*/ 1,
/*18*/ 1, /*19*/ 1, /*1a*/ 1, /*1b*/ 1, /*1c*/ 1, /*1d*/ 1, /*1e*/ 1, /*1f*/ 1,
/*20*/ 0, /*21*/ 0, /*22*/ 0, /*23*/ 0, /*24*/ 0, /*25*/ 0, /*26*/ 0, /*27*/ 0, /* Space and graphics begin */
/*28*/ 0, /*29*/ 0, /*2a*/ 0, /*2b*/ 0, /*2c*/ 0, /*2d*/ 0, /*2e*/ 0, /*2f*/ 0,
/*30*/ 0, /*31*/ 0, /*32*/ 0, /*33*/ 0, /*34*/ 0, /*35*/ 0, /*36*/ 0, /*37*/ 0,
/*38*/ 0, /*39*/ 0, /*3a*/ 0, /*3b*/ 0, /*3c*/ 0, /*3d*/ 0, /*3e*/ 0, /*3f*/ 0,
/*40*/ 0, /*41*/ 0, /*42*/ 0, /*43*/ 0, /*44*/ 0, /*45*/ 0, /*46*/ 0, /*47*/ 0,
/*48*/ 0, /*49*/ 0, /*4a*/ 0, /*4b*/ 0, /*4c*/ 0, /*4d*/ 0, /*4e*/ 0, /*4f*/ 0,
/*50*/ 0, /*51*/ 0, /*52*/ 0, /*53*/ 0, /*54*/ 0, /*55*/ 0, /*56*/ 0, /*57*/ 0,
/*58*/ 0, /*59*/ 0, /*5a*/ 0, /*5b*/ 0, /*5c*/ 0, /*5d*/ 0, /*5e*/ 0, /*5f*/ 0,
/*60*/ 0, /*61*/ 0, /*62*/ 0, /*63*/ 0, /*64*/ 0, /*65*/ 0, /*66*/ 0, /*67*/ 0,
/*68*/ 0, /*69*/ 0, /*6a*/ 0, /*6b*/ 0, /*6c*/ 0, /*6d*/ 0, /*6e*/ 0, /*6f*/ 0,
/*70*/ 0, /*71*/ 0, /*72*/ 0, /*73*/ 0, /*74*/ 0, /*75*/ 0, /*76*/ 0, /*77*/ 0,
/*78*/ 0, /*79*/ 0, /*7a*/ 0, /*7b*/ 0, /*7c*/ 0, /*7d*/ 0, /*7e*/ 0, /*7f*/ 1, /* backspace */
/*80*/ 0, /*81*/ 0, /*82*/ 0, /*83*/ 0, /*84*/ 0, /*85*/ 0, /*86*/ 0, /*87*/ 0,
/*88*/ 0, /*89*/ 0, /*8a*/ 0, /*8b*/ 0, /*8c*/ 0, /*8d*/ 0, /*8e*/ 0, /*8f*/ 0,
/*90*/ 0, /*91*/ 0, /*92*/ 0, /*93*/ 0, /*94*/ 0, /*95*/ 0, /*96*/ 0, /*97*/ 0,
/*98*/ 0, /*99*/ 0, /*9a*/ 0, /*9b*/ 0, /*9c*/ 0, /*9d*/ 0, /*9e*/ 0, /*9f*/ 0,
/*a0*/ 0, /*a1*/ 0, /*a2*/ 0, /*a3*/ 0, /*a4*/ 0, /*a5*/ 0, /*a6*/ 0, /*a7*/ 0,
/*a8*/ 0, /*a9*/ 0, /*aa*/ 0, /*ab*/ 0, /*ac*/ 0, /*ad*/ 0, /*ae*/ 0, /*af*/ 0,
/*b0*/ 0, /*b1*/ 0, /*b2*/ 0, /*b3*/ 0, /*b4*/ 0, /*b5*/ 0, /*b6*/ 0, /*b7*/ 0,
/*b8*/ 0, /*b9*/ 0, /*ba*/ 0, /*bb*/ 0, /*bc*/ 0, /*bd*/ 0, /*be*/ 0, /*bf*/ 0,
/*c0*/ 0, /*c1*/ 0, /*c2*/ 0, /*c3*/ 0, /*c4*/ 0, /*c5*/ 0, /*c6*/ 0, /*c7*/ 0,
/*c8*/ 0, /*c9*/ 0, /*ca*/ 0, /*cb*/ 0, /*cc*/ 0, /*cd*/ 0, /*ce*/ 0, /*cf*/ 0,
/*d0*/ 0, /*d1*/ 0, /*d2*/ 0, /*d3*/ 0, /*d4*/ 0, /*d5*/ 0, /*d6*/ 0, /*d7*/ 0,
/*d8*/ 0, /*d9*/ 0, /*da*/ 0, /*db*/ 0, /*dc*/ 0, /*dd*/ 0, /*de*/ 0, /*df*/ 0,
/*e0*/ 0, /*e1*/ 0, /*e2*/ 0, /*e3*/ 0, /*e4*/ 0, /*e5*/ 0, /*e6*/ 0, /*e7*/ 0,
/*e8*/ 0, /*e9*/ 0, /*ea*/ 0, /*eb*/ 0, /*ec*/ 0, /*ed*/ 0, /*ee*/ 0, /*ef*/ 0,
/*f0*/ 0, /*f1*/ 0, /*f2*/ 0, /*f3*/ 0, /*f4*/ 0, /*f5*/ 0, /*f6*/ 0, /*f7*/ 0,
/*f8*/ 0, /*f9*/ 0, /*fa*/ 0, /*fb*/ 0, /*fc*/ 0, /*fd*/ 0, /*fe*/ 0, /*ff*/ 0};
#else
	;
#endif
#ifdef _xpp
#undef extern
#endif
/* **** **** **** **** **** **** **** **** **** **** **** ****
* end of xpp.h
**** **** **** **** **** **** **** **** **** **** **** **** */



/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: menus.c,v 2.3 2000/06/15 17:10:42 rda Exp rda $
 *
 * menus.c -  creation of menus for the X/Motif ProofPower
 * Interface
 *
 * (c) ICL 1994
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _menus
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#include "xpp.h"


static void setup_menu_items(
	Widget		menu,
	int		type,
	MenuItem	*items)
{
	Widget w;
	MenuItem	*item;
	XmString	lab;
	static Widget setup_menu_aux(
		Widget	parent,
		int	type,
		char	*menu_title,
		char	menu_mnemonic,
		Bool	tear_off_enabled,
		MenuItem	*items);
/*
 * Loop round the menu items
 */
	for (item = items; item->label; ++item) {
/*
 * Is this a pull-right submenu?
 */
		if(item->pullright) {
			w = setup_menu_aux(
				menu,
				XmMENU_PULLDOWN,
				item->label,
				item->mnemonic,
				item->pullright_tear_off_enabled,
				item->pullright);
		} else {
			w = XtVaCreateManagedWidget(
				item->label,
				*(item->class),
				menu,
				NULL);
		}
/*
 * Is there a mnemonic? (but not for popups)
 */
		if(type == XmMENU_PULLDOWN && item->mnemonic) {
			XtVaSetValues(
				w,
				XmNmnemonic,	item->mnemonic,
				NULL);
		}
/*
 * Is there an accelerator? N.b. accelerator is not allowed for
 * a pull-right submenu.
 */
		if(!item->pullright && item->accelerator) {
			lab = XmStringCreateSimple(item->accelerator_text);
			XtVaSetValues(
				w,
				XmNaccelerator,		item->accelerator,
				XmNacceleratorText, 	lab,
				NULL);
			XmStringFree(lab);
		}
/*
 * Is there a callback? Again not sensible for pull-right submenu
*/
		if(!item->pullright && item->callback) {
			XtAddCallback(
				w, XmNactivateCallback,
				item->callback, item->callback_data);
		}
	}
}

static Widget setup_menu_aux(
	Widget	parent,
	int	type,
	char	*menu_title,
	char	menu_mnemonic,
	Bool	tear_off_enabled,
	MenuItem	*items)
{
	Widget		menu, cascade;
	XmString	lab;
	if(type == XmMENU_POPUP) {
/*
 * just create the popup menu:
 */
		menu = XmCreatePopupMenu(parent, "menu", NULL, 0);
	} else {
/*
 * Create the pulldown menu and its cascade button:
 */
		if(tear_off_enabled) {
			XtVaSetValues(
				menu,
				XmNtearOffModel,	XmTEAR_OFF_ENABLED,
				NULL);
		}
		menu = XmCreatePulldownMenu(parent, "menu", NULL, 0);
		lab = XmStringCreateSimple(menu_title);
		cascade = XtVaCreateManagedWidget(
			menu_title, xmCascadeButtonGadgetClass, parent,
			XmNsubMenuId,	menu,
			XmNlabelString,	lab,
			XmNmnemonic,	menu_mnemonic,
			NULL);
		XmStringFree(lab);
	}

	setup_menu_items(menu, type, items);

	return type == XmMENU_POPUP ? menu : cascade;
}

Widget setup_menu(
	Widget  parent,
	int	type,
	char    *menu_title,
	char    menu_mnemonic,
	Bool    tear_off_enabled,
	MenuItem        *items)
{
	Widget  cascade, menu;
	if(type == XmMENU_POPUP) {
		return 
			setup_menu_aux(
				parent, type, menu_title,
				menu_mnemonic, tear_off_enabled, items);
	} else {
		Widget cascade, menu;
		cascade = setup_menu_aux(
				parent, type, menu_title,
				menu_mnemonic, tear_off_enabled, items);
		XtVaGetValues(
				cascade,
				XmNsubMenuId,   &menu,
				NULL);
		return menu;
	}
}

void resetup_menu(
	Widget		menu,
	int		type,
	MenuItem	*items)
{
	Widget *btns;
	NAT num_btns;
	Bool sens;
	int i;

	XtVaGetValues(menu, XmNchildren, &btns,
		XmNnumChildren, &num_btns, NULL);

	for(i = 0; i < num_btns; ++i) {
		XtDestroyWidget(btns[i]);
	}

	setup_menu_items(menu, type, items);	
}

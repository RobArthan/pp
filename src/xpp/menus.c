

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$
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


Widget setup_pulldown_menu(
	Widget	parent,
	char	*menu_title,
	char	menu_mnemonic,
	Bool	tear_off_enabled,
	MenuItem	*items)
{
	Widget		menu, cascade, w;
	MenuItem	*item;
	XmString	lab;
/*
 * Create the menu and its cascade button:
 */
	lab = XmStringCreateSimple(menu_title);
	menu = XmCreatePulldownMenu(parent, "menu", NULL, 0);
	if(tear_off_enabled) {
		XtVaSetValues(
			menu,
			XmNtearOffModel,	XmTEAR_OFF_ENABLED,
			NULL);
	}
	cascade = XtVaCreateManagedWidget(
		menu_title, xmCascadeButtonGadgetClass, parent,
		XmNsubMenuId,	menu,
		XmNlabelString,	lab,
		XmNmnemonic,	menu_mnemonic,
		NULL);
	XmStringFree(lab);
/*
 * Loop round the menu items
 */
	for (item = items; item->label; ++item) {
/*
 * Is this a pull-right submenu?
 */
		if(item->pullright) {
			w = setup_pulldown_menu(
				menu,
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
 * Is there a mnemonic?
 */
		if(item->mnemonic) {
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
	return cascade;
}


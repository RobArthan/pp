

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$
 *
 * undo.c -  text window undo facility for the X/Motif ProofPower
 * Interface
 *
 * (c) ICL 1993, 1994
 *
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _undo
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#include <string.h>
#include <stdio.h>
#include "xpp.h"

/* The following is used to implement undo in the edit menu */

typedef struct undo_details {
	Widget text_w;
	Widget menu_w;
	NAT menu_entry_offset;
	Boolean can_undo;			/* true iff. can do an undo */
	Boolean moved_away;			/* true if the change is complete */
	Boolean undoing;			/* true while undo in progress */
	Boolean in_business;			/* true if first & last are valid */
	unsigned char undo_redo_index; 	/* 0 means undo ; 1 means redo */
	NAT first, last;			/* position in text of chars to */
						/* be replaced by an undo */
	char *oldtext;				/* deleted characters to put in */
} UndoBuffer;




static Boolean changed = False;

static char *undo_redo[2] = {"Undo", "Redo"};

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * clear_undo: unset changed flag and do other re-initialisations
 * when a file is saved, loaded or whatever
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void clear_undo(UndoBuffer *ub)
{
	ub->can_undo = False;
	ub->moved_away = True;
	ub->in_business = False;
	ub->first = 0;
	ub->last = 0;
	ub->undoing = False;
	ub->undo_redo_index = 0;
	if(ub->oldtext != NULL) {
		XtFree(ub->oldtext);
		ub->oldtext = NULL;
	}
	if(ub->menu_w) {
		set_menu_item_sensitivity(ub->menu_w,
				ub->menu_entry_offset, False);
		set_menu_item_label(ub->menu_w,
			ub->menu_entry_offset, undo_redo[0]);
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_undo: attach an undo capability to a text window.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
XtPointer add_undo(
		Widget	text_w,
		Widget menu_w,
		NAT menu_entry_offset)
{
	UndoBuffer *ub;
	if(!(ub = (UndoBuffer *)XtMalloc(sizeof(UndoBuffer)))) {
		return NULL;
	}
	ub->text_w = text_w;
	ub->menu_w = menu_w;
	ub->menu_entry_offset = menu_entry_offset;
	ub->oldtext = NULL;
	clear_undo(ub);	/* rest of initialisation etc. */
	return (XtPointer) ub;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * MONITORING CHANGES FOR THE UNDO COMMAND
 * **** **** **** **** **** **** **** **** **** **** **** **** */
/*
 * What follows implements a very simple undo/redo facility.
 * Undoable actions are:
 *
 *	typing a single character (possibly overstriking many others)
 *	cut
 *	paste (possibly overstriking some chars)
 *	undo/redo
 *
 * Only the last action is undoable
 */
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Monitor cursor motions:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void undo_motion_cb(
	Widget				text_w,
	UndoBuffer			*ub,
	XmTextVerifyCallbackStruct	cbs)
{
	/* ub->moved_away = True; */
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Reinitialise the undo buffer. N.b. initialisation of the `last'
 * component almost always has to be reassigned. Following gives
 * an undo which would not change the text.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void reinit_undo_buffer (
	UndoBuffer	*ub,
	XmTextVerifyCallbackStruct *cbs,
	Boolean cu)
{
	ub->can_undo = cu;
	ub->moved_away = False;
	ub->first = cbs->startPos;
	ub->last = cbs->startPos;
	ub->in_business = True;
	if(ub->oldtext != NULL) {
		XtFree(ub->oldtext);
		ub->oldtext = NULL;
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Monitor typed input:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void undo_modify_cb(
	Widget				text_w,
	UndoBuffer			*ub,
	XmTextVerifyCallbackStruct	*cbs)
{
	NAT len;
	char *cut_chars;
	static char *prefix(), *affix();

	if(	!cbs->text->length &&
		!ub->undoing &&
		cbs->endPos == cbs->startPos + 1 &&
		(cbs->endPos == ub->last || cbs->startPos == ub->last) &&
		ub->in_business) {
				/* deleting single character at end of 
					 current typing thread */
		if(cbs->endPos == ub->last) {
				/* deleting last char of current thread */
			if(ub->last > ub-> first) {
				--ub->last;
			} else {
				/* deleting char before start of current thread */
				char buf[2];
				if(XmTextGetSubstring(ub->text_w,
						cbs->startPos, 1, 2, buf)
					!= XmCOPY_SUCCEEDED) {
						reinit_undo_buffer(ub, cbs, False);
				} else {
					ub->can_undo = True;
					ub->moved_away = False;
					ub->first = cbs->startPos;
					ub->last = cbs->startPos;	
					ub->oldtext = prefix(buf[0], ub->oldtext);
				}
			}
		} else {	/* deleting char after start of current thread */
			char buf[2];
			if(XmTextGetSubstring(ub->text_w,
					cbs->startPos, 1, 2, buf)
				!= XmCOPY_SUCCEEDED) {
					reinit_undo_buffer(ub, cbs, False);
			} else {
				ub->can_undo = True;
				ub->moved_away = False;
				ub->last = cbs->startPos;	
				ub->oldtext = affix(buf[0], ub->oldtext);
			}
		}
	} else if(cbs->startPos < cbs->endPos) {
				/* deleted something else */
		len = cbs->endPos - cbs->startPos;
		cut_chars = XtMalloc(len + 1);
		if(XmTextGetSubstring(ub->text_w,
				cbs->startPos, len, len+1, cut_chars)
			!= XmCOPY_SUCCEEDED) {
			reinit_undo_buffer(ub, cbs, False);
		} else {
			cut_chars[len] = '\0';
			reinit_undo_buffer(ub, cbs, True); /* for the XtFree */
			ub->moved_away = False;
			ub->first = cbs->startPos;
			ub->last = cbs->startPos + cbs->text->length;	
			ub->oldtext = cut_chars;
		}
	} else if (ub->moved_away || ub->last != cbs->startPos) {
					/* started typing somewhere new */
		reinit_undo_buffer(ub, cbs, True);
		ub->last = cbs->startPos + cbs->text->length;
	} else {
					/* just carried on typing */
		ub->last += cbs->text->length;
	}
	if(ub->menu_w) {
		set_menu_item_sensitivity(ub->menu_w,
			ub->menu_entry_offset, ub->can_undo);
/* If this isn't the call invoked by the XmReplace in undo_cb */
/* The menu label should revert to "Undo": */
		if(!ub->undoing) {
			ub->undo_redo_index = 0;
			set_menu_item_label(ub->menu_w,
				ub->menu_entry_offset, undo_redo[0]);
		}
	}
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Do an undo. Note that the text replacement will cause
 * the modify/verify call back undo_modify_cb to be invoked
 * so that the next undo will undo the undo (i.e. undo + undo = redo).
 * Since this will change the undo buffer we must copy the relevant
 * fields. We must set the moved_away field to indicate that we're
 * script_modify_cb is to stop accumulating changes.
 * Any text inserted by the undo is selected and the insertion
 * position is set to the end of the undo point. The beginning
 * of the new selection (or the insertion point if no text was
 * inserted) is manoeuvred into view in the window.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void undo_cb(
	Widget			text_w,
	UndoBuffer		*ub,
	XmAnyCallbackStruct	cbs)
{
	XmTextPosition fst, lst;
	NAT len;
	char *str;
	if(ub->can_undo) {
		ub->undoing = True;
		ub->moved_away = True;
		if(ub->oldtext == NULL) {
			len = 0;
			str = XtMalloc(len + 1);
			strcpy(str, "");
		} else {
			len = strlen(ub->oldtext);
			str = XtMalloc(len + 1);
			strcpy(str, ub->oldtext);
		};
		fst = ub->first;
		lst = ub->last;
		text_show_position(ub->text_w, fst);
		XmTextReplace(ub->text_w, fst, lst, str);
		ub->undo_redo_index = 1 - ub->undo_redo_index;
		set_menu_item_label(ub->menu_w, ub->menu_entry_offset,
				undo_redo[ub->undo_redo_index]);
		if(len) {
			XmTextSetSelection(ub->text_w, fst, fst+len, CurrentTime);
		} else {
			XmTextSetInsertionPosition(ub->text_w, fst);
		}
		XtFree(str);
		ub->undoing = False;
	}
}
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * string manipulating utilities:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static char *prefix(char ch, char *str)
{
	if(str) {
		char *p;
		char this, prev;
		str = XtRealloc(str, strlen(str) + 2);
		for(p = str, prev = ch; prev; ++p) {
			this = *p;
			*p = prev;
			prev = this;
		}
		*p = '\0';
	} else {
		str = XtMalloc(2);
		str[0] = ch;
		str[1] = '\0';
	}
	return str;
}
static char *affix(char ch, char *str)
{
	if(str) {
		char *p;
		NAT len;
		len = strlen(str);
		str = XtRealloc(str, len + 2);
		str[len] = ch;
		str[len+1] = '\0';
	} else {
		str = XtMalloc(2);
		str[0] = ch;
		str[1] = '\0';
	}
	return str;
}

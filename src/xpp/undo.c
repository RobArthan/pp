/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: undo.c,v 2.17 2003/08/01 11:13:13 rda Exp rda $
 *
 * undo.c -  text window undo facility for the X/Motif ProofPower
 * Interface
 *
 * undo.c: this file is part of the PPTex system
 *
 * Copyright (c) 2002 Lemma 1 Ltd.
 * 
 * See the file LICENSE for your rights to use and change this file.
 *
 * Contact: Rob Arthan < rda@lemma-one.com >
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

/* Messages for various purposes: */
static char *changes_saved_warning = "The file has been saved since "
                                     "you last changed it.  Do you "
                                     "really want to undo the last change?";

static char *read_only_warning = "The read-only option is turned on. "
				 "Do you really want to turn this option off "
				 "and edit the text?";

/* The following is used to implement undo/redo in the edit menu */
static NAT next_debug_no = 0;
typedef struct undo_node {
	NAT debug_no;           /* only for debugging */
	Boolean in_business;    /* true if first & last are valid */
	Boolean changes_saved;  /* true if changes have been saved */
	Boolean moved_away;     /* true if the change is complete */
	NAT first,              /* position in text of chars to */
	    last;               /* be replaced by an undo */
	char *oldtext;          /* deleted characters to put in */
	NAT   oldtextSize;      /* current amount of space in the oldtext buffer */
    Boolean was_null;
	struct undo_node *next,
	                 *prev;
} UndoNode;

/* This is the base structure */
typedef struct undo_details {
	Widget text_w;
	Widget *menu_ws;
	NAT undo_menu_entry_offset;
	NAT redo_menu_entry_offset;
	Boolean can_undo;               /* true iff. can do an undo */
	Boolean can_redo;               /* true iff. can do a redo */
	Boolean undoing;                /* true while undo in progress */
	Boolean noMemory;               /* very serious when true! */
	Boolean enabled;                /* false when a file load's happening */
	UndoNode *root;
	UndoNode *active;
} UndoBuffer;

/* Pre-reserved, emergency, space */
#define RESERVEDSPACE 1000000

/* Slightly safer memory allocation.                  *
 * If a malloc or realloc fails then free off the     *
 * emergency space and try again (this can only be    *
 * done once).  The emergency space is allocated when *
 * the master UndoBuffer is allocated.                */


static Boolean noMemory(UndoBuffer *ub);
static void lowMemoryWarning(UndoBuffer *ub);

static char *emergencySpace = (char *) NULL;

static char *lXtMalloc(size_t size, UndoBuffer *ub, Boolean *answer)
{
	char *retVal;
	retVal = XtMalloc(size);
	if (!retVal && emergencySpace) {
		XtFree(emergencySpace);
		emergencySpace = (char *) NULL;
		retVal = XtMalloc(size);
		if (retVal) {
			lowMemoryWarning(ub);
		}
	}
	if (!retVal) {
		*answer = noMemory(ub);
	}
	return retVal;
}

static void lXtFree(char *ptr)
{
	/* This function isn't really needed, but is *
	 * here to leave a consistant naming scheme  */
	XtFree(ptr);
}

static char *lXtRealloc(char *ptr, size_t size, UndoBuffer *ub, Boolean *answer)
{
	char *retVal;
	retVal = XtRealloc(ptr, size);
	if (!retVal && emergencySpace) {
		XtFree(emergencySpace);
		emergencySpace = (char *) NULL;
		retVal = XtRealloc(ptr, size);
		if (retVal) {
			lowMemoryWarning(ub);
		}
	}
	if (!retVal) {
		*answer = noMemory(ub);
	}
	return retVal;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Accessor functions to the undo structures
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static char *oldtext(UndoBuffer *ub)
{
	static char emptyString[] = "";
	if(ub->active == (UndoNode *) NULL) {
		return emptyString;
	}
	if(ub->active->oldtext == (char *) NULL) {
		return emptyString;
	}
	return ub->active->oldtext;
}

static void setOldtext(UndoBuffer *ub, char *value)
{
	/* NB the space for value is not allocated here */
	if(ub->active == (UndoNode *) NULL) {
		return;
	}
	if(ub->active->oldtext != (char *) NULL) {
		lXtFree(ub->active->oldtext);
	}
	ub->active->oldtext     = value;
	ub->active->oldtextSize = strlen(value) + 1;
}
static void clearOldtext(UndoBuffer *ub)

{
	if(ub->active == (UndoNode *) NULL) {
		return;
	}
	if(ub->active->oldtext == (char *) NULL) {
		return;
	}
	*(ub->active->oldtext) = '\0';
	/* Don't free anything now, it's possible the next thing done will *
	 * be a realloc.  If it isn't the old value will be freed then.    */
}

static Boolean growOldtextTo(UndoBuffer *ub, NAT len, Boolean *answer)
{
	/* Make the oldtext buffer (at least) len+1 big */
	char *ptr;

	if(ub->active == (UndoNode *) NULL) {
		return False;
	}

	if(len < ub->active->oldtextSize) {
		/* There's already enough space */
		return True;
	}

	if(ub->active->oldtextSize == 0 || ub->active->oldtext == (char *) NULL) {
		ptr = lXtMalloc(len+1, ub, answer);
		if(ptr) {
			*ptr = '\0';
		}
	} else {
		ptr = ub->active->oldtext;
		ptr = lXtRealloc(ptr, len+1, ub, answer);
	}
	if(!ptr) {
		return False;
	}
	ub->active->oldtext     = ptr;
	ub->active->oldtextSize = len+1;

	return True;
}

#define MIN_OT_SIZE 128
#define OT_GROWTH_FACTOR 0.25
static Boolean growOldtext(UndoBuffer *ub, Boolean *answer)
{
	/* Make the oldtext buffer (at least) one character bigger */
	NAT len,
	    newSize;
	char *ptr;

	/* There's a fair chance that the next thing that will happen *
	 * after causing the oldText string to grow is that it will   *
	 * grow again.  So reallocs are done in bigger chunks.        */

	if(ub->active == (UndoNode *) NULL) {
		return False;
	}

	len = 0;
	if(ub->active->oldtextSize != 0 && ub->active->oldtext != (char *) NULL) {
		len = strlen(ub->active->oldtext);
	}
	if(len+1 < ub->active->oldtextSize) {
		/* There's already enough space */
		return True;
	}
	
	if(len+1 < MIN_OT_SIZE) {
		newSize = MIN_OT_SIZE;
	} else {
		newSize  = ub->active->oldtextSize;
		newSize += newSize * OT_GROWTH_FACTOR;
		if(newSize == ub->active->oldtextSize) {
			newSize += MIN_OT_SIZE;
		}
	}
	if(ub->active->oldtextSize == 0 || ub->active->oldtext == (char *) NULL) {
		ptr = lXtMalloc(newSize, ub, answer);
		if(!ptr) {
			/* we're in real trouble, but try to be helpful */
			newSize = len+2;
			ptr = lXtMalloc(newSize, ub, answer);
			if(ptr) {
				lowMemoryWarning(ub);
			}
		}
		if(ptr) {
			*ptr = '\0';
		}
	} else {
		ptr = ub->active->oldtext;
		ptr = lXtRealloc(ptr, newSize, ub, answer);
		if(!ptr) {
			/* as above, we're really in trouble, but try to be helpful */
			newSize = len+2;
			ptr = ub->active->oldtext;
			ptr = lXtRealloc(ptr, newSize, ub, answer);
			if(ptr) {
				lowMemoryWarning(ub);
			}
		}
	}
	if(!ptr) {
		return False;
	}
	ub->active->oldtext     = ptr;
	ub->active->oldtextSize = newSize;

	return True;
}
static Boolean prefixOldtext(UndoBuffer *ub, char ch, Boolean *answer)
{
	char *p,
	     this,
	     prev;

	if(ub->active == (UndoNode *) NULL) {
		return False;
	}
	if(!growOldtext(ub, answer)) {
		return False;
	}

	for(p = ub->active->oldtext, prev = ch; prev; ++p) {
		this = *p;
		*p = prev;
		prev = this;
	}
	*p = '\0';

	return True;
}
static Boolean affixOldtext(UndoBuffer *ub, char ch, Boolean *answer)
{
	char *p;

	if(ub->active == (UndoNode *) NULL) {
		return False;
	}
	if(!growOldtext(ub, answer)) {
		return False;
	}

	p = ub->active->oldtext;
	while (*p != '\0') {
		p++;
	}
	*p++ = ch;
	*p   = '\0';

	return True;
}

static Boolean was_null(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return False;
	}
	return ub->active->was_null;
}
static void setWas_null(UndoBuffer *ub, Boolean value)
{
	if(ub->active == (UndoNode *) NULL) {
		return;
	}
	ub->active->was_null = value;
}

static Boolean moved_away(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return True;
	}
	return ub->active->moved_away;
}
static void setMoved_away(UndoBuffer *ub, Boolean value)
{
	if(ub->active == (UndoNode *) NULL) {
		return;
	}
	ub->active->moved_away = value;
}

static Boolean in_business(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return False;
	}
	return ub->active->in_business;
}
static void setIn_business(UndoBuffer *ub, Boolean value)
{
	if(ub->active == (UndoNode *) NULL) {
		return;
	}
	ub->active->in_business = value;
}

static Boolean changes_saved(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return False;
	}
	return ub->active->changes_saved;
}
static void setChanges_saved(UndoBuffer *ub, Boolean value)
{
	UndoNode *ptr;

	/* It only makes sense for one node to have a changes_saved = True, *
     * so we may need to walk the NodeBuffer list forwards ...          */

	if(ub->active == (UndoNode *) NULL) {
		if(ub->root != (UndoNode *) NULL) {
			ptr = ub->root;
			while(ptr != (UndoNode *) NULL) {
				ptr->changes_saved = False;
				ptr = ptr->next;
			};
		}
		return;
	}
	ub->active->changes_saved = value;
	if(!value) {
		return;
	}

	ptr = ub->active->next;
	while(ptr != (UndoNode *) NULL) {
		ptr->changes_saved = False;
		ptr = ptr->next;
	}
	/* ... or backwards */
	ptr = ub->active->prev;
	while(ptr != (UndoNode *) NULL) {
		ptr->changes_saved = False;
		ptr = ptr->prev;
	}
}

static NAT first(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return 0;
	}
	return ub->active->first;
}
static void setFirst(UndoBuffer *ub, NAT value)
{
	if(ub->active == (UndoNode *) NULL) {
		return;
	}
	ub->active->first = value;
}

static NAT last(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return 0;
	}
	return ub->active->last;
}
static void setLast(UndoBuffer *ub, NAT value)	
{
	if(ub->active == (UndoNode *) NULL) {
		return;
	}
	ub->active->last = value;
}


/*
 * (more) memory handling functions
 */

/* Called if we appear to be low on memory (actually *
 * detecting this is a bit hit and miss, though)     */
static void lowMemoryWarning(UndoBuffer *ub) {
	memory_warning_dialog(ub->text_w, True);
}

static void setUndo(UndoBuffer *ub, Boolean state);
static void setRedo(UndoBuffer *ub, Boolean state);
/* Called if we've run out of memory (i.e. it's serious) */
/* The return value always false at present. (Could be response from user) */
static Boolean noMemory(UndoBuffer *ub) {
	if(ub->noMemory) {
		return False;	/* we already know */
	}
	ub->noMemory = True;
	nomemory_dialog(ub->text_w, True);
	return False;
}


/* a (sort of) destructor */
static Boolean freeUndoNodesInner(UndoBuffer *ub, UndoNode *nd)
{
	if(nd == (UndoNode *) NULL) {
		return False;
	}
	(void) freeUndoNodesInner(ub, nd->next);
	nd->next = (UndoNode *) NULL;
	nd->prev = (UndoNode *) NULL;
	if(nd->oldtext != (char *) NULL) {
		lXtFree(nd->oldtext);
		nd->oldtext     = (char *) NULL;
		nd->oldtextSize = 0;
	}
	lXtFree((char *) nd);
	return True;
}
static void freeUndoNodes(UndoBuffer *ub, UndoNode *nd)
{
	if (!freeUndoNodesInner(ub, nd)) {
		/* nothing got freed */
		return;
	}
	ub->noMemory = False;
	if (! emergencySpace) {
		/* In case we've used the reserve, try to get it back */
		emergencySpace = XtMalloc(RESERVEDSPACE);
	}
}


/* a (sort of) constructor */
static Boolean newUndoNode(UndoBuffer *ub, Boolean *answer)
{
	UndoNode *new;
	*answer = False;
	new = (UndoNode *) lXtMalloc(sizeof(UndoNode), ub, answer);
	if(!new) {
		return False;
	}
	new->debug_no      = ++next_debug_no;
	new->moved_away    = True;
	new->first         = 0;
	new->last          = 0;
	new->in_business   = False;
	new->changes_saved = False;
	new->oldtext       = (char *) NULL;
	new->oldtextSize   = 0;
	new->was_null      = False;
	new->next          = (UndoNode *) NULL;
	new->prev          = (UndoNode *) NULL;

	/* now add the new node to the chain */
	if(ub->root == (UndoNode *) NULL) {
		freeUndoNodes(ub, ub->active);  /* paranoi! */
		ub->root   = new;
		ub->active = new;
		return True;
	}

	/* ditch any redo chain */
	if(ub->active != (UndoNode *) NULL) {
		freeUndoNodes(ub, ub->active->next);
	} else {
		/* this happens when undone to the start */
		freeUndoNodes(ub, ub->root);
		ub->root   = new;
		ub->active = new;
		return True;
	}

	new->prev        = ub->active;
	ub->active->next = new;

	/* move the active node */
	ub->active = new;

	return True;
}

/* move the active node forwards ... */
static void backtrack(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return;
	}
	ub->active = ub->active->prev;
}

/* ... and backwards */
static void retrack(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		ub->active = ub->root;
		return;
	}
	ub->active = ub->active->next;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Utility functions to set the sensitivity of the buttons
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static void setUndo(UndoBuffer *ub, Boolean state)
{
	Widget *wp;
	if(ub->can_undo != state) {
		ub->can_undo = state;
		if(ub->menu_ws) {
			for(wp = ub->menu_ws; *wp; ++wp) {
				set_menu_item_sensitivity(*wp,
				                          ub->undo_menu_entry_offset,
				                          state);
			}
		}
	}
}


static void setRedo(UndoBuffer *ub, Boolean state)
{
	Widget *wp;
	if(ub->can_redo != state) {
		ub->can_redo = state;
		if(ub->menu_ws) {
			for(wp = ub->menu_ws; *wp; ++wp) {
				set_menu_item_sensitivity(*wp,
				                          ub->redo_menu_entry_offset,
				                          state);
			}
		}
	}
}


/* set the menu buttons properly according to the undoNodes */
static void setUndoRedo(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		setUndo(ub, False);
		setRedo(ub, ub->root != (UndoNode *) NULL);
		return;
	}
	setUndo(ub, True);
	setRedo(ub, ub->active->next != (UndoNode *) NULL);
}



/* can an undo/redo actually be done according to the structures? */
static Boolean canUnRedo(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return False;
	}
	return True;
}


/* **** **** **** **** **** **** **** **** **** **** **** **** *
 * clear_undo: put the undo buffer back in a pristine state.   *
 * e.g., used when a file is loaded.                           *
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void clear_undo(XtPointer xtp)
{
	UndoBuffer *ub = xtp;
	Widget *wp;

	/* force undo/redo to be False */
	ub->can_undo = True;
	ub->can_redo = True;
	setUndo(ub, False);
	setRedo(ub, False);

	freeUndoNodes(ub, ub->root);
	ub->root   = (UndoNode *) NULL;
	ub->active = (UndoNode *) NULL;

	ub->undoing = False;
	ub->enabled = True;

	if(ub->menu_ws) {
		for(wp = ub->menu_ws; *wp; ++wp) {
			set_menu_item_label(*wp,
			                    ub->undo_menu_entry_offset,
			                    "Undo");
			set_menu_item_label(*wp,
			                    ub->redo_menu_entry_offset,
			                    "Redo");
		}
	}
}

/* Called just before doing an open, revert or empty file.  All undoing *
 * will be disabled (in order to stop any memory being allocated        *
 * unnecessarily).  This is safe as the first thing to be done after    *
 * the file load or clear has been completed will be to call clear_undo *
 * (which will discard any undo structure, so it's pointless allocating *
 * any for the file load.   clear_undo resets this state to normal.     */
void pause_undo(XtPointer xtp)
{
	UndoBuffer *ub = xtp;
	ub->enabled = False;
	setUndo(ub, False);
	setRedo(ub, False);
}

/* Only needed if an open failed, otherwise clear_undo gets called */
void unpause_undo(XtPointer xtp)
{
	UndoBuffer *ub = xtp;
	ub->enabled = True;
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * notify_save: set the changes_saved flag to provoke a warning
 * if the user asks to undo; also set the moved_away to tell
 * undo_modify_cb to stop accumulating changes and set the
 * and update the menus accordingly.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void notify_save(XtPointer xtp)
{
	UndoBuffer *ub = xtp;
	setChanges_saved(ub, True);
	setMoved_away(ub,    True);
}


/* **** **** **** **** **** **** **** **** **** **** **** **** **** **** *
 * add_undo: attach an undo capability to a text window (called once).   *
 * **** **** **** **** **** **** **** **** **** **** **** **** **** **** */
XtPointer add_undo(
		Widget	text_w,
		Widget *menu_ws,
		NAT undo_menu_entry_offset,
		NAT redo_menu_entry_offset)
{
	UndoBuffer *ub;
	/* NB this Malloc must not use the local one and ... */
	emergencySpace = XtMalloc(RESERVEDSPACE);
	/* don't need to handle errors */

	/* ... this Malloc can't use the local one (which needs ub) */
	if(!(ub = (UndoBuffer *) XtMalloc(sizeof(UndoBuffer)))) {
		fprintf(stderr, "A serious problem has happened, "
		                "unable to allocate space for the undo root\n");
		return NULL;
	}

	/* Set-up the no memory and warning dialogs in case needed laster */
	nomemory_dialog(text_w, False);
	memory_warning_dialog(text_w, False);

	ub->text_w                 = text_w;
	ub->menu_ws                = menu_ws;
	ub->undo_menu_entry_offset = undo_menu_entry_offset;
	ub->redo_menu_entry_offset = redo_menu_entry_offset;
	ub->root                   = (UndoNode *) NULL;
	ub->active                 = (UndoNode *) NULL;
	ub->undoing                = False;
	ub->noMemory               = False;
	clear_undo(ub);	/* rest of initialisation etc. */
	return (XtPointer) ub;
}




/* **** **** **** **** **** **** **** **** **** **** **** **** **** *
 * Reinitialise the undo buffer.  NB initialisation of the `last'   *
 * component almost always has to be reassigned.  Following gives   *
 * an undo which would not change the text.                         *
 * **** **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean reinit_undo_buffer (
	UndoBuffer	*ub,
	XmTextVerifyCallbackStruct *cbs,
	Boolean cu,
	Boolean *answer)
{
	if(!ub->undoing) {
		setUndo(ub, cu);
		setRedo(ub, False);
	}

	if(!ub->undoing || ub->active == (UndoNode *) NULL) {
		if(!newUndoNode(ub, answer)) {
			return False;
		}
	}
	setMoved_away(ub,  False);
	setFirst(ub,       cbs->startPos);
	setLast(ub,        cbs->startPos);
	setIn_business(ub, True);
	return True;
}


/* **** **** **** **** **** **** **** **** **** *
 * MONITORING CHANGES FOR THE UNDO COMMAND      *
 * **** **** **** **** **** **** **** **** **** */
/*
 * The undoable actions are:
 *
 *	typing a single character (possibly overstriking many others)
 *	cut
 *	paste (possibly overstriking some chars)
 *	undo/redo
 *
 */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Monitor typed input:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean undoModifyCB(
	Widget		text_w,
	UndoBuffer *ub,
	XtPointer	xtp_cbs,
	Boolean    *noMA)
{
	XmTextVerifyCallbackStruct *cbs = xtp_cbs;
	NAT len;
	Widget *wp;

	if(!cbs->text->length &&
	   !ub->undoing &&
	   cbs->endPos == cbs->startPos + 1 &&
	   (cbs->endPos == last(ub) || cbs->startPos == last(ub)) &&
	   in_business(ub)) {
		/* deleting single character at end of current typing thread */
		if(cbs->endPos == last(ub)) {
			if(last(ub) > first(ub)) {
				/* deleting last char of current thread */
				setLast(ub, last(ub) - 1);
			} else {
				/* deleting char before start of current thread */
				char buf[2];
				if(XmTextGetSubstring(ub->text_w,
				                      cbs->startPos,
				                      1,
				                      2,
				                      buf) != XmCOPY_SUCCEEDED) {
					/* I havn't figured out why this code is here as *
					 * we'll only be at this point if the above call *
					 * couldn't copy the text buffer, so we're not   *
					 * going to be able to undo it since we don't    *
					 * know what to undo it to.        PG 2002 05 13 */
					if(!reinit_undo_buffer(ub, cbs, False, noMA)) {
						return False;
					}
				} else {
					char *newptr;
					setUndo(ub, True);
					setMoved_away(ub, False);
					setFirst(ub,      cbs->startPos);
					setLast(ub,       cbs->startPos);
					if(!prefixOldtext(ub, buf[0], noMA)) {
						return False;
					}
				}
			}
		} else {	/* deleting char after start of current thread */
			char buf[2];
			if(XmTextGetSubstring(ub->text_w,
			                      cbs->startPos,
			                      1,
			                      2,
			                      buf) != XmCOPY_SUCCEEDED) {
				/* See the comment below the call to *
				 * XmTextGetSubstring above this one */
				if(!reinit_undo_buffer(ub, cbs, False, noMA)) {
					return False;
				}
			} else {
				char *newptr;
				setUndo(ub, True);
				setMoved_away(ub, False);
				setLast(ub,       cbs->startPos);
				if(!affixOldtext(ub, buf[0], noMA)) {
						return False;
				}
			}
		}
	} else if(cbs->startPos < cbs->endPos) {
		char *cut_chars;
		/* deleted something else */
		len = cbs->endPos - cbs->startPos;

		if(!reinit_undo_buffer(ub, cbs, True, noMA)) {
			return False;
		}
		if(!growOldtextTo(ub, len, noMA)) {
			return False;
		}
		if(XmTextGetSubstring(ub->text_w,
                              cbs->startPos,
                              len,
                              len+1,
                              oldtext(ub)) == XmCOPY_SUCCEEDED) {
			char *ptr = oldtext(ub)+len;
			*ptr = '\0';

			setMoved_away(ub, False);
			setFirst(ub,      cbs->startPos);
			setLast(ub,       cbs->startPos + cbs->text->length);	
		} else {
			if(!ub->undoing) {
				setUndo(ub, False);
			}
		}
	} else if(ub->undoing && cbs->startPos == cbs->endPos) {
		/* undoing a delete */
		if(!reinit_undo_buffer(ub, cbs, False, noMA)) {
			return False;
		}
		setMoved_away(ub, False);
		setFirst(ub,      cbs->startPos);
		setLast(ub,       cbs->startPos + cbs->text->length);	
		clearOldtext(ub);
	} else if(moved_away(ub) || last(ub) != cbs->startPos) {
		/* started typing somewhere new */
		if(!reinit_undo_buffer(ub, cbs, True, noMA)) {
			return False;
		}
		setLast(ub, cbs->startPos + cbs->text->length);
	} else {
		/* just carried on typing */
		setLast(ub, last(ub) + cbs->text->length);
	}

	if(ub->menu_ws && !ub->undoing) {
		/* If this isn't the call invoked by the *
		 * the XmReplace in undo_cb turn Undo on */
		setUndo(ub, True);
		setRedo(ub, False);
	}

	return True;
}

void undo_modify_cb(
	Widget		text_w,
	XtPointer	cbd,
	XtPointer	xtp_cbs)
{
	UndoBuffer *ub = cbd;
	XmTextVerifyCallbackStruct *cbs = xtp_cbs;
	Boolean noMemoryAnswer = False;
	if(!ub->enabled) {
		return;
	}
	if(global_options.read_only){
		if(yes_no_dialog(text_w, read_only_warning, "Confirm") ) {
			set_read_only(False);
			show_modified(True);
		} else {
			cbs-> doit = False;
			return;
		}
	} else {
		show_modified(False);
	}
	text_verify_cb(text_w, cbd, xtp_cbs);
	if(!undoModifyCB(text_w, ub, xtp_cbs, &noMemoryAnswer)) {
	}
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Do an undo/redo. Note that the text replacement will cause
 * the modify/verify call back undo_modify_cb to be invoked
 * so that the next undo will undo the undo (i.e. undo + undo = redo).
 * Since this will change the undo buffer we must copy the relevant
 * fields. We must set the moved_away field to indicate that
 * undo_modify_cb is to stop accumulating changes.
 * Any text inserted by the undo is selected and the insertion
 * position is set to the end of the undo point. The beginning
 * of the new selection (or the insertion point if no text was
 * inserted) is manoeuvred into view in the window.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean undoRedo(
	UndoBuffer *ub,
    	Boolean     amUndoing)
{
	XmTextPosition fst, lst;
	NAT len;

	if(canUnRedo(ub)) {
		if(changes_saved(ub) &&
		   amUndoing &&
		   !yes_no_dialog(ub->text_w, changes_saved_warning, "Confirm Undo")) {
			return False;
		}
		ub->undoing = True;
		setMoved_away(ub, True);
		len = strlen(oldtext(ub));
		if(amUndoing) {
			setWas_null(ub, len == 0);
		}
		fst = first(ub);
		lst = last(ub);
		text_show_position(ub->text_w, fst);
		XmTextReplace(ub->text_w, fst, lst, oldtext(ub));

		if(len) {
			XmTextSetSelection(ub->text_w, fst, fst+len, CurrentTime);
		} else {
			XmTextSetInsertionPosition(ub->text_w, fst);
		}

		ub->undoing = False;
		if(!amUndoing && was_null(ub)) {
			clearOldtext(ub);
		}
	}
	return True;
}


void undo(XtPointer undo_ptr)
{
	UndoBuffer *ub = undo_ptr;
	if(!ub->enabled) {
		return;
	}

	if(undoRedo(ub, True)) {
    		backtrack(ub);
		setUndoRedo(ub);
	}
}


void redo(XtPointer undo_ptr)
{
	UndoBuffer *ub = undo_ptr;
	if(!ub->enabled) {
		return;
	}

	retrack(ub);
	if(undoRedo(ub, False)) {
		setUndoRedo(ub);
	} else {
		backtrack(ub);
	}
}

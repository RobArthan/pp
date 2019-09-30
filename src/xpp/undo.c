/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: undo.c,v 2.29 2011/02/12 10:17:57 rda Exp rda $
 *
 * undo.c -  text window undo facility for the X/Motif ProofPower
 * Interface
 *
 * undo.c: this file is part of the PPXpp package
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
typedef struct undo_node {
	Boolean changes_saved;   /* true if changes have been saved */
	Boolean change_complete; /* true if the change is complete */
	Cardinal first,          /* position in text of chars to */
	         last;           /* be replaced by an undo */
	wchar_t *old_text;       /* deleted characters to put in */
	Cardinal old_text_size;  /* current number of wide characters
				    available in the old_text buffer */
    Boolean was_null;
	struct undo_node *next,
	                 *prev;
} UndoNode;

/* This is the base structure */
typedef struct undo_details {
	Widget text_w;
	Widget *menu_ws;
	Cardinal undo_menu_entry_offset;
	Cardinal redo_menu_entry_offset;
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
static void low_memory_warning(UndoBuffer *ub);

static char *emergencySpace = (char *) NULL;

static char *lXtMalloc(size_t size, UndoBuffer *ub, Boolean *answer)
{
	char *ret_val;
	ret_val = XtMalloc(size);
	if (!ret_val && emergencySpace) {
		XtFree(emergencySpace);
		emergencySpace = (char *) NULL;
		ret_val = XtMalloc(size);
		if (ret_val) {
			low_memory_warning(ub);
		}
	}
	if (!ret_val) {
		*answer = noMemory(ub);
	}
	return ret_val;
}

static void lXtFree(char *ptr)
{
	/* This function isn't really needed, but is *
	 * here to leave a consistant naming scheme  */
	XtFree(ptr);
}

static char *lXtRealloc(char *ptr, size_t size, UndoBuffer *ub, Boolean *answer)
{
	char *ret_val;
	ret_val = XtRealloc(ptr, size);
	if (!ret_val && emergencySpace) {
		XtFree(emergencySpace);
		emergencySpace = (char *) NULL;
		ret_val = XtRealloc(ptr, size);
		if (ret_val) {
			low_memory_warning(ub);
		}
	}
	if (!ret_val) {
		*answer = noMemory(ub);
	}
	return ret_val;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Accessor functions to the undo structures
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static wchar_t *old_text(UndoBuffer *ub)
{
	static wchar_t emptyString[] = L"";
	if(ub->active == (UndoNode *) NULL) {
		return emptyString;
	}
	if(ub->active->old_text == (wchar_t *) NULL) {
		return emptyString;
	}
	return ub->active->old_text;
}

static void clear_old_text(UndoBuffer *ub)

{
	if(ub->active == (UndoNode *) NULL) {
		return;
	}
	if(ub->active->old_text == (wchar_t *) NULL) {
		return;
	}
	*(ub->active->old_text) = L'\0';
	/* Don't free anything now, it's possible the next thing done will *
	 * be a realloc.  If it isn't the old value will be freed then.    */
}

static Boolean grow_old_text_to(UndoBuffer *ub, Cardinal len, Boolean *answer)
{
	/* Make the old_text buffer (at least) len+1 big */
	wchar_t *ptr;

	if(ub->active == (UndoNode *) NULL) {
		return False;
	}

	if(len < ub->active->old_text_size) {
		/* There's already enough space */
		return True;
	}

	if(ub->active->old_text_size == 0 || ub->active->old_text == (wchar_t *) NULL) {
		ptr = (wchar_t*)lXtMalloc((len+1)*sizeof(wchar_t), ub, answer);
		if(ptr) {
			*ptr = '\0';
		}
	} else {
		ptr = ub->active->old_text;
		ptr = (wchar_t*)lXtRealloc((char*)ptr,
					(len+1)*sizeof(wchar_t), ub, answer);
	}
	if(!ptr) {
		return False;
	}
	ub->active->old_text     = ptr;
	ub->active->old_text_size = len+1;

	return True;
}

/*
 The units for MIN_OT_SIZE are wide characters, not bytes.
 */
#define MIN_OT_SIZE 128
#define OT_GROWTH_FACTOR 0.25
static Boolean grow_old_text(UndoBuffer *ub, Boolean *answer)
{
	/* Make the old_text buffer (at least) one character bigger */
	Cardinal len, new_size;
	wchar_t *ptr;

	/* There's a fair chance that the next thing that will happen *
	 * after causing the oldText string to grow is that it will   *
	 * grow again.  So reallocs are done in bigger chunks.        */

	if(ub->active == (UndoNode *) NULL) {
		return False;
	}

	len = 0;
	if(ub->active->old_text_size != 0 &&
				ub->active->old_text != (wchar_t*) NULL) {
		len = wcslen(ub->active->old_text);
	}
	if(len+1 < ub->active->old_text_size) {
		/* There's already enough space */
		return True;
	}
	
	if(len+1 < MIN_OT_SIZE) {
		new_size = MIN_OT_SIZE;
	} else {
		new_size  = ub->active->old_text_size;
		new_size += new_size * OT_GROWTH_FACTOR;
		if(new_size == ub->active->old_text_size) {
			new_size += MIN_OT_SIZE;
		}
	}
	if(ub->active->old_text_size == 0 ||
				ub->active->old_text == (wchar_t*) NULL) {
		ptr = (wchar_t*)lXtMalloc(new_size*sizeof(wchar_t), ub, answer);
		if(!ptr) {
			/* we're in real trouble, but try to be helpful */
			new_size = len+2;
			ptr = (wchar_t*)lXtMalloc(new_size*sizeof(wchar_t), ub,
									answer);
			if(ptr) {
				low_memory_warning(ub);
			}
		}
		if(ptr) {
			*ptr = '\0';
		}
	} else {
		ptr = ub->active->old_text;
		ptr = (wchar_t*)lXtRealloc((char*)ptr,
				new_size*sizeof(wchar_t), ub, answer);
		if(!ptr) {
			/* as above, we're really in trouble, but try to be helpful */
			new_size = len+2;
			ptr = ub->active->old_text;
			ptr = (wchar_t*)lXtRealloc((char*)ptr,
					new_size*sizeof(wchar_t), ub, answer);
			if(ptr) {
				low_memory_warning(ub);
			}
		}
	}
	if(!ptr) {
		return False;
	}
	ub->active->old_text     = ptr;
	ub->active->old_text_size = new_size;

	return True;
}
static Boolean prefix_old_text(UndoBuffer *ub, wchar_t ch, Boolean *answer)
{
	wchar_t *p,
	     this,
	     prev;

	if(ub->active == (UndoNode *) NULL) {
		return False;
	}
	if(!grow_old_text(ub, answer)) {
		return False;
	}

	for(p = ub->active->old_text, prev = ch; prev; ++p) {
		this = *p;
		*p = prev;
		prev = this;
	}
	*p = L'\0';

	return True;
}
static Boolean affix_old_text(UndoBuffer *ub, wchar_t ch, Boolean *answer)
{
	wchar_t *p;

	if(ub->active == (UndoNode *) NULL) {
		return False;
	}
	if(!grow_old_text(ub, answer)) {
		return False;
	}

	p = ub->active->old_text;
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
static void set_was_null(UndoBuffer *ub, Boolean value)
{
	if(ub->active == (UndoNode *) NULL) {
		return;
	}
	ub->active->was_null = value;
}
static Boolean change_complete(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return True;
	}
	return ub->active->change_complete;
}
static void set_change_complete(UndoBuffer *ub, Boolean value)
{
	if(ub->active == (UndoNode *) NULL) {
		return;
	}
	ub->active->change_complete = value;
}
static Boolean changes_saved(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return False;
	}
	return ub->active->changes_saved;
}
static Boolean in_sync(UndoBuffer *ub)
{
	UndoNode *ptr;
	if(ub->active != (UndoNode *) NULL) {
		return ub->active->changes_saved;
	}
	ptr = ub->root;
	while(ptr != (UndoNode *) NULL) {
		if(ptr->changes_saved) {
			return False;
		}
		ptr = ptr->next;
	}
	return True;
}
static void set_changes_saved(UndoBuffer *ub, Boolean value)
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
			}
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

static Cardinal first(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return 0;
	}
	return ub->active->first;
}
static void set_first(UndoBuffer *ub, Cardinal value)
{
	if(ub->active == (UndoNode *) NULL) {
		return;
	}
	ub->active->first = value;
}

static Cardinal last(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return 0;
	}
	return ub->active->last;
}
static void set_last(UndoBuffer *ub, Cardinal value)	
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
static void low_memory_warning(UndoBuffer *ub) {
	memory_warning_dialog(ub->text_w, True);
}

static void set_undo(UndoBuffer *ub, Boolean state);
static void set_redo(UndoBuffer *ub, Boolean state);
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
	if(nd->old_text != (wchar_t *) NULL) {
		lXtFree((char*)nd->old_text);
		nd->old_text     = (wchar_t *) NULL;
		nd->old_text_size = 0;
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
	new->change_complete    = True;
	new->first              = 0;
	new->last               = 0;
	new->changes_saved      = False;
	new->old_text           = (wchar_t *) NULL;
	new->old_text_size      = 0;
	new->was_null           = False;
	new->next               = (UndoNode *) NULL;
	new->prev               = (UndoNode *) NULL;

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
static void set_undo(UndoBuffer *ub, Boolean state)
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


static void set_redo(UndoBuffer *ub, Boolean state)
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
static void set_undoRedo(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		set_undo(ub, False);
		set_redo(ub, ub->root != (UndoNode *) NULL);
		return;
	}
	set_undo(ub, True);
	set_redo(ub, ub->active->next != (UndoNode *) NULL);
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
	set_undo(ub, False);
	set_redo(ub, False);

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
	set_undo(ub, False);
	set_redo(ub, False);
}

/* Only needed if an open failed, otherwise clear_undo gets called */
void unpause_undo(XtPointer xtp)
{
	UndoBuffer *ub = xtp;
	ub->enabled = True;
	set_undoRedo(ub);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * notify_save: set the changes_saved flag to provoke a warning
 * if the user asks to undo; also set the change_complete flag to tell
 * undo_modify_cb that the current thread of typing is complete.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void notify_save(XtPointer xtp)
{
	UndoBuffer *ub = xtp;
	set_changes_saved(ub, True);
	set_change_complete(ub, True);
}


/* **** **** **** **** **** **** **** **** **** **** **** **** **** **** *
 * add_undo: attach an undo capability to a text window (called once).   *
 * **** **** **** **** **** **** **** **** **** **** **** **** **** **** */
XtPointer add_undo(
		Widget	text_w,
		Widget *menu_ws,
		Cardinal undo_menu_entry_offset,
		Cardinal redo_menu_entry_offset)
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
 * Reinitialise the undo buffer so that a new undo entry can be entered.
 * If we are undoing or redoing, we can overwrite the active node, since
 * the information lost from the undo buffer will be put into the text
 * widget; otherwise, we add a new node to the list.
 * NB the initialisation of the `last' component sets first and last
 * to the start position from cbs and the old_text to NULL and moved away
 * to false (this gives an undo that will do nothing).
 * **** **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean reinit_undo_buffer (
	UndoBuffer	*ub,
	XmTextVerifyCallbackStructWcs *cbs,
	Boolean cu,
	Boolean *answer)
{
	if(!ub->undoing) {
		set_undo(ub, cu);
		set_redo(ub, False);
	}

	if(!ub->undoing || ub->active == (UndoNode *) NULL) {
		if(!newUndoNode(ub, answer)) {
			return False;
		}
	}
	set_change_complete(ub, False);
	set_first(ub, cbs->startPos);
	set_last(ub, cbs->startPos);
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
 *
 * An undoable action replaces one substring of the text with
 * another. We want to avoid having an undo node for every character
 * typed or deleted so we treat those cases specially.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean monitor_typing(
	Widget		text_w,
	UndoBuffer *ub,
	XmTextVerifyCallbackStructWcs	*cbs,
	Boolean    *noMA)
{
	Cardinal len, lst = last(ub);

	if(!cbs->text->length &&
	   !ub->undoing &&
	   cbs->endPos == cbs->startPos + 1 &&
	   (cbs->endPos == lst || cbs->startPos == lst)) {
		/* the user is deleting single character adjacent to the end of the current thread */
		wchar_t buf[2];
		if(lst > first(ub)) {
			/* start a new thread if there are any typed characters to remember */
			if(!reinit_undo_buffer(ub, cbs, True, noMA)) {
				return False;
			}
		}
		if(XmTextGetSubstringWcs(ub->text_w,
		                         cbs->startPos,
		                         1,
		                         2,
		                         buf) != XmCOPY_SUCCEEDED) {
			/* Motif must have run out of memory */
			*noMA = noMemory(ub);
			return False;
		}
		set_undo(ub, True);
		set_change_complete(ub, False);
		if(cbs->endPos == lst) { /* deleting to left of end of thread */
			/* adjust first and last to allow for deletion */
			set_first(ub, cbs->startPos);
			set_last(ub, cbs->startPos);
			if(!prefix_old_text(ub, buf[0], noMA)) {
					return False;
			}
		} else { /* deleting to right of end of thread */
			if(!affix_old_text(ub, buf[0], noMA)) {
					return False;
			}
		}
	} else if(cbs->startPos < cbs->endPos) {
		/* deleted or overtyped one character not adjacent to end of thread */
		/* or deleted or overtyped more than one character */
		/* (possibly in undo/redo) */
		len = cbs->endPos - cbs->startPos;

		if(!reinit_undo_buffer(ub, cbs, True, noMA)) {
			return False;
		}
		if(!grow_old_text_to(ub, len, noMA)) {
			return False;
		}
		if(XmTextGetSubstringWcs(ub->text_w,
                              cbs->startPos,
                              len,
                              len+1,
                              old_text(ub)) == XmCOPY_SUCCEEDED) {
			wchar_t *ptr = old_text(ub)+len;
			*ptr = L'\0';

			set_change_complete(ub, False);
			set_first(ub, cbs->startPos);
			set_last(ub, cbs->startPos + cbs->text->length);	
		} else {
			/* Our buffer was big enough, so Motif must have run out of memory */
			*noMA = noMemory(ub);
		}
	} else if(ub->undoing && cbs->startPos == cbs->endPos) {
		/* undoing a delete */
		if(!reinit_undo_buffer(ub, cbs, False, noMA)) {
			return False;
		}
		set_change_complete(ub, False);
		set_first(ub, cbs->startPos);
		set_last(ub, cbs->startPos + cbs->text->length);	
		clear_old_text(ub);
	} else if(
		(cbs->text->length != 0 && *old_text(ub) != 0)
					/* typed something and last change deleted something */
	||	change_complete(ub)	/* open, save or undo since last change */
	||	lst != cbs->startPos /* started typing somewhere new */
	||	cbs->text->length > 1) { /* multi-character insert: e.g., paste */
		if(!reinit_undo_buffer(ub, cbs, True, noMA)) {
			return False;
		}
		set_last(ub, cbs->startPos + cbs->text->length);
	} else {
		/* In this branch, we must have: */
		/* cbs.endPos == cbs.startPos == last && */
		/* !change_complete(ub) && (so not very first change) */
		/* cbs->text->length <= 1 */
		/* If cbs->text->length == 1, just carried on typing */
		/* If cbs->text->length == 0, Motif notified no change */
		/* In either case the following will do: */
		set_last(ub, lst + cbs->text->length);
	}

	if(ub->menu_ws && !ub->undoing) {
		/* If this isn't the call invoked by the *
		 * the XmReplace in undo_cb turn Undo on */
		set_undo(ub, True);
		set_redo(ub, False);
	}

	return True;
}
/*
 * The main modify/verify callback: undo_modify_cb. In addition to
 * monitoring changes so they can be undone and redone, this is used
 * to fix up a problem with the Motif text widget:
 * It is quite easy to delete text that is not visible on the screen
 * accidentally. If this happens it is good to scroll to the position
 * where the deletion occurred to give the user a clue. Unfortunately,
 * with drag-and-drop via shift+btn2, in a single operation (as far
 * as the user is concerned) you can delete some off-screen text
 * and simultaneously insert it into the on-screen text. In this
 * case, the default Motif treatment is the best we can give (which
 * is to display the newly inserted text). Unfortunately, this operation
 * is not treated atomically by Motif which treats it as an insertion
 * followed by a deletion. We use a work proc and some state to address this.
 * The sequence of calls will be that the modify/verify callback will be
 * called once or twice for each operation. Each time it is called it
 * registers a work proc and updates the flags in the following struct
 * if appropriate. The work proc will not be called until the callbacks for
 * a single user operation have been called. When the work proc is called
 * it can take the appropriate action for the combined operation and then
 * clear the flags. It may then get called again unnecessarily, but that
 * does not matter (because the second call will see both flags false).
 */
static struct {
	Boolean inserting, deleting_off_screen;
	Widget text_w;
	XmTextPosition pos;} work_proc_info = {False, False, 0, 0};
static Boolean undo_modify_work_proc(XtPointer unused)
{
	if(work_proc_info.deleting_off_screen && !work_proc_info.inserting) {
		XmTextSetInsertionPosition(
				work_proc_info.text_w,
				work_proc_info.pos);
	}
	work_proc_info.deleting_off_screen = work_proc_info.inserting = False;
	return True; /* don't want to be called again */
}
void undo_modify_cb(
	Widget		text_w,
	XtPointer	cbd,
	XtPointer	xtp_cbs)
{
	UndoBuffer *ub = cbd;
	XmTextVerifyCallbackStructWcs *cbs = xtp_cbs;
	Boolean noMemoryAnswer = False;
	Position ignored_x, ignored_y;
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
	(void)monitor_typing(text_w, ub, cbs, &noMemoryAnswer);
	if(	cbs->text->length == 0
	&&	cbs->startPos < cbs->endPos
	&&	!XmTextPosToXY(text_w, cbs->startPos, &ignored_x, &ignored_y)
	&&	!XmTextPosToXY(text_w, cbs->endPos, &ignored_x, &ignored_y)) {
		/* deleted text that's not currently on display; */
		work_proc_info.text_w = text_w;
		work_proc_info.pos = cbs->startPos;
		work_proc_info.deleting_off_screen = True;
	} else if (cbs->text->length != 0) {
		work_proc_info.inserting = True;
	}
	/* schedule work proc to set insertion position
	   to highlight offscreen deletion, if necessary. */
	XtAppAddWorkProc(app, undo_modify_work_proc, 0);
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Do an undo/redo. Caller's responsibility to check that the data
 * structures will allow the operation.
 * We must set the change_complete field to indicate that
 * undo_modify_cb is to stop accumulating changes.
 * Any text inserted by the undo is selected and the insertion
 * position is set to the end of the undo point. The beginning
 * of the new selection (or the insertion point if no text was
 * inserted) is manoeuvred into view in the window.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean undo_redo(
	UndoBuffer *ub,
    	Boolean     amUndoing)
{
	XmTextPosition fst, lst;
	Cardinal len;

	if(changes_saved(ub) &&
	   amUndoing &&
	   !yes_no_dialog(ub->text_w, changes_saved_warning, "Confirm Undo")) {
		return False;
	}
	ub->undoing = True;
	set_change_complete(ub, True);
	len = wcslen(old_text(ub));
	if(amUndoing) {
		set_was_null(ub, len == 0);
	}
	fst = first(ub);
	lst = last(ub);
	text_show_position(ub->text_w, fst);
	XmTextReplaceWcs(ub->text_w, fst, lst, old_text(ub));

	if(len) {
		XmTextSetSelection(ub->text_w, fst, fst+len, CurrentTime);
	} else {
		XmTextSetInsertionPosition(ub->text_w, fst);
	}

	ub->undoing = False;
	if(!amUndoing && was_null(ub)) {
		clear_old_text(ub);
	}
	return True;
}


void undo(XtPointer undo_ptr)
{
	UndoBuffer *ub = undo_ptr;
	if(!ub->enabled || !ub->can_undo) {
		return;
	}

	if(undo_redo(ub, True)) {
    		backtrack(ub);
		set_undoRedo(ub);
	}
	if(in_sync(ub)) {
		show_unmodified();
	}
}


void redo(XtPointer undo_ptr)
{
	UndoBuffer *ub = undo_ptr;
	if(!ub->enabled || !ub->can_redo) {
		return;
	}

	retrack(ub);
	if(undo_redo(ub, False)) {
		set_undoRedo(ub);
	} else {
		backtrack(ub);
	}
	if(in_sync(ub)) {
		show_unmodified();
	}
}

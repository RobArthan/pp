/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: undo.c,v 2.7 2002/03/22 13:57:41 phil Exp phil $
 *
 * undo.c -  text window undo facility for the X/Motif ProofPower
 * Interface
 *
 * (c) ICL 1993, 1994
 *
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static char rcsid[] = "$Id: undo.c,v 2.7 2002/03/22 13:57:41 phil Exp phil $";

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

static char* changes_saved_warning =
"The file has been saved since you last changed it. "
"Do you really want to undo the last change?";


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
	UndoNode *root;
	UndoNode *active;
} UndoBuffer;


/* Debug functions */
#define DBGMAX 47
static char *debugFormatText(char *in)
{
	static char out[DBGMAX + 3];
	char *iptr = in,
	     *optr = out;
	NAT cnt = 0;
	if(in == (char *) NULL) {
		return "<null>";
	}
	*optr++ = '"';
	while(cnt < (DBGMAX - 5)) {
	switch(*iptr) {
		case '\0':
			*optr++ = '"';
			*optr = *iptr;
			return out;
			break;
		case '\n':
			*optr++ = '\\';
			*optr   = 'n';
			break;
		case '\t':
			*optr++ = '\\';
			*optr   = 't';
			break;
		case '\r':
			*optr++ = '\\';
			*optr   = 'r';
			break;
		default:
			*optr = *iptr;
			break;
		}
		iptr++;
		optr++;
		cnt++;
	}
	*optr++ = ' ';
	*optr++ = '.';
	*optr++ = '.';
	*optr++ = '.';
	*optr++ = '"';
	*optr   = '\0';
	return out;
}

static void dumpUndoStack(UndoBuffer *ub, char *where)
{
	UndoNode *ptr;
	char buf[4];
	fprintf(stderr, "Undo Stack dump at %s\n", where);
	sprintf(buf, "%s%s%s",
	        ub->can_undo ? "U" : "_",
	        ub->can_redo ? "R" : "_",
	        ub->undoing  ? "U" : "_");
	ptr = ub->root;
	if(ptr == (UndoNode *) NULL) {
		fprintf(stderr, "%s <empty>\n", buf);
	} else {
		while(ptr != (UndoNode *) NULL) {
			fprintf(stderr,
			        "%s %2d%s %s%s%s%s %4d - %4d [%3d] %s\n",
			        buf,
			        ptr->debug_no,
			        (ptr == ub->active) ? "A" : " ",
			        ptr->in_business   ? "B" : "_",
			        ptr->changes_saved ? "S" : "_",
			        ptr->moved_away    ? "M" : "_",
			        ptr->was_null      ? "n" : "_",
			        ptr->first,
			        ptr->last,
			        (ptr->oldtext == (char *) NULL) ? 0 : strlen(ptr->oldtext),
			        debugFormatText(ptr->oldtext));
			sprintf(buf, "   ");
			ptr = ptr->next;
		}
	}
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Accessor functions
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static char *oldtext(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return (char *) NULL;
	}
	return ub->active->oldtext;
}
void setOldtext(UndoBuffer *ub, char *value)
{
	if(ub->active == (UndoNode *) NULL) {
		return;
	}
	ub->active->oldtext = value;
}
void clearOldtext(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return;
	}
	sprintf(ub->active->oldtext, "");
}

static Boolean was_null(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return False;
	}
	return ub->active->was_null;
}
void setWas_null(UndoBuffer *ub, Boolean value)
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
void setMoved_away(UndoBuffer *ub, Boolean value)
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
void setIn_business(UndoBuffer *ub, Boolean value)
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
void setChanges_saved(UndoBuffer *ub, Boolean value)
{
	UndoNode *ptr;

	/* It only makes sense for one node to have a changes_saved = True,
     * so we may need to walk the NodeBuffer list forwards ... */

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
void setFirst(UndoBuffer *ub, NAT value)
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
void setLast(UndoBuffer *ub, NAT value)	
{
	if(ub->active == (UndoNode *) NULL) {
		return;
	}
	ub->active->last = value;
}


/* memory handling */
/* Called if we've run out of memory (i.e. it's serious) */
static void noMemory(UndoBuffer *ub) {
	if(ub->noMemory) {
		return;	/* we already know */
	}
	ub->noMemory = True;
	/* should display a dialogue box here */
	fprintf(stderr, "Have run out of memory\n");
}


/* a (sort of) destructor */
void freeUndoNodes(UndoBuffer *ub, UndoNode *nd)
{
	if(nd == (UndoNode *) NULL) {
		return;
	}
	freeUndoNodes(ub, nd->next);
	nd->next = (UndoNode *) NULL;
	nd->prev = (UndoNode *) NULL;
	if(nd->oldtext != (char *) NULL) {
		XtFree(nd->oldtext);
		nd->oldtext = (char *) NULL;
	}
	XtFree((char *) nd);
	ub->noMemory = False;
}


/* a (sort of) constructor */
Boolean newUndoNode(UndoBuffer *ub)
{
	UndoNode *new;
	new = (UndoNode *) XtMalloc(sizeof(UndoNode));
	if(!new) {
		noMemory(ub);
		return False;
	}
	new->debug_no      = ++next_debug_no;
	new->moved_away    = True;
	new->first         = 0;
	new->last          = 0;
	new->in_business   = False;
	new->changes_saved = False;
	new->oldtext       = (char *) NULL;
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

void backtrack(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return;
	}
	ub->active = ub->active->prev;
}

void retrack(UndoBuffer *ub)
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


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * clear_undo: put the undo buffer back in a pristine state.
 * e.g., used when a file is loaded.
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


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * add_undo: attach an undo capability to a text window.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
XtPointer add_undo(
		Widget	text_w,
		Widget *menu_ws,
		NAT undo_menu_entry_offset,
		NAT redo_menu_entry_offset)
{
	UndoBuffer *ub;
	if(!(ub = (UndoBuffer *)XtMalloc(sizeof(UndoBuffer)))) {
		fprintf(stderr, "A serious problem has happened, "
		                "unable to allocate space for the undo root\n");
		return NULL;
	}
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
	Widget		text_w,
	XtPointer	cbd,
	XtPointer	cbs)
{
	/* setMoved_away(ub, True); */
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Reinitialise the undo buffer. N.b. initialisation of the `last'
 * component almost always has to be reassigned. Following gives
 * an undo which would not change the text.
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static Boolean reinit_undo_buffer (
	UndoBuffer	*ub,
	XmTextVerifyCallbackStruct *cbs,
	Boolean cu)
{
	if(!ub->undoing) {
		setUndo(ub, cu);
		setRedo(ub, False);
	}

	if(!ub->undoing || ub->active == (UndoNode *) NULL) {
		if(!newUndoNode(ub)) {
			return False;
		}
	}
	setMoved_away(ub,  False);
	setFirst(ub,       cbs->startPos);
	setLast(ub,        cbs->startPos);
	setIn_business(ub, True);
	return True;
}


/* forward declarations */
static char *prefix(UndoBuffer *ub, char ch, char *str),
            *affix (UndoBuffer *ub, char ch, char *str);
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * Monitor typed input:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
void undo_modify_cb(
	Widget		text_w,
	XtPointer	cbd,
	XtPointer	xtp_cbs)
{
	UndoBuffer *ub = cbd;
	XmTextVerifyCallbackStruct *cbs = xtp_cbs;
	NAT len;
	char *cut_chars;
	Widget *wp;

	if(ub->noMemory) {
		setUndo(ub, False);
		setRedo(ub, False);
		return;
	}

	if(!cbs->text->length &&
	   !ub->undoing &&
	   cbs->endPos == cbs->startPos + 1 &&
	   (cbs->endPos == last(ub) || cbs->startPos == last(ub)) &&
	   in_business(ub)) {
		/* deleting single character at end of current typing thread */
		if(cbs->endPos == last(ub)) {
				/* deleting last char of current thread */
			if(last(ub) > first(ub)) {
				setLast(ub, last(ub) - 1);
			} else {
				/* deleting char before start of current thread */
				char buf[2];
				if(XmTextGetSubstring(ub->text_w, cbs->startPos, 1, 2, buf)
					!= XmCOPY_SUCCEEDED) {
						if(!reinit_undo_buffer(ub, cbs, False)) {
							return;
						}
				} else {
					setUndo(ub, True);
					setMoved_away(ub, False);
					setFirst(ub,      cbs->startPos);
					setLast(ub,       cbs->startPos);	
					setOldtext(ub,    prefix(ub, buf[0], oldtext(ub)));
				}
			}
		} else {	/* deleting char after start of current thread */
			char buf[2];
			if(XmTextGetSubstring(ub->text_w,
					cbs->startPos, 1, 2, buf)
				!= XmCOPY_SUCCEEDED) {
					if(!reinit_undo_buffer(ub, cbs, False)) {
						return;
					}
			} else {
				setUndo(ub, True);
				setMoved_away(ub, False);
				setLast(ub,       cbs->startPos);	
				setOldtext(ub,    affix(ub, buf[0], oldtext(ub)));
			}
		}
	} else if(cbs->startPos < cbs->endPos) {
				/* deleted something else */
		len = cbs->endPos - cbs->startPos;
		cut_chars = XtMalloc(len + 1);
		if(!cut_chars) {
			noMemory(ub);
			return;
		}
		if(XmTextGetSubstring(ub->text_w, cbs->startPos, len, len+1, cut_chars)
			!= XmCOPY_SUCCEEDED) {
			if(!reinit_undo_buffer(ub, cbs, False)) {
				return;
			}
		} else {
			cut_chars[len] = '\0';
			if(!reinit_undo_buffer(ub, cbs, True)) { /* for the XtFree */
				return;
			}
			setMoved_away(ub, False);
			setFirst(ub,      cbs->startPos);
			setLast(ub,       cbs->startPos + cbs->text->length);	
			setOldtext(ub,    cut_chars);
		}
	} else if(moved_away(ub) || last(ub) != cbs->startPos) {
					/* started typing somewhere new */
		if(!reinit_undo_buffer(ub, cbs, True)) {
			return;
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
	Widget		text_w,
	UndoBuffer *ub,
	XtPointer	cbs,
    Boolean     amUndoing)
{
	XmTextPosition fst, lst;
	NAT len;
	char *str;

	if(canUnRedo(ub)) {
		if(changes_saved(ub) &&
		   amUndoing &&
           !yes_no_dialog(text_w, changes_saved_warning)) {
			return False;
		}
		ub->undoing    = True;
		setMoved_away(ub, True);
		if(oldtext(ub) == NULL) {
			len = 0;
			str = XtMalloc(len + 1);
			if(!str) {
				noMemory(ub);
				return False;
			}
			strcpy(str, "");
			if(amUndoing) {
				setWas_null(ub, True);
			}
		} else {
			len = strlen(oldtext(ub));
			if(amUndoing) {
				setWas_null(ub, len == 0);
			}
			str = XtMalloc(len + 1);
			if(!str) {
				noMemory(ub);
				return False;
			}
			strcpy(str, oldtext(ub));
		};
		fst = first(ub);
		lst = last(ub);
		text_show_position(ub->text_w, fst);
		XmTextReplace(ub->text_w, fst, lst, str);

		if(len) {
			XmTextSetSelection(ub->text_w, fst, fst+len, CurrentTime);
		} else {
			XmTextSetInsertionPosition(ub->text_w, fst);
		}

		XtFree(str);
		ub->undoing = False;
		if(!amUndoing && was_null(ub) && oldtext(ub) != (char *) NULL) {
			clearOldtext(ub);
		}
	}
	return True;
}


void undo_cb(Widget text_w, XtPointer cbd, XtPointer cbs)
{
	UndoBuffer *ub = cbd;

	if(ub->noMemory) {
		setUndo(ub, False);
		setRedo(ub, False);
		return;
	}

	if(undoRedo(text_w, ub, cbs, True)) {
    	backtrack(ub);
		setUndoRedo(ub);
	}
}


void redo_cb(Widget text_w, XtPointer cbd, XtPointer cbs)
{
	UndoBuffer *ub = cbd;

	if(ub->noMemory) {
		setUndo(ub, False);
		setRedo(ub, False);
		return;
	}

	retrack(ub);
	if(undoRedo(text_w, ub, cbs, False)) {
		setUndoRedo(ub);
	} else {
		backtrack(ub);
	}
}


/* **** **** **** **** **** **** **** **** **** **** **** ****
 * string manipulating utilities:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static char *prefix(UndoBuffer *ub, char ch, char *str)
{
	if(str) {
		char *p;
		char this, prev;
		str = XtRealloc(str, strlen(str) + 2);
		if(!str) {
			noMemory(ub);
			return (char *) NULL;
		}
		for(p = str, prev = ch; prev; ++p) {
			this = *p;
			*p = prev;
			prev = this;
		}
		*p = '\0';
	} else {
		str = XtMalloc(2);
		if(!str) {
			noMemory(ub);
			return (char *) NULL;
		}
		str[0] = ch;
		str[1] = '\0';
	}
	return str;
}


static char *affix(UndoBuffer *ub, char ch, char *str)
{
	if(str) {
		char *p;
		NAT len;
		len = strlen(str);
		str = XtRealloc(str, len + 2);
		if(!str) {
			noMemory(ub);
			return (char *) NULL;
		}
		str[len] = ch;
		str[len+1] = '\0';
	} else {
		str = XtMalloc(2);
		if(!str) {
			noMemory(ub);
			return (char *) NULL;
		}
		str[0] = ch;
		str[1] = '\0';
	}
	return str;
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: undo.c,v 2.5 2001/12/15 16:52:27 rda Exp phil $
 *
 * undo.c -  text window undo facility for the X/Motif ProofPower
 * Interface
 *
 * (c) ICL 1993, 1994
 *
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */
static char rcsid[] = "$Id: undo.c,v 2.5 2001/12/15 16:52:27 rda Exp phil $";

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
	Boolean stop_here;      /* stop point when rolling back */
	Boolean in_business;    /* true if first & last are valid */
	Boolean changes_saved;  /* true if changes have been saved */
	Boolean moved_away;     /* true if the change is complete */
	NAT first,              /* position in text of chars to */
	    last;               /* be replaced by an undo */
	char *oldtext;          /* deleted characters to put in */
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
	UndoNode *root;
	UndoNode *active;
} UndoBuffer;

/* Debug functions */
#define DBGMAX 50
static char *debugFormatText(char *in)
{
  static char out[DBGMAX + 1];
  char *iptr = in,
       *optr = out;
  NAT cnt = 0;
  if(in == (char *) NULL) {
   return (char *) NULL;
  }
  while(cnt < (DBGMAX - 5)) {
   switch(*iptr) {
    case '\0':
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
  *optr   = '\0';
  return out;
}

static void dumpUndoStack(UndoBuffer *ub, char *where)
{
 UndoNode *ptr;
 fprintf(stderr, "Undo Stack dump at %s\n", where);
 fprintf(stderr, "%s%s%s",
         ub->can_undo ? "U" : "_",
         ub->can_redo ? "R" : "_",
         ub->undoing  ? "U" : "_");
 ptr = ub->root;
 if(ptr == (UndoNode *) NULL) {
  fprintf(stderr, " <empty>");
 } else {
  while(ptr != (UndoNode *) NULL) {
   fprintf(stderr,
           "\n   %2d%s %s%s%s%s %4d - %4d \"%s\"",
           ptr->debug_no,
           (ptr == ub->active) ? "A" : " ",
           ptr->stop_here     ? "S" : "_",
           ptr->in_business   ? "B" : "_",
           ptr->changes_saved ? "S" : "_",
           ptr->moved_away    ? "M" : "_",
           ptr->first,
           ptr->last,
           debugFormatText(ptr->oldtext));
   ptr = ptr->next;
  }
 }
 fprintf(stderr, "\n");
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
	ub->active->oldtext = value;
}

static Boolean stop_here(UndoBuffer *ub)
{
	if(ub->active == (UndoNode *) NULL) {
		return True;
	}
	return ub->active->stop_here;
}
void setStop_here(UndoBuffer *ub, Boolean value)
{
	ub->active->stop_here = value;
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
	ub->active->changes_saved = value;
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
	ub->active->last = value;
}


/* memory handling */
/* a (sort of) destructor */
void freeUndoNodes(UndoNode *nd)
{
	if(nd == (UndoNode *) NULL) {
		return;
	}
	freeUndoNodes(nd->next);
fprintf(stderr, "freeUndoNodes[%d]\n", nd->debug_no);
	nd->next = (UndoNode *) NULL;
	nd->prev = (UndoNode *) NULL;
	if(nd->oldtext != (char *) NULL) {
		XtFree(nd->oldtext);
		nd->oldtext = (char *) NULL;
	}
	XtFree((char *) nd);
}


/* a (sort of) constructor */
Boolean newUndoNode(UndoBuffer *ub)
{
	UndoNode *new;
	new = (UndoNode *) XtMalloc(sizeof(UndoNode));
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
	new->next          = (UndoNode *) NULL;
	new->prev          = (UndoNode *) NULL;

	/* now add the new node to the chain */
	if(ub->root == (UndoNode *) NULL) {
		freeUndoNodes(ub->active);  /* paranoi! */
		ub->root   = new;
		ub->active = new;
fprintf(stderr, "newUndoNode no. %d at root\n", ub->active->debug_no);
		return True;
	}

	/* ditch any redo chain */
	if(ub->active != (UndoNode *) NULL) {
		freeUndoNodes(ub->active->next);
	} else {
		/* this happens when undone to the start */
		freeUndoNodes(ub->active);
		ub->root   = new;
		ub->active = new;
fprintf(stderr, "newUndoNode no. %d replaced root\n", ub->active->debug_no);
		return True;
	}

	new->prev        = ub->active;
	ub->active->next = new;

	/* move the active node */
	ub->active = new;
if(new->prev == (UndoNode *) NULL) {
 fprintf(stderr, "newUndoNode no. %d: (first)\n", ub->active->debug_no);
} else {
 fprintf(stderr,
         "newUndoNode no. %d: prev %d\n",
         ub->active->debug_no,
         ub->active->prev->debug_no);
}

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
/*
fprintf(stderr, "setUndo: set to %s\n", state ? "True" : "False");
*/
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
/*
fprintf(stderr, "setRedo: set to %s\n", state ? "True" : "False");
*/
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
static Boolean canUnRedo(UndoBuffer *ub, Boolean amUndoing)
{
	if(ub->active == (UndoNode *) NULL) {
		return False;
		setUndo(ub, False);  /* just in case */
		setRedo(ub, False);
	}
	if(amUndoing) {
		setUndo(ub, True);
		return True;
	}
	if(ub->active->next != (UndoNode *) NULL) {
		setRedo(ub, True);
	}
	setRedo(ub, False);
	return False;
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

	freeUndoNodes(ub->root);
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
dumpUndoStack(ub, "1e");
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
		return NULL;
	}
	ub->text_w                 = text_w;
	ub->menu_ws                = menu_ws;
	ub->undo_menu_entry_offset = undo_menu_entry_offset;
	ub->redo_menu_entry_offset = redo_menu_entry_offset;
	ub->root                   = (UndoNode *) NULL;
	ub->active                 = (UndoNode *) NULL;
	ub->undoing                = False;
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
static void reinit_undo_buffer (
	UndoBuffer	*ub,
	XmTextVerifyCallbackStruct *cbs,
	Boolean cu)
{
fprintf(stderr,
        "reinit_undo_buffer: cu = %s, undoing = %s%s\n",
        cu ? "True" : "False",
        ub->undoing ? "True" : "False",
        (ub->active == (UndoNode *) NULL) ? " no undo buffer" : "");
dumpUndoStack(ub, "2s");
	setUndo(ub, cu);
	setRedo(ub, False);

	if(!ub->undoing || ub->active == (UndoNode *) NULL) {
		if (! newUndoNode(ub)) {
			/* a dialogue is needed here */
			fprintf(stderr, "Oh! Shit!\n");   /* Arrgh! */
		}
	}
	setMoved_away(ub,  False);
	setFirst(ub,       cbs->startPos);
	setLast(ub,        cbs->startPos);
	setIn_business(ub, True);

dumpUndoStack(ub, "2e");
}


static char *prefix(char,char*), *affix(char,char*); /* forward declaration */
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

if(!ub->undoing) {
 dumpUndoStack(ub, "3s");
}

	if(	!cbs->text->length &&
		!ub->undoing &&
		cbs->endPos == cbs->startPos + 1 &&
		(cbs->endPos == last(ub) || cbs->startPos == last(ub)) &&
		in_business(ub)) {
				/* deleting single character at end of 
					 current typing thread */
		if(cbs->endPos == last(ub)) {
				/* deleting last char of current thread */
			if(last(ub) > first(ub)) {
				setLast(ub, last(ub) - 1);
			} else {
				/* deleting char before start of current thread */
				char buf[2];
				if(XmTextGetSubstring(ub->text_w, cbs->startPos, 1, 2, buf)
					!= XmCOPY_SUCCEEDED) {
fprintf(stderr, " --A: calling reinit_undo_buffer(False)\n");
						reinit_undo_buffer(ub, cbs, False);
				} else {
					setUndo(ub, True);
					setMoved_away(ub, False);
					setFirst(ub,      cbs->startPos);
					setLast(ub,       cbs->startPos);	
					setOldtext(ub,    prefix(buf[0], oldtext(ub)));
				}
			}
		} else {	/* deleting char after start of current thread */
			char buf[2];
			if(XmTextGetSubstring(ub->text_w,
					cbs->startPos, 1, 2, buf)
				!= XmCOPY_SUCCEEDED) {
fprintf(stderr, " --B: calling reinit_undo_buffer(False)\n");
					reinit_undo_buffer(ub, cbs, False);
			} else {
				setUndo(ub, True);
				setMoved_away(ub, False);
				setLast(ub,       cbs->startPos);	
				setOldtext(ub,    affix(buf[0], oldtext(ub)));
			}
		}
	} else if(cbs->startPos < cbs->endPos) {
				/* deleted something else */
		len = cbs->endPos - cbs->startPos;
		cut_chars = XtMalloc(len + 1);
		if(XmTextGetSubstring(ub->text_w, cbs->startPos, len, len+1, cut_chars)
			!= XmCOPY_SUCCEEDED) {
fprintf(stderr, " --C: calling reinit_undo_buffer(False)\n");
			reinit_undo_buffer(ub, cbs, False);
		} else {
			cut_chars[len] = '\0';
fprintf(stderr, " --D: calling reinit_undo_buffer(True)\n");
			reinit_undo_buffer(ub, cbs, True); /* for the XtFree */
			setMoved_away(ub, False);
			setFirst(ub,      cbs->startPos);
			setLast(ub,       cbs->startPos + cbs->text->length);	
			setOldtext(ub,    cut_chars);
		}
	} else if(moved_away(ub) || last(ub) != cbs->startPos) {
					/* started typing somewhere new */
fprintf(stderr, " --E: calling reinit_undo_buffer(True)\n");
		reinit_undo_buffer(ub, cbs, True);
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

if(!ub->undoing) {
 dumpUndoStack(ub, "3e");
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
static void undoRedo(
	Widget		text_w,
	UndoBuffer *ub,
	XtPointer	cbs,
    Boolean     amUndoing)
{
	XmTextPosition fst, lst;
	NAT len;
	char *str;

	if(canUnRedo(ub, amUndoing)) {
		if(	changes_saved(ub)
		&&	!yes_no_dialog(text_w, changes_saved_warning)) {
			return;
		}
		ub->undoing    = True;
		setMoved_away(ub, True);
		if(oldtext(ub) == NULL) {
			len = 0;
			str = XtMalloc(len + 1);
			strcpy(str, "");
		} else {
			len = strlen(oldtext(ub));
			str = XtMalloc(len + 1);
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
		setUndo(ub, False);
		setRedo(ub, True);
	}
}


void undo_cb(Widget text_w, XtPointer cbd, XtPointer cbs)
{
	UndoBuffer *ub = cbd;
fprintf(stderr, "undo =====================================================\n");
dumpUndoStack(ub, "4s");
	undoRedo(text_w, ub, cbs, True);
    backtrack(ub);
	setUndoRedo(ub);
dumpUndoStack(ub, "4e");
fprintf(stderr, "undo =====================================================\n");
}


void redo_cb(Widget text_w, XtPointer cbd, XtPointer cbs)
{
	UndoBuffer *ub = cbd;

fprintf(stderr, "redo =====================================================\n");
dumpUndoStack(ub, "5s");
	retrack(ub);
/*	setUndo(ub, True);  /* force a change, undoRedo will set this False ... */
	undoRedo(text_w, ub, cbs, False);
	undoRedo(text_w, ub, cbs, True);
	setUndoRedo(ub);
dumpUndoStack(ub, "5e");
fprintf(stderr, "redo =====================================================\n");
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

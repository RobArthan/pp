
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$
 *
 * pixmaps.c -  creation of pixmaps for the X/Motif ProofPower
 * Interface
 *
 * (c) ICL 1994
 * 
 * The bitmaps (e.g., as made with the bitmap programme) are held
 * in include files, e.g., pp_bitmap.h).
 * For each bitmap a function is supplied here returning an X
 * Pixmap for that bitmap
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros:
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _pixmaps.c

#include "xpp.h"

#include "pp_bitmap.h"

static Pixmap pp_pixmap = 0;

Pixmap get_pp_pixmap(){
	if(!pp_pixmap) {
		pp_pixmap = XCreatePixmapFromBitmapData(
			XtDisplay(root),
			RootWindowOfScreen(XtScreen(root)),
			pp_bitmap_bits,
			pp_bitmap_width,
			pp_bitmap_height,
			BlackPixelOfScreen(XtScreen(root)), /* foreground pixel */
			WhitePixelOfScreen(XtScreen(root)), /* background pixel */
			DefaultDepthOfScreen(XtScreen(root)) /* depth */);
	}
	return pp_pixmap;
}


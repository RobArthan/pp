
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: pixmaps.c,v 2.3 1997/12/03 13:48:27 rda Rel rda $
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
#define _pixmaps

#include "xpp.h"

#include "pp_bitmap.h"

static Pixmap pp_pixmap = 0;

Pixmap get_pp_pixmap(void){
	if(!pp_pixmap) {
		pp_pixmap = XCreatePixmapFromBitmapData(
			XtDisplay(root),
			RootWindowOfScreen(XtScreen(root)),
			(char*)pp_bitmap_bits,
			pp_bitmap_width,
			pp_bitmap_height,
			BlackPixelOfScreen(XtScreen(root)), /* foreground pixel */
			WhitePixelOfScreen(XtScreen(root)), /* background pixel */
			DefaultDepthOfScreen(XtScreen(root)) /* depth */);
	}
	return pp_pixmap;
}


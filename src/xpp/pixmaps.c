
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: pixmaps.c,v 2.4 2001/11/16 17:19:56 rda Exp $
 *
 * pixmaps.c -  creation of pixmaps for the X/Motif ProofPower
 * Interface
 *
 * pixmaps.c: this file is part of the PPTex system
 *
 * Copyright (c) 2002 Lemma 1 Ltd.
 * 
 * See the file LICENSE for your rights to use and change this file.
 *
 * Contact: Rob Arthan < rda@lemma-one.com >
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


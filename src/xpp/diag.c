
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id: diag.c,v 2.2 2002/10/17 17:09:34 rda Exp rda $ 
 *
 * diag.c - debugging tools for the X/Motif ProofPower Interface
 *
 * diag.c: this file is part of the PPTex system
 *
 * Copyright (c) 2002 Lemma 1 Ltd.
 * 
 * See the file LICENSE for your rights to use and change this file.
 *
 * Contact: Rob Arthan < rda@lemma-one.com >
 *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * macros
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#define _diag
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * include files: 
 * **** **** **** **** **** **** **** **** **** **** **** **** */
#include <stdio.h>

#include "xpp.h"

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * msg: print a message to standard error
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void msg(char *s1, char *s2)
{
	if(s2[strlen(s2) - 1] == '\n') {
		fprintf(stderr, "xpp: %s: %s", s1, s2);
	} else {
		fprintf(stderr, "xpp: %s: %s\n", s1, s2);
	};
	fflush(stderr);
}

extern void env_diag(
		char	*fmt,
		char	*value)
{
	if(!pp_env_debug) {
		return;
	}
	fprintf(stderr, "xpp: ");
	fprintf(stderr, fmt, value);
	fprintf(stderr, "\n");
	fflush(stderr);
}

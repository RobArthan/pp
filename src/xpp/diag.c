
/* **** **** **** **** **** **** **** **** **** **** **** ****
 * $Id$ 
 *
 * diag.c - debugging tools for the X/Motif ProofPower Interface
 *
 * (c) ICL 1993
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

void msg(s1, s2)
char *s1, *s2;
{
	if(s2[strlen(s2) - 1] == '\n') {
		fprintf(stderr, "xpp: %s: %s", s1, s2);
	} else {
		fprintf(stderr, "xpp: %s: %s\n", s1, s2);
	};
	fflush(stderr);
}

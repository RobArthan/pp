
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
 * global data
 * **** **** **** **** **** **** **** **** **** **** **** **** */
NAT debug;

/*
 * debug is a bit map as follows:
 *
 *	1 = print messages resulting from calls to diag()
 *	2 = print function entry and exit messages
 *
 * There are #defs for these in xpp.h
 */

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

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * gen_diag: print a message to standard error when given bit
 * in debug is set
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void gen_diag(mask, s1, s2)
NAT mask;
char *s1, *s2;
{
	if (debug & mask) {
		msg(s1, s2);
	};
}

/* **** **** **** **** **** **** **** **** **** **** **** ****
 * diag: print a message to standard error if debug bit 1 is set:
 * **** **** **** **** **** **** **** **** **** **** **** **** */

void diag(s1, s2)
char *s1, *s2;
{
	gen_diag(MESSAGE, s1, s2);
}

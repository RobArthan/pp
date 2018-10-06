#
# sed commands to generate help.c from output of nroff -ms help.txt
#
1i\
/*\
 * Help texts for the ProofPower X/Motif Interface.\
 * This file is automatically created by makehelp.sh from help.txt.\
 * Do not edit.\
 */\
#define _help\
#include "xpp.h"
#
:x
# if it doesn't begin with a * we are in the middle of a section, skip
# special processing of section title.
/^\*/!by
# got here, so in section title; hold the current line
h
# output const String Help_<Section_Title> = 
s/\* *//
s/ /_/g
s/^/const String Help_/
s/$/ =/p
# get original out of hold and turn it into ==== <Section Title> ===
x
s/\* *//
s/.*/==== & ====/
:y
# output current line as a C string with a newline at the end
s/.*/"&\\n"/p
# get next
n
# if non-empty, branch to x.
/./bx
# otherwise we have an empty line:
:z
# if this is the last line output a semicolon
$i\
;
# get next, finish here if no next line.
n
# if empty, branch back to z.
/./!bz
# if it begins with a * output a semicolon and branch to x
/^\*/i\
;
/^\*/bx
# otherwise output a newline string and branch to x
i\
"\\n"
bx

#
# $Id$
# makehelp - ProofPower X/Motif Interface build tool
# This shell script constructs the files and help.c and help.h from help.txt
# using nroff -ms to do the formatting.
# For each item:
# * A Help Title
# ...
# it produces a C string declaration:
# const String Help_A_Help_Title =
# "==== A Help Title ===="
# ...
# It replaces multiple new lines by single ones
rm -f help.c
rm -f help.h
ex -s <<\!
r ! nroff -ms help.txt 
1,/^\*/-1d
g/^$/j|s/./\
&/
%s/ *$//
g/^\*/s/^* *//|s/.*/* &\
==== & ====/
v/^*/s/^/"/|s/$/\\n"/
g/^\*/s/^\* *//|s/ /_/g|s/^/;\
const String Help_/|s/$/ =/
1d
$s/$/;/
0a
/*
 * Help texts for the ProofPower X/Motif Interface.
 * This file is automatically created from help.txt.
 * Do not edit.
 * Made by $RCSfile$ version $Revision$ of $Date$
 */
#define _help
#include "xpp.h"
.
w! help.c
v/^const String Help_/d
%s/^/extern /
%s/ =/;/
0a
/*
 * Help include file for the ProofPower X/Motif Interface.
 * This file is automatically created from help.txt.
 * Do not edit.
 * Made by $RCSfile$ version $Revision$ of $Date$
 */
.
w! help.h
q
!

#
# $Id: makehelp.sh,v 2.1 1994/08/30 13:37:40 djk Exp xpp $
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
# It replaces multiple blank lines by single blank lines
# It assumes that the input does not contain lines containing only
# hash signs and that lines beginning with asterisks are the
# message headers to be turned into C string declarations.
#
# 
rm -f help.c
rm -f help.h
# ex >/dev/null 2>&1 -s <<\!
ed <<\!
r ! nroff -ms help.txt 
g/^#*$/s/^/#/
1,$-1g/^#*$/j
1,$-1g/^#*$/j
1,$-1g/^#*$/j
1,$-1g/^#*$/j
1,$-1g/^#*$/j
1,$-1g/^#*$/j
1,$-1g/^#*$/j
1,$-1g/^#*$/j
g/^##*/s/#*/\
/
%s/ *$//
g/^\*/s/.*/&\
==== & ====/
v/^\*/s/^/"/
v/^\*/s/$/\\n"/
g/^\*/s/ /_/g
g/^\*/s/$/ =/
g/^\*/s/^/;\
const String Help_/
1d
$s/$/;/
g/^"==== \*/s/ \*//
g/^const/s/\*_//1
0a
/*
 * Help texts for the ProofPower X/Motif Interface.
 * This file is automatically created from help.txt.
 * Do not edit.
 * Made by $RCSfile: makehelp.sh,v $ version $Revision: 2.1 $ of $Date: 1994/08/30 13:37:40 $
 */
#define _help
#include "xpp.h"
.
w help.c
v/^const String Help_/d
%s/^/extern /
%s/ =/;/
0a
/*
 * Help include file for the ProofPower X/Motif Interface.
 * This file is automatically created from help.txt.
 * Do not edit.
 * Made by $RCSfile: makehelp.sh,v $ version $Revision: 2.1 $ of $Date: 1994/08/30 13:37:40 $
 */
.
w help.h
q
!

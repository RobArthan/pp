#
# $Id$
# makehelp - ProofPower X/Motif Interface build tool
# This shell script constructs the header file help.h from help.txt
# using nroff -ms to do the formatting.
# For each item:
# * A Help Title
# ...
# it produces a C string declaration:
# const String Help_A_Help_Title =
# "==== A Help Title ===="
# ...
# It replaces multiple new lines by single ones
rm -f help.h
ex <<\!
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
.
w help.h
q
!

#
# $Id: makehelp.sh,v 2.3 2000/01/04 14:24:30 rda Rel rda $
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
YEAR=`date +%Y`
nroff -ms help.txt | sed -nf makehelp1.sed | sed -e /YEAR/s/YEAR/$YEAR/ >help.c
sed -nf makehelp2.sed < help.c > help.h

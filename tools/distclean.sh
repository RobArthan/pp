#!/bin/sh
# clean-up program for the open source edition of ProofPower
# removes all files other than sources from the src directory.
#
# clean: this file is part of the ProofPower system
# 
# Copyright (c) 2002 Lemma 1 Ltd.
#
# See the file LICENSE for your rights to use and change this file.
#
# Contact: Rob Arthan < rda@lemma-one.com >
#
# $Id: configure.sh,v 1.1 2002/10/18 17:09:17 rda Exp $
#
give_up(){
	echo configure: $*
	exit 1
}
#
# Check we have a src directory
#
CWD=`pwd`
if	[ ! -d src ]
then	give_up "the directory $CWD/src does not exist"
else	cd src
fi
#
# Find the make files and start building the list of files to keep
#
MAKEFILES=
TOKEEP="version"
for f in pptex dev xpp hol zed daz
do	if	[ -f $f.mkf ]
	then	MAKEFILES="$MAKEFILES $f.mkf"
		TOKEEP="$TOKEEP README.$f"
	fi
done
if	[ "$MAKEFILES" = "" ]
then	give_up "no ProofPower make files found in $CWD/src"
fi
#
# Calculate files to be retained
#
for f in $MAKEFILES
do	TOKEEP="$TOKEEP `make -f $f packinglist`"
done
#
# Calculate files to delete (the list may contain a few files that aren't present)
#
TODELETE="`{ { echo $TOKEEP | tr ' ' '\n'; }; ls; } | sort | uniq -u`"
#
# Delete them:
#
rm -f $TODELETE


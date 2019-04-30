#! /bin/sh
#
# File: install_holdemo
# Derived from: $Header: /home/rda/hol/RCS/install_holdemo.sh,v 1.5 2005/09/12 11:54:39 rda Exp rda $
#
# Running this script sets up example database in the directory ./db
#
# exit immediately on none zero code
set -e
# Default directory names, should not need to change these.
DIR=`pwd`
PPINSTALLDIR="$DIR"
DOC="$DIR"/doc
DB="$DIR"/db
TMPBUILD="$DIR"/tmp_build
DELETEBUILDDIR="y"
PPDATABASEPATH="$TMPBUILD:$PPDATABASEPATH"
export PPINSTALLDIR PPDATABASEPATH

# tell the user what we are doing
echo `date`
echo "Creating new databases"
rm -rf "$TMPBUILD"
mkdir "$TMPBUILD"
cd "$TMPBUILD"

cp "$DOC"/wrk051.pp .
cp "$DOC"/spc001.pp "$DOC"/spc002.pp .
cp "$DOC"/usr004.pp "$DOC"/usr013* .
cp "$DOC"/usr022_slides.pp .
cp "$DOC"/wrk022.pp "$DOC"/wrk043.pp "$DOC"/wrk044.pp "$DOC"/wrk046.pp .
cp "$DOC"/usr022S.pp .
sieve sml <usr022S.pp >/dev/null
mv hol_course_work.pp "$DOC"
sieve sml < wrk051.pp
make -f wrk051.mkf all_hol

mv example_hol.* "$DB"

# Tidy up neatly, deleting all unnecessary files
if test "$DELETEBUILDDIR" = "y"
then
	echo `date`
	echo "Tidying up"
	cd "$DIR"
	rm -rf "$TMPBUILD"
fi

echo `date`
echo "Finished"

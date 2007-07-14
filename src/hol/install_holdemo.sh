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

cp "$DOC"/wrk051.doc .
cp "$DOC"/spc001.doc "$DOC"/spc002.doc .
cp "$DOC"/usr004.doc "$DOC"/usr013* .
cp "$DOC"/usr022_slides.doc .
cp "$DOC"/wrk022.doc "$DOC"/wrk043.doc "$DOC"/wrk044.doc "$DOC"/wrk046.doc .
cp "$DOC"/usr022S.doc .
sieve sml <usr022S.doc >/dev/null
mv hol_course_work.doc "$DOC"
sieve sml < wrk051.doc
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

#! /bin/sh
#
# File: install_zeddemo
# Derived from: $Header: /home/rda/hol/RCS/install_zeddemo.sh,v 1.5 2005/09/12 11:54:39 rda Exp rda $
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

cp "$DOC"/wrk050.pp "$DOC"/wrk051.pp .
cp "$DOC"/usr011* .
cp "$DOC"/usr023_slides.pp .
cp "$DOC"/usr023S.pp .
sieve sml <usr023S.pp >/dev/null
mv zed_course_work.pp zed_course_solutions.pp "$DOC"
sieve -u sml < wrk051.pp
make -f wrk051.mkf all_zed


mv example_zed.* "$DB"

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

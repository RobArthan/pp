#! /bin/sh
#
# File: install_holdemo
# Derived from: $Header: /home/rda/hol/RCS/install_holdemo.sh,v 1.1 2000/08/09 12:04:02 gill Exp rda $
#
# Running this script sets up example database in the directory ./bin
#
# exit immediately on none zero code
set -e
# Default directory names, should not need to change these.
dir=`pwd`
PPINSTALLDIR=$dir
doc=$dir/doc
bin=$dir/bin
tmp_build=$dir/tmp_build
deletebuilddir="y"
export PPINSTALLDIR

# tell the user what we are doing
echo `date`
echo "Creating new databases"
rm -rf $tmp_build
mkdir $tmp_build
cd $tmp_build

cp $doc/wrk051.doc .
cp $doc/spc001.doc $doc/spc002.doc .
cp $doc/usr004.doc $doc/usr013* .
cp $doc/usr022_slides.doc .
cp $doc/wrk022.doc $doc/wrk043.doc $doc/wrk044.doc $doc/wrk046.doc .
cp $doc/usr022S.doc .
sieve sml <usr022S.doc >/dev/null
mv hol_course_work.doc $doc
sieve sml < wrk051.doc
make -f wrk051.mkf all_hol

eval `.arch-n-opsys`

mv *.$HEAP_SUFFIX $bin

# Tidy up neatly, deleting all unnecessary files
if test "x$deletebuilddir" = "xy"
then
	echo `date`
	echo "Tidying up"
	cd $dir
	rm -rf $tmp_build
fi

echo `date`
echo "Finished"

#! /bin/sh
#
# File: install_zeddemo
# Derived from: $Header: /home/rda/zed/RCS/install_zeddemo.sh,v 1.1 2000/08/09 12:05:01 gill Exp rda $
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

cp $doc/wrk050.doc $doc/wrk051.doc .
cp $doc/usr011* .
cp $doc/usr023_slides.doc .
cp $doc/usr023S.doc .
sieve sml <usr023S.doc >/dev/null
mv zed_course_work.doc zed_course_solutions.doc $doc
sieve sml < wrk051.doc
make -f wrk051.mkf all_zed

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

#!/bin/sh

# mtreport: check a set of TTD files for succes or failure and produce
# a summary log.
# 	mtreport ttdfile ...
# The following must agree with the string produced by the module
# test harness of DTD013/IMP013 (and tests that don't use the harness
# to report an overall pass should follow suit).
PASS_STRING="All module tests passed"
#
TTDS="$*"
NUM_TTDS=`echo $TTDS | wc -w`
PASSES=`egrep -l "$PASS_STRING" $TTDS`
NUM_PASSES=`echo $PASSES | wc -w`
# Concatenate and sort names of test files run and test files passed.
# Names of failed test files will appear only once in the result.
FAILS=`for f in $TTDS $PASSES; do echo $f; done | sort | uniq -u`
NUM_FAILS=`echo $FAILS | wc -w`
if	[ "$FAILS" != "" ]
then
	INT_FAILS=`echo $NUM_FAILS | sed -e "1s/[ 	]//g"`
	if	[ "$INT_FAILS" = 1 ]
	then	echo "The following test failed:"
	else	echo "The following tests failed:"
	fi
	for f in $FAILS
	do
		echo "        " $f
	done
else	echo "No tests failed"
fi
echo "Test summary: $NUM_TTDS run; $NUM_PASSES passed; $NUM_FAILS failed"


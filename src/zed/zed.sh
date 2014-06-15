#! /bin/sh
# zed: shell script to start a ProofPower-Z session
PROGNAME=zed
USAGE="$PROGNAME [-d database[#theoryname]] [-i files] [-f files [-n|-s] [-v]] [-- ml_flags]"
export PROGNAME USAGE
pp -d zed $@
	chmod +x zed

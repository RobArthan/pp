#!/bin/sh
# configuration program for the open source edition of ProofPower
#
# configure: this file is part of the ProofPower system
# 
# Copyright (c) 2002 Lemma 1 Ltd.
#
# See the file LICENSE for your rights to use and change this file.
#
# Contact: Rob Arthan < rda@lemma-one.com >
#
# $Id: configure.sh,v 1.20 2002/12/20 15:55:44 rda Exp rda $
#
# Environment variables may be used to force various decisions:
#
# PPCOMPILER       - if set must be one of POLYML or SMLNJ
#                    (default: if Poly/ML is available use it, else SML/NJ).
#
# PPDOCFORMAT      - if set must be one of PDF or PS and causes dvipdfm
#                    (resp. dvips) to be used to generate PDF or PostScript
#                    versions of the DVI files in the doc directory
#                    (default: you just get the DVI files).
#
# PPINSTALLDIR     - if set must give the absolute path name of
#                    a directory the user can create or write to
#                    (default: first of /usr/share/pp, /usr/local/pp,
#                    /opt/pp, $HOME/pp that looks like it will work).
#
# PPMOTIFLINKING   - if set must be one of static or dynamic
#                    (default: dynamic).
#
# PPTARGETDIR      - as PPINSTALLDIR, overrides PPINSTALLDIR if set and non-empty.
#
# PPTARGETS        - a space separated list of packages to include
#                   (default: whichever of pptex hol zed daz xpp are there).
#
# PPPOLYDBASE      - name of file containing the initial Poly/ML database
#                   (default: /usr/lib/poly/ML_dbase)
#
# If any of these is an empty string, it is treated as if it were unset.
#
# PPTARGETDIR is for developers who may want to test this script while
# retaining an existing setting for PPINSTALLDIR.
#
# The package names in PPTARGETS if used must be taken from the list:
# pptex dev hol zed daz xpp. This is mostly useful if you want to
# install the development kit (possibly separately from the other packages).
# The default is not to install it.
#
# PPPOLYDBASE is not relevant if PPCOMPILER is SMLNJ. The default is
# appropriate for Poly/ML installed on Linux from the RPM.
#
# This is done by creating a shell script, install, which captures the decisions.
# Makes some sanity checks on the source directory (but not many).
#
# Here we go ...
#
give_up(){
	echo configure: error: $*
	exit 1
}
#
# Find an ML Compiler
#
if	[ "${PPCOMPILER:-}" != "" ]
then	case "$PPCOMPILER" in
		POLYML) T="Poly/ML";;
		SMLNJ)  T="Standard ML of New Jersey";;
		*)	give_up "PPCOMPILER must be one of POLYML or SMLNJ";;
	esac
	echo "Using $T as specified"
elif	which poly >/dev/null 2>&1
then	echo "Using Poly/ML"
	PPCOMPILER=POLYML
elif	which sml >/dev/null 2>&1
then	echo "Using Standard ML of New Jersey"
	PPCOMPILER=SMLNJ
else	give_up "cannot find a Standard ML compiler"
fi
#
# Find Poly/ML database if appropriate:
#
if	[ "$PPCOMPILER" = POLYML ]
then	if	[ "${PPPOLYDBASE:-}" = "" ]
	then	PPPOLYDBASE=/usr/lib/poly/ML_dbase
	fi
	if	[ ! -f $PPPOLYDBASE ]
	then	give_up "The file $PPPOLYDBASE does not exist"
	fi
	echo "Using $PPPOLYDBASE for the Poly/ML compiler database"
else	PPPOLYDBASE=
fi
#
# Find out how to link Motif
#
if	[ "${PPMOTIFLINKING:-}" != "" ]
then	case "$PPMOTIFLINKING" in
		dynamic) true;;
		static)  true;;
		*)	give_up "PPCOMPILER must be one of POLYML or SMLNJ";;
	esac
	echo "Using $PPMOTIFLINKING linking for Motif as specified"
else	PPMOTIFLINKING=dynamic
	echo "Using $PPMOTIFLINKING linking for Motif"
fi
#
# Find a target directory
#
if	[ "${PPTARGETDIR:-}" = "" ]
then	PPTARGETDIR=$PPINSTALLDIR
fi
if	[ "${PPTARGETDIR:-}" = "" ]
then	for parent in /usr/share /usr/local /opt $HOME
	do
		if	[ -d $parent ]
		then	if	[ -d $parent/pp -a -w $parent/pp ]
			then	PPTARGETDIR=$parent/pp
				break
			elif	[ -d $parent -a -w $parent ]
			then	PPTARGETDIR=$parent/pp
				break
			fi
		fi
	done
	if	[ "$PPTARGETDIR" = "" ]
	then	give_up "cannot create any of the default installation directories"
	fi
elif	[ ! -d "$PPTARGETDIR" ]
then	( mkdir $PPTARGETDIR; rmdir $PPTARGETDIR ) || \
	give_up "cannot create the directory $PPTARGETDIR"
elif	[ -d "$PPTARGETDIR" -a ! -w "$PPTARGETDIR" ]
then	give_up "cannot write to the directory $PPTARGETDIR"
fi
if	[ `expr "$PPTARGETDIR" : '\/'` != 1 ]
then	give_up "the target directory must be an absolute path name (i.e., begin with \"/\")"
fi
echo "Using $PPTARGETDIR as the installation target directory"
#
# Check for user-defined target list:
#
SUPPORTEDTARGETS="dev pptex xpp hol zed daz"
if	[ "${PPTARGETS:-}" = "" ]
then	PPTARGETS="pptex xpp hol zed daz"
	USERDEFINEDTARGETS=n
else	for f in $PPTARGETS
	do	case "$f" in
			dev|pptex|xpp|hol|zed|daz)
				true;;
			*)	give_up "unrecognised package \"$f\" (not one of dev, pptex, xpp, hol, zed, daz)"
		esac
	done
	USERDEFINEDTARGETS=y
fi
#
# Look for packages to be installed:
#
CWD=`pwd`
if	[ ! -d src ]
then	give_up "the directory $CWD/src does not exist"
fi
SOMETODO=n
ACTTARGETS=
for f in $PPTARGETS
do	if	[ -f src/$f.mkf ]
	then	eval $f=y
		SOMETODO=y
		ACTTARGETS="$ACTTARGETS $f"
	elif	[ "$USERDEFINEDTARGETS" = y ]
	then	give_up "the make file $f.mkf is missing from the source directory"
	else	eval $f=n
	fi
done
if	[ $SOMETODO = n ]
then	give_up "cannot find any packages to build in $CWD/src"
fi
echo "Generating code to install the following packages: $ACTTARGETS"
#
# Check for document format requirements:
#
case "${PPDOCFORMAT:-}" in
	"")	DOPDF=n; DOPS=n;;
	PDF)	DOPDF=y; DOPS=n;;
	PS)	DOPDF=n; DOPS=y;;
	*)	give_up "unsupported document format \"$PPDOCFORMAT\" (not one of PDF or PS)"
esac
if	[ "$DOPDF" = y ]
then	if	which dvipdfm >/dev/null 2>&1
	then	echo "Generating code to produce PDF versions of the documents"
	else	give_up "dvipdfm does not seem to be available and is needed if you specify PPDOCFORMAT=PDF"
	fi
elif	[ "$DOPS" = y ]
then	if	which dvips >/dev/null 2>&1
	then	echo "Generating code to produce PostScript versions of the documents"
	else	give_up "dvips does not seem to be available and is needed if you specify PPDOCFORMAT=PS"
	fi
fi
#
# Build the script
#
TAB=
out(){
	echo "$TAB$*" >>install
}
export_it(){
	VAR=$1
	VAL=`eval echo '$'$1`
	out "$VAR=$VAL"
	out "export $VAR"
}
if	[ -w . ]
then	>install
else	give_up "cannot write the file install in the directory $CWD"
fi
chmod +x install
out "#!/bin/sh"
out "# install: ProofPower installation script"
out "# This file was automatically generated by the configure script."
out "# Edit it at your own risk!"
export_it PPCOMPILER
export_it PPMOTIFLINKING
export_it PPTARGETDIR
if	[ "$PPCOMPILER" = POLYML ]
then	export_it PPPOLYDBASE
fi
out 'give_up(){'
out '	echo "install: installation failed; see $1 for more details"'
out '	exit 1'
out '}'
out 'date +"OpenProofPower installation begins [%c] ..."'
out 'if [ "$1" = "" -o "$1" = "-d" ]'
out 'then'
TAB="	"
out "echo \"Moving to build directory $CWD/src\""
out "cd $CWD/src"
out 'OLD_PATH=$PATH'
out "PATH=.:"'$PATH'
out "export PATH"
#
# Clean up the src directory
#
./distclean
# 
# Output the make command to build the packages
#
out "echo \"Building $ACTTARGETS\""
out "echo \"See $CWD/build.log for messages\""
out "if	make -f install.mkf $ACTTARGETS >$CWD/build.log 2>&1"
out 'then	date +"Build complete [%c] ..."'
out "else	give_up $CWD/build.log"
out "fi"
#
# Now go to the target directory, build the demos (and freeze the
# databases, en passant, or explicitly for daz which doesn't have
# demo scripts at the moment).
#
if	[ "$hol" = y -o "$zed" = y -o "$daz" = y ]
then
	out "echo \"Moving to installation directory $PPTARGETDIR\" ..."
	out "echo \"See $PPTARGETDIR/<package>.log for messages\""
	out "cd $PPTARGETDIR"
	out "PATH=$PPTARGETDIR/bin:"'$OLD_PATH'
	out "export PATH"
	if	[ "$hol" = y ]
	then	out "echo Installing hol demo database"
		out './install_holdemo >hol.log 2>&1 || give_up $PPTARGETDIR/hol.log'
	fi
	if	[ "$zed" = y ]
	then	out "echo Installing zed demo database"
		out './install_zeddemo >zed.log 2>&1 || give_up $PPTARGETDIR/zed.log'
	fi
	if	[ "$daz" = y -a "$PPCOMPILER" = POLYML ]
	then	out "echo Freezing daz database"
		out '( pp_make_database -f -p daz junk$$; rm junk$$.polydb ) >daz.log 2>&1 || give_up $PPTARGETDIR/daz.log'
	fi
fi
TAB=
out "fi"
out 'if [ "$1" = "" -o "$1" = "+d" ]'
out 'then'
TAB="	"
if	[ "$DOPDF" = y -o "$DOPS" = y ]
then
	if	[ "$DOPDF" = y -o "$DOPS" = y ]
	then	out "echo \"Moving to documentation directory $PPTARGETDIR/doc\" ..."
		out "cd $PPTARGETDIR/doc"
	fi
	if	[ "$DOPDF" = y ]
	then	out "echo \"Converting documents to PDF (see $PPTARGETDIR/dvipdfm.log for messages)\""
		out 'for f in *.dvi'
		out 'do	dvipdfm $f'
		out "done >$PPTARGETDIR/dvipdfm.log 2>&1"
	fi
	if	[ "$DOPS" = y ]
	then	out "echo \"Converting documents to PostScript (see $PPTARGETDIR/dvips.log for messages)\""
		out 'for f in *.dvi'
		out 'do	dvips -o "" $f'
		out "done >$PPTARGETDIR/dvips.log 2>&1"
	fi
fi
out "echo Generating HTML roadmap to the documents: $PPTARGETDIR/doc/index.html"
if	[ "$DOPDF" = y ]
then	HTMLEDIT='-e /@ext@/s/@ext@/pdf/g'
elif	[ "$DOPS" = y ]
then	HTMLEDIT='-e /@ext@/s/@ext@/ps/g'
else	HTMLEDIT='-e /@ext@/s/@ext@/dvi/g'
fi
for f in  $SUPPORTEDTARGETS
do	
	if [ "`eval echo '$'$f`" != y ]
	then	HTMLEDIT="$HTMLEDIT -e /@$f@/d"
	else	HTMLEDIT="$HTMLEDIT -e /@$f@/s/@$f@//g"
	fi
done
out "sed $HTMLEDIT  <$CWD/src/index.html.src > $PPTARGETDIR/doc/index.html"
out "cp $CWD/src/lemma1.gif $CWD/src/newpplogo.gif $PPTARGETDIR/doc"
TAB=
out "fi"
out 'date +"Installation complete [%c]"'
echo "If you are happy with these settings, now run ./install to install ProofPower."

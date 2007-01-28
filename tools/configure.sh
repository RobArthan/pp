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
# $Id: configure.sh,v 1.41 2006/12/11 16:12:22 rda Exp rda $
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
# PPHOME           - if set must give the absolute path name of
#                    a directory the user can create or write to
#                    (default: first of /usr/local/pp, /usr/share/pp,
#                    /opt/pp, /sw/pp, $HOME/pp that looks like it will work).
#
# PPMOTIFLINKING   - if set must be one of static or dynamic
#                    (default: dynamic).
#
# PPMOTIFHOME      - directory containing the include and lib directories
#                    for Motif (default: tries to find it in typical locations).
#
# PPTARGETDIR      - as PPHOME, overrides PPHOME if set and non-empty.
#
# PPTARGETS        - a space separated list of packages to include or "all" for
#                    everything in the src directory.
#                   (default: whichever of pptex hol zed daz qcz xpp are there).
#
# PPPOLYDBASE      - name of file containing the initial Poly/ML database
#                   (default: /usr/lib/poly/ML_dbase)
#
# PPCACHESIZE      - when ProofPower-Z is built, the HOL types
#                    needed for Z schema types with up to
#                    $PPCACHESIZE components are predefined.
#                    (default: 50)
#
# PPUSERCFLAGS     - additional flags for "gcc -c" calls building xpp
#
# PPUSERCLIBS      - additional flags for "gcc -o" calls building xpp
#
#
# If any of these is an empty string, it is treated as if it were unset.
#
# PPTARGETDIR is for developers who may want to test this script while
# retaining an existing setting for PPHOME.
#
# The package names in PPTARGETS if used must be taken from the list:
# pptex dev hol zed daz qcz xpp. This is mostly useful if you want to
# install the development kit (possibly separately from the other packages).
# The default is not to install it.
#
# PPPOLYDBASE is not relevant if PPCOMPILER is SMLNJ. The default is
# appropriate for Poly/ML installed on Linux from the RPM.
#
# This is done by creating a shell script, install, which captures the decisions.
# Makes some sanity checks on the source directory (but not many).
#
# We begin with some handy shell functions:
#
give_up(){
	echo ERROR: $* 1>&2
	exit 1
}
#
warn(){
	echo WARNING: $* 1>&2
}
#
# The following is a substitute for "which" needed on systems like BSD
# and Solaris where "which" is a grotty C-shell-script.
#
split_path(){
	IFS=: eval "echo \$PATH"
}
find_in_path(){
	for DIR in `split_path`
	do	FILE=$DIR/$1
		if	[ -x $FILE -a -f $FILE ]
		then	echo $FILE
			return 0
		fi
	done
	return 1
}
#
# THe following is used to check for dependencies on executables (ed etc.)
#
check_bin(){
	find_in_path $1 >/dev/null 2>&1 || warn $2
}
#
# Now here we go ...
#
# Set locale to C, i.e., turn off localisation so that text-processing is 8-bit clean
#
LC_ALL=C
export LC_ALL
#
# Find a target directory
#
if	[ "${PPTARGETDIR:-}" = "" ]
then	PPTARGETDIR=$PPHOME
fi
if	[ "${PPTARGETDIR:-}" = "" ]
then	for parent in /usr/local /opt /sw /usr/share $HOME
	do	if	[ -d $parent ]
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
SUPPORTEDTARGETS="dev pptex xpp hol zed daz qcz"
if	[ "${PPTARGETS:-}" = "" ]
then	PPTARGETS="pptex xpp hol zed daz qcz"
	USERDEFINEDTARGETS=n
elif	[ "${PPTARGETS:-}" = "all" ]
then	PPTARGETS=$SUPPORTEDTARGETS
	USERDEFINEDTARGETS=n
else	USERDEFINEDTARGETS=y
	for f in $PPTARGETS
	do	case "$f" in
			dev|pptex|xpp|hol|zed|daz|qcz)
				true;;
			*)	give_up "unrecognised package \"$f\" (not one of dev, pptex, xpp, hol, zed, daz, qcz)"
		esac
	done
fi
#
# Look for packages to be installed:
#
CWD=`pwd`
if	[ ! -d src ]
then	give_up "the directory $CWD/src does not exist"
fi
SOMETODO=n
for f in $SUPPORTEDTARGETS
do	eval $f=n
done
for f in $PPTARGETS
do	if	[ -f src/$f.mkf ]
	then	eval $f=y
		SOMETODO=y
	elif	[ "$USERDEFINEDTARGETS" = y ]
	then	give_up "the make file $f.mkf is missing from the source directory"
	fi
done
if	[ $SOMETODO = n ]
then	give_up "cannot find any packages to build in $CWD/src"
fi
ACTTARGETS=
for f in $SUPPORTEDTARGETS
do	if	eval [  \$$f = y  ]
	then	ACTTARGETS="$ACTTARGETS $f"
	fi
done
#
# Find an ML Compiler
#
if	[ "$dev" = y -o "$hol" = y -o "$zed" = y -o "$daz" = y -o "$qcz" = y ]
then	if	[ "${PPCOMPILER:-}" != "" ]
	then	case "$PPCOMPILER" in
			POLYML) T="Poly/ML"; C="poly";;
			SMLNJ)  T="Standard ML of New Jersey"; C="sml";;
			*)	give_up "PPCOMPILER must be one of POLYML or SMLNJ";;
		esac
		echo "Using $T as specified"
		check_bin "$C" "$C not found; $T must be installed if you specify PPCOMPILER=$PPCOMPILER"
	elif	find_in_path poly >/dev/null 2>&1
	then	echo "Using Poly/ML"
		PPCOMPILER=POLYML
	elif	find_in_path sml >/dev/null 2>&1
	then	echo "Using Standard ML of New Jersey"
		PPCOMPILER=SMLNJ
	else	give_up "cannot find a Standard ML compiler"
	fi
	if	[ "$PPCOMPILER" = SMLNJ ]
	then	if	! find_in_path .arch-n-opsys >/dev/null 2>&1
		then	give_up ".arch-n-opsys not found: to build with SML/NJ the installation bin directory must be on your path"
		fi
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
fi
#
# Check for various tbings we need:
#
# C compiler (has to be gcc):
#
check_bin "gcc" "gcc not found"
#
# TeX and LaTeX:
#
check_bin "latex" "TeX and LaTeX software not found"
#
# A representative sample of the text utilities we need
#
check_bin "nl" "nl text line-numbering utility not found"
check_bin "ed" "ed line editor not found"
check_bin "nroff" "nroff text formatting program not found"
#
# Find out how to link Motif and where the Motif includes and libraries are:
#
if	[ "$xpp" = y ]
then	if	[ "${PPMOTIFLINKING:-}" != "" ]
	then	case "$PPMOTIFLINKING" in
			dynamic) true;;
			static)  true;;
			*)	give_up "PPMOTIFLINKING must be one of \"default\" or \"static\"";;
		esac
		echo "Using $PPMOTIFLINKING linking for Motif as specified"
	else	PPMOTIFLINKING=dynamic
		echo "Using $PPMOTIFLINKING linking for Motif"
	fi
	#
	# Check out PPMOTIFHOME
	#
	USERCFLAGS=${PPUSERCFLAGS:-}
	USERCLIBS=${PPUSERCLIBS:-}
	if	[ "${PPMOTIFHOME:-}" != "" ]
	then	if	[ ! -d $PPMOTIFHOME ]
		then	give_up "directory \"$PPMOTIFHOME\" does not seem to exist"
		elif	[ ! -d $PPMOTIFHOME/include/Xm ]
		then	give_up "directory \"$PPMOTIFHOME\" does not seem to contain the Motif include files"
		else	echo "Using $PPMOTIFHOME for Motif include files and binaries"
		fi
	elif	[ -d /usr/X11R6/include/Xm ]
	then	PPMOTIFHOME=/usr/X11R6
	elif	[ -d /usr/openwin/include/Xm ]
	then	PPMOTIFHOME=/usr/openwin
	elif	[ -d /usr/include/Xm ]
	then	PPMOTIFHOME=/usr
	elif	[ -d /sw/include/Xm ]
	then	PPMOTIFHOME=/sw
	fi
	if	[ "${PPMOTIFHOME:-}" != "" ]
	then	USERCFLAGS="-I$PPMOTIFHOME/include $USERCFLAGS"
		USERCLIBS="-L$PPMOTIFHOME/lib $USERCLIBS"
	else	warn "Motif installation not found"
	fi
fi
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
then	if	find_in_path dvipdfm >/dev/null 2>&1
	then	DVI2PDF=dvipdfm
	elif	find_in_path dvipdf >/dev/null 2>&1
	then	DVI2PDF=dvipdf
	else	give_up "dvipdfm or dvipdf must be available if you specify PPDOCFORMAT=PDF"
	fi
	echo "Generating code to produce PDF versions of the documents"
elif	[ "$DOPS" = y ]
then	if	find_in_path dvips >/dev/null 2>&1
	then	echo "Generating code to produce PostScript versions of the documents"
	else	give_up "dvips must be available if you specify PPDOCFORMAT=PS"
	fi
fi
#
# Find the cachesize
PPCACHESIZE=${PPCACHESIZE:-50}
if	[ `expr  \( "$PPCACHESIZE" : '.*' \) = \
		\( "$PPCACHESIZE" : '[0-9]*' \)` = 0 ]
then
	give_up "PPCACHESIZE must be a number"
fi
if	[ "$zed" = y -o "$daz" = y ]
then
	echo "Using $PPCACHESIZE for the size of the labelled product cache"
fi
#
# Build the script
#
echo "Generating code to install the following packages: $ACTTARGETS"
TAB=
out(){
	echo "$TAB$*" >>install
}
export_it(){
	VAR=$1
	VAL=`eval echo '$'$1`
	out "$VAR="'"'"$VAL"'"'
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
export_it LC_ALL
export_it PPCOMPILER
export_it PPMOTIFLINKING
export_it PPTARGETDIR
export_it PPCACHESIZE
export_it USERCFLAGS
export_it USERCLIBS
out 'PPHOME=$PPTARGETDIR'
out "export PPHOME"
out "PATH=$CWD/src:"'$PATH'
out "export PATH"
out "PPDATABASEPATH=$CWD/src"
out "export PPDATABASEPATH"
out "PPETCPATH=$CWD/src"
out "export PPETCPATH"
if	[ "$PPCOMPILER" = POLYML ]
then	export_it PPPOLYDBASE
fi
out 'TEXINPUTS=.:$PPTARGETDIR/tex:$PPTARGETDIR/doc:$TEXINPUTS:'
out "export TEXINPUTS"
out 'BIBINPUTS=.:$PPTARGETDIR/tex:$PPTARGETDIR/doc:$BIBINPUTS:'
out "export BIBINPUTS"
out 'BSTINPUTS=.:$PPTARGETDIR/tex:$PPTARGETDIR/doc:$BSTINPUTS:'
out "export BSTINPUTS"
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
out "cat $CWD/src/version >$PPTARGETDIR/VERSION"
#
# Now go to the target directory, build the demos (and freeze the
# databases, en passant, or explicitly for daz and qcz which don't have
# demo scripts at the moment).
#
if	[ "$hol" = y -o "$zed" = y -o "$daz" = y -o "$qcz" = y ]
then
	out "echo \"Moving to installation directory $PPTARGETDIR\" ..."
	out "echo \"See $PPTARGETDIR/<package>.log for messages\""
	out "cd $PPTARGETDIR"
	out "PATH=$PPTARGETDIR/bin:"'$PATH'
	out "PPDATABASEPATH=$PPTARGETDIR/db:$CWD/src"
	out "PPETCPATH=$PPTARGETDIR/db:$CWD/src"
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
	if	[ "$qcz" = y -a "$PPCOMPILER" = POLYML ]
	then	out "echo Freezing qcz database"
		out '( pp_make_database -f -p qcz junk$$; rm junk$$.polydb ) >qcz.log 2>&1 || give_up $PPTARGETDIR/qcz.log'
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
	then	out "echo \"Converting documents to PDF (see $PPTARGETDIR/$DVI2PDF.log for messages)\""
		out 'for f in *.dvi'
		out "do	$DVI2PDF" '$f'
		out "done >$PPTARGETDIR/$DVI2PDF.log 2>&1"
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

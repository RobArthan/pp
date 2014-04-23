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
# configure.sh,v 1.57 2011/10/02 13:45:59 rda Exp
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
#                    (default: first of /usr/local/pp, /opt/pp, /sw/pp,
#                    /usr/share/pp, $HOME/pp that looks like it will work).
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
# PPPOLYHOME       - name of directory containing the bin and lib directories
#                    where Poly/ML (5.1 or later) may be found.
#                    (default: /usr/local)
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
# PPLD_RUN_PATH	   - the value of LD_RUN_PATH to be used when the pp-ml
#                    driver program is linked. Only relevant for Poly/ML.
#                    Allows "cross-compiling" between systems where Poly/ML
#                    has been installed using different directory names.
#                    You may need to set LD_LIBRARY_PATH when you run
#                    ./install so that pp-ml will work locally.
#                    (default: the lib subdirectory of the Poly/ML
#                    installation directory on the local system).
#
# PPPOLYLINKFLAGS  - any extra flags needed to link poly programs.
#                    e.g., '-arch i386' to get a 32-bit executable if
#                    64-bit is the default. Or '-segprot POLY rwx rwx'
#                    to work around a permissions problem on Mac OS X 10.6
#                    with 64-bit executables (default is '-segprot POLY rwx rwx'
#                    on MacOS X, empty string otherwise).
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
# PPPOLYHOME is not relevant if PPCOMPILER is SMLNJ. The default of
# /usr/local matches the default of the Poly/ML make file.
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
# The following is a substitute for "which". It is needed on systems like BSD
# and Solaris where "which" is a grotty C-shell-script (which, in particular,
# does not report an error if the program is not found).
#
find_in_path(){
(
	IFS=:
	for DIR in $PATH
	do	FILE="$DIR"/"$1"
		if	[ -x "$FILE" -a -f "$FILE" ]
		then	echo "$FILE"
			return 0
		fi
	done
	return 1
)
}
#
# The following is used to check for dependencies on executables (poly etc.)
# The first argument is the program; the second is a message to output as
# a warning if the program is not in the path.
#
check_bin(){
	find_in_path "$1" >/dev/null 2>&1 || warn $2
}
#
# Now here we go ...
#
# Set locale to C, i.e., turn off localisation so that text-processing is 8-bit clean
#
LC_ALL=C
export LC_ALL
#
# Find the OS for future reference
#
find_os(){
	S=`{ uname -s || echo unknown; } | dd conv=lcase 2>/dev/null`
	case $S in
		cygwin*)
			echo "cygwin" ;;
		sunos)
			echo "solaris" ;;
		*)
			echo $S ;;
	esac
}
OS=`find_os`
#
# Find a target directory
#
if	[ "${PPTARGETDIR:-}" = "" ]
then	PPTARGETDIR="$PPHOME"
fi
if	[ "${PPTARGETDIR:-}" = "" ]
then	for parent in /usr/local /opt /sw /usr/share "$HOME"
	do	if	[ -d "$parent" ]
		then	if	[ -d "$parent"/pp -a -w "$parent"/pp ]
			then	PPTARGETDIR="$parent"/pp
				break
			elif	[ -d "$parent" -a -w "$parent" ]
			then	PPTARGETDIR="$parent"/pp
				break
			fi
		fi
	done
	if	[ "$PPTARGETDIR" = "" ]
	then	give_up 'cannot find a suitable installation directory'
	fi
elif	[ ! -d "$PPTARGETDIR" ]
then	( mkdir "$PPTARGETDIR"; rmdir "$PPTARGETDIR" ) || \
	give_up "cannot create the directory \"$PPTARGETDIR\""
elif	[ -d "$PPTARGETDIR" -a ! -w "$PPTARGETDIR" ]
then	give_up "cannot write to the directory \"$PPTARGETDIR\""
fi
if	[ `expr "$PPTARGETDIR" : '\/'` != 1 ]
then	give_up 'the target directory must be an absolute path name (i.e., begin with "/")'
fi
echo "Using $PPTARGETDIR as the installation target directory"
#
# Calculate target list:
#
SUPPORTEDTARGETS="dev pptex xpp hol zed daz qcz"
DEFAULTTARGETS="pptex xpp hol zed daz qcz"
if	[ "${PPTARGETS:-}" = "" ]
then	
	PPTARGETS=$DEFAULTTARGETS
	USERDEFINEDTARGETS=n
elif	[ "${PPTARGETS:-}" = "all" ]
then	PPTARGETS="dev $DEFAULTTARGETS"
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
PPBUILDDIR=`pwd`
if	[ ! -d src ]
then	give_up "the directory \"$PPBUILDDIR/src\" does not exist"
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
	then	give_up "the make file \"$f.mkf\" is missing from the source directory"
	fi
done
if	[ "$SOMETODO" = n ]
then	give_up "cannot find any packages to build in \"$PPBUILDDIR/src\""
fi
ACTTARGETS=
for f in $SUPPORTEDTARGETS
do	if	eval [  \$$f = y  ]
	then	ACTTARGETS=`echo $ACTTARGETS $f`
	fi
done
#
# Find an ML Compiler, if we need one
#
if	[ "$dev" = y -o "$hol" = y -o "$zed" = y -o "$daz" = y -o "$qcz" = y ]
then
	#
	# Determine PPCOMPILER 
	#
	if	[ "${PPCOMPILER:-}" != "" ]
	then	case "$PPCOMPILER" in
			POLYML) T='Poly/ML'; C='poly';;
			SMLNJ)  T='Standard ML of New Jersey'; C='sml';;
			*)	give_up 'PPCOMPILER must be one of "POLYML" or "SMLNJ"';;
		esac
		check_bin "$C" "$C not found on search path; $T must be installed if you specify PPCOMPILER=$PPCOMPILER"
	elif	[ "$PPPOLYHOME" != "" ]
	then	PPCOMPILER=POLYML
	elif	POLY=`find_in_path poly 2>/dev/null`
	then	PPCOMPILER=POLYML
		POLYFROMPATH=y
	elif	find_in_path sml >/dev/null 2>&1
	then	PPCOMPILER=SMLNJ
	else	give_up 'cannot find a Standard ML compiler'
	fi
	#
	# Do compiler-specific checks and settings and report to user
	#
	if	[ "$PPCOMPILER" = POLYML ]
	then	if	[ "${PPPOLYHOME:-}" = "" ]
		then	if	[ "$POLYFROMPATH" != y ]
			then	# User specified PPCOMPILER=POLYML but not PPPOLYHOME
				if	POLY=`find_in_path poly 2>/dev/null`
				then	POLYFROMPATH=y
				fi
			fi
			if	[ "$POLYFROMPATH" = "y" ]
			then	PPPOLYHOME=`dirname "$POLY"`
				PPPOLYHOME=`dirname "$PPPOLYHOME"`
			else	give_up "Cannot find the Poly/ML home directory; please set PPPOLYHOME"
			fi
		fi
		if	[ ! -f "$PPPOLYHOME"/bin/poly ]
		then	give_up "The file \"$PPPOLYHOME/bin/poly\" does not exist"
		fi
		if	[ ! -f "$PPPOLYHOME"/lib/libpolymain.a -a \
			  ! -f "$PPPOLYHOME"/lib64/libpolymain.a ]
		then	give_up "Cannot find libpolymain.a in "$PPPOLYHOME/lib" or "$PPPOLYHOME/lib64
		fi
		if	[ "$OS" = darwin ]
		then	POLYLINKFLAGS="${PPPOLYLINKFLAGS:--segprot POLY rwx rwx}"
		else	POLYLINKFLAGS="${PPPOLYLINKFLAGS:-}"
		fi
		echo "Using Poly/ML from $PPPOLYHOME"
	elif	[ "$PPCOMPILER" = SMLNJ ]
	then	if	! find_in_path .arch-n-opsys >/dev/null 2>&1
		then	give_up '".arch-n-opsys" not found: to build with SML/NJ, its installation bin directory must be on your path'
		fi
		echo 'Using Standard ML of New Jersey'

	fi
fi
#
# Check for various tbings we need:
#
# C compiler (has to be gcc):
#
check_bin 'gcc' 'gcc not found'
#
# TeX and LaTeX:
#
check_bin 'latex' 'TeX and LaTeX software not found'
#
# A representative sample of the text utilities we need
#
check_bin 'nl' 'nl text line-numbering utility not found'
check_bin 'ed' 'ed line editor not found'
check_bin 'nroff' 'nroff text formatting program not found'
#
# Find out how to link Motif and where the Motif includes and libraries are:
#
if	[ "$xpp" = y ]
then	if	[ "${PPMOTIFLINKING:-}" != "" ]
	then	case "$PPMOTIFLINKING" in
			dynamic) true;;
			static)  true;;
			*)	give_up 'PPMOTIFLINKING must be one of "dynamic" or "static"';;
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
	then	if	[ ! -d "$PPMOTIFHOME" ]
		then	give_up "directory \""$PPMOTIFHOME"\" does not seem to exist"
		elif	[ ! -d "$PPMOTIFHOME"/include/Xm ]
		then	give_up "directory \""$PPMOTIFHOME"\" does not seem to contain the Motif include files"
		else	echo "Using $PPMOTIFHOME for Motif include files and binaries"
		fi
	elif	[ -d /usr/X11R6/include/Xm ]
	then	PPMOTIFHOME=/usr/X11R6
	elif	[ -d /usr/openwin/include/Xm ]
	then	PPMOTIFHOME=/usr/openwin
	elif	[ -d /usr/include/Xm ]
	then	PPMOTIFHOME=/usr
	elif	[ -d /opt/local/include/Xm ]
	then	PPMOTIFHOME=/opt/local
	elif	[ -d /sw/include/Xm ]
	then	PPMOTIFHOME=/sw
	fi
	if	[ "${PPMOTIFHOME:-}" != "" ]
	then	echo "Using $PPMOTIFHOME for Motif include files and binaries"
		USERCFLAGS="-I$PPMOTIFHOME/include $USERCFLAGS"
		USERCLIBS="-L$PPMOTIFHOME/lib $USERCLIBS"
	else	warn 'Motif installation not found'
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
then	echo 'Generating code to produce PDF versions of the documents'
	if	find_in_path dvipdf >/dev/null 2>&1
	then	DVI2PDF=dvipdf
		DVI2PDFOPTS="-sPAPERSIZE=a4"
	elif	find_in_path dvipdfm >/dev/null 2>&1
	then	DVI2PDF=dvipdfm
		DVI2PDFOPTS="-z9"
		warn "dvipdf not available, using dvipdfm"
		warn "dvipdfm cannot include some diagrams in the documents"
	else	give_up 'dvipdfm or dvipdf must be available if you specify PPDOCFORMAT=PDF'
	fi
elif	[ "$DOPS" = y ]
then	if	find_in_path dvips >/dev/null 2>&1
	then	echo 'Generating code to produce PostScript versions of the documents'
	else	give_up 'dvips must be available if you specify PPDOCFORMAT=PS'
	fi
fi
#
# Find the cachesize
PPCACHESIZE=${PPCACHESIZE:-50}
if	[ `expr  \( "$PPCACHESIZE" : '.*' \) = \
		\( "$PPCACHESIZE" : '[0-9]*' \)` = 0 ]
then
	give_up 'PPCACHESIZE must be a number'
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
declare_quoted(){
	VAR=$1
	VAL=`eval echo \"'$'"$VAR"\"`
	out "$VAR=\"$VAL\""
}
declare_unquoted(){
	VAR=$1
	VAL=`eval echo \"'$'"$VAR"\"`
	out "$VAR=$VAL"
}
if	[ -w . ]
then	>install
else	give_up "cannot write to the file \"install\" in the directory \"$PPBUILDDIR\""
fi
chmod +x install
out '#!/bin/sh'
out '# install: ProofPower installation script'
out '# This file was automatically generated by the configure script.'
out '# Edit it at your own risk!'
declare_quoted LC_ALL
declare_quoted ACTTARGETS
if	[ "$DOPDF" = y ]
then	declare_quoted DVI2PDF
	declare_quoted DVI2PDFOPTS
fi
declare_quoted PPBUILDDIR
declare_quoted PPCACHESIZE
declare_quoted PPCOMPILER
declare_quoted PPMOTIFLINKING
declare_quoted PPTARGETDIR
declare_unquoted USERCFLAGS
declare_unquoted USERCLIBS
if	[ "$PPCOMPILER" = POLYML ]
then	declare_quoted PPPOLYHOME
	if	[ "$PPLD_RUN_PATH" != "" ]
	then	declare_quoted PPLD_RUN_PATH
	fi
	if	[ "$POLYFROMPATH" != y ]
	then	out 'PATH="$PPPOLYHOME/bin:$PATH"'
	fi
	out 'LD_LIBRARY_PATH="$PPPOLYHOME/lib"'
	out 'export LD_LIBRARY_PATH'
fi
declare_quoted POLYLINKFLAGS
out 'PATH="$PPBUILDDIR/src:$PATH"'
out 'PPHOME="$PPTARGETDIR"'
out 'PPDATABASEPATH="$PPBUILDDIR/src"'
out 'PPETCPATH="$PPBUILDDIR/src"'
out 'TEXINPUTS=".:$PPTARGETDIR/tex:$PPTARGETDIR/doc:$TEXINPUTS:"'
out 'BIBINPUTS=".:$PPTARGETDIR/tex:$PPTARGETDIR/doc:$BIBINPUTS:"'
out 'BSTINPUTS=".:$PPTARGETDIR/tex:$PPTARGETDIR/doc:$BSTINPUTS:"'
out 'export LC_ALL PPCACHESIZE PPCOMPILER PPMOTIFLINKING PPTARGETDIR'
out 'export PPHOME PATH PPDATABASEPATH PPETCPATH PPPOLYHOME'
out 'export POLYLINKFLAGS TEXINPUTS BIBINPUTS BSTINPUTS USERCFLAGS USERCLIBS'
out 'unset PPVER'
out 'give_up(){'
out '	echo "install: installation failed; see $1 for more details"'
out '	exit 1'
out '}'
out 'date +"OpenProofPower installation begins [%c] ..."'
out 'if [ "$1" = "" -o "$1" = "-d" ]'
out 'then'
TAB='	'
out 'echo "Moving to build directory $PPBUILDDIR/src"'
out 'cd "$PPBUILDDIR/src"'
#
# Clean up the src directory
#
./distclean
# 
# Output the make command to build the packages
#
out 'echo Building $ACTTARGETS'
out 'echo See $PPBUILDDIR/build.log for messages'
out 'if	make -f install.mkf $ACTTARGETS >"$PPBUILDDIR/build.log" 2>&1'
out 'then	date +"Build complete [%c] ..."'
out 'else	give_up "$PPBUILDDIR/build.log"'
out 'fi'
out 'cat "$PPBUILDDIR/src/version" >"$PPTARGETDIR/VERSION"'
#
# Now go to the target directory, build the demos (and freeze the
# databases, en passant, or explicitly for daz and qcz which don't have
# demo scripts at the moment).
#
if	[ "$hol" = y -o "$zed" = y -o "$daz" = y -o "$qcz" = y ]
then
	out 'echo "Moving to installation directory $PPTARGETDIR" ...'
	out 'echo "See $PPTARGETDIR/<package>.log for messages"'
	out 'cd "$PPTARGETDIR"'
	out 'PATH="$PPTARGETDIR/bin:$PATH"'
	out 'PPDATABASEPATH="$PPTARGETDIR/db:$PPBUILDDIR/src"'
	out 'PPETCPATH="$PPTARGETDIR/db:$PPBUILDDIR/src"'
	if	[ "$hol" = y ]
	then	out 'echo Installing hol demo database'
		out './install_holdemo >hol.log 2>&1 || give_up "$PPTARGETDIR/hol.log"'
	fi
	if	[ "$zed" = y ]
	then	out 'echo Installing zed demo database'
		out './install_zeddemo >zed.log 2>&1 || give_up "$PPTARGETDIR/zed.log"'
	fi
	if	[ "$daz" = y -a "$PPCOMPILER" = POLYML ]
	then	out 'echo Freezing daz database'
		out '( pp_make_database -f -p daz junk$$; rm junk$$.polydb ) >daz.log 2>&1 || give_up "$PPTARGETDIR/daz.log"'
	fi
	if	[ "$qcz" = y -a "$PPCOMPILER" = POLYML ]
	then	out 'echo Freezing qcz database'
		out '( pp_make_database -f -p qcz junk$$; rm junk$$.polydb ) >qcz.log 2>&1 || give_up "$PPTARGETDIR/qcz.log"'
	fi
fi
TAB=
out 'fi'
out 'if [ "$1" = "" -o "$1" = "+d" ]'
out 'then'
TAB='	'
if	[ "$DOPDF" = y -o "$DOPS" = y ]
then
	if	[ "$DOPDF" = y -o "$DOPS" = y ]
	then	out 'echo "Moving to documentation directory $PPTARGETDIR/doc" ...'
		out 'cd "$PPTARGETDIR/doc"'
	fi
	if	[ "$DOPDF" = y ]
	then	out 'echo "Converting documents to PDF (see $PPTARGETDIR/$DVI2PDF.log for messages)"'
		out 'for f in *.dvi'
		out 'do	$DVI2PDF $DVI2PDFOPTS $f'
		out 'done >"$PPTARGETDIR/$DVI2PDF.log" 2>&1'
	fi
	if	[ "$DOPS" = y ]
	then	out 'echo "Converting documents to PostScript (see $PPTARGETDIR/dvips.log for messages)"'
		out 'for f in *.dvi'
		out 'do	dvips -o "" $f'
		out 'done >"$PPTARGETDIR/dvips.log" 2>&1'
	fi
fi
out 'echo Generating HTML roadmap to the documents: $PPTARGETDIR/doc/index.html'
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
out "sed $HTMLEDIT"  '<"$PPBUILDDIR/src/index.html.src" > "$PPTARGETDIR/doc/index.html"'
out 'cp "$PPBUILDDIR/src/lemma1.gif" "$PPBUILDDIR/src/newpplogo.gif" "$PPTARGETDIR/doc"'
TAB=
out 'fi'
out 'date +"Installation complete [%c]"'
echo "If you are happy with these settings, now run ./install to install ProofPower."

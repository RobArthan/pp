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
# $Id: configure.sh,v 1.4 2002/10/20 20:29:19 rda Exp rda $
#
# Environment variables may be used to force various decisions:
#
# PPCOMPILER       - if set must be one of POLYML or SMLNJ
#                    (default: if Poly/ML is available use it, else SML/NJ)
# PPMOTIFLINKING   - if set must be one of static or dynamic
#                    (default: dynamic)
# PPINSTALLDIR     - if set must give the absolute path name of
#                    a directory the user can create or write to
#                    (default: first of /usr/share/pp, /usr/local/pp,
#                    /opt/pp, $HOME/pp that looks like it will work)
# PPTARGETDIR      - as PPINSTALLDIR, overrides PPINSTALLDIR if set and non-empty
# PPTARGETS        - a space separated list of packages to include
#                   (default: whichever of pptex hol zed daz xpp are there)
#
# If any of these is an empty string, it is treated as if it were unset.
#
# PPTARGETDIR is for developers who may want to test this script while
# retaining an existing setting for PPINSTALLDIR.
#
# The package names in PPTARGETS if used must be taken from the list:
# pptex dev hol zed daz xpp. This is mostly useful if you want to
# install the development kit (possibly separately from the other packages).
# The default is not to install it. It's the user's responsibility to ensure
# that the source directory or a directory on the search path already
# contains the compiled code for any packages that are needed by the specified
# packages (hol, zed and daz need dev and pptex, dev needs pptex). The packages
# are compiled in the order specified by the user.
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
elif	which poly
then	echo "Using Poly/ML"
	PPCOMPILER=POLYML
elif	which sml
then	echo "Using Standard ML of New Jersey"
	PPCOMPILER=SMLNJ
else	give_up "cannot find a Standard ML compiler"
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
	echo "Using $PPMOTIFLINKING linking"
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
if	[ `expr index "$PPTARGETDIR" "/"` != 1 ]
then	give_up "the target directory must be an absolute path name (i.e., begin with \"/\")"
fi
echo "Using $PPTARGETDIR as the installation target directory"
#
# Check for user-defined target list:
#
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
for f in $PPTARGETS
do	if	[ -e src/$f.mkf ]
	then	eval $f=y
		SOMETODO=y
	elif	[ "$USERDEFINEDTARGETS" = y ]
	then	give_up "the make file $f.mkf is missing from the source directory"
	else	eval $f=n
	fi
done
if	[ $SOMETODO = n ]
then	give_up "cannot find any packages to build in $CWD/src"
fi
echo "Generating code to install the following packages: $PPTARGETS"
#
# Build the script
#
out(){
	echo $* >>install
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
out "cd $CWD/src"
out 'OLD_PATH=$PATH'
out "PATH=.:"'$PATH'
out "export PATH"
#
# Build pptex and also slrp if slrp's needed and not going to be installed
#
if	[ "$dev" != y -a \( "$hol" = y -o "$zed" = y -o "$daz" = y \) ]
then	out "make -f pptex.mkf build"
	out "make -f dev.mkf build"
fi
#
# Loop round the packages outputting the commands to compile them
# (inst = binaries + documentation). The touch is a work-around for
# problems with temporary tex files that are created when the reference
# manuals are built and have the same names, but different contents and
# so need to be rebuilt.
for f in $PPTARGETS
do	if	[ "`eval echo '$'$f`" = y ]
	then	out 'touch dtd*.doc'
		out "make -f $f.mkf inst"
	fi
done
out "cd $PPTARGETDIR"
out "PATH=$PPTARGETDIR/bin:"'$OLD_PATH'
out "export PATH"
if	[ "$hol" = y ]
then	out "./install_holdemo >holdemo.log 2>&1"
fi
if	[ "$zed" = y ]
then	out "./install_zeddemo >zeddemo.log 2>&1"
fi
if	[ "$daz" = y -a $PPCOMPILER=POLYML ]
then	out '( pp_make_database -f -p daz junk$$; rm junk$$.polydb ) >dazinit.log 2>&1'
fi

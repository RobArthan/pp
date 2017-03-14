# ProofPower Developer Notes


## Files

The  top-level of the git repository contains
the following versioned files.

- LICENSE.md - the GPL
- NOTES.md - these notes
- README.md - the README file for the repo
- dev_env - shell environment set-up for developers
- src - parent for the source directories for the packages
- tools - tools, mainly for building releases

Once you get started, the directory will also contain one or
both of the following unversioned directories:

- bld - the installation directory for your work in progress
- rel - parent for release directories and tarballs

## Set-up


The following assumes your ProofPower git repository is
in $HOME/git/pp. If not, then make the obvious changes.
Nothing should depend on the name used for the repository directory.

If you are developing ProofPower, you will spend most of your
time in the subdirectory of src for the package you are working
on. Before you do this you will need to set up your shell
environment and install the packages you need in $HOME/git/pp/bld.

First, in $HOME/git/pp, have a look at dev_env to see what it does.
You may well want to make changes to make the PATH variable
it sets up suit your needs. When you are happy with it, source it:

    . dev_env

It is useful to know the dependencies between the packages.

- pptex has no dependencies
- dev depends on pptex (but only for typesetting the documentation)
- xpp depends on pptex (for typesetting the documentation and for some C code)
- hol depends on dev
- zed depends on hol
- daz depends on zed

Now visit each of the package directories in turn in some order respecting the
above dependencies and build the `inst` target using the package make file.
This will build a ProofPower installation directory in $HOME/git/pp/bld. You
could just build your package and the ones it depends on, but I usually do the
lot:

    for p in pptex xpp dev hol zed daz
    do
        cd $HOME/git/pp/src/$p
        make -f $p.mkf inst
    done

The above will install the xpp editor in $HOME/git/pp/bld so that (after
sourcing dev_env) you can use it from there while you are developing any of
hol, zed or daz.  This will typically be easier than picking up xpp from
another ProofPower installation on your PATH.

Now go to your package directory and do your stuff, using the `inst` target to
recompile. For hol, zed and daz you can also use the `bininst` target which
saves a bit of time by not regenerating the documents. You will generally need
to clean the package directory first. E.g.,

    make -f hol.mkf clean
    make -f hol.mkf bininst

(You could also use `git clean -xf` to do the clean, but it is more aggressive
in what it removes. In particular, the `clean` targets will not delete files
with `.txt` or `.sh` extensions or unknown files with no extension, so you can
safely use such file names for temporarty working data or scripts.)

Run the test suite for the package by making the target test, e.g., in hol:

    make -f hol.mkf test

## tools directory

The tools directory is where you build releases. It also contains
other odds and ends, currently just comprising a blank Lemma 1 document.

You construct a release in $HOME/git/tools using make_rel.
In simple use you just run it with the version number as parameter:

    make_rel 1.1w53

This will create the installation directory and the tarball for
the release as children of $HOME/bgit/pp/rel.
make_rel has other parameters that are for use when including
the ProofPower repository as a submodule of another repo.

Releases should be tagged with their version number:

    git tag -a 1.1w53

Rob Arthan (rda@lemma-one.com) 18 April 2015

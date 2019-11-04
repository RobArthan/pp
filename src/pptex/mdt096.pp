=IGN
********************************************************************************
mdt096.pp: this file is part of the PPDev system

Copyright (c) 2019 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
%%%%% YOU MAY WANT TO CHANGE POINT SIZE IN THE FOLLOWING:
\documentclass[a4paper,12pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\usepackage{epsf}
\makeindex
\def\Slrp{{\bf SLRP}}
\def\Hide#1{\relax}
\ftlinepenalty=9999

%%%%% YOU WILL USUALLY WANT TO CHANGE THE FOLLOWING TO SUIT YOU AND YOUR DOCUMENT:

\def\Title{ Tests for Sieve }

\def\Abstract{\begin{center}
{\bf Abstract}\par
{Tests for the sieve program, automatically generated from the default viewfile.}
\end{center}}

\def\Reference{DS/FMU/IED/MDT096}

\def\Author{R.B.~Jones}

\def\EMail{{\tt rbj@rbjones.com}}

%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge \Title } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{$Revision: 0.3 $%
}
\def\Date{\FormatDate{$Date: 2019/10/06 15:03:54 $%
}}

%%%%% NOW BEGIN THE DOCUMENT AND MAKE THE FRONT PAGE

\begin{document}
\headsep=0mm
\FrontPage
\headsep=10mm

%%%%% STANDARD RED-TAPE SECTIONS (MAY WANT TO INTERLEAVE SOME \newpage COMMANDS IN THESE)

%%%%% CONTENTS:

\subsection{Contents}

\tableofcontents

%%%%% REFERENCES:

\subsection{References}

\bibliographystyle{fmu}

%%%%% CHANGE THE FOLLOWING AS NECESSARY (E.G., TO PICK UP daz.bib):
{\raggedright
\bibliography{fmu}
}
%%%%% CHANGES HISTORY:
\subsection{Changes History}
\begin{description}

\item[2019"10:10] First draft.

%%%% END OF CHANGES HISTORY %%%%
\end{description}

%%%%%  CHANGES FORECAST:

\subsection{Changes Forecast}

Lots.

\newpage
\section{GENERAL}
\subsection{Scope}
The intention is to exercise all the categories of material which are covered by the default viewfile, initially both in ext and utf8.

\subsection{Introduction}

The idea is to chose a single passage of material which exercises the full ext character set and a selection of other unicode characters, including indexed names, and to edit this automatically into a copy of the view file instead of the material between directives, also modifying the actual directives as necessary (i.e. remove view name, perhaps add parameters).
In this way modify the utf8 version of the view file, and translate it back into ext for the ext version of the test.
The ext version will be run through on a pre-utf8 version of ProofPower to establish the "correct" answers (with some manual checking), which will be translated back to unicode to provide reference material for the utf8 mode runs of the tests (subject to manual editing if there should prove to be any cases where these mappings legitimately don't commute.
The test will be run through sieve in every view supported by the view file.

A perl script will generate the tests in the first instance.
Shell scripts to run and check them.

\subsection{Purpose and Background}
See \cite{LEMMA1/HOL/DTD118}.

\section{TEST CASES}

The following is the material to be injected.
It is Chapter "NON-ASCII CHARACTER SET" from USR001 with all directives removed and an extra wadge of exotic unicode character added at the end.

=DUMP mdt096a.pl
#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

my $body_text = <<'END_OF_BODY_TEXT';
cat <<'EOF' >/dev/null

The non-ascii character set provides characters grouped
into various categories.

{\tabstop0.3in\vertbarfalse

\section{Greek Letters}

These may be freely used between the indexing characters.

	Γ	Δ	Θ	Λ	Ξ	Π	Σ	Υ	Φ	Ψ	Ω
	α	β	γ	δ	ε	ζ	η	θ	ι	κ	λ	μ
	ν	ξ	π	ρ	σ	τ	υ	φ	χ	ψ	ω

\section{Logic, Equivalence and Related Symbols}

These may be freely used between the indexing characters.

	∧	∨	¬	∀	∃	⦁	×	≤	≠	≥	∈	∉	⇔	⇒

\section{Set Symbols}

These may be freely used between the indexing characters.

	𝔹	ℂ	𝔽	ℕ	ℙ	ℚ	ℝ	𝕊	𝕌	ℤ	⊆	∅	⊂	∩	⋂	∪	⋃	⊖

\Section{Arrows}

These may be freely used between the indexing characters.

	→	⤖	⤕	⇻	↔	⤀	⇸	↣	↦	↠	⤔

\section{Formal Text Brackets}

Indexing of these non-ascii characters is not supported.


	⌜	ⓣ	ⓜ	ⓩ	⌝	Ⓢ	■	┌	└	╒	├


\section{Padding Symbols}

Indexing of these non-ascii characters is not supported.  Attempting to
do so tends to get an index entry with just a page number!

	│	─	═


\section{Index Brackets}

Indexing of the indexing brackets themselves is not supported.

\section{Bracketing Symbols}

These may be freely used between the indexing characters.

	⟨	⟩	⟦	⟧	⦇	⦈

\section{Subscription and Superscription}

These characters may be used as part of the identifiers in indexed
entries, but they will cause the appropriate subscription or
superscription, their images will not be shown in the index.

	⋎	⋏	↗	↘	↕

These subscription and superscription characters must be used carefully
or \LaTeX{} may give error messages, probably relating to unmatched
grouping symbols (i.e., the \verb|{| and \verb|}| characters).


\begin{center}
\tabcolsep=1cm
\begin{tabular}{llllll}
Character:	& \DNchar	& \UPchar	& \UPtext	& \DNtext	& \CANtext	\\
\LaTeX:		& \verb|_|	& \verb|^|	& \verb|^{|	& \verb|_{|	& \verb|}|	\\
\end{tabular}
\end{center}

\section{Underlining}
These underlining brackets enclose a block of text that will be underlined. The brackets must balance. Underlining brackets may be nested to achieve multiple underlining. The underlined text may extend over multiple lines.

	⨽	⨼


\section{Relation, Sequence and Bag Symbols}

These may be freely used between the indexing characters.

	⩥	▷	⩤	◁	⁀	↾	↿	⊕	⊎	⨾	∘

\section{Miscellaneous}

These may be freely used between the indexing characters.

	⊢	⦂	≜	⊥	⊖


Supplemental Arrows-B[1]

Official Unicode Consortium code chart (PDF)

		 0	1	2	3	4	5	6	7	8	9	A	B	C	D	E	F
U+290x	⤀	⤁	⤂	⤃	⤄	⤅	⤆	⤇	⤈	⤉	⤊	⤋	⤌	⤍	⤎	⤏
U+291x	⤐	⤑	⤒	⤓	⤔	⤕	⤖	⤗	⤘	⤙	⤚	⤛	⤜	⤝	⤞	⤟
U+292x	⤠	⤡	⤢	⤣	⤤	⤥	⤦	⤧	⤨	⤩	⤪	⤫	⤬	⤭	⤮	⤯
U+293x	⤰	⤱	⤲	⤳	⤴	⤵	⤶	⤷	⤸	⤹	⤺	⤻	⤼	⤽	⤾	⤿
U+294x	⥀	⥁	⥂	⥃	⥄	⥅	⥆	⥇	⥈	⥉	⥊	⥋	⥌	⥍	⥎	⥏
U+295x	⥐	⥑	⥒	⥓	⥔	⥕	⥖	⥗	⥘	⥙	⥚	⥛	⥜	⥝	⥞	⥟
U+296x	⥠	⥡	⥢	⥣	⥤	⥥	⥦	⥧	⥨	⥩	⥪	⥫	⥬	⥭	⥮	⥯
U+297x	⥰	⥱	⥲	⥳	⥴	⥵	⥶	⥷	⥸	⥹	⥺	⥻	⥼	⥽	⥾	⥿
EOF
END_OF_BODY_TEXT

my $viewfilename = shift @ARGV;
my $sievetestfile = "mdt096b";
my $sievedumpfile = "mdt096c";
my $sievedumpfileacc = "mdt096d";
my $textforcatfile = "mdt096e";

system("echo \"text for cat\n\" > $textforcatfile");

my $sh_text = <<"END_OF_TEXT";
cat $textforcatfile
END_OF_TEXT
    
my $cat_text = "$textforcatfile\n";
 
my %views = ();
 
open (my $SF, "<", $viewfilename) or die $!;

my $directive = "";
my $view = "";
my $minargs = -1;
my $maxargs = 0;
my $write = 0;
my $append = 0;
my $filter = 0;
my $dumpfile = 0;
my %metadata = ();
my $dirdata;

# Scan the view file to gather information about directives and views

while (<$SF>){
    if (/^$/ || /^[\s#]/) {next};
    /^(\S*)\s*(\S*)/;
    $directive = $1;
    $view=$2;
    unless (exists $metadata{$directive}) {
	$metadata{$directive} = \{dummy=>1}
};
$dirdata = $metadata{$directive};
$views{$view} = ();
$minargs = 0;
$maxargs = 0;
$write = 0;
$append = 0;
$filter = 0;
while (<$SF>){
    if (/^\s+arguments\s+(\d)(\s+(\d)|)/){
	$minargs = $1;
	$maxargs = (defined($3) ? $3 : $minargs);
	next
    } elsif (/^\s+write\s+\$(\d)/){
	$write = $1; next
    } elsif (/^\s+append\s+\$(\d)/){
	$append = $1; next
    } elsif (/^\s+filter\s+(\S+)/){
	$filter = $1; next
    } elsif (/^\s/) {next}
    else {last}
}
# print "$directive\t$view $minargs $maxargs $write $append $filter\n";
if ($minargs>=0) {${$dirdata}->{minargs} = $minargs};
if ($maxargs) {${$dirdata}->{maxargs}=$maxargs};
if ($write) {${$dirdata}->{write}=1};
if ($append) {${$dirdata}->{append}=1};
if ($filter) {${$dirdata}->{filter}=$filter};
};
close $SF;

# Now write the test file

open (my $TF, ">", $sievetestfile) or die $!;
my $dumpcount=0;
foreach my $dir (sort(keys %metadata)){
    $dirdata=$metadata{$dir};
    print $TF $dir;
    print $TF ("\t",
	          ${$dirdata}->{append}  ? $sievedumpfile."0"
		: ${$dirdata}->{write}   ? $sievedumpfile.(sprintf("%d",++$dumpcount))
	        : ${$dirdata}->{minargs} ? $sievedumpfile
	        : "",
	       "\n");
    my $fil = ${$dirdata}->{filter};
 #  if (defined($fil)) {print "filter for $dir is $fil\n"};
    print $TF (
	 defined ($fil)
	 ? ($fil eq "cat" ? $cat_text : $sh_text)
	 : $body_text
	 );
};

close $TF;

system("echo \"\" > $sievedumpfileacc");

# Now run sieve on the test file for each view

for my $view (sort keys %views) {
    print "sieve $view <$sievetestfile >$sievedumpfile\n";
    system("sieve $view <$sievetestfile >$sievedumpfile");
    system("echo \"@@@@@@@@@@@@ view $view @@@@@@@@@@@@@@@ sieve $view <$sievetestfile >$sievedumpfile @@@@@@@\n\" >> $sievedumpfileacc");
    system("cat $sievedumpfile >> $sievedumpfileacc");
    system("rm $sievedumpfile");
}

# Append to the main output file the output from all the dump files

for my $dump (0..$dumpcount) {
    system("echo \"@@@@@@@@@@@@ cat $sievedumpfile$dump >> $sievedumpfileacc @@@@@@@@@@@\n\" >> $sievedumpfileacc");
    system("cat $sievedumpfile$dump >> $sievedumpfileacc");
    system("rm -f $sievedumpfile$dump");
};

system("rm -f $sievetestfile");
system("rm -f $textforcatfile");

#    system("\nls -l mdt096*");

# Diff this combined file with the reference output
=TEX

=SH
perl mdt096a.pl utf8svf
=TEX
\end{document}
=IGN


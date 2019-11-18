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


=DUMP mdt096a.pl
#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

my $body_text_head = <<'END_OF_BODY_TEXT';
cat <<'EOF' >/dev/null
END_OF_BODY_TEXT

my $body_text = <<'END_OF_BODY_TEXT';

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

# minimal keywordfile 

# This is a stripped down keyword file for use with document
# processors which accept utf8 such as lualatex.

# The only change is to delete most of the LaTeX macros.
#
#
# This keywordfile contains support for the Z and HOL extended character
# set together with some additional keywords giving access to the calligraphic
# letters and the symbols given in tables 3.4, 3.5, 3.6 and 3.7 of the
# LaTeX User's Guide and Reference Manual (L. Lamport 1986).
# The calligraphic letters are called %calA%, %calB%, etc.
# Blackboard bold letters are also supported and are called %bbA%,
# %bbB%, etc. Blackboard bold B, C, F, N, P, Q, R, U and Z have extended
# characters assigned to them and have the aliases:
# The keywords for the symbols from the tables have the same names as in LaTeX
# (e.g. the infinity symbol, \infty in LaTeX, has keyword %infty%), with the
# exception of the names in the following table:
#
# The character codes supplied in this file were once the codes in the ProofPower
# extended character set, but are now UNICODE code points.
#
# LaTeX Name		Keyword
# ===== ====		=======
# \Leftrightarrow	
# \subseteq 		
# \ast 			N/A (use ASCII `*')
# \supset		%supset%
# \supseteq 		
# \equiv		%identical%
# \sim			N/A (use ASCII `~')
# \mid 			N/A (use ASCII `|')
# \backslash 		N/A (use ASCII `\')
# \int			%integral%
# \bullet		%=>%
# \cap			%intersect%
# \cup			%union%
# \uplus		%bagunion%
# \vee			%or%
# \wedge		%and%
# \oplus		%overwrite%
# \amalg		%coprod%
# \in			%mem%
# \vdash		%thm%
# \perp			%bottom%
# \frown		%cat%
# \rightarrow		%fun%
# \Rightarrow		%implies%
# \leftrightarrow	%rel%
# \Leftrightarrow	
# \mapsto		%map%
# \bot			%bottom%
# \|			%parallel%
# \neg			%not%
# \triangle		%bigtriangleup%
#
# (The exceptions arise either because LaTeX gives more than one name
# for a symbol or because the keyword is taken from Z usage)
%bbI%			simple	 0x01D540
%bbJ%			simple	 0x01D541
%bbK%			simple	 0x01D542
%bbL%			simple	 0x01D543
%bbM%			simple	 0x01D544
%bbN%			simple	 0x002115
%bbO%			simple	 0x01D546
%bbP%			simple	 0x002119
%bbS%			simple	 0x01D54A
%bbT%			simple	 0x01D54B
%bbU%			simple	 0x01D54C
%bbV%			simple	 0x01D54D
%bbW%			simple	 0x01D54E
%bbX%			simple	 0x01D54F
%bbY%			simple	 0x01D550
%beta%			simple	 0x0003B2
%bigcirc%		simple	 0x0025ef
%bigcolon%		simple	 0x002982
%bigodot%		simple	 0x002a00
%bigoplus%		simple	 0x002a01
%bigotimes%		simple	 0x002a02
%bigsqcup%		simple	 0x002a06
%bigtriangledown%	simple	 0x0025bd
%bigtriangleup%		simple	 0x0025b3
%biguplus%		simple	 0x002a04
%bigvee%		simple	 0x0022c1
%bigwedge%		simple	 0x0022c0
%bij%			simple	 0x002916
%boolean%		sameas	 %bbB%
%bottom%		simple	 0x0022A5
%bowtie%		simple	 0x0022c8
%calA%			simple	 0x1D49C
%calB%			simple	 0x0212C
%calC%			simple	 0x1D49E
%calD%			simple	 0x1D49F
%calE%			simple	 0x02130
%calF%			simple	 0x02131
%calG%			simple	 0x1D4A2
%calH%			simple	 0x0210B
%calI%			simple	 0x02110
%calJ%			simple	 0x1D4A5
%calK%			simple	 0x1D4A6
%calL%			simple	 0x02112
%calM%			simple	 0x02133
%calN%			simple	 0x1D4A9
%calO%			simple	 0x1D4AA
%calP%			simple	 0x1D4AB
%calQ%			simple	 0x1D4AC
%calR%			simple	 0x0211B
%calS%			simple	 0x1D4AE
%calT%			simple	 0x1D4AF
%calU%			simple	 0x1D4B0
%calV%			simple	 0x1D4B1
%calW%			simple	 0x1D4B2
%calX%			simple	 0x1D4B3
%calY%			simple	 0x1D4B4
%calZ%			simple	 0x1D4B5
%cantext%		simple	 0x002195
%ulbegin%		simple	 0x002A3D
%ulend%			simple	 0x002A3C
%cat%			simple	 0x002040
%cdot%			simple	 0x00010b
%chi%			simple	 0x0003C7
%circ%			sameas	 %fcomp%
%clubsuit%		simple	 0x002663
%complex%		sameas	 %bbC%
%cong%			simple	 0x002245
%coprod%		simple	 0x002210
%dagger%		simple	 0x002020
%dashv%			simple	 0x0022a3
%ddagger%		simple	 0x002021
%def%			simple	 0x00225C
%delta%			simple	 0x0003B4
%diamond%		simple	 0x0022c4
%diamondsuit%		simple	 0x002666
%dintersect%		simple	 0x0022C2
%div%			simple	 0x0000f7
%dntext%		simple	 0x002198	\PrOI{}
%doteq%			simple	 0x002250
%down%			simple	 0x0022CE
%downarrow%		simple	 0x002193	\MMM{\downarrow}
%dres%			simple	 0x0025C1	\MMM{\dres}
%dsub%			simple	 0x002A64	\dsub{}
%dunion%		simple	 0x0022C3
%ell%			simple	 0x002113
%emptyset%		simple	 0x002205
%epsilon%		simple	 0x0003B5
%equiv%			simple	 0x0021D4
%eta%			simple	 0x0003B7
%exists%		simple	 0x002203
%extract%		simple	 0x0021BF
%fcomp%			simple	 0x002218
%ffun%			simple	 0x0021FB
%filter%		simple	 0x0021BE
%finj%			simple	 0x002915
%flat%			simple	 0x00266d
%fn%			sameas	 %lambda%
%forall%		simple	 0x002200
%fset%			sameas	%bbF%
%fun%			simple	 0x002192
%gamma%			simple	 0x0003B3
%geq%			simple	 0x002265
%gg%			simple	 0x00226b
%hbar%			simple	 0x00210f
%heartsuit%		simple	 0x002665
%hookleftarrow%		simple	 0x0021a9
%hookrightarrow%	simple	 0x0021aa
%identical%		simple	 0x002261
%imath%			simple	 0x000131
%implies%		simple	 0x0021D2
%infty%			simple	-1	\MMM{\infty}
%inj%			simple	 0x0021A3
%integral%		simple	-1	\MMM{\int}
%intersect%		simple	 0x002229
%iota%			simple	 0x0003B9
%jmath%			simple	 0x000237
%kappa%			simple	 0x0003BA
%lambda%		simple	 0x0003BB
%lbag%			simple	 0x0027E6
%lchevron%		simple	-1	{\langle}
%leadsto%		simple	-1	\MMM{\leadsto}
%leftarrow%		simple	 0x002190
%leftharpoondown%	simple	 0x0021bd
%leftharpoonup%		simple	 0x0021bc
%leq%			simple	 0x002264
%lhd%			simple	-1	\MMM{\lhd}
%ll%			simple	 0x00226a
%longleftarrow%		simple	 0x0027f5
%longleftrightarrow%	simple	 0x0027f7
%longmapsto%		simple	 0x0027fc
%longrightarrow%	simple	 0x0027f6
%lrelimg%		simple	 0x002987
%lseq%			simple	 0x0027E8
%map%			simple	 0x0021A6
%mem%			simple	 0x002208
%mho%			simple	 0x002127
%models%		simple	 0x0022a7
%mp%			simple	 0x002213
%mu%			simple	 0x0003BC
%nabla%			simple	 0x002207
%nat%			sameas	%bbN%
%natural%		simple	 0x00266e
%nearrow%		simple	 -1
%neq%			simple	 0x002260
%ni%			simple	 0x00220b
%not%			simple	 0x0000AC
%notmem%		simple	 0x002209
%nu%			simple	 0x0003BD
%nwarrow%		simple	 0x002196
%odot%			simple	 0x002299
%oint%			simple	 0x00222e
%omega%			simple	 0x0003C9
%ominus%		simple	 0x002296
%or%			simple	 0x002228
%oslash%		simple	 0x0000f8
%otimes%		simple	 0x002297
%overwrite%		simple	 0x002295
%parallel%		simple	 0x002225
%partial%		simple	-1	\MMM{\partial}
%pfun%			simple	 0x0021F8
%phi%			simple	 0x0003C6
%pi%			simple	 0x0003C0
%pinj%			simple	 0x002914
%pm%			simple	 0x0000b1
%prec%			simple	 0x00227a
%preceq%		simple	 0x002aaf
%prod%			simple	 0x00220f
%propto%		simple	 0x00221d
%pset%			sameas	%bbP%
%psi%			simple	 0x0003C8
%psubset%		simple	 0x002282
%psupset%		simple	 0x002283
%psurj%			simple	 0x002900
%rbag%			simple	 0x0027E7
%rchevron%		simple	-1	{\rangle}
%rcomp%			simple	 0x002A3E
%rat%			sameas	 %bbQ%
%real%			sameas	 %bbR%
%refinedby%		sameas	 %sqsubseteq%
%rel%			simple	 0x002194
%rhd%			simple	-1	\MMM{\rhd}
%rho%			simple	 0x0003C1
%rightharpoondown%	simple	 0x0021c1
%rightharpoonup%	simple	 0x0021c0
%rightleftharpoons%	simple	 0x0021cc
%rrelimg%		simple	 0x002988
%rres%			simple	 0x0025B7
%rseq%			simple	 0x0027E9
%rsub%			simple	 0x002A65
%searrow%		simple	 -1	\MMM{\searrow}
%select%		sameas	 %epsilon%
%setminus%		simple	 0x002216
%sharp%			simple	 0x00266f
%sigma%			simple	 0x0003C3
%simeq%			simple	 0x002243
%smile%			simple	 0x002323
%spadesuit%		simple	 0x002660
%spot%			simple	 0x002981
%sqcap%			simple	 0x002293
%sqcup%			simple	 0x002294
%sqsubset%		simple	 0x00228f
%sqsubseteq%		simple	 0x002291
%star%			simple	 0x002606
%succ%			simple	 0x00227b
%succeq%		simple	 0x002ab0
%sum%			simple	 0x002211
%supset%		simple	 0x002283
%surd%			simple	-1	\MMM{\surd}
%surj%			simple	 0x0021A0
%swarrow%		simple	 0x002199
%symbol%		sameas	 %bbS%
%symdiff%		simple	 0x002296
%tau%			simple	 0x0003C4
%theta%			simple	 0x0003B8
%thm%			simple	 0x0022A2
%top%			simple	 0x0022a4
%triangleleft%		simple	 0x0025c3
%triangleright%		simple	 0x0025b9
%u%			sameas	 %bbU%
%uminus%		simple	 0x00FE63
%union%			simple	 0x00222A
%unlhd%			simple	-1	\MMM{\unlhd}
%unrhd%			simple	-1	\MMM{\unrhd}
%up%			simple	 0x0022CF	
%uparrow%		simple	 0x002191	\MMM{\uparrow}
%updownarrow%		simple	 -1	\MMM{\updownarrow}
%upsilon%		simple	 0x0003C5
%uptext%		simple	 0x002197	\PrOH{}
%wp%			simple	 0x002118
%wr%			simple	 0x002240
%x%			simple	 0x0000D7
%xi%			simple	 0x0003BE
%zeta%			simple	 0x0003B6
EOF
END_OF_BODY_TEXT

my $body_text2 = <<'END_OF_BODY_TEXT';

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
my $keyfilename = shift @ARGV;
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

# Now write the test file (unless a file is supplied)

my $dumpcount=0;
if(my $testfilename = shift @ARGV) {
      $sievetestfile = $testfilename;
} else {
  open (my $TF, ">", $sievetestfile) or die $!;
  foreach my $dir (sort(keys %metadata)){
  	   $dirdata=$metadata{$dir};
    	   my $dirline = "$dir ".
	           ( ${$dirdata}->{append}  ? $sievedumpfile."0"
		   	: ${$dirdata}->{write}   ? $sievedumpfile.(sprintf("%d",++$dumpcount))
	        	: ${$dirdata}->{minargs} ? $sievedumpfile
	        	: "");
 	   print $TF "$dirline\n";
    	   my $fil = ${$dirdata}->{filter};
       	      print $TF (
	      defined ($fil)
	      ? ($fil eq "cat" ? $cat_text : $sh_text)
	      : $body_text_head."&&&&&&&\tdirective: \"$dirline\"\t&&&&&&&\n".$body_text
	   );
  };
  close $TF;
};

system("echo \"\" > $sievedumpfileacc");

# Now run sieve on the test file for each view

for my $view (sort keys %views) {
    print "sieve -f $viewfilename -K -k $keyfilename $view <$sievetestfile >$sievedumpfile\n";
    system("sieve -f $viewfilename -K -k $keyfilename $view <$sievetestfile >$sievedumpfile");
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

#system("rm -f $sievetestfile");
system("rm -f $textforcatfile");

#    system("\nls -l mdt096*");

# Diff this combined file with the reference output
=TEX

=SH
perl mdt096a.pl utf8svf sievekeyword
=TEX
\end{document}
=IGN

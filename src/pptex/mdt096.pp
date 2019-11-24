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
cat <<'EOF' >/dev/null
These may be freely used between the indexing characters.

	Γ	Δ	Θ	Λ	Ξ	Π	Σ	Υ	Φ	Ψ	Ω
	α	β	γ	δ	ε	ζ	η	θ	ι	κ	λ	μ
	ν	ξ	π	ρ	σ	τ	υ	φ	χ	ψ	ω

\section{Logic, Equivalence and Related Symbols}

	∧	∨	¬	∀	∃	⦁	×	≤	≠	≥	∈	∉	⇔	⇒

\section{Set Symbols}

	𝔹	ℂ	𝔽	ℕ	ℙ	ℚ	ℝ	𝕊	𝕌	ℤ	⊆	∅	⊂	∩	⋂	∪	⋃	⊖

\Section{Arrows}

	→	⤖	⤕	⇻	↔	⤀	⇸	↣	↦	↠	⤔

\section{Formal Text Brackets}

	⌜	ⓣ	ⓜ	ⓩ	⌝	Ⓢ	■	┌	└	╒	├

\section{Padding Symbols}

	│	─	═

\section{Bracketing Symbols}

These may be freely used between the indexing characters.

	⟨	⟩	⟦	⟧	⦇	⦈

\section{Subscription and Superscription}

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
	⨽	⨼


\section{Relation, Sequence and Bag Symbols}

	⩥	▷	⩤	◁	⁀	↾	↿	⊕	⊎	⨾	∘

\section{Miscellaneous}

	⊢	⦂	≜	⊥	⊖

# minimal keywordfile 

 The calligraphic letters are called %calA%, %calB%, etc.
# Blackboard bold letters are also supported and are called %bbA%,
# %bbB%, etc. Blackboard bold B, C, F, N, P, Q, R, U and Z have extended
# characters assigned to them and have the aliases:
# The keywords for the symbols from the tables have the same names as in LaTeX
# (e.g. the infinity symbol, \infty in LaTeX, has keyword %infty%), with the
# exception of the names in the following table:
#
# LaTeX Name		Keyword
# ===== ====		=======
# \Leftrightarrow	
# \subseteq 		
# \ast 			N/A (use ASCII `*')
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

%bbI%  0x01D540
%bbJ%	 0x01D541
%bbK%	 0x01D542
%bbL%	 0x01D543
%bbM%	 0x01D544
%bbN%	 0x002115
%bbO%	 0x01D546
%bbP%	 0x002119
%bbS%	 0x01D54A
%bbT%	 0x01D54B
%bbU%	 0x01D54C
%bbV%	 0x01D54D
%bbW%	 0x01D54E
%bbX%	 0x01D54F
%bbY%	 0x01D550
%beta%	 0x0003B2
%bigcirc%		simple	 0x0025ef
%bigcolon%		 0x002982
%bigodot%		 0x002a00
%bigoplus%		 0x002a01
%bigotimes%		 0x002a02
%bigsqcup%		 0x002a06
%bigtriangledown%	 0x0025bd
%bigtriangleup%		 0x0025b3
%biguplus%		 0x002a04
%bigvee%		 0x0022c1
%bigwedge%		 0x0022c0
%bij%	 0x002916
%boolean%		sameas	 %bbB%
%bottom%		 0x0022A5
%bowtie%		 0x0022c8
%calA%	 0x1D49C
%calB%	 0x0212C
%calC%	 0x1D49E
%calD%	 0x1D49F
%calE%	 0x02130
%calF%	 0x02131
%calG%	 0x1D4A2
%calH%	 0x0210B
%calI%	 0x02110
%calJ%	 0x1D4A5
%calK%	 0x1D4A6
%calL%	 0x02112
%calM%	 0x02133
%calN%	 0x1D4A9
%calO%	 0x1D4AA
%calP%	 0x1D4AB
%calQ%	 0x1D4AC
%calR%	 0x0211B
%calS%	 0x1D4AE
%calT%	 0x1D4AF
%calU%	 0x1D4B0
%calV%	 0x1D4B1
%calW%	 0x1D4B2
%calX%	 0x1D4B3
%calY%	 0x1D4B4
%calZ%	 0x1D4B5
%cantext%		 0x002195
%ulbegin%		 0x002A3D
%ulend%	 0x002A3C
%cat%	 0x002040
%cdot%	 0x00010b
%chi%	 0x0003C7
%circ%			sameas	 %fcomp%
%clubsuit%		 0x002663
%complex%		sameas	 %bbC%
%cong%	 0x002245
%coprod%		 0x002210
%dagger%		 0x002020
%dashv%	 0x0022a3
%ddagger%		 0x002021
%def%	 0x00225C
%delta%	 0x0003B4
%diamondsuit%		 0x002666
%dintersect%		 0x0022C2
%div%	 0x0000f7
%dntext%		 0x002198	\PrOI{}
%doteq%	 0x002250
%down%	 0x0022CE
%downarrow%		 0x002193	\MMM{\downarrow}
%dres%	 0x0025C1	\MMM{\dres}
%dsub%	 0x002A64	\dsub{}
%dunion%		 0x0022C3
%ell%	 0x002113
%emptyset%		 0x002205
%epsilon%		 0x0003B5
%equiv%	 0x0021D4
%eta%	 0x0003B7
%exists%		 0x002203
%extract%		 0x0021BF
%fcomp%	 0x002218
%ffun%	 0x0021FB
%filter%		 0x0021BE
%finj%	 0x002915
%flat%	 0x00266d
%fn%			sameas	 %lambda%
%forall%		 0x002200
%fset%			sameas	%bbF%
%fun%	 0x002192
%gamma%	 0x0003B3
%geq%	 0x002265
%gg%	 0x00226b
%hbar%	 0x00210f
%heartsuit%		 0x002665
%hookleftarrow%		 0x0021a9
%hookrightarrow%	 0x0021aa
%identical%		 0x002261
%imath%	 0x000131
%implies%		 0x0021D2
%infty%	-1	\MMM{\infty}
%inj%	 0x0021A3
%integral%		-1	\MMM{\int}
%intersect%		 0x002229
%iota%	 0x0003B9
%jmath%	 0x000237
%kappa%	 0x0003BA
%lambda%		 0x0003BB
%lbag%	 0x0027E6
%lchevron%		-1	{\langle}
%leadsto%		-1	\MMM{\leadsto}
%leftarrow%		 0x002190
%leftharpoondown%	 0x0021bd
%leftharpoonup%		 0x0021bc
%leq%	 0x002264
%lhd%	-1	\MMM{\lhd}
%ll%	 0x00226a
%longleftarrow%		 0x0027f5
%longleftrightarrow%	 0x0027f7
%longmapsto%		 0x0027fc
%longrightarrow%	 0x0027f6
%lrelimg%		 0x002987
%lseq%	 0x0027E8
%map%	 0x0021A6
%mem%	 0x002208
%mho%	 0x002127
%models%		 0x0022a7
%mp%	 0x002213
%mu%	 0x0003BC
%nabla%	 0x002207
%nat%			sameas	%bbN%
%natural%		 0x00266e
%neq%	 0x002260
%ni%	 0x00220b
%not%	 0x0000AC
%notmem%		 0x002209
%nu%	 0x0003BD
%nwarrow%		 0x002196
%odot%	 0x002299
%oint%	 0x00222e
%omega%	 0x0003C9
%ominus%		 0x002296
%or%	 0x002228
%oslash%		 0x0000f8
%otimes%		 0x002297
%overwrite%		 0x002295
%parallel%		 0x002225
%partial%		-1	\MMM{\partial}
%pfun%	 0x0021F8
%phi%	 0x0003C6
%pi%	 0x0003C0
%pinj%	 0x002914
%pm%	 0x0000b1
%prec%	 0x00227a
%preceq%		 0x002aaf
%prod%	 0x00220f
%propto%		 0x00221d
%pset%			sameas	%bbP%
%psi%	 0x0003C8
%psubset%		 0x002282
%psupset%		 0x002283
%psurj%	 0x002900
%rbag%	 0x0027E7
%rchevron%		-1	{\rangle}
%rcomp%	 0x002A3E
%rat%			sameas	 %bbQ%
%real%			sameas	 %bbR%
%refinedby%		sameas	 %sqsubseteq%
%rel%	 0x002194
%rhd%	-1	\MMM{\rhd}
%rho%	 0x0003C1
%rightharpoondown%	 0x0021c1
%rightharpoonup%	 0x0021c0
%rightleftharpoons%	 0x0021cc
%rrelimg%		 0x002988
%rres%	 0x0025B7
%rseq%	 0x0027E9
%rsub%	 0x002A65
%select%		sameas	 %epsilon%
%setminus%		 0x002216
%sharp%	 0x00266f
%sigma%	 0x0003C3
%simeq%	 0x002243
%smile%	 0x002323
%spadesuit%		 0x002660
%spot%	 0x002981
%sqcap%	 0x002293
%sqcup%	 0x002294
%sqsubset%		 0x00228f
%sqsubseteq%		 0x002291
%star%	 0x002606
%succ%	 0x00227b
%succeq%		 0x002ab0
%sum%	 0x002211
%surd%	-1	\MMM{\surd}
%surj%	 0x0021A0
%swarrow%		 0x002199
%symbol%		sameas	 %bbS%
%symdiff%		 0x002296
%tau%	 0x0003C4
%theta%	 0x0003B8
%thm%	 0x0022A2
%top%	 0x0022a4
%triangleleft%		 0x0025c3
%triangleright%		 0x0025b9
%u%			sameas	 %bbU%
%uminus%		 0x00FE63
%union%	 0x00222A
%unlhd%	-1	\MMM{\unlhd}
%unrhd%	-1	\MMM{\unrhd}
%up%	 0x0022CF	
%uparrow%		 0x002191	\MMM{\uparrow}
%upsilon%		 0x0003C5
%uptext%		 0x002197	\PrOH{}
%wp%	 0x002118
%wr%	 0x002240
%x%	 0x0000D7
%xi%	 0x0003BE
%zeta%	 0x0003B6
EOF
END_OF_BODY_TEXT

my $body_text_tail = <<'END_OF_BODY_TEXT';


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
      $dumpcount = shift @ARGV;
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
diff mdt096d mdt096r
if test "$?" != 0
then echo Test failed
     echo Some module tests failed \(see mdt096.ttd for details\)
else echo All module tests passed
fi
=TEX
\end{document}
=IGN
The following script was used to compare test results with pp3.1w8 so that reference results could be established.
=VDUMP trans.sh
pp_file_conv -u -n <mdt096a.pl >~/git/pp3.1w8/src/pptex/mdt096ae.pl
pp_file_conv -u -n <mdt096b >~/git/pp3.1w8/src/pptex/mdt096be
pp_file_conv -u -n <utf8svf >~/git/pp3.1w8/src/pptex/utf8svfe
cd ~/git
mv pp pputf8
mv pp3.1w8 pp
cd pp/src/pptex
perl mdt096ae.pl utf8svfe sievekeyword mdt096be 2
cd ~/git
mv pp pp3.1w8
mv pputf8 pp
cd pp/src/pptex
pp_file_conv -n <~/git/pp3.1w8/src/pptex/mdt096d >mdt096du
=IGN

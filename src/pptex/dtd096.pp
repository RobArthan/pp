=IGN
********************************************************************************
dtd096.doc: this file is part of the PPHol system

Copyright (c) 2016 Lemma 1 Ltd.

See the file LICENSE for your rights to use and change this file.

Contact: Rob Arthan < rda@lemma-one.com >
********************************************************************************
=TEX
\documentclass[a4paper,12pt]{article}

%%%%% YOU CAN ADD OTHER PACKAGES AS NEEDED BELOW:
\usepackage{A4}
\usepackage{Lemma1}
\usepackage{ProofPower}
\usepackage{epsf}
\makeindex

\def\Title{Detailed Design for sieve and findfile utilities}

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the detailed design for the sieve and finfile utilities.}
\end{center}}

\def\Reference{LEMMA1/HOL/DTD096}

\def\Author{R.B.~Jones}

\def\EMail{{\tt rbj@rbjones.com}}

%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge \Title } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}
\begin{centering}



\end{centering}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{\VCVersion}
\def\Date{\FormatDate{\VCDate}}

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

\newpage
\subsection{References}

\bibliographystyle{fmu}

%%%%% CHANGE THE FOLLOWING AS NECESSARY (E.G., TO PICK UP daz.bib):
{\raggedright
\bibliography{fmu}
}
%%%%% CHANGES HISTORY:
\subsection{Changes History}
\begin{description}
\item[2016/08/27]
First working draft (as dtd123) arising from port of pputf8 contrib into pptex.
\item[2016/12/02]
Conversion to dtd096 as imp123 is incorporated into imp096, providing a first cut implementation of pputf8 and utf8pp in {\Product}
\item[2016/12/07]
Rewrite header file generation to use pputf8 structure from imp122 rather than incorporating a version of the table.


%%%% END OF CHANGES HISTORY %%%%
\end{description}

%%%%%  CHANGES FORECAST:

\subsection{Changes Forecast}

None.

%%%%% DISTRIBUTION LIST

\subsection{Distribution}

Lemma 1 build system.

\newpage

\section{Introduction}
\subsection{Scope}
This document is the detailed design document for the sieve and findfile utilities in {\Product}.

However, its scope is limited, the principal documentation for these utilities being USR001.
It primarily covers the changes to {\Product} for the support of utf-8, and initial drafts will be simple copies of the principal correspondence discussing how this should be done.

\subsection{Purpose and Background}
See \cite{DS/FMU/IED/HLD011}.

This document is now being used as top level documentation for the proposed implementation of utf-8 support in \Product{}, since the main action is in {\tt sieve}.

\section{Support for utf-8 UNICODE in ProofPower}

\subsection{Goals}

The PPTex package is to support UTF-8 encoded Unicode mark-up in ProofPower documents.
It will continue to support the ProofPower 8-bit encoded extended character set (hereafter referred
to as EXT), with some qualification in relation to the distributed concatenation operator, which is being phased out.
It will continue to support the ProofPower ASCII encoding.
It will support conversion to and from all three formats.
The ASCII encoding can be used in documents that also use the EXT encoding and it will be supported in documents that use the UTF-8 encoding.
There is no requirement to support documents involving a mixture of UTF-8 and EXT.
The full UNICODE code set is supported in all document types, in the ASCII format through the use of percent keywords, either giving the UNICODE code point, or a keyword which has been declared in a {\tt sievekeyword} file to be synonymous with some code point.
A reconciliation will be undertaken between the keywords at present used in \Product{} and those in the set nominated in the MathML standard, and a {\tt sievekeyword} file will be supplied containing the resulting keyword definitions.

The PPXpp package is to support UTF-8 encoded Unicode mark-up as far as is possible with
the OpenMotif GUI technology.
This will be done by translation from the chosen file encoding to the \Product{} extended character set supplemented as required by percent keywords as names or for code points for which no name has been declared, as codes.

\subsubsection{Observations}

The use of a Byte-Order-Marker to identify a file as using UTF-8 encodings seems to
be deprecated.

The long term goal is for UTF-8 to supersede EXT.

MathML defines XML entity names for a lot of the symbols we need (and many more).
Adopting these names will give a user-friendly alternative to numeric code points.

Assumption: the distribution concatenation symbol can be removed and everywhere replaced
by its two character equivalent. 
The conversions from extended character set files will continue to accept the distributed concatenation code, but the conversion to the extended character set will not make use of the character, and the \Product{} Reader/Writer will expand it on input, but not compress on output.

At Phil Clayton's (nice) suggestion, the ProofPower mapping previously mapped the greek
letters to the corresponding code points for Mathematical Alphanumeric Symbols in the range
1D400-1D7FF.
However, the MathML entities use the code points for Greek in the range 0370-03FF.
The Mathematical Greek Symbols do look nice, but to gain compatibility with MathML,
we have reverted to using the code points for Greek in the range 0370-03FF.
This also allows you to enter Greek by switching to a  standard Greek keyboard mapping.
We also use the right symbol for $\phi$ (the previous mapping used what LaTeX
calls ``\verb!\!varphi'' rather than ``\verb!\!phi'').

For the record, these are the small greek letters in the current set of mathml entities:

=GFT
<!ENTITY alpha            "&#x003B1;" ><!--GREEK SMALL LETTER ALPHA -->
<!ENTITY beta             "&#x003B2;" ><!--GREEK SMALL LETTER BETA -->
<!ENTITY chi              "&#x003C7;" ><!--GREEK SMALL LETTER CHI -->
<!ENTITY delta            "&#x003B4;" ><!--GREEK SMALL LETTER DELTA -->
<!ENTITY digamma          "&#x003DD;" ><!--GREEK SMALL LETTER DIGAMMA -->
<!ENTITY epsi             "&#x003B5;" ><!--GREEK SMALL LETTER EPSILON -->
<!ENTITY epsilon          "&#x003B5;" ><!--GREEK SMALL LETTER EPSILON -->
<!ENTITY eta              "&#x003B7;" ><!--GREEK SMALL LETTER ETA -->
<!ENTITY gamma            "&#x003B3;" ><!--GREEK SMALL LETTER GAMMA -->
<!ENTITY gammad           "&#x003DD;" ><!--GREEK SMALL LETTER DIGAMMA -->
<!ENTITY iota             "&#x003B9;" ><!--GREEK SMALL LETTER IOTA -->
<!ENTITY kappa            "&#x003BA;" ><!--GREEK SMALL LETTER KAPPA -->
<!ENTITY lambda           "&#x003BB;" ><!--GREEK SMALL LETTER LAMDA -->
<!ENTITY mu               "&#x003BC;" ><!--GREEK SMALL LETTER MU -->
<!ENTITY nu               "&#x003BD;" ><!--GREEK SMALL LETTER NU -->
<!ENTITY omega            "&#x003C9;" ><!--GREEK SMALL LETTER OMEGA -->
<!ENTITY omicron          "&#x003BF;" ><!--GREEK SMALL LETTER OMICRON -->
<!ENTITY phi              "&#x003C6;" ><!--GREEK SMALL LETTER PHI -->
<!ENTITY pi               "&#x003C0;" ><!--GREEK SMALL LETTER PI -->
<!ENTITY psi              "&#x003C8;" ><!--GREEK SMALL LETTER PSI -->
<!ENTITY rho              "&#x003C1;" ><!--GREEK SMALL LETTER RHO -->
<!ENTITY sigma            "&#x003C3;" ><!--GREEK SMALL LETTER SIGMA -->
<!ENTITY sigmaf           "&#x003C2;" ><!--GREEK SMALL LETTER FINAL SIGMA -->
<!ENTITY sigmav           "&#x003C2;" ><!--GREEK SMALL LETTER FINAL SIGMA -->
<!ENTITY tau              "&#x003C4;" ><!--GREEK SMALL LETTER TAU -->
<!ENTITY theta            "&#x003B8;" ><!--GREEK SMALL LETTER THETA -->
<!ENTITY upsi             "&#x003C5;" ><!--GREEK SMALL LETTER UPSILON -->
<!ENTITY upsilon          "&#x003C5;" ><!--GREEK SMALL LETTER UPSILON -->
<!ENTITY varsigma         "&#x003C2;" ><!--GREEK SMALL LETTER FINAL SIGMA -->
<!ENTITY xi               "&#x003BE;" ><!--GREEK SMALL LETTER XI -->
<!ENTITY zeta             "&#x003B6;" ><!--GREEK SMALL LETTER ZETA -->
=TEX

Removal of distributed concatenation character: remove uses of this character from PPZed.
Rationalise UTF-8 support in PPHol (module 122) as EXT characters now map to a single Unicode code point and not a list.

\subsection{The Translations}

The contrib package PPUtf8 defines a mapping from EXT to UTF-8 and provides filters
to convert between the two formats.
This conversion will be extended to cover translation to and from sieve keywords and sieve hex coded UNICODE code points, which will require that the package will read the keyword file at run time.

The PPHol packages provide support for input and output using either EXT or UTF-8.
The translations will be as supportd by the PPutf8 structure.

The PPTex package provides a program called sieve which supports conversion
between EXT and ASCII encodings and projection onto SML, TeX and other formats
for further processing.
The translations will be the same as those provided in PPutf8, but will be independently coded in C in the sieve file program.

The program xpp is provided to edit \Product{} documents.
Its internal working uses the EXT format, and because of limitations in graphics package it uses (Motif) will not be upgraded to full unicode support, but will translate utf-8 documents to EXT format for editing, which will result in characters neither ACII not in the \Product{} extended character set will be shown as `% keywords or % enclosed hexadecinal UNCODE code points.
The translations will be provided by the sieve program.

\subsubsection{ProofPower to Unicode}

Translating ProofPower into Unicode converts a stream of bytes into a stream of Unicode code points.
An ASCII string of the form ''%x\emph{HHHHHH}%", where \emph{HHHHHH}
is a string of 6 upper-case hexadecimal digits representing a value in the range
0x000100 to 0x10FFFF, is translated into the Unicode code point with that value.
Strings of this form are identified reading from left to right.
Any byte in the range 0x00 to 0x7F not appearing in
such a string is translated into the Unicode code point with the same numeric value.

A byte in the range 0x80 to 0xFF other than 0x8B is translated
into the Unicode code point identified in the basic translation table above.
0x8B was previously translated into two characters but is now withdrawn and may be reassigned.

\subsubsection{Unicode to ProofPower}

Translating Unicode into the \Product{} EXT format converts a stream of code points into a stream of bytes.

A Unicode code point in the range 0x000000 to 0x00007F is
translated into the byte with the same numeric value.
A Unicode code point listed in the Code Point column in the basic translation table is translated into the byte with the numeric value given in the Byte column.
A Unicode code point in the range 0x000080 to 0x10FFFF that is not listed in the basic translation table
is translated either into the ASCII string ``\%\emph{keyword}\%'' where this keyword is declared in the prevailing sievekeyword files as ``sameas'' the Unicode code point, or, failing any such declaration into the ASCII string ``\%x\emph{HHHHHH}%'', where \emph{HHHHHH} represents the value of the code
point as 6 upper-case hexadecimal digits.

\subsubsection{Rationale}

The mapping for Z symbols (other than paragraph mark-up) follows the ISO Z
Standard Unicode mark-up.  An exception is that the ASCII minus sign is
translated unchanged while the unary minus sign 0xF8 is translated into SMALL
HYPHEN-MINUS. Unfortunately, SMALL HYPHEN-MINUS often seems to be rendered
bigger than HYPHEN-MINUS.

Unicode does not provide any single glyphs that resemble
the decorated Quine corners provided in the ProofPower character set
for quoting HOL types, ML and Z. Squared letters T, M and Z have been
used as a convenient single character translation for these.

The ``\%x\emph{HHHHHH}\%'' format allows any code point to be used in a ProofPower identifier.
Strings of this form are highly unlikely to occur in existing scripts and so there is no requirement for a string of this form to be translated into Unicode as 9 ASCII characters.

\subsection{Conversion Tables}

Two conversion tables are required.

The first is the mapping of \Product{} extended codes to unicode code points.
This is a fixed mapping, having one definitive version as an SML definition, which is used to generate other versions as required, and incorporated into the \Product{} build as required by inclusion from other parts of the build.
This is done for the structure Unicode, which makes the \Product{} to utf-8 mapping in an SML structure in \Product{}, and may also be imported into the Reader/Writer.
The table is also used to generate C header files used by sieve to implement {\tt pputf8} and {\tt utf8pp}.

\subsection{sievekeyword file}

The keyword file will no longer be used to define the correspondence between \% keywords and extended characters.
Instead of an extended character code, the UNICODE code point will be required (if there is one).
The mapping between extended characters and UNICODE code points will be hard wired into \Product, {\tt xpp} and {\tt sieve}.
The usage of \% kewords will also be made consistent with the use of keywords in SGML entities, specifically those associated with the mathml standard (which I believe includes the XHTML set).
The following changes are therefore proposed to the existing set of named entities.

	\%circ\% is defined as an alias for \%fcomp\% in the ProofPower entities. it is not used. Drop it.
	Change \%equiv\% to \%iff\% which agrees with MathML
	Change \%int\% to \%Z\%.
	Change \%real\% to \%R\%
	For uniformity, change\%nat\% and \%complex\% to \%N\% and \%C\% respectively
	Change \%subset\% and \%supset\% to \%subseteq\% and \%supseteq\% respectively



\section{C Header Files}

This module creates two C header files ppunicodetab.h and unicodepptab.h containing tables defining the mapping between \Product{} extended character codes and unicode points.
These files are generated by functions defined in Standard ML which use conversion facilities provided by imp122.

The header files are available for use by any other programs which might undertake similar translations, the programs are supplied as a part of \Product{} release.

imp096 includes a separate C module which provides various facilities for translating between unicode and the {\Product} extended character set.
These are made into a separate module so that they can be used by xpp.
Header files for this module are provided in this section.  

=SML
structure PPUtf8 = struct
local
structure ⦏W⦎ = Word;
structure ⦏C⦎ = SML97BasisLibrary.Char;
structure ⦏S⦎ = SML97BasisLibrary.String;
in
(*
=TEX
The following reconstructs the basic translation table using the Unicode structure from imp122.
=SML
*)

=IGN
	use"dtd108.sml"; use"imp108.sml"; 
	use"dtd002.sml"; use"imp002.sml"; 
	use"dtd001.sml"; use"imp001.sml";
	use"dtd122.sml"; use"imp122.sml";
	use"dtd096.sml";
=SML

val pp_to_unicode_basic_translation = List.tabulate (128,
    fn x:int => let val c = C.chr(x+128)
       	    in ((c, PPUnicode.pp_to_unicode c))
	    end);
=TEX
Now we sort the table to give a table suitable for translation from UNICODE to extended pp characters.
=SML
fun ⦏pad_string⦎ (width : int)  (s : string) : string = (
	let	fun zeroes i = if i <= 0 then "" else "0" ^ zeroes (i-1);
	in	zeroes (width - size s) ^ s
	end
);

val char_order : char ORDER = (fn c1 => fn c2 => C.ord c1 - C.ord c2);

val byte_string_order : string ORDER = (fn s1 => fn s2 =>
	lexicographic char_order (S.explode s1) (S.explode s2)
);

val unicode_order:UNICODE ORDER = fn u1 => fn u2 => byte_string_order
    (pad_string 6 (PPUnicode.unicode_to_hex_string u1))
    (pad_string 6 (PPUnicode.unicode_to_hex_string u2));

val ⦏unicode_to_pp_ordered_tab⦎ : (UNICODE * char) list = 
	(sort (pair_order unicode_order char_order) o map swap) 
		pp_to_unicode_basic_translation;
=TEX
The rest of the code outputs the two C header files: ppunicodetab.h and unicodepptab.h
=SML
fun ⦏word_to_string⦎ (width : int)  (w : word) : string =
    	pad_string width (Word.toString w);

fun ⦏c_hex_string_of_char⦎ (c : char) : string = (
	(word_to_string 2 o W.fromInt o C.ord) c
);
=TEX
=SML
fun ⦏c_pp_to_unicode⦎ (outfile : string) : unit = (
	let	val strm = open_out outfile;
		fun say s = output(strm, s);
		fun aux i = (
			let	val s = PPUnicode.unicode_to_hex_string
				    (PPUnicode.pp_to_unicode (C.chr i));
				val text = "0x" ^ (pad_string 6 s);
			in	say "\t\"";
				say text;
				(if	i < 255
				then	(say "\",\n";
					aux (i+1))
				else	say "\"\n")
			end
		);
	in	say (
"/*\n * " ^
 outfile ^ ": automatically generated by dtd096.ML.\n * " ^
 Date.toString (Date.fromTimeLocal(Time.now())) ^ "\n" ^
" * Conversion from ProofPower characters to utf8 strings is done\n" ^
" * by obtaining the unicode code point using an indexed lookup in the following array:\n" ^
" */\n");
		say "static const char *pp_to_unicode [128] = {\n";
		aux 128;
		say "};\n";
		close_out strm
	end
);
=TEX
=SML
fun ⦏p_pp_to_unicode⦎ (outfile : string) : unit = (
	let	val strm = open_out outfile;
		fun say s = output(strm, s);
		fun aux i = (
			let	val t1 = "0x" ^ (pad_string 2 (Int.fmt StringCvt.HEX i));
				val t2 = "(" ^ (Int.toString i) ^ "|" ^ t1 ^ ")";
				val s2 = PPUnicode.unicode_to_hex_string
				    (PPUnicode.pp_to_unicode (C.chr i));
				val t3 = "0x" ^ (pad_string 6 s2);
				val sub = "\ts/^(\\S*\\s*\\S*\\s*)" ^ t2 ^ "/\\1 " ^ t3 ^ "/i;"
			in	say "\t";
				say sub;
				(if	i < 255
				then	(say "\n";
					aux (i+1))
				else	say "\n")
			end
		);
	in	say (
"#!/usr/bin/perl\n" ^
"#\n# " ^
 outfile ^ " automatically generated by dtd096.ML.\n# " ^
 Date.toString (Date.fromTimeLocal(Time.now())) ^ "\n" ^
"# Conversion of sievekeyword file from ProofPower ext to unicode codepoints is done \n" ^
"# by the following collection of substitutions:\n" ^
"\n\n");
		say "while (<STDIN>) {\n";
		aux 128;
		say "print $_;\n};\n";
		close_out strm
	end
);
=TEX
=SML
fun ⦏c_unicode_to_pp⦎ (outfile : string) : unit = (
	let	val strm = open_out outfile;
		fun say s = output(strm, s);
		fun aux ((u, c) :: more) = (
			let	val text1 = "0x" ^ (pad_string 6 (unicode_to_hex_string u));
				val text2 = "'\\x" ^ (c_hex_string_of_char c) ^ "'";
			in	say "\t{";
				say text1;
				say ", ";
				say text2;
				(case more of
				 _ :: _	=> 	(
					say "},\n";
					aux more
				) | _	=>	say "}\n")
			end
		) | aux [] = ();
	in	say (
"/*\n * " ^
 outfile ^ ": automatically generated by utf8.ML.\n * " ^
  Date.toString (Date.fromTimeLocal(Time.now())) ^ "\n" ^
" * Conversion from UTF-8 encoded character to a\n" ^
" * ProofPower extended character is done by an associative lookup\n" ^
" * in the following sorted array of records:\n" ^
" */\n" ^
"typedef int unicode;\n" ^
"typedef struct {\n" ^
"\tunicode code_point;\n" ^
"\tchar pp_char;} unicode_to_pp_entry;\n");
		say "#define UNICODE_TO_PP_LEN ";
		say(string_of_int (length unicode_to_pp_ordered_tab));
		say "\nstatic unicode_to_pp_entry unicode_to_pp [UNICODE_TO_PP_LEN] = {\n";
		aux unicode_to_pp_ordered_tab;
		say "};\n";
		close_out strm
	end
);
=TEX
=SML
val _ =
(*	if length utf8_to_pp_tab <> length pp_to_utf8_tab
	then	diag_line "WARNING: duplicate entries lost from utf8_to_pp_tab"
	else *)	();

val _ = c_pp_to_unicode "ppunicodetab.h";
val _ = p_pp_to_unicode "pp2unisktrans.pl";
val _ = c_unicode_to_pp "unicodepptab.h";

end (* of local ... in ... end *);
end (* of structure PPUtf8 *);
=TEX

\section{sieve}

Sieve will be enhanced so that keywords of the form \%\#xXXXXXX\% and \%\#NNNNNN\%
are predefined (where XXXXXX and NNNNNN represent case-insensitive hexadecimal
and decimal representations of a valid Unicode code point).
The optional numeric encoding of a code for a glyph in the sieve keyword file entries will now be interpreted as a Unicode code point.

A fixed mapping from extended characters to UNICODE code points will be used, rather than including this in the {\tt sievekeyword} file.

Using the existing sameas mechanism, we can then implement the MathML entity names.
This involves a certain amount of reconciliation in the handful of cases where existing
ProofPower entity names conflict with MathML. Some adjustments to the existing mapping
from EXT to UTF-8 might be needed (e.g., it was a nice idea to change to using
the mathematical greek characters, but it might be better to revert for conformance with MathML).

Module 122 from PPHol and the modules from PPDev that it depends on will
be moved into PPTex and replaced by links in PPHol and/or PPDev.
The mapping between EXT and UNICODE is incorporated into dtd122, and used in implementing the structure PPutf8.
That structure is used by dtd096 to generate C header files giving access to this table in imp096 for use by the {\tt sieve} program.
Two header files are generated, one defining the map from EXT to UNICODE, amd the other from UNICODE to EXT (containing only those codes for which an EXT is available, and sorted in UNICODE code point order.
The {\tt .json} file defining the mathml (and xhtml) entity names from the W3C website is to be placed in the pptex directory and used by the makefile to generate a sievekeyword file identifying the single character entities with their UNICODE code points using the {\tt sameas} facility.
The Reader/Writer will be changed to use the PPutf8 structure for any translation between UTF8 and EXT which it undertakes.

sieve will have command line options to select between UTF-8 and EXT on inputs and
outputs (independently so all 4 directions of conversion are possible). The driver
scripts (doctex etc.) will define a new file name extension for UTF-8 encoded
documents. We need to think through the options for the outputs of these scripts
on case-by-case basis. E.g., would it be prudent for docsml to output ASCII only?

\section{PLAN}

Very crude at this point:

\begin{itemize}
\item[First]
get the SML table and the {\tt .h} files in place to define the correspondence between the \Product{} extended characters and UNICODE code points.
Also generate a {\tt sievekeyword} file from the mathml entities {\tt .json}.

\item[Then], possibly concurrently:

\begin{itemize}
\item do the changes to {\tt sieve}.
\item do the changes to xpp
\item change reader/writer
\end{itemize}
\end{itemize}




\section{TEST POLICY}
There are no special module test requirements.
\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}




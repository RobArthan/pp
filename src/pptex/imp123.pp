=IGN
********************************************************************************
imp123.doc: this file is part of the PPHol system

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

\def\Title{pputf8 and utf8pp: Implementation }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the implementation of utilities for translating documents from the ProofPower character
coding to utf8.}
\end{center}}

\def\Reference{LEMMA1/HOL/IMP123}

\def\Author{R.B. Jones}

\def\EMail{{\tt rbj@rbjones.com}}

%\def\Phone{+44 118 958 4409}

%\def\Fax{+44 118 956 1920}

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
\item[2016/08/13]
First working draft constructed from pputf8 contrib by rda.

%%%% END OF CHANGES HISTORY %%%%
\end{description}

%%%%%  CHANGES FORECAST:

\subsection{Changes Forecast}

None.

%%%%% DISTRIBUTION LIST

\subsection{Distribution}

Lemma 1 build system.

\newpage

\section{Introduction}xpp
\subsection{Scope}
This document gives the implementation of utilities for {\Product} files to and from utf8.

\subsection{Purpose and Background}
See \cite{LEMMA1/HOL/DTD123}.

\section{GENERATING HEADER FILES}

This section contains ML for generating header files for use by C programs which translate ProofPower codes to and from utf8.

\subsection{THE STRUCTURES}
This file generates C header files pputf8tab.h utf8pptab.h
containing definitions of tables mapping ProofPower extended characters
to and from UTF-8 encoded Unicode equivalents.
=SML
structure PPUtf8 = struct
local
structure ⦏W⦎ = Word;
structure ⦏C⦎ = SML97BasisLibrary.Char;
structure ⦏S⦎ = SML97BasisLibrary.String;
in
(*
=TEX
The following implements the full UCS encoding and does not impose the UTF-8 rules.
=SML
*)
fun ⦏utf8_of_word⦎ (w : W.word) : string = (
	S.implode (map (C.chr o W.toInt) (
	if	w <= 0wx7f	(* <= 7 bits *)
	then	[	w]
	else if	w <= 0wx7ff	(* <= 11 bits *)
	then	[	W.orb(0wxc0, W.>>(w, 0wx6)),
			W.orb(0wx80, W.andb(w, 0wx3f))]
	else if	w <= 0wxffff	(* <= 16 bits *)
	then	[	W.orb(0wxe0, W.>>(w, 0wxc)),
			W.orb(0wx80, W.>>(W.andb(w, 0wxfc0), 0wx6)),
			W.orb(0wx80, W.andb(w, 0wx3f))]
	else if	w <= 0wx1fffff	(* <= 21 bits *)
	then	[	W.orb(0wxf0, W.>>(w, 0wx12)),
			W.orb(0wx80, W.>>(W.andb(w, 0wx3f000), 0wxc)),
			W.orb(0wx80, W.>>(W.andb(w, 0wxfc0), 0wx6)),
			W.orb(0wx80, W.andb(w, 0wx3f))]
	else if	w <= 0wx3ffffff	(* <= 26 bits *)
	then	[	W.orb(0wxf8, W.>>(w, 0wx18)),
			W.orb(0wx80, W.>>(W.andb(w, 0wxfc0000), 0wx12)),
			W.orb(0wx80, W.>>(W.andb(w, 0wx3f000), 0wxc)),
			W.orb(0wx80, W.>>(W.andb(w, 0wxfc0), 0wx6)),
			W.orb(0wx80, W.andb(w, 0wx3f))]
	else	[	W.orb(0wxfc, W.>>(w, 0wx1e)),
			W.orb(0wx80, W.>>(W.andb(w, 0wx3f000000), 0wx18)),
			W.orb(0wx80, W.>>(W.andb(w, 0wxfc0000), 0wx12)),
			W.orb(0wx80, W.>>(W.andb(w, 0wx3f000), 0wxc)),
			W.orb(0wx80, W.>>(W.andb(w, 0wxfc0), 0wx6)),
			W.orb(0wx80, W.andb(w, 0wx3f))]))
);
(*
=TEX
\ftlinepenalty=9999
This is the basic translation table.
=SML
*)
val ⦏pp_to_utf8_basic_translation⦎ : ((string * W.word) * string) list = [
=SMLLITERAL
	(("¬",	0wx0000AC ),	"NOT SIGN"),
	(("×",	0wx0000d7 ),	"MULTIPLICATION SIGN"),
	(("⁀",	0wx002040 ),	"CHARACTER TIE"),
	(("ℂ",	0wx002102 ),	"DOUBLE-STRUCK CAPITAL C"),
	(("ℕ",	0wx002115 ),	"DOUBLE-STRUCK CAPITAL N"),
	(("ℙ",	0wx002119 ),	"DOUBLE-STRUCK CAPITAL P"),
	(("ℚ",	0wx00211a ),	"DOUBLE-STRUCK CAPITAL Q"),
	(("ℝ",	0wx00211d ),	"DOUBLE-STRUCK CAPITAL R"),
	(("ℤ",	0wx002124 ),	"DOUBLE-STRUCK CAPITAL Z"),
	(("→",	0wx002192 ),	"RIGHTWARDS ARROW"),
	(("↔",	0wx002194 ),	"LEFT RIGHT ARROW"),
	(("↕",	0wx002195 ),	"UP DOWN ARROW"),
	(("↗",	0wx002197 ),	"NORTH EAST ARROW"),
	(("↘",	0wx002198 ),	"SOUTH EAST ARROW"),
	(("↠",	0wx0021a0 ),	"RIGHTWARDS TWO HEADED ARROW"),
	(("↣",	0wx0021a3 ),	"RIGHTWARDS ARROW WITH TAIL"),
	(("↦",	0wx0021a6 ),	"RIGHTWARDS ARROW FROM BAR"),
	(("↾",	0wx0021be ),	"UPWARDS HARPOON WITH BARB RIGHTWARDS"),
	(("↿",	0wx0021bf ),	"UPWARDS HARPOON WITH BARB LEFTWARDS"),
	(("⇐",	0wx0021d0 ),	"LEFTWARDS DOUBLE ARROW"),
	(("⇒",	0wx0021d2 ),	"RIGHTWARDS DOUBLE ARROW"),
	(("⇔",	0wx0021d4 ),	"LEFT RIGHT DOUBLE ARROW"),
	(("⇸",	0wx0021f8 ),	"RIGHTWARDS ARROW WITH VERTICAL STROKE"),
	(("⇻",	0wx0021fb ),	"RIGHTWARDS ARROW WITH DOUBLE VERTICAL STROKE"),
	(("∀",	0wx002200 ),	"FOR ALL"),
	(("∃",	0wx002203 ),	"THERE EXISTS"),
	(("∅",	0wx002205 ),	"EMPTY SET"),
	(("∈",	0wx002208 ),	"ELEMENT OF"),
	(("∉",	0wx002209 ),	"NOT AN ELEMENT OF"),
	(("∘",	0wx002218 ),	"RING OPERATOR"),
	(("∧",	0wx002227 ),	"LOGICAL AND"),
	(("∨",	0wx002228 ),	"LOGICAL OR"),
	(("∩",	0wx002229 ),	"INTERSECTION"),
	(("∪",	0wx00222a ),	"UNION"),
	(("≜",	0wx00225c ),	"DELTA EQUAL TO"),
	(("≠",	0wx002260 ),	"NOT EQUAL TO"),
	(("≡",	0wx002261 ),	"IDENTICAL TO"),
	(("≤",	0wx002264 ),	"LESS-THAN OR EQUAL TO"),
	(("≥",	0wx002265 ),	"GREATER-THAN OR EQUAL TO"),
	(("⊂",	0wx002282 ),	"SUBSET OF"),
	(("⊃",	0wx002283 ),	"SUPERSET OF"),
	(("⊆",	0wx002286 ),	"SUBSET OF OR EQUAL TO"),
	(("⊇",	0wx002287 ),	"SUPERSET OF OR EQUAL TO"),
	(("⊑",	0wx002291 ),	"SQUARE IMAGE OF OR EQUAL TO"),
	(("⊕",	0wx002295 ),	"CIRCLED PLUS"),
	(("⊖",	0wx002296 ),	"CIRCLED MINUS"),
	(("⊢",	0wx0022a2 ),	"RIGHT TACK"),
	(("⊥",	0wx0022a5 ),	"UP TACK"),
	(("⋂",	0wx0022c2 ),	"N-ARY INTERSECTION"),
	(("⋃",	0wx0022c3 ),	"N-ARY UNION"),
	(("⋎",	0wx0022ce ),	"CURLY LOGICAL OR"),
	(("⋏",	0wx0022cf ),	"CURLY LOGICAL AND"),
	(("⌜",	0wx00231c ),	"TOP LEFT CORNER"),
	(("⌝",	0wx00231d ),	"TOP RIGHT CORNER"),
	(("ⓜ",	0wx0024dc ),	"CIRCLED LATIN SMALL LETTER M"),
	(("ⓣ",	0wx0024e3 ),	"CIRCLED LATIN SMALL LETTER T"),
	(("ⓩ",	0wx0024e9 ),	"CIRCLED LATIN SMALL LETTER Z"),
	(("Ⓢ",	0wx0024c8 ),	"CIRCLED LATIN CAPITAL LETTER S"),
	(("─",	0wx002500 ),	"BOX DRAWINGS LIGHT HORIZONTAL"),	
	(("│",	0wx002502 ),	"BOX DRAWINGS LIGHT VERTICAL"),	
	(("┌",	0wx00250c ),	"BOX DRAWINGS LIGHT DOWN AND RIGHT"),	
	(("└",	0wx002514 ),	"BOX DRAWINGS LIGHT UP AND RIGHT"),
	(("├",	0wx00251c ),	"BOX DRAWINGS LIGHT VERTICAL AND RIGHT"),	
	(("═",	0wx002550 ),  "BOX DRAWINGS DOUBLE HORIZONTAL"),
	(("╒",	0wx002552 ),	"BOX DRAWINGS DOWN SINGLE AND RIGHT DOUBLE"),	
	(("■",	0wx0025A0 ),	"BLACK SQUARE"),
	(("▷",	0wx0025b7 ),	"WHITE RIGHT-POINTING TRIANGLE"),
	(("◁",	0wx0025c1 ),	"WHITE LEFT-POINTING TRIANGLE"),
	(("⟦",	0wx0027e6 ),	"MATHEMATICAL LEFT WHITE SQUARE BRACKET"),
	(("⟧",	0wx0027e7 ),	"MATHEMATICAL RIGHT WHITE SQUARE BRACKET"),
	(("⤀",	0wx002900 ),	"RIGHTWARDS TWO-HEADED ARROW WITH VERTICAL STROKE"),
	(("⤔",	0wx002914 ),	"RIGHTWARDS ARROW WITH TAIL WITH VERTICAL STROKE"),
	(("⤕",	0wx002915 ),	"RIGHTWARDS ARROW WITH TAIL WITH DOUBLE VERTICAL STROKE"),
	(("⤖",	0wx002916 ),	"RIGHTWARDS TWO-HEADED ARROW WITH TAIL"),
	(("⦁",	0wx002981 ),	"Z NOTATION SPOT"),
	(("⦂",	0wx002982 ),	"Z NOTATION TYPE COLON"),
	(("⦇",	0wx002987 ),	"Z NOTATION LEFT IMAGE BRACKET"),
	(("⦈",	0wx002988 ),	"Z NOTATION RIGHT IMAGE BRACKET"),
	(("⦎",	0wx00298e ),	"RIGHT SQUARE BRACKET WITH TICK IN BOTTOM CORNER"),
	(("⦏",	0wx00298f ),	"LEFT SQUARE BRACKET WITH TICK IN BOTTOM CORNER"),
	(("⊎",	0wx002a04 ),	"N-ARY UNION OPERATOR WITH PLUS"),
	(("⨼",	0wx002a3c ),	"INTERIOR PRODUCT"),
	(("⨽",	0wx002a3d ),	"RIGHTHAND INTERIOR PRODUCT"),
	(("⨾",	0wx002a3e ),	"Z NOTATION RELATIONAL COMPOSITION"),
	(("⩤",	0wx002a64 ),	"Z NOTATION DOMAIN ANTIRESTRICTION"),
	(("⩥",	0wx002a65 ),	"Z NOTATION RANGE ANTIRESTRICTION"),
	(("⟨",	0wx0027E8 ),	"MATHEMATICAL LEFT ANGLE BRACKET"),
	(("⟩",	0wx0027E9 ),	"MATHEMATICAL RIGHT ANGLE BRACKET"),
	(("﹣",	0wx00fe63 ),	"SMALL HYPHEN-MINUS"),
	(("𝔹",	0wx01d539 ),	"MATHEMATICAL DOUBLE-STRUCK CAPITAL B"),
	(("𝔽",	0wx01d53d ),	"MATHEMATICAL DOUBLE-STRUCK CAPITAL F"),
	(("𝕊",	0wx01d54a ),	"MATHEMATICAL DOUBLE-STRUCK CAPITAL S"),
	(("𝕌",	0wx01d54c ),	"MATHEMATICAL DOUBLE-STRUCK CAPITAL U"),
	(("Γ",	0wx01d6e4 ),	"MATHEMATICAL ITALIC CAPITAL GAMMA"),
	(("Δ",	0wx01d6e5 ),	"MATHEMATICAL ITALIC CAPITAL DELTA"),
	(("Θ",	0wx01d6e9 ),	"MATHEMATICAL ITALIC CAPITAL THETA"),
	(("Λ",	0wx01d6ec ),	"MATHEMATICAL ITALIC CAPITAL LAMDA"),
	(("Ξ",	0wx01d6ef ),	"MATHEMATICAL ITALIC CAPITAL XI"),
	(("Π",	0wx01d6f1 ),	"MATHEMATICAL ITALIC CAPITAL PI"),
	(("Σ",	0wx01d6f4 ),	"MATHEMATICAL ITALIC CAPITAL SIGMA"),
	(("Υ",	0wx01d6f6 ),	"MATHEMATICAL ITALIC CAPITAL UPSILON"),
	(("Φ",	0wx01d6f7 ),	"MATHEMATICAL ITALIC CAPITAL PHI"),
	(("Ψ",	0wx01d6f9 ),	"MATHEMATICAL ITALIC CAPITAL PSI"),
	(("Ω",	0wx01d6fa ),	"MATHEMATICAL ITALIC CAPITAL OMEGA"),
	(("α",	0wx01d6fc ),	"MATHEMATICAL ITALIC SMALL ALPHA"),
	(("β",	0wx01d6fd ),	"MATHEMATICAL ITALIC SMALL BETA"),
	(("γ",	0wx01d6fe ),	"MATHEMATICAL ITALIC SMALL GAMMA"),
	(("δ",	0wx01d6ff ),	"MATHEMATICAL ITALIC SMALL DELTA"),
	(("ε",	0wx01d700 ),	"MATHEMATICAL ITALIC SMALL EPSILON"),
	(("ζ",	0wx01d701 ),	"MATHEMATICAL ITALIC SMALL ZETA"),
	(("η",	0wx01d702 ),	"MATHEMATICAL ITALIC SMALL ETA"),
	(("θ",	0wx01d703 ),	"MATHEMATICAL ITALIC SMALL THETA"),
	(("ι",	0wx01d704 ),	"MATHEMATICAL ITALIC SMALL IOTA"),
	(("κ",	0wx01d705 ),	"MATHEMATICAL ITALIC SMALL KAPPA"),
	(("λ",	0wx01d706 ),	"MATHEMATICAL ITALIC SMALL LAMDA"),
	(("μ",	0wx01d707 ),	"MATHEMATICAL ITALIC SMALL MU"),
	(("ν",	0wx01d708 ),	"MATHEMATICAL ITALIC SMALL NU"),
	(("ξ",	0wx01d709 ),	"MATHEMATICAL ITALIC SMALL XI"),
	(("π",	0wx01d70b ),	"MATHEMATICAL ITALIC SMALL PI"),
	(("ρ",	0wx01d70c ),	"MATHEMATICAL ITALIC SMALL RHO"),
	(("σ",	0wx01d70e ),	"MATHEMATICAL ITALIC SMALL SIGMA"),
	(("τ",	0wx01d70f ),	"MATHEMATICAL ITALIC SMALL TAU"),
	(("υ",	0wx01d710 ),	"MATHEMATICAL ITALIC SMALL UPSILON"),
	(("φ",	0wx01d711 ),	"MATHEMATICAL ITALIC SMALL PHI"),
	(("χ",	0wx01d712 ),	"MATHEMATICAL ITALIC SMALL CHI"),
	(("ψ",	0wx01d713 ),	"MATHEMATICAL ITALIC SMALL PSI"),
	(("ω",	0wx01d714 ),	"MATHEMATICAL ITALIC SMALL OMEGA")
];
(*
=TEX
=SML
*)
val byte_string_order : string ORDER = (fn s1 => fn s2 =>
	lexicographic (fn c1 => fn c2 => ord c1 - ord c2) (explode s1) (explode s2)
);
val ⦏pp_to_utf8_tab⦎ : (string * string) list = 
	(sort (pair_order byte_string_order byte_string_order) o
		map (fn ((c, w), _) => (c, utf8_of_word w))) 
		pp_to_utf8_basic_translation;
(*
=TEX
The following have no Unicode equivalent, but have equivalent
ProofPower forms that do.
=SML
*)
val ⦏pp_to_pp_replacement⦎ : (string * string) list = 
	map (fn (c, s) => (c, implode (map (lassoc1 pp_to_utf8_tab) (explode s)))) [
=SMLLITERAL
	("",	"⁀/" )
=SML
];
(*
=TEX
=SML
*)
val ⦏pp_to_utf8⦎ : string array =
	PPArray.arrayoflist
		(map (lassoc1 (pp_to_pp_replacement @ pp_to_utf8_tab))
			(map chr (interval 0 255)));
(*
=TEX
=SML
*)
val ⦏word_order⦎ : word ORDER = fn w1 => fn w2 => W.toInt w1 - W.toInt w2;

val ⦏utf8_to_pp_tab⦎ : (word * string) list =
	(sort (pair_order word_order byte_string_order)) 
		(map (swap o fst) pp_to_utf8_basic_translation);
(*
=TEX
The rest of the code outputs the two C header files: pputf8tab.h and utf8pptab.h
=SML
*)

fun ⦏word_to_string⦎ (width : int)  (w : word) : string = (
	let	fun zeroes i = if i <= 0 then "" else "0" ^ zeroes (i-1);
		val s = Word.toString w;
	in	zeroes (width - size s) ^ s
	end
);

fun ⦏c_hex_char_of_char⦎ (c : char) : string = (
	"\\x" ^ (word_to_string 2 o W.fromInt o C.ord) c
);

fun ⦏c_hex_string_of_string⦎ (s : string) : string = (
	implode(map c_hex_char_of_char(S.explode s))
);

fun ⦏c_hex_int_of_code_point⦎ (w : word) : string = (
	"0x" ^ word_to_string 6 w
);

fun ⦏c_pp_to_utf8⦎ (outfile : string) : unit = (
	let	val strm = open_out outfile;
		fun say s = output(strm, s);
		fun aux i = (
			let	val s = PPArray.sub(pp_to_utf8, i);
				val text = c_hex_string_of_string s;
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
 outfile ^ ": automatically generated by utf8.ML.\n * " ^
 Date.toString (Date.fromTimeLocal(Time.now())) ^ "\n" ^
" * Conversion from ProofPower characters to UTF-8 strings is done\n" ^
" * by an indexed lookup in the following array:\n" ^
" */\n");
		say "static const char *pp_to_utf8 [256] = {\n";
		aux 0;
		say "};\n";
		close_out strm
	end
);


fun ⦏c_utf8_to_pp⦎ (outfile : string) : unit = (
	let	val strm = open_out outfile;
		fun say s = output(strm, s);
		fun aux ((w, s) :: more) = (
			let	val text1 = c_hex_int_of_code_point w;
				val text2 = c_hex_string_of_string s;
			in	say "\t{";
				say text1;
				say ", \"";
				say text2;
				(case more of
				 _ :: _	=> 	(
					say "\"},\n";
					aux more
				) | _	=>	say "\"}\n")
			end
		) | aux [] = ();
	in	say (
"/*\n * " ^
 outfile ^ ": automatically generated by utf8.ML.\n * " ^
  Date.toString (Date.fromTimeLocal(Time.now())) ^ "\n" ^
" * Conversion from UTF-8 encoded character to a string of 1 or more\n" ^
" * ProofPower extended characters is done by an associative lookup\n" ^
" * in the following sorted array of records:\n" ^
" */\n" ^
"typedef int unicode;\n" ^
"typedef struct {\n" ^
"\tunicode code_point;\n" ^
"\tconst char *pp_string;} utf8_to_pp_entry;\n");
		say "#define UTF8_TO_PP_LEN ";
		say(string_of_int (128 + length utf8_to_pp_tab));
		say "\nstatic utf8_to_pp_entry utf8_to_pp [UTF8_TO_PP_LEN] = {\n";
		aux (map (fn i => (W.fromInt i, chr i)) (interval 0 127) @ utf8_to_pp_tab);
		say "};\n";
		close_out strm
	end
);

val _ =
(*	if length utf8_to_pp_tab <> length pp_to_utf8_tab
	then	diag_line "WARNING: duplicate entries lost from utf8_to_pp_tab"
	else *)	();

val _ = c_pp_to_utf8 "pputf8tab.h";
val _ = c_utf8_to_pp "utf8pptab.h";

end (* of local ... in ... end *);
end (* of structure PPUtf8 *);
=TEX

\section{The Program utf8pp}

=DUMP utf8pp.c
/*
 * pputf8.c: convert UTF-8 to the ProofPower extended character set.
 *
 * Rob Arthan rda@lemma-one.com
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
/*
 * The include file utf8pptab.h is automatically generated from some ML
 * code. It contains an array of records each containing a Unicode code
 * point (represented as a signed int) and the corresponding ProofPower character.
 * The array is sorted by * the code point and we do the associative lookup
 * with bsearch.
 */
#include "utf8pptab.h"
int utf8pp_error = 0;
int line;

int utf8_to_pp_entry_cmp(const void *buf1, const void *buf2)
{
	const utf8_to_pp_entry *u1 = buf1, *u2 = buf2;
	return  u1->code_point - u2->code_point;
}

const char *unicode_to_kw(unicode code_point)
{
	static char buf[10];
	sprintf(buf, "%%x%06X%%", code_point);
	return buf;
}

const char *unicode_to_pp(unicode cp)
{	
	utf8_to_pp_entry key, *search_result;
	key.code_point = cp;
	search_result = bsearch(&key, utf8_to_pp,
		UTF8_TO_PP_LEN, sizeof(utf8_to_pp_entry), utf8_to_pp_entry_cmp);
	return search_result != 0 ?
		search_result->pp_string :
		unicode_to_kw(cp);
}
/*
 * If invalid UTF-8 is found, output an error message and skip to
 * the next new line.
 */
unicode invalid_utf8(void)
{
	int whatgot;
	fprintf(stderr, "utf8pp: line %d: invalid utf-8 input\n", line);
	utf8pp_error = 1;
	whatgot = getchar();
	while(whatgot != '\n' && whatgot != EOF) {
		whatgot = getchar();
	}
	if(whatgot == '\n') {
		line += 1;
	}
	return whatgot & 0xff;
}

unicode get_code_point(void)
{
	int whatgot, r, l;
	whatgot = getchar();
	if(whatgot == EOF) { return 0; }
	if(whatgot == '\n') { line += 1; }
	r = whatgot & 0xff;
	if(r <= 0x7f) { return r; }
	l = 0;
	while(r & 0x80) {
		r = (r & 0x7f) << 1;
		l += 1;
	}
	if(l > 4) { return invalid_utf8(); }
	r = r >> l;
	while(--l) {
		whatgot = getchar();
		if(whatgot == EOF || ((whatgot & 0xc0) != 0x80)) {
			return invalid_utf8();
		}
		r = (r << 6) | (whatgot & 0x3f);
	}
	return r;
}

void do_utf8_to_pp(void)
{
	unicode cp;
	const char *pp_string;
	cp = get_code_point();
	while(cp) {
		pp_string = unicode_to_pp(cp);
		printf("%s", pp_string);
		cp = get_code_point();
	}
}

void usage(void)
{
	printf("utf8pp"
		": convert UTF-8 to ProofPower extended character format\n");
	printf("utf8pp: usage: utf8pp < input_file > output_file\n");
}

int main (int argc, char *argv[])
{
	line = 1;
	if(argc == 1) {
		do_utf8_to_pp();
		return ferror(stdin) || ferror(stdout) || utf8pp_error;
	} else {
		usage();
		return 0;
	}
}

=TEX

\section{The Program pputf8}

=DUMP pputf8.c
/*
 * pputf8.c: convert from the ProofPower extended character set to utf-8
 *
 * Rob Arthan rda@lemma-one.com
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
/*
 * The include file pputf8tab.h is automatically generated from some ML
 * code. It contains an array pp_to_utf8 containing 256 strings.
 * Conversion from the ProofPower extended character set to utf-8
 * is just a look-up in this array.
 * Note that a few characters map to string of more than one unicode
 * characters.
 */
#include "pputf8tab.h"

enum {	S_INITIAL,
	S_HAVE_PERCENT,
	S_HAVE_X,
	S_HAVE_HEXIT_1,
	S_HAVE_HEXIT_2,
	S_HAVE_HEXIT_3,
	S_HAVE_HEXIT_4,
	S_HAVE_HEXIT_5,
	S_HAVE_HEXIT_6,
	S_HAVE_KEYWORD};

typedef char bool;

enum {False = 0, True = 1};

static bool is_uc_hexit(char ch)
{
	return ('0' <= ch && ch <= '9') || ('A' <= ch && ch <= 'F');
}

static bool is_percent(char ch)
{
	return ch == '%';
}

static bool is_x(char ch)
{
	return ch == 'x';
}

static void do_chars(int len, char *cs)
{
	while(len--) {
		printf("%s", pp_to_utf8[(int)*cs++ & 0xff]);
	}
}

static bool do_keyword(unsigned u)
{
	if(u <= 0x7f) { /* <= 7 bits */
		return False;
	} else if (u <= 0x7ff) { /* <= 11 bits */
		putchar(0xc0u | (u >> 6u));
		putchar(0x80u | (u & 0x3fu));
		return True;
	} else if (u <= 0xffff) { /* <= 16 bits */
		putchar(0xe0u | (u >> 12u));
		putchar(0x80u | ((u & 0xfc0u) >> 6u));
		putchar(0x80u | (u & 0x3fu));
		return True;
	} else if (u <= 0x10ffffu) { /* <= max code point, so <= 21 bits */
		putchar(0xf0u | (u >> 18u));
		putchar(0x80u | ((u & 0x3f000u) >> 12u));
		putchar(0x80u | ((u & 0xfc0u) >> 6u));
		putchar(0x80u | (u & 0x3fu));
		return True;
	} else {
		return False;
	}
}

#define STEP(TST, ST) \
	if((TST)(whatgot)) {\
		state = (ST);\
	} else {\
		do_chars(l, buf);\
		l = 0;\
		state = S_INITIAL;\
	};\
	break;

static void do_pp_to_utf8 (void)
{
	int whatgot, state, l;
	char buf[9];
	unsigned u;
	l = 0;
	state = S_INITIAL;
	while ((whatgot = getchar()) != EOF) {
		buf[l++] = whatgot;
		switch(state) {
			case S_INITIAL:      STEP(is_percent,  S_HAVE_PERCENT);
			case S_HAVE_PERCENT: STEP(is_x,              S_HAVE_X);
			case S_HAVE_X:       STEP(is_uc_hexit, S_HAVE_HEXIT_1);
			case S_HAVE_HEXIT_1: STEP(is_uc_hexit, S_HAVE_HEXIT_2);
			case S_HAVE_HEXIT_2: STEP(is_uc_hexit, S_HAVE_HEXIT_3);
			case S_HAVE_HEXIT_3: STEP(is_uc_hexit, S_HAVE_HEXIT_4);
			case S_HAVE_HEXIT_4: STEP(is_uc_hexit, S_HAVE_HEXIT_5);
			case S_HAVE_HEXIT_5: STEP(is_uc_hexit, S_HAVE_HEXIT_6);
			case S_HAVE_HEXIT_6: STEP(is_percent,  S_HAVE_KEYWORD);
		}
		if(state == S_HAVE_KEYWORD) {
			sscanf(&buf[2], "%6X", &u);
			if(!do_keyword(u)) { do_chars(l, buf); }
			l = 0;
			state = S_INITIAL;
		}
	}
}

static void usage(void)
{
	printf("pputf8"
		": convert ProofPower extended character format to UTF-8\n");
	printf("usage: pputf8 < input_file > output_file\n");
}

int main (int argc, char *argv[])
{
	if(argc == 1) {
		do_pp_to_utf8();
		return ferror(stdin) || ferror(stdout);
	} else {
		usage();
		return 0;
	}
}
=TEX

\section{utf8ppk}

=DUMP utf8ppktab_head
/*
 * entitiestab.h: automatically generated by the pptex.mkf.
 * This table records the single character entity names
 * from the MathML 3.0 standard as a list of structures.
 */
typedef int unicode;
typedef struct {
	unicode code_point;
	const char *pp_string;} utf8_to_ppk_entry;
#define UTF8_TO_PPK_LEN 2000
static utf8_to_ppk_entry utf8_to_ppk [UTF8_TO_PPK_LEN] = {
=TEX

\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}
=IGN


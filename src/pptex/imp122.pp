=IGN
********************************************************************************
imp122.doc: this file is part of the PPHol system

Copyright (c) 2002 Lemma 1 Ltd.

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

\def\Title{Unicode and UTF-8: Implementation }

\def\Abstract{\begin{center}
{\bf Abstract}\par\parbox{0.7\hsize}
{\small This document gives the implementation of utilities for working with UTF-8 and Unicode in {\Product}.}
\end{center}}

\def\Reference{LEMMA1/HOL/IMP122}

\def\Author{R.D. Arthan}

\def\EMail{{\tt rda@lemma-one.com}}

\def\Phone{+44 118 958 4409}

\def\Fax{+44 118 956 1920}

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
\item[2015/03/13]
First working draft.
\item[2015/03/15]
Updates after beginning to use the interfaces in anger.
\item[2015/03/26]
Moved in common functions from Reader/Writer.
\item[2015/03/28]
Translation revised in light of comments from Phil Clayton.
\item[2015/04/15]
Now uses new date and version macros from doctex
\item[2015/11/24]
Made table initialisation defensive against different interpretations of hexadecimal characters in strings.
\item[2016/09/01]
Bag union now maps to 0x228E MULTISET UNION.
\item[2016/11/06]
Resolved conflicts merging master into utf8 branch.

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
This document gives the implementation of utilities for working with Unicode in {\Product}.

\subsection{Purpose and Background}
See \cite{LEMMA1/HOL/DTD122}.


\section{THE STRUCTURES}

=TEX
=SML
structure ⦏PPUnicode⦎ : PPUnicode = struct
=POLYML
structure ⦏Unicode⦎ : WORD = Word32;
=NJML
structure ⦏Unicode⦎ : WORD = Word;
=TEX
=SML

structure U = Unicode;
structure C = SML97BasisLibrary.Char;
structure S = SML97BasisLibrary.String;
(*
=TEX
=SML
*)

type ⦏UNICODE⦎ = U.word;

val ⦏max_code_point⦎ : UNICODE = 0wx10FFFF;

fun ⦏unicode_to_utf8⦎ (w : UNICODE) : string = (
	(S.implode o map (C.chr o U.toInt)) (
	if	w <= 0wx7F	(* <= 7 bits *)
	then	[	w]
	else if	w <= 0wx7FF	(* <= 11 bits *)
	then	[	U.orb(0wxC0, U.>>(w, 0wx6)),
			U.orb(0wx80, U.andb(w, 0wx3F))]
	else if	w <= 0wxFFFF	(* <= 16 bits *)
	then	[	U.orb(0wxE0, U.>>(w, 0wxC)),
			U.orb(0wx80, U.>>(U.andb(w, 0wxFC0), 0wx6)),
			U.orb(0wx80, U.andb(w, 0wx3F))]
	else if	w <= max_code_point (* <= 21 bits *)
	then	[	U.orb(0wxF0, U.>>(w, 0wx12)),
			U.orb(0wx80, U.>>(U.andb(w, 0wx3F000), 0wxC)),
			U.orb(0wx80, U.>>(U.andb(w, 0wxFC0), 0wx6)),
			U.orb(0wx80, U.andb(w, 0wx3F))]
	else	fail "unicode_to_utf8" 122001 [])
);

fun ⦏unicode_to_hex_string⦎ (w : UNICODE) : string = (
    if w <= max_code_point
    then U.toString w
    else fail "unicode_to_utf8" 122001 []
);

(*
=TEX
The following slavishly implements the dictum of RFC3629 which outlaws
encoding a code point in more bytes than are necessary.
=SML
*)
fun ⦏utf8_to_unicode⦎ (s : 'a -> char OPT * 'a) : 'a -> (UNICODE OPT * 'a) OPT = (fn st0 =>
	let	fun invalid () = fail "" 0 [];
		fun ws st = (
			case s st of
				(Value ch, st') => ((U.fromInt o C.ord) ch, st')
			| 	(Nil, _) => invalid ()
		);
		fun aux1 st (n, acc) i = (
			if i < n
			then	let	val (w, st') = ws st;
				in	if	U.andb(w, 0wxC0) = 0wx80
					then	aux1 st' (n, (U.<<(acc,0wx6) + U.andb(w, 0wx3F))) (i+1)
					else	invalid ()
				end
			else (acc, st)
		);
		fun aux2 st (n, acc) = (
			let	val (x, st') = aux1 st (n, acc) 1;
			in	if	case n of
						2 => 0wx000080 <= x
					|	3 => 0wx000800 <= x
					|	4 => 0wx010000 <= x andalso x <= max_code_point
					|	_ => true
				then	Value(Value x, st')
				else	invalid ()
			end
		);
		fun aux3 st1 w0 = aux2 st1 (
			if	U.andb(w0, 0wx80) = 0wx00
			then	(1, w0)
			else if	U.andb(w0, 0wxE0) = 0wxC0
			then	(2, (U.andb(w0, U.notb 0wxC0)))
			else if U.andb(w0, 0wxF0) = 0wxE0
			then	(3, (U.andb(w0, U.notb 0wxE0)))
			else if U.andb(w0, 0wxF8) = 0wxF0
			then	(4, (U.andb(w0, U.notb 0wxF0)))
			else	invalid ()
		);
	in	case s st0 of
			(Nil, st1) => Value(Nil, st1)
		|	(Value ch, st1) => aux3 st1 ((U.fromInt o C.ord) ch)
	end	handle Fail _ => Nil
);
(*
=TEX
=SML
*)
fun string_stream ((s, i) : string * int) : char OPT * (string * int) = (
	if	i < size s
	then	(Value (String.sub(s, i)), (s, i + 1))
	else	(Nil, (s, i))
);
fun ⦏utf8_string_to_unicode⦎ (s : string) : UNICODE list = (
	let	fun aux acc si = (
			case utf8_to_unicode string_stream si of
				Value (Value u, sj) => aux (u::acc) sj
			|	Value (Nil, _) => rev acc
			|	Nil => fail "utf8_string_to_unicode" 122002 []
		);
	in	aux [] (s, 0)
	end
);
(*
=TEX
=SML
*)
fun ⦏file_stream⦎ (strm : instream) : char OPT * instream = (
	case input(strm, 1) of
		""  => (Nil, strm)
	|	c => ((Value o C.chr o ord) c, strm)
);
fun ⦏utf8_input⦎ (strm : instream) : UNICODE OPT = (
	case utf8_to_unicode file_stream strm of
		Nil => fail "utf8_input" 122002 []
	|	Value(uo, _) => uo
); 
(*
=TEX
The basic translation scheme for individual {\Product} characters.
=SML
*)

val basic_pp_to_unicode_table : (char * UNICODE) list = map (C.chr ** Combinators.I) [
	(0x80,	0wx002286 )	(* SUBSET OF OR EQUAL TO *),
	(0x81,	0wx002a65 )	(* Z NOTATION RANGE ANTIRESTRICTION *),
	(0x82,	0wx00228e )	(* MULTISET UNION *),
	(0x83,	0wx01d54c )	(* MATHEMATICAL DOUBLE-STRUCK CAPITAL U *),
	(0x84,	0wx000394 )	(* GREEK CAPITAL LETTER DELTA *),
	(0x85,	0wx002218 )	(* RING OPERATOR *),
	(0x86,	0wx0003A6 )	(* GREEK CAPITAL LETTER PHI *),
	(0x87,	0wx000393 )	(* GREEK CAPITAL LETTER GAMMA *),
	(0x88,	0wx002514 )	(* BOX DRAWINGS LIGHT UP AND RIGHT *),
	(0x89,	0wx0022ce )	(* CURLY LOGICAL OR *),
	(0x8A,	0wx000398 )	(* GREEK CAPITAL LETTER THETA *),
	(0x8C,	0wx00039B )	(* GREEK CAPITAL LETTER LAMDA *),
	(0x8D,	0wx002208 )	(* ELEMENT OF *),
	(0x8E,	0wx002209 )	(* NOT AN ELEMENT OF *),
	(0x8F,	0wx002916 )	(* RIGHTWARDS TWO-HEADED ARROW WITH TAIL *),
	(0x90,	0wx0003A0 )	(* GREEK CAPITAL LETTER PI *),
	(0x91,	0wx0024dc )	(* CIRCLED LATIN SMALL LETTER M *),
	(0x92,	0wx0025b7 )	(* WHITE RIGHT-POINTING TRIANGLE *),
	(0x93,	0wx0003A3 )	(* GREEK CAPITAL LETTER SIGMA *),
	(0x94,	0wx0024e3 )	(* CIRCLED LATIN SMALL LETTER T *),
	(0x95,	0wx0003A5 )	(* GREEK CAPITAL LETTER UPSILON *),
	(0x96,	0wx01d539 )	(* MATHEMATICAL DOUBLE-STRUCK CAPITAL B *),
	(0x97,	0wx0003A9 )	(* GREEK CAPITAL LETTER OMEGA *),
	(0x98,	0wx00039E )	(* GREEK CAPITAL LETTER XI *),
	(0x99,	0wx0003A8 )	(* GREEK CAPITAL LETTER PSI *),
	(0x9A,	0wx002205 )	(* EMPTY SET *),
	(0x9B,	0wx0022cf )	(* CURLY LOGICAL AND *),
	(0x9C,	0wx002550 )	(* BOX DRAWINGS DOUBLE HORIZONTAL *),
	(0x9D,	0wx002552 )	(* BOX DRAWINGS DOWN SINGLE AND RIGHT DOUBLE *),
	(0x9E,	0wx002915 )	(* RIGHTWARDS ARROW WITH TAIL WITH DOUBLE VERTICAL STROKE *),
	(0x9F,	0wx0021fb )	(* RIGHTWARDS ARROW WITH DOUBLE VERTICAL STROKE *),
	(0xA0,	0wx002282 )	(* SUBSET OF *),
	(0xA1,	0wx002229 )	(* INTERSECTION *),
	(0xA2,	0wx0027e9 )	(* MATHEMATICAL RIGHT ANGLE BRACKET *),
	(0xA3,	0wx002296 )	(* CIRCLED MINUS *),
	(0xA4,	0wx0021d4 )	(* LEFT RIGHT DOUBLE ARROW *),
	(0xA5,	0wx0022c2 )	(* N-ARY INTERSECTION *),
	(0xA6,	0wx00225c )	(* DELTA EQUAL TO *),
	(0xA7,	0wx0027e8 )	(* MATHEMATICAL LEFT ANGLE BRACKET *),
	(0xA8,	0wx002987 )	(* Z NOTATION LEFT IMAGE BRACKET *),
	(0xA9,	0wx002988 )	(* Z NOTATION RIGHT IMAGE BRACKET *),
	(0xAA,	0wx002194 )	(* LEFT RIGHT ARROW *),
	(0xAB,	0wx002295 )	(* CIRCLED PLUS *),
	(0xAC,	0wx00231c )	(* TOP LEFT CORNER *),
	(0xAD,	0wx002192 )	(* RIGHTWARDS ARROW *),
	(0xAE,	0wx00231d )	(* TOP RIGHT CORNER *),
	(0xAF,	0wx00211d )	(* DOUBLE-STRUCK CAPITAL R *),
	(0xB0,	0wx0025a0 )	(* BLACK SQUARE *),
	(0xB1,	0wx002227 )	(* LOGICAL AND *),
	(0xB2,	0wx002228 )	(* LOGICAL OR *),
	(0xB3,	0wx0000AC )	(* NOT SIGN *),
	(0xB4,	0wx0021d2 )	(* RIGHTWARDS DOUBLE ARROW *),
	(0xB5,	0wx002200 )	(* FOR ALL *),
	(0xB6,	0wx002203 )	(* THERE EXISTS *),
	(0xB7,	0wx002981 )	(* Z NOTATION SPOT *),
	(0xB8,	0wx0000d7 )	(* MULTIPLICATION SIGN *),
	(0xB9,	0wx0024c8 )	(* CIRCLED LATIN CAPITAL LETTER S *),
	(0xBA,	0wx002982 )	(* Z NOTATION TYPE COLON *),
	(0xBB,	0wx002a3e )	(* Z NOTATION RELATIONAL COMPOSITION *),
	(0xBC,	0wx002264 )	(* LESS-THAN OR EQUAL TO *),
	(0xBD,	0wx002260 )	(* NOT EQUAL TO *),
	(0xBE,	0wx002265 )	(* GREATER-THAN OR EQUAL TO *),
	(0xBF,	0wx01d54a )	(* MATHEMATICAL DOUBLE-STRUCK CAPITAL S *),
	(0xC0,	0wx00222a )	(* UNION *),
	(0xC1,	0wx0003B1 )	(* GREEK SMALL LETTER ALPHA *),
	(0xC2,	0wx0003B2 )	(* GREEK SMALL LETTER BETA *),
	(0xC3,	0wx002291 )	(* SQUARE IMAGE OF OR EQUAL TO *),
	(0xC4,	0wx0003B4 )	(* GREEK SMALL LETTER DELTA *),
	(0xC5,	0wx0003B5 )	(* GREEK SMALL LETTER EPSILON *),
	(0xC6,	0wx0003C6 )	(* GREEK SMALL LETTER PHI *),
	(0xC7,	0wx0003B3 )	(* GREEK SMALL LETTER GAMMA *),
	(0xC8,	0wx0003B7 )	(* GREEK SMALL LETTER ETA *),
	(0xC9,	0wx0003B9 )	(* GREEK SMALL LETTER IOTA *),
	(0xCA,	0wx0003B8 )	(* GREEK SMALL LETTER THETA *),
	(0xCB,	0wx0003BA )	(* GREEK SMALL LETTER KAPPA *),
	(0xCC,	0wx0003BB )	(* GREEK SMALL LETTER LAMDA *),
	(0xCD,	0wx0003BC )	(* GREEK SMALL LETTER MU *),
	(0xCE,	0wx0003BD )	(* GREEK SMALL LETTER NU *),
	(0xCF,	0wx002900 )	(* RIGHTWARDS TWO-HEADED ARROW WITH VERTICAL STROKE *),
	(0xD0,	0wx0003C0 )	(* GREEK SMALL LETTER PI *),
	(0xD1,	0wx0003C7 )	(* GREEK SMALL LETTER CHI *),
	(0xD2,	0wx0003C1 )	(* GREEK SMALL LETTER RHO *),
	(0xD3,	0wx0003C3 )	(* GREEK SMALL LETTER SIGMA *),
	(0xD4,	0wx0003C4 )	(* GREEK SMALL LETTER TAU *),
	(0xD5,	0wx0003C5 )	(* GREEK SMALL LETTER UPSILON *),
	(0xD6,	0wx002102 )	(* DOUBLE-STRUCK CAPITAL C *),
	(0xD7,	0wx0003C9 )	(* GREEK SMALL LETTER OMEGA *),
	(0xD8,	0wx0003BE )	(* GREEK SMALL LETTER XI *),
	(0xD9,	0wx0003C8 )	(* GREEK SMALL LETTER PSI *),
	(0xDA,	0wx0003B6 )	(* GREEK SMALL LETTER ZETA *),
	(0xDB,	0wx00298f )	(* LEFT SQUARE BRACKET WITH TICK IN BOTTOM CORNER *),
	(0xDC,	0wx002502 )	(* BOX DRAWINGS LIGHT VERTICAL *),
	(0xDD,	0wx00298e )	(* RIGHT SQUARE BRACKET WITH TICK IN BOTTOM CORNER *),
	(0xDE,	0wx0022c3 )	(* N-ARY UNION *),
	(0xDF,	0wx0021f8 )	(* RIGHTWARDS ARROW WITH VERTICAL STROKE *),
	(0xE0,	0wx0021a3 )	(* RIGHTWARDS ARROW WITH TAIL *),
	(0xE1,	0wx002a64 )	(* Z NOTATION DOMAIN ANTIRESTRICTION *),
	(0xE2,	0wx0022a5 )	(* UP TACK *),
	(0xE3,	0wx0021d0 )	(* LEFTWARDS DOUBLE ARROW *),
	(0xE4,	0wx002283 )	(* SUPERSET OF *),
	(0xE5,	0wx002287 )	(* SUPERSET OF OR EQUAL TO *),
	(0xE6,	0wx01d53d )	(* MATHEMATICAL DOUBLE-STRUCK CAPITAL F *),
	(0xE7,	0wx002197 )	(* NORTH EAST ARROW *),
	(0xE8,	0wx002198 )	(* SOUTH EAST ARROW *),
	(0xE9,	0wx002261 )	(* IDENTICAL TO *),
	(0xEA,	0wx002195 )	(* UP DOWN ARROW *),
	(0xEB,	0wx002040 )	(* CHARACTER TIE *),
	(0xEC,	0wx0021bf )	(* UPWARDS HARPOON WITH BARB LEFTWARDS *),
	(0xED,	0wx0021a6 )	(* RIGHTWARDS ARROW FROM BAR *),
	(0xEE,	0wx002115 )	(* DOUBLE-STRUCK CAPITAL N *),
	(0xEF,	0wx0021a0 )	(* RIGHTWARDS TWO HEADED ARROW *),
	(0xF0,	0wx002119 )	(* DOUBLE-STRUCK CAPITAL P *),
	(0xF1,	0wx0024e9 )	(* CIRCLED LATIN SMALL LETTER Z *),
	(0xF2,	0wx0025c1 )	(* WHITE LEFT-POINTING TRIANGLE *),
	(0xF3,	0wx00211a )	(* DOUBLE-STRUCK CAPITAL Q *),
	(0xF4,	0wx0022a2 )	(* RIGHT TACK *),
	(0xF5,	0wx002a3d )	(* RIGHTHAND INTERIOR PRODUCT *),
	(0xF6,	0wx002a3c )	(* INTERIOR PRODUCT *),
	(0xF7,	0wx00251c )	(* BOX DRAWINGS LIGHT VERTICAL AND RIGHT *),
	(0xF8,	0wx00fe63 )	(* SMALL HYPHEN-MINUS *),
	(0xF9,	0wx0021be )	(* UPWARDS HARPOON WITH BARB RIGHTWARDS *),
	(0xFA,	0wx002124 )	(* DOUBLE-STRUCK CAPITAL Z *),
	(0xFB,	0wx0027e6 )	(* MATHEMATICAL LEFT WHITE SQUARE BRACKET *),
	(0xFC,	0wx002500 )	(* BOX DRAWINGS LIGHT HORIZONTAL *),
	(0xFD,	0wx0027e7 )	(* MATHEMATICAL RIGHT WHITE SQUARE BRACKET *),
	(0xFE,	0wx002914 )	(* RIGHTWARDS ARROW WITH TAIL WITH VERTICAL STROKE *),
	(0xFF,	0wx00250c )	(* BOX DRAWINGS LIGHT DOWN AND RIGHT *)
];

(*
=TEX
Efficient data structures: we use an array for {\Product} to Unicode and a search tree
for the opposite direction.
=SML
*)
val ⦏pp_to_unicode_array⦎ : UNICODE array = (
	let	fun translate c = (
			lassoc2 basic_pp_to_unicode_table(U.fromInt o C.ord)c
		);
	in	PPArray.arrayoflist (map (translate o C.chr) (interval 0 255))
	end
);
val ⦏unicode_order⦎ : UNICODE ORDER = fn w1 => fn w2 => U.toInt w1 - U.toInt w2;
val ⦏unicode_to_pp_tree⦎ : (UNICODE, char) SEARCH_TREE = 
	list_st_merge (initial_search_tree unicode_order)
		(map swap basic_pp_to_unicode_table @
			map (fn i => (U.fromInt i, C.chr i)) (interval 0 127));
(*
=TEX
Entry points:
=SMLPLAIN SML
*)
val ⦏pp_to_unicode⦎ : char -> UNICODE =
	(curry Array.sub pp_to_unicode_array o C.ord);
val ⦏basic_unicode_to_pp⦎ : UNICODE -> char OPT = switch st_lookup unicode_to_pp_tree;
fun ⦏unicode_to_keyword⦎ (cp : UNICODE) : string = (
	let	fun zeroes i = if i <= 0 then "" else "0" ^ zeroes (i-1);
		val s = Unicode.toString cp;
	in	"%x" ^ zeroes (6 - size s) ^ s ^"%"
	end
);
fun ⦏unicode_to_pp⦎ (cp : UNICODE) : string = (
	case basic_unicode_to_pp cp of
		Value ch => S.implode [ch]
	|	Nil => unicode_to_keyword cp
);
(*
=TEX
=SML
*)
end (* of structure PPUnicode *);
=TEX

\section{EPILOGUE}
=SML
open PPUnicode;
=TEX
\twocolumn[\section{INDEX}]
\small
\printindex

\end{document}
=IGN

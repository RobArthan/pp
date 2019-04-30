=IGN
********************************************************************************
mdt118.doc: this file is part of the PPDev system

Copyright (c) 2002 Lemma 1 Ltd.

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

\def\Title{ Generic SLRP Parser: Module Tests}

\def\Abstract{\begin{center}
{\bf Abstract}\par
{The module tests for the generic SLRP parser.}
\end{center}}

\def\Reference{DS/FMU/IED/MDT118}

\def\Author{R.D. Arthan}

\def\EMail{{\tt rda@lemma-one.com}}

\def\Phone{+44 118 958 4409}

\def\Fax{+44 118 956 1920}

%%%%% YOU MAY WANT TO CHANGE THE FOLLOWING TO GET A NICE FRONT PAGE:
\def\FrontPageTitle{ {\huge \Title } }
\def\FrontPageHeader{\raisebox{16ex}{\begin{tabular}[t]{c}
\bf Copyright \copyright\ : Lemma 1 Ltd \number\year\\\strut\\
\end{tabular}}}

%%%%% THE FOLLOWING DEFAULTS WILL GENERALLY BE RIGHT:

\def\Version{$Revision: 1.11 $%
}
\def\Date{\FormatDate{$Date: 2006/10/25 15:52:59 $%
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

\item[Issues 1.1 (2003/02/27) to 1.7 (2003/03/07) ] First drafts.
\item[Issues 1.8 (2003/03/20), 1.9 (2006/10/22)] Full C parser is now in a separate document, \cite{LEMMA1/DEV/WRK077}.
\item[Issue 1.10 (2006/10/23)] Tests for new command line options {\tt -r} and {\tt -b}.
\item[2014/07/23]
Augmented old RCS version numbers in the changes history with dates.
Dates will be used in place of version numbers in future.

\item[2015/11/25]
Adjusted boiler-plate so that everything is compiled from scratch.
\item[2015/11/26]
Now works with MLton as well as Poly/ML and SML/NJ.

%%%% END OF CHANGES HISTORY %%%%
\end{description}

%%%%%  CHANGES FORECAST:

\subsection{Changes Forecast}

None.

%%%%% DISTRIBUTION LIST

\subsection{Distribution}
\begin{center}
\begin{tabular}{ll}
{\Product} Development Library & Lemma 1\\
\end{tabular}
\end{center}
\newpage
\section{GENERAL}
\subsection{Scope}
This document contains the detailed design for a generic framework for a parser generated
by \Slrp. This is useful both for testing {\Slrp} and as a service to {\Slrp} users.

\subsection{Introduction}
See \cite{LEMMA1/HOL/DTD118}.



\subsection{Purpose and Background}
See \cite{LEMMA1/HOL/DTD118}.

\section{TEST CASES}
We currently run the generic parser on each of Ada 95, C, Java 1.1 and pascal and then there is
a little test of the command line flags which vary generic parsing.

\pagebreak
\section{COMPILING THE COMMON MATERIAL}
=DUMP run-mdt118.sml
app use [
	"dtd108.sml",
	"imp108.sml",
	"dtd002.sml",
	"imp002.sml",
	"dtd001.sml",
	"imp001.sml",
	"dtd018.sml",
	"imp018.sml",
	"dtd013.sml",
	"imp013.sml",
	"dtd118.sml",
	"imp118.sml",
	"mdt118.sml"
];
=DUMP run-mdt118.mlb
	$(SML_LIB)/basis/basis.mlb
	dtd108.sml	
	imp108.sml	
	dtd002.sml	
	imp002.sml	
	dtd001.sml	
	imp001.sml	
	dtd018.sml	
	imp018.sml	
	dtd013.sml	
	imp013.sml
	dtd118.sml	
	imp118.sml
	mdt118.sml
=TEX
The structure in IMP018 does not apply the signature constraint from DTD018 to enable the structure
to be used inside another structure without having to include the signature (this is largely historical).
We test that the structure complies with the signature thus:
=SML
structure OriginalSlrpDriver = SlrpDriver;
structure SlrpDriver : SlrpDriver = OriginalSlrpDriver;
=TEX
=POLYML
PPCompiler.print_depth 4;
=NJML
PPCompiler.print_depth 4;
=TEX
\section{ADA 95}
=DUMP mdt118.ada
PACKAGE identifier IS

TYPE identifier IS `(` identifier `,` identifier `)` `;`

END identifier `;`
=TEX
=SML
open GenericSlrpParser;
=INCLUDE
ada95.grm.sml
=SML
val t = parse_file slrp'gen_parser "mdt118.ada";
print_tree t;
fun f (Leaf _) = 1
|   f (Node(_, children)) = (
	1 + fold (op +) (map f children) 0
);
store_mt_results
mt_run[
	("ada95.1", f, t, 43)
];
=TEX
\section{C}
=DUMP mdt118.c.tok
`typedef` TypeDefName  `*`Identifier`;`
`int` Identifier `(` `)`
`{`
	`typedef` TypeDefName Identifier `;`
	TypeDefName Identifier `=` IntegerConstant `;`
	Identifier `=` Identifier `+` Identifier`;`
	`return` Identifier`;`
`}`
=TEX
=IGN
PolyML.print_depth 4;
val t = parse_string slrp'gen_parser "`int` Identifier `;`";
=SML
=INCLUDE
c.grm.sml
=SML
val t = parse_file slrp'gen_parser "mdt118.c.tok";
print_tree t;
store_mt_results
mt_run[
	("c.1", f, t, 149)
];
=TEX
\section{JAVA 1.1}
=DUMP mdt118.java
INTERFACE IDENTIFIER `{`
        PUBLIC VOID IDENTIFIER `(` CHAR IDENTIFIER `)` `;`
`}`
=TEX
=SML
=INCLUDE
java11.grm.sml
=SML
val t = parse_file slrp'gen_parser "mdt118.java";
print_tree t;
store_mt_results
mt_run[
	("java11.1", f, t, 38)
];
=TEX
\section{PASCAL}
=DUMP mdt118.p
PROGRAM IDENTIFIER SEMICOLON

VAR IDENTIFIER COLON IDENTIFIER SEMICOLON

PBEGIN
    IDENTIFIER ASSIGNMENT REALNUMBER SEMICOLON
    FOR IDENTIFIER ASSIGNMENT IDENTIFIER TO DIGSEQ
    DO IDENTIFIER ASSIGNMENT IDENTIFIER PLUS IDENTIFIER SEMICOLON
    IDENTIFIER LPAREN IDENTIFIER COMMA
               IDENTIFIER STAR IDENTIFIER PLUS IDENTIFIER RPAREN SEMICOLON

END

DOT
=TEX
=SML
=INCLUDE
pascal.grm.sml
=SML
open GenericSlrpParser;
val t = parse_file slrp'gen_parser "mdt118.p";
print_tree t;
store_mt_results
mt_run[
	("pascal.1", f, t, 173)
];
=TEX
\section{CUSTOMISED EXAMPLE}
=SML
=INCLUDE
wrk077.sml
=SML
=TEX
=DUMP mdt118.1.c
static int table = {1, 2, 4, 8, 16};

int main(void)
{
	fprintf(stderr, sizeof table);
}
=TEX
Need to recompile $f$ since compiling wrk077.sml will have pulled in a new copy of
the generic parser code and data types.
=SML
fun f (Leaf _) = 1
|   f (Node(_, children)) = (
	1 + fold (op +) (map f children) 0
);
val t1 = (c_parse_file "mdt118.1.c");
print_tree t1;
store_mt_results
mt_run[
	("c1.1.1", f, t1, 232)
];
=TEX
A longer example (the Boyer-Moore string search from xpp):
=DUMP mdt118.2.c
typedef struct {
	long int	offset;
	long int	length;
} Substring;

typedef struct {
	long int	index[256];
	long int	length;
	char	pattern[0];
} bm_search_t;

/*
 * Pre-processing for the Boyer-Moore search algorithm.
 * The memory allocation here is relying on long int being
 * at least as aligned as char.
 */

static bm_search_t *bm_search_comp(char *pattern)
{
	long int len = strlen(pattern);
	int i;
	bm_search_t *bm;
	bm = (bm_search_t *) XtMalloc(sizeof(bm_search_t) + len + 1);
	if(bm == 0) { /* malloc failed */
		return bm;
	}
	strcpy(&(bm->pattern)[0], pattern);
	if(global_options.ignore_case) {
		for(i = 0; i < len; ++i) {
			(bm->pattern)[i]= toupper((bm->pattern)[i]);
		}
	}
	for(i = 0; i < 256; ++i) {
		(bm->index)[i] = -1;
	}
	for(i = len - 1; i >= 0; --i) {
		if( (bm->index)[(bm->pattern)[i]] == -1 ) {
			(bm->index)[(bm->pattern)[i]] = i;
		}
	}
	bm->length = len;
	return bm;
}
/*
 * The Boyer-Moore search algorithm:
 */
static Substring bm_search_exec(bm_search_t *bm, char *text)
{
	int cursor, i, next;
	Substring result;
	result.offset = -1; /* assume no match until we get one */
	if(bm->length == 0) {
		return result;
	}
	cursor = 0;
	i = bm->length - 1;
	while(i >= 0 && text[cursor]) {
		char ch = global_options.ignore_case ? toupper(text[cursor+i]) : text[cursor+i];
		if(ch == (bm->pattern)[i]) { /* possible match at cursor */
			i -= 1;
		} else { /* no match at cursor; slide up according to index value: */
			next = cursor + i - (bm->index)[text[cursor+i]];
			cursor += 1;
			while(text[cursor] && cursor < next) {
				cursor += 1;
			}
			i = bm->length - 1;
		}
	}
	if(i < 0) { /* match at cursor */
		result.offset = cursor;
		result.length = bm->length;
	}
	return result;
}
=TEX
=SML
val t2 = (c_parse_file "mdt118.2.c");
print_tree t2;
store_mt_results
mt_run[
	("c1.1.2", f, t2, 2636)
];
=TEX
Check that the two examples from \cite{LEMMA1/DEV/WRK077} do not crash.
=SML
fun wrk077_files () = (
	(c_parse_file "wrk077.1.i"; c_parse_file "wrk077.2.i"; true)
	handle Fail _ => false
);
=TEX
=SML
store_mt_results
mt_run[
	("c1.1.3", wrk077_files, (), true)
];
=TEX
\section{Test for Option Flags}
We have a simple grammar for balanced bracketing.
=DUMP mdt118a.grm.txt
Bracklist  =
                | Bracklist, Brack
                ;

Brack = `(`,  Bracklist,  `)` ;
=SML
(*
=SH
echo generating mdt118a.grm.txt
slrp -f mdt118a.grm.txt -g
cp mdt118a.grm.txt mdt118b.grm.txt
echo generating mdt118b.grm.txt
slrp -f mdt118b.grm.txt -g -r
cp mdt118a.grm.txt mdt118c.grm.txt
echo generating mdt118c.grm.txt
slrp -f mdt118c.grm.txt -g -b
cp mdt118a.grm.txt mdt118d.grm.txt
echo generating mdt118d.grm.txt
slrp -f mdt118d.grm.txt -g -r -b
=DUMP mdt118a.brax
(
   () () (
                () ( () (()))
         )
  ( () )
)

=SML
 *)
=TEX
We have generated all combinations of separate/local reduction functions and brief/standard reduction  function interface.
=SML
val type_env : unit E_DICT list ref = ref [initial_e_dict];
val in_type_def : bool ref = ref false;
val str_un_fpar_nesting : int ref = ref 0;
fun reset_state () = (
        type_env := [initial_e_dict];
        in_type_def := false;
        str_un_fpar_nesting := 0
);

fun count_tree (Leaf _) = 1
|   count_tree (Node ((a,b),l))  =  fold (fn (a,b:int) => a+b) (map count_tree l) 0

fun brax_classifier (lc, _) = lc;
fun brax_resolver _ = DoShift;
fun brax_rec (c::more, _) =
        if c = "(" orelse c = ")" then
                (more, Known (LCString c, (c, get_line_number())))
        else (c::more, Unknown)
|  brax_rec (chs, _) = (chs, Unknown);

(* use "mdt118a.grm.red.sml";*)
=INCLUDE
mdt118a.grm.sml
=SML
fun brax_parse_file name = (
        reset_state();
        slrp'gen_parser brax_resolver brax_classifier
        (default_error string_of_lex_value)
        (gen_reader LCEos (rec_first [ brax_rec ] ) (in_char_stream_of_file name))
        ([], true)
);

count_tree (brax_parse_file"mdt118a.brax");

store_mt_results
mt_run[
         ("o.a", (fn x => count_tree x), brax_parse_file "mdt118a.brax", 22)
];
=TEX
=SML
=INCLUDE
mdt118b.grm.red.sml
=SML
=INCLUDE
mdt118b.grm.sml
=SML
fun brax_parse_file name = (
        reset_state();
        slrp'gen_parser brax_resolver brax_classifier
        (default_error string_of_lex_value)
        (gen_reader LCEos (rec_first [ brax_rec ] ) (in_char_stream_of_file name))
        ([], true)
);

print_tree (brax_parse_file"mdt118a.brax");

store_mt_results
mt_run[
         ("o.b", fn x=> count_tree x, brax_parse_file "mdt118a.brax", 22)
];
=TEX
=SML
(*use "mdt118c.grm.red.sml"*)
=INCLUDE
mdt118c.grm.sml
=SML
fun brax_parse_file name = (
        reset_state();
        slrp'gen_parser brax_resolver brax_classifier
        (default_error string_of_lex_value)
        (gen_reader LCEos (rec_first [ brax_rec ] ) (in_char_stream_of_file name))
        ([], true)
);

print_tree (brax_parse_file"mdt118a.brax");

store_mt_results
mt_run[
         ("o.c", fn x=> count_tree x, brax_parse_file "mdt118a.brax", 22)
];

=INCLUDE
mdt118d.grm.red.sml
=INCLUDE
mdt118d.grm.sml
=SML
fun brax_parse_file name = (
        reset_state();
        slrp'gen_parser brax_resolver brax_classifier
        (default_error string_of_lex_value)
        (gen_reader LCEos (rec_first [ brax_rec ] ) (in_char_stream_of_file name))
        ([], true)
);

count_tree (brax_parse_file"mdt118a.brax");

store_mt_results
mt_run[
         ("o.d", fn x=> count_tree x, brax_parse_file "mdt118a.brax", 22)
];

=TEX
\section{EPIILOGUE}
=SML
raw_diag_string (summarize_mt_results()^"\n");
=TEX
\end{document}
=IGN


/* utf8module.h

 utf8module was produced in the course of upgrading the sieve program
 to support utf8 encoded unicode files, as well as files using the
 original ProofPower extended character set (dating back to 1990).
 The utf8 support has been placed in a separate module so that it can
 also be used by other programs, e.g xpp.

 The design of the various mappings results in certain previously existing
 code in sieve being required for the implementation of the utf8 facilities,
 notably the compilation of a keyword table from information read from
 one or more keyword files, and the location of those files using
 findfile.  Certain low level facilities are shared between these aspects
 of sieve which are now provided in the utf8 module and the main body
 of sieve, which therefore makes the interface between sieve and the utf8
 module more complex and less elegant than it might otherwise have been.

 Because xpp was built using Motif it is not expected that xpp
 will ever fully support unicode, and it was therefore desirable to
 provide a way of editing utf8 files with xpp by conversion to and from
 the ProofPower extended character set.
 Unicode characters not available in the extended character set
 would be rendered as entities, using the established %keyword% convention.
 As well as allowing the unicode code to be specified numerically,
 it was thought desirable to allowed named entities, the declaration of
 which would be given in the keyword file.

 This code in utf8module falls into the following principal parts.
 A. Code implementng the findfile facility.
 B. Code for reading keyword files and building the keyword table.
 C. Code for doing the translations, using the information in a keyword table.
 D. Code for reading and writing files while undertaking translation.

 The code for reading the keyword files was already a part of sieve,
 and shared use of many low-level routines with other parts of sieve (e.g. the
 code for reading the control file) which would not be required by xpp.
 There are also shared data structures.

 Therefore, without an almost complete rewrite of sieve, the end result is
 a rather ragged and unsatisfactory interface.

 I have tried therefore to present low level aspects unlikely ever to be used
 other than by sieve first, and to separate out as cleanly as possible the
 features necessary for another application such as sieve to use the utf8 to pp
 translation facilities.
*/

#ifndef UTF8MODULE
#define UTF8MODULE

#define FPRINTF (void)fprintf
#define PRINTF (void)printf
#define PUTC (void)putc
#define WFPRINTF (void)fwprintf
#define WPRINTF (void)wprintf
#define PUTWC (void)putwc
#define MAX_LINE_LEN 1024
#define CHARSIZE (sizeof(wchar_t))
#define MAX_LINE_LEN_BYTES (MAX_LINE_LEN * CHARSIZE)
#define NOT_FOUND (-1)
#define U_NOT_FOUND 0xFFFFFF

typedef wchar_t unicode;
#define UNICODE_TO_PP_LEN 128

typedef char bool;
enum {False = 0, True = 1};

/* String Utilities */

int copy_keyword(
	wchar_t *kw,
	int kwlen,
	wchar_t *dest,
	int max,
	int suppress);
int copy_keyword_uni(
	unicode *kw,
	int kwlen,
	wchar_t *dest,
	int max,
	int suppress);
int copy_string(char *source, char *dest, int max);
int wcopy_string(wchar_t *source, wchar_t *dest, int max);
char * find_space(char *str);
wchar_t * wfind_space(wchar_t *str);
int wcount_to_space(wchar_t *str);
char * skip_space(char *str);
wchar_t * wskip_space(wchar_t *str);
char * split_at_space(char *str);
wchar_t * wsplit_at_space(wchar_t *str);
void string_n_copy(char *dest, char *source, int n);
void wstring_n_copy(wchar_t *dest, wchar_t *source, int n);

/* find file */

int file_exists(char *name, int is_reg);
char * get_real_name (char * name);
char * tilde_expand(char *name);
wchar_t * wtilde_expand(wchar_t *name);

/* error reporting */

#define MAX_LINE_LEN 1024
#define LINE_LEN_WCHAR_FMT "%1024ls"

struct file_data{
  char *name;
  char *file_name;
  int line_no;
  int grumbles;
  FILE *fp;
  wchar_t cur_line[MAX_LINE_LEN+1];
  bool utf8;
  unicode code_line[MAX_LINE_LEN+1];
};

void
grumble1(char *msg,
	struct file_data *file_F,
	int show_line);
void
grumble(char *fmt,
	char *msg,
	struct file_data *file_F,
	int show_line);
void
wgrumble(wchar_t *fmt,
	 wchar_t *msg,
	 struct file_data *file_F,
	 int show_line);
void message1(char *msg);
void message(char *fmt, char *msg);
void wmessage1(wchar_t *msg);
void wmessage(wchar_t *fmt, wchar_t *msg);

void EXIT(int n);
void error_top(void);
void error1(char *msg);
void error(char *fmt, char *msg);
void werror(wchar_t *fmt, wchar_t *msg);
void internal_error(char *fmt, char *msg);
void winternal_error(wchar_t *fmt, wchar_t *msg);
void print_unix_error1(int eno);
void unix_error1(char *msg);
void unix_error(char *fmt, char *msg);
void wunix_error(wchar_t *fmt, wchar_t *msg);
void *malloc_and_check(unsigned size, int err);

/* debug information */

extern int debug;

#define D_SHOW_KEYWORD_TABLE 2
#define D_GET_KW 128
#define D_READ_STEER_LINE 4096
#define D_UTF8 16384

/* files */

/* keyword files  */

#define MAX_KEYWORDS 4000
#define MAX_KW_LEN 50

extern struct file_data keyword_F;

struct keyword_information{
  unicode uni; /* unicode code point, -1 => none */
  short ech;   /* extended character code, -1 => none */
  short orig_kind; /* as read from keyword file */
  short act_kind;  /* allowing for KW_SAMEAS */
#define KW_NOT_SET 0
#define KW_SIMPLE 1
#define KW_INDEX 2
#define KW_SAMEAS 3
#define KW_SAMEAS_UNKNOWN 4
#define KW_DIRECTIVE 5
#define KW_START_DIR 6
#define KW_VERB_ALONE 7
#define KW_WHITE 8
  wchar_t *name;		/* The keyword */
  wchar_t *macro;      	/* Equivalent macro, or NULL */
  regex_t *tex_arg;	/* R.E. defining the TeX argument of this keyword, if non-null */
  wchar_t tex_arg_sense;	/* How to interpret the R.E. */
#define KW_RE_MATCH 0		/* The argument must match the R.E. */
#define KW_RE_DELIMITER 1	/* The argument is delimited by something that matches the R.E. */
  short seq;   /* sequence number */
};

struct kw_information {
  int num_keywords;
  int num_unicodes;
  int max_kw_len;
  struct keyword_information *char_code[256];
  struct keyword_information *unicode_code[MAX_KEYWORDS];
  struct keyword_information keyword[MAX_KEYWORDS];
};

struct kw_information kwi;

bool utf8_stdin;

int get_hol_kw(wchar_t *str,
	       int * len,
	       int warn,
	       struct file_data *file_F);

int get_hol_kw_uni(unicode *str,
	       int * len,
	       int warn,
	       struct file_data *file_F);

int simple_read_line(char *line, int max_len, struct file_data *file_F);
int simple_wread_line(wchar_t *line, int max_len, struct file_data *file_F);
int read_line_as_ext(struct file_data *file_F);

char *find_steering_file(char *name, char *file_type);
void read_steering_line(wchar_t *line, struct file_data *file_F);

int find_keyword(wchar_t *kw);

/*
------------------
read_keyword_files
------------------
Before making use of any procedures which translate to or from
named percent keywords it is necessary to construct a keyword file.
This is done by reading one or more keyword files.
The names of these files are determined by the -k and -K command
parameters in existing applications.

If the content of these parameters is compiled into an array
of string references then this array may be passed to
the following procedure, which will read the files and construct
the keyword table.

Examples of how to compile the array may be found in the sieve
and pp_file_conv applications.
*/

void read_keyword_files(char *keyword_files[]);

struct limits{
	int opt_list;
	int file_name_area;
	int non_copy_length;
	int process_line_len;
	int filter_len;
	int view_file;
	int keyword_file;
	int source_file;
	int num_keyword_files;
} limits;

#define MAX_KEYWORD_FILES 20

extern unsigned char character_flags[256];

extern char *program_name;

/*
------------------
utf8_line_to_codes
------------------
This procedure, given a line of utf8 encoded unicode will
convert the line into an array of unicode code points.

It should be passed the address of the utf8, which is required
to be a null terminated string, and the address of a unicode array,
which will also be null terminated when the procedure exits.
The return value is the number of code points resulting.

(this procedure should no longer be in use)
*/

int utf8_line_to_codes(wchar_t line[], unicode codes[]);

/* Translate a unicode code point to the corresponding pp ext char (if there is one),
otherwise, return 0 */

const wchar_t unicode_to_ext(unicode cp);

/*
---------------
unicode_to_aekw
---------------
(to Ascii, Extended character, or KeyWord)
Convert a unicode code point to either:
1. the same ascii character (<128)
2. a ProofPower extended character (128-255)
3. a percent enclose hexadecimal literal unicode code point
4. a keyword in percents
in that order of priority.
*/

wchar_t *unicode_to_aekw(unicode code_point);

/*
--------------
unicode_to_kwi
--------------
Find the keyword information for a unicode code point (if any).
*/

struct keyword_information *unicode_to_kwi(unicode cp);

/*
----------------
code_line_to_ext
----------------
This procedure takes a line of input which has been translated into unicode
code points into the ProofPower extended character set.
The source and destination are buffers in a file_data parameter.
The result is the length of the ext line.
*/

int code_line_to_ext(struct file_data *file_F);

/*
--------------------------
ext_or_kw_to_unicode
--------------------------
Takes a null terminated string of characters which are either ascii,
or ProofPower extended characters, or percent enclosed keyword names
(declared in the current keyword files) or percent enclosed ascii
hexadecimal unicode code points and converts the first to a unicode code point.

If this function delivers U_NOT_FOUND then this means that a keyword which
has no associated unicode code point was found.
The *len parameter will in that case be set to the length of the keyword
even though no unicode code point is returned.
*/
  
unicode ext_or_kw_to_unicode(wchar_t *line, int *len);

/*
--------------------------
ext_seq_to_unicode
--------------------------
Takes a null terminated string of characters which are either ascii,
or ProofPower extended characters and converts them to a null terminated
array of unicode code points. 
*/

void ext_seq_to_unicode(wchar_t *line, unicode codes[]);

/*
--------------------------
ext_kw_seq_to_unicode
--------------------------
Takes a null terminated string of characters which are either asscii,
or ProofPower extended characters, or percent enclosed keyword names
(declared in the current keyword files) or percent enclosed ascii
hexadecimal unicode code points and converts them to a null terminated
array of unicode code points. 
*/

void ext_kw_seq_to_unicode(wchar_t *line, unicode codes[]);

/*
----------------------
unicode_to_utf8
----------------------
This procedure takes a unicode code point and returns a utf8 string.
If unicode point > 0x10ffffu it will be an empty string.
*/ 

char *unicode_to_utf8(unicode u);
wchar_t *unicode_to_wutf8(unicode u);

/*
-------------------
unicode_seq_to_utf8
-------------------
Unicode sequence to utf8.
This function takes a null terminated unicode sequence and translates it into a null
terminated utf8 char sequence (allocated my malloc).
*/

char *unicode_seq_to_utf8(unicode *useq);

/*
-------------------
utf8_seq_to_unicode
-------------------
utf8 sequence to unicode.
This function takes a null terminated utf8 (char) sequence and translates it into a null
terminated unicode (wchar_t) sequence (allocated my malloc).
*/

unicode *utf8_seq_to_unicode(char *useq);

/*
-------------
unicode_to_kw
-------------
Convert a unicode code point to a keyword in percents
(named if possible. otherwise hex).
*/

wchar_t *unicode_to_kw(unicode code_point);

/*
---------
uni_to_pp
---------
converts a unicode code point to either an ascii character
(if < 128) or a ProofPower extended character (128-255) if possible.
Otherwise returns -1.
*/

const int uni_to_pp(unicode cp);

void output_ext_as_utf8(wchar_t *line, FILE *file_F);

/*
These high levek transcription procedures are used by pp_file_conv
and may not be more genrally applicable.
*/    

void transcribe_file_to_utf8(struct file_data *input_F, FILE *output_F);
void transcribe_file_nkw_to_utf8(struct file_data *input_F, FILE *output_F);
void transcribe_file_to_ext(struct file_data *input_F, FILE *output_F);
void transcribe_file_to_ascii(struct file_data *input_F, FILE *output_F);

#endif

/* from psearch.c */

int sv_regwcomp(regex_t *preg, const wchar_t *widepat, int cflags);
int sv_regwexec(const regex_t *preg, const wchar_t *widestr,
		       size_t nmatch, regmatch_t pmatch[], int eflags);

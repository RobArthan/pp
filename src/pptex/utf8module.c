#include <stdio.h>
#include <ctype.h>
#include <pwd.h>
#include <string.h>
#include <signal.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <regex.h>
#include <unistd.h>
#include <pwd.h>
#include <sys/types.h>
#include <sys/param.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "unicodepptab.h"
#include "ppunicodetab.h"

#define VoidStrcpy(a,b) { if(a != NULL) (void)strcpy(a, b); }
#define Strcpy(a,b) ((a != NULL) ? strcpy(a, b) : NULL)

#define PPHOME "PPHOME"
#define PPETCPATH "PPETCPATH"
#define PPENVDEBUG "PPENVDEBUG"
#define SLASH_ETC "/etc"

/*
\subsection{String Utilities}

{\tt skip_space} : Return a pointer to the first non space like character
in "str".
*/

char *
skip_space(char *str)
{
	char *p = str;

	if(p != NULL) {
		while( isascii(*p) && isspace(*p) ) {
			++p;
		}
	}
	return(p);
}

/*
{\tt find_space} : Return a pointer to the first space like character
in "str".
*/
		     
char *
find_space(char *str)
{
	char *p = str;

	if(p != NULL) {
		while( (*p) && !(isascii(*p) && isspace(*p)) ) {
			++p;
		}
	}
	return(p);
}

/*
{\tt string_n_copy} : Copy a string of at most {\tt n} characters, but
stop at an earlier null character.  Append a null character to the
resultant string.  Thus the result string may occupy {\tt n+1}
characters.  This routine is very similar to the library routine {\tt
strncpy} but: (1)~it does not pad the result string with nulls; (2)~it
guarantees the result is null terminated; and, (3)~it does not return
any value.
*/

void
string_n_copy(char *dest, char *source, int n)
{
	while((n--)>0 && *source) {
		*(dest++) = *(source++);
	}
	*dest = '\0';
}
/*

{\tt split_at_space} : Split the given string into two by overwriting
the first white space character in the argument with a null,
effectively leaving the argument as the first word of string.  Then,
skip further white space characters returning a pointer to the first
non-space character.  If the argument does not have any spaces then
nothing is overwritten and the value returned is a pointer to the null
character at the end of the string.

*/
char *
split_at_space(char *str)
{
	char *p = find_space(str);

	if(p != NULL && *p) {
		*p = '\0';
		p = skip_space(p+1);
	}
	return(p);
}
/*

{\tt str_match} : Compares the two strings.  If the first string is a prefix of
the second string then the length of the first string is returned.
Otherwise 0 is returned.
*/

int
str_match(char *prefix, char *str)
{
	int i = 0;

	while(prefix[i] != '\0' && str[i] != '\0' && prefix[i] == str[i]) {
		i++;
	}

	return( prefix[i] == '\0' ? i : 0 );
}

extern struct passwd *getpwnam(const char *name);

char *
tilde_expand(char *name)
{
	char uname[9]; /* usernames longer than 8 chars truncated */
	char *insert_str, *res;
	char *p, *q;
	int res_len, insert_len;
	struct passwd *pw;
	if(*name != '~') {
	    return(Strcpy((char*)malloc((unsigned)strlen(name)+1), name));
	};
	for(q = uname, p=name+1; p - name < 8 && *p && *p != '/'; ++p) {
	    *q++ = *p;
	};
	*q = 0;
	if(*uname) { /* A name has been supplied */
	    pw = getpwnam(uname);
	    if(pw == NULL) {
		return(NULL);
	    };
	    insert_str = pw->pw_dir;
	} else if((insert_str=getenv("HOME")) == NULL){
	    return(NULL);
	};
	insert_len = strlen(insert_str);
	res_len = insert_len + strlen(p);
	if((res=(char*)malloc((unsigned)res_len))==NULL){
	    return(NULL);
	};
	VoidStrcpy(res, insert_str);
	VoidStrcpy(res+insert_len, p);
	*(res+res_len) = 0;
	return(res);
}

char *
dirname(char *name)
{
	struct stat buf;
	char *ans;
	char *slash;
	if(name == NULL) {
	    return(NULL);
	};
	ans = tilde_expand(name);
	if(ans == NULL) return(NULL);

	if(stat(ans, &buf) || !S_ISDIR(buf.st_mode)) {
		if((slash=strrchr(ans, '/')) == NULL){
		    slash = ans;
		};
		*slash = 0;
	};
	return(ans);
}

int
file_exists(char *name, int is_reg)
{
	struct stat st;
	return((name != NULL) && !stat(name, &st) && (!is_reg ||S_ISREG(st.st_mode)));
}

char *
find_file(char *name, char *dirs, int is_reg)
{
	char *dir;
	char *buf;
	char *mydirs;
	int name_len = strlen(name);
	int dir_len;
	char *path_entry;

	if(name[0] == '/') {
		return(name);
	};

	if(dirs == NULL || (mydirs = (char*)malloc((unsigned)strlen(dirs)+1)) == NULL) {
		return(NULL);
	};

	VoidStrcpy(mydirs, dirs);
	path_entry = strtok(mydirs, ":");
	while(path_entry != NULL) {
	    dir = dirname(path_entry);
	    if(dir != NULL) {
		dir_len = strlen(dir);
		if((buf = (char*)malloc((unsigned)dir_len+name_len+2)) == NULL) {
			return(NULL);
		};
		VoidStrcpy(buf, dir);
		*(buf+dir_len) = '/';
		VoidStrcpy(buf+dir_len+1, name);
		if(file_exists(buf, is_reg)) {
			return(buf);
		};
		free(buf);
	    }
	    path_entry = strtok((char*)NULL, ":");
	};
	return(NULL);
}

int unicodepp_error = 0;
int line;
char * program_name = "";
int debug = 0;

#define D_SHOW_SIEVE_TABLE 1
#define D_SHOW_KEYWORD_TABLE 2
#define D_INIT_TABLES 4
#define D_READ_SOURCE_LINE 8
#define D_DECODE_DIR_LINE 16
#define D_ACTIONS 32
#define D_SHOW_FULL_SIEVE_TABLE 64
#define D_GET_KW 128
#define D_OPEN_OUTPUT 256
#define D_MAIN_CONVERT_CH 512
#define D_PROCESS_LINE 1024
#define D_EXPAND 2048
#define D_READ_STEER_LINE 4096
#define D_8192 8192

#define FPRINTF (void)fprintf
#define PRINTF (void)printf
#define PUTC (void)putc
#define MAX_LINE_LEN 1024
#define NOT_FOUND (-1)

struct file_data{
	char *name;
	char *file_name;
	int line_no;
	int grumbles;
	FILE *fp;
	char cur_line[MAX_LINE_LEN+1];
};

/*
\subsection{Sizes of Data Areas Used}

The `{\tt-l}' option causes various numbers about sizes of data
structures to be printed.  The variable part of this information is
gathered here.  A structure is used just to reduce the number of global
names.  These values are printed by function $list_limits$.

Many of the limiting values are declared near the data structures
they refer to.  A few are declared here.
*/

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
} limits = {
	0, 0, 0, 0, 0, 0, 0, 0, 0
};

#define MAX_KEYWORD_FILES 20

void
EXIT(int n)
{
	if(debug) FPRINTF(stderr, "%s: exiting with code %d\n", program_name, n);

	if(n != 0) n = 1;

	(void)exit(n);
}

typedef char bool;

enum {False = 0, True = 1};

#define bool short
#define true 1
#define false 0
void
grumble1(char *msg,
	struct file_data *file_F,
	int show_line)
{
	FPRINTF(stderr, "%s", program_name);
	if(show_line) {
		FPRINTF(stderr, ": line %d of %s", file_F->line_no, file_F->name);
		if(file_F->file_name != 0) FPRINTF(stderr, " %s", file_F->file_name);
	}
	FPRINTF(stderr, ": %s\n", msg);
	if(show_line) FPRINTF(stderr, "\t%s\n", file_F->cur_line);

	file_F->grumbles ++;
}

void
grumble(char *fmt,
	char *msg,
	struct file_data *file_F,
	int show_line)
{
	FPRINTF(stderr, "%s", program_name);
	if(show_line) {
		FPRINTF(stderr, ": line %d of %s", file_F->line_no, file_F->name);
		if(file_F->file_name != 0) FPRINTF(stderr, " %s", file_F->file_name);
	}
	PUTC(':', stderr);
	PUTC(' ', stderr);
	FPRINTF(stderr, fmt, msg);
	PUTC('\n', stderr);
	if(show_line) FPRINTF(stderr, "\t%s\n", file_F->cur_line);

	file_F->grumbles ++;
}
void
error_top(void)
{
	FPRINTF(stderr, "%s: ", program_name);
}

void
error1(char *msg)
{
	error_top();
	FPRINTF(stderr, "%s", msg);
	PUTC('\n', stderr);
}

void
error(char *fmt, char *msg)
{
	error_top();
	FPRINTF(stderr, fmt, msg);
	PUTC('\n', stderr);
}

void
internal_error(char *fmt, char *msg)
{
	FPRINTF(stderr, "%s: possible internal error\n  ", program_name);
	FPRINTF(stderr, fmt, msg);
	PUTC('\n', stderr);
}
void
print_unix_error1(int eno)
{
	char *msg = strerror(eno);

	if(msg != NULL) {
		FPRINTF(stderr, "\n\t%s\n", msg);
	} else {
		FPRINTF(stderr, "\n	unix error code: %d\n", eno);
	}
}

void
unix_error1(char *msg)
{
	extern int errno;
	int save_errno = errno;

	error_top();
	FPRINTF(stderr, "%s", msg);

	print_unix_error1(save_errno);
}

void
unix_error(char *fmt, char *msg)
{
	extern int errno;
	int save_errno = errno;

	error_top();
	FPRINTF(stderr, fmt, msg);

	print_unix_error1(save_errno);
}
void
message1(char *msg)
{
	(void)fputs(msg, stdout);
	(void)fputs("\n", stdout);
}

void
message(char *fmt, char *msg)
{
	(void)printf(fmt, msg);
	(void)fputs("\n", stdout);
}
void *
malloc_and_check(unsigned size, int err)
{
	void * area;

	area = malloc(size);

	if(area == NULL) {
		error1("cannot allocate work area");
		EXIT(err);
	}

	return(area);
}
int unicode_to_pp_entry_cmp(const void *buf1, const void *buf2)
{
	const unicode_to_pp_entry *u1 = buf1, *u2 = buf2;
	return  u1->code_point - u2->code_point;
}
const char *unicode_to_kw(unicode code_point)
{
	static char buf[10];
	sprintf(buf, "%%x%06X%%", code_point);
	return buf;
}
const char unicode2ppi(unicode cp)
{	
	unicode_to_pp_entry key, *search_result;
	key.code_point = cp;
	search_result = bsearch(&key, unicode_to_pp,
		UNICODE_TO_PP_LEN, sizeof(unicode_to_pp_entry), unicode_to_pp_entry_cmp);
	return (search_result=NULL) ? (char) 0 : search_result -> pp_char;
}
const char *unicode2ppk(unicode cp)
{	
	unicode_to_pp_entry key;
	char search_result;
	key.code_point = cp;
	search_result = unicode2ppi(cp);
	return (search_result=(char)0) ? NULL : unicode_to_kw(cp);
}
unicode invalid_unicode(void)
{
	int whatgot;
	fprintf(stderr, "utf8pp: line %d: invalid utf-8 input\n", line);
	unicodepp_error = 1;
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
	if(l > 4) { return invalid_unicode(); }
	r = r >> l;
	while(--l) {
		whatgot = getchar();
		if(whatgot == EOF || ((whatgot & 0xc0) != 0x80)) {
			return invalid_unicode();
		}
		r = (r << 6) | (whatgot & 0x3f);
	}
	return r;
}
void do_unicode_to_pp(void)
{
	unicode cp;
	const char *pp_string;
	cp = get_code_point();
	while(cp) {
		pp_string = unicode2ppk(cp);
		printf("%s", pp_string);
		cp = get_code_point();
	}
}
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

bool is_uc_hexit(char ch)
{
	return ('0' <= ch && ch <= '9') || ('A' <= ch && ch <= 'F');
}
bool is_percent(char ch)
{
	return ch == '%';
}
bool is_x(char ch)
{
	return ch == 'x';
}
void do_chars(int len, char *cs)
{
	while(len--) {
		printf("%s", pp_to_unicode[(int)*cs++ & 0xff]);
	}
}
bool do_keyword(unsigned u)
{
	if(u <= 0x7f) {
		return False;
	} else if (u <= 0x7ff) {
		putchar(0xc0u | (u >> 6u));
		putchar(0x80u | (u & 0x3fu));
		return True;
	} else if (u <= 0xffff) {
		putchar(0xe0u | (u >> 12u));
		putchar(0x80u | ((u & 0xfc0u) >> 6u));
		putchar(0x80u | (u & 0x3fu));
		return True;
	} else if (u <= 0x10ffffu) {
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
void do_pp_to_unicode (void)
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
int uni_to_pp_entry_cmp(const void *buf1, const void *buf2)
{
	const unicode_to_pp_entry *u1 = buf1, *u2 = buf2;
	return  u1->code_point - u2->code_point;
}

const char *uni_to_kw(unicode code_point)
{
	static char buf[10];
	sprintf(buf, "%%x%06X%%", code_point);
	return buf;
}
const int uni_to_pp(unicode cp)
{	
	unicode_to_pp_entry key, *search_result;
	key.code_point = cp;
	if (cp<128) return cp;
	search_result = bsearch(&key, unicode_to_pp,
		UNICODE_TO_PP_LEN, sizeof(unicode_to_pp_entry), uni_to_pp_entry_cmp);
	return search_result != NULL ? (unsigned char)search_result->pp_char : -1;
}
/*

{\tt get_char_unicode} : Extract a character unicode code point from {\tt line}, if a
code is obtained then return 1 and set {\tt value} to the code found.
If no code found then return 0 and set "value" to 0.

Unicode code points are one of:  hex with a leading "0x" or "0X"; octal
with a leading "0"; or decimal numbers.  They must be in the
range~$-1\sb{10}$ to~$ffffff\sb{16}$.

*/

int
get_char_unicode(char *line, unicode *value)
{
	int ch = -1;		/* -1 ==> not a valid code */

	int scan_ans;
	int len;

	scan_ans = sscanf(line, "%i%n", &ch, &len);

	if(scan_ans != 1 || len != strlen(line))
		ch = -1;

	if(ch >= -1 && ch <= 0xFFFFFF) {
		*value = ch;
		return(1);
	} else {
		*value = 0;
		return(0);
	}
}

struct file_data keyword_F = 	{ "keyword file", 0, 0, 0 };

struct keyword_information{
	unicode uni;		
	short ech;		
	short orig_kind;	
	short act_kind;
#define KW_NOT_SET 0
#define KW_SIMPLE 1
#define KW_INDEX 2
#define KW_SAMEAS 3
#define KW_SAMEAS_UNKNOWN 4
#define KW_DIRECTIVE 5
#define KW_START_DIR 6
#define KW_VERB_ALONE 7
#define KW_WHITE 8
	char *name;		
	char *macro;	
	regex_t *tex_arg;
	char tex_arg_sense;
#define KW_RE_MATCH 0	
#define KW_RE_DELIMITER 1
};
#define MAX_KEYWORDS 4000
#define MAX_KW_LEN 50

struct kw_information {
	int num_keywords;
	int max_kw_len;
	struct keyword_information *char_code[256];
	struct keyword_information *unicode_code[MAX_KEYWORDS];
	struct keyword_information keyword[MAX_KEYWORDS];
} kwi = {0, 0,};

void
add_new_keyword(
	char *name,
	unicode uni,
	int kind,
	char *macro,
	regex_t * tex_arg,
	char tex_arg_sense)
{
	struct keyword_information *ki;
	int len = strlen(name);
	int orig_kind = kind;

	if(kwi.num_keywords >= MAX_KEYWORDS) {
		error1("too many keywords");
		EXIT(29);
	}

	if(len > MAX_KW_LEN) {
		grumble1("keyword too long", &keyword_F, true);
	}

	if(len > kwi.max_kw_len) kwi.max_kw_len = len;

	if(kind == KW_SAMEAS_UNKNOWN) {
		int len2 = strlen(macro);
		orig_kind = KW_SAMEAS;

		if(len2 > MAX_KW_LEN) {
			grumble1("sameas keyword too long", &keyword_F, true);
		}

		if(len2 > kwi.max_kw_len) kwi.max_kw_len = len2;
	}

	ki = &kwi.keyword[kwi.num_keywords];
	kwi.num_keywords++;

	ki->name = name;
	ki->ech = uni_to_pp(uni);
	ki->uni = uni;
	ki->orig_kind = orig_kind;
	ki->act_kind = kind;
	ki->macro = macro;
	ki-> tex_arg = tex_arg;
	ki-> tex_arg_sense = tex_arg_sense;

	if (debug & D_SHOW_KEYWORD_TABLE) {
	   PRINTF("add_keyword: %s ext: %d uni %x\n", name, ki->ech, uni);
	};
	
	if(kwi.num_keywords>1 && strcmp(kwi.keyword[kwi.num_keywords-1].name,
				name) < 0) {
		grumble1("keywords unsorted", &keyword_F, true);
	}
}
int
find_keyword(char *kw)
{
	int lower_end = 0;
	int top_end = kwi.num_keywords - 1;

	while (lower_end <= top_end) {
		int middle = (lower_end + top_end) / 2;
		int posn = strcmp(kw, kwi.keyword[middle].name);

		if(posn == 0) return(middle);

		if(posn < 0)	top_end = middle - 1;
		else		lower_end = middle + 1;
	}

	return(NOT_FOUND);
}
void
show_kw_kind(int kind)
{
	char * kwty = NULL;
	switch (kind) {
	case KW_NOT_SET:			kwty = "not-set";		break;
	case KW_SIMPLE:			kwty = "simple";		break;
	case KW_INDEX:			kwty = "index";		break;
	case KW_SAMEAS:			kwty = "sameas";		break;
	case KW_SAMEAS_UNKNOWN:	kwty = "sameas-?";		break;
	case KW_DIRECTIVE:		kwty = "directive";		break;
	case KW_START_DIR:		kwty = "startdirective";	break;
	case KW_VERB_ALONE:		kwty = "verbalone";		break;
	case KW_WHITE:			kwty = "white";		break;
	default:									break;
	}

	if(kwty == NULL) PRINTF("?(%d)", kind);
	else PRINTF("%s", kwty);
}
void
show_one_keyword(struct keyword_information *ki)
{
	PRINTF("(%p)",		ki);
	PRINTF(" ech=%4d",		ki->ech);
	PRINTF(" uni=%8x",		ki->uni);
	PRINTF("  ty=");
	show_kw_kind(ki->act_kind);
	if(ki->act_kind != ki->orig_kind) {
		PRINTF("(was=");
		show_kw_kind(ki->orig_kind);
		PUTC(')', stdout);
	}
	PRINTF("  name=(%ld)",		(long)strlen(ki->name));
	PRINTF("'%s'",			ki->name);
	PRINTF("  macro='%s'\n",	ki->macro ? ki->macro : "(None)");
}
void
show_one_indexed_keyword(int kwindex)
{
	if(kwindex>=0 && kwindex<kwi.num_keywords) {
		(void)printf("%4d  ", kwindex);
		show_one_keyword(&(kwi.keyword[kwindex]));
	} else {
		(void)printf("%4d  not a valid keyword index\n", kwindex);
	}

}
void
show_keywords(void)
{
	int i;

	(void)printf("Characters and keywords\n\t%d  keywords\n",
		kwi.num_keywords);
	(void)printf("\t%d  max keyword length\n", kwi.max_kw_len);

	for(i=0; i<kwi.num_keywords; i++) {
		show_one_indexed_keyword(i);
	}
}
int
compare_keyword_information(
	const void *vp1,
	const void *vp2)
{
	const struct keyword_information *kw1 = vp1;
	const struct keyword_information *kw2 = vp2;
	return(kw1->name == NULL || kw2->name == NULL
		? -1 : strcmp(kw1->name, kw2->name));
}
void initialise_keyword_information(void) {
        int i;
	for(i=0; i<MAX_KEYWORDS; i++)
		kwi.keyword[i].orig_kind =
		kwi.keyword[i].act_kind =
			KW_NOT_SET;
	for(i=0; i<256; i++)
		kwi.char_code[i] = NULL;

	add_new_keyword("%%", -1, KW_SIMPLE, "\\%", NULL, 0);
};


/*
A keyword may be defined to have a {\TeX} argument, given as a regular expression
following a {\#} sign not escaped by a backslash in the macro part of the keyword file line.
The  following function checks for this regular expression, replaces the {\#} sign by a null
terminator and compiles the regular expression (into a malloced buffer). The return
value is a pointer to the compiled regular expression or null, if there is no {\TeX} argument.
*/

void
get_tex_arg(char *macro, regex_t **tex_arg, char *tex_arg_sense)
{
	char *p = macro;
	char escaped = false;
	int error_code;
	int cflags = REG_EXTENDED;
	while(*p) {
		if(escaped) {
			escaped = false;
		} else if (*p == '\\') {
			escaped = true;
		} else if (*p == '#') {
			break;
		}
		p += 1;
	}
	if(*p == '#') {
		*p = '\0';
		p += 1;
		if(*p == '-') {
			*tex_arg_sense = KW_RE_DELIMITER;
			p += 1;
		} else {
			*tex_arg_sense = KW_RE_MATCH;
		}
		*tex_arg = malloc_and_check(sizeof(regex_t), 108);
		error_code = regcomp(*tex_arg, p, cflags);
		if(error_code != 0) {
			char *errbuf;
			int errbufsize = regerror(error_code, *tex_arg, 0, 0);
			errbuf = malloc_and_check(errbufsize, 109);
			(void) regerror(error_code, *tex_arg, errbuf, errbufsize);
			grumble(" error in regular expression: %s", errbuf,
				&keyword_F, true);
			free(errbuf);
			free(*tex_arg);
			*tex_arg = 0;
		}
	} else {
		*tex_arg =0;
	}	
}

unsigned char character_flags[256];

#define DIRECTIVE_CHAR 1
#define IS_DIRECTIVE_CHAR(qq) (character_flags[(qq)&0xFF] & DIRECTIVE_CHAR)
#define SET_DIRECTIVE_CHAR(qq) character_flags[(qq)&0xFF] |= DIRECTIVE_CHAR

#define SND_CHAR_DIR_KW 2
#define IS_SND_CHAR_DIR_KW(qq) (character_flags[(qq)&0xFF] & SND_CHAR_DIR_KW)
#define SET_SND_CHAR_DIR_KW(qq) character_flags[(qq)&0xFF] |= SND_CHAR_DIR_KW

#define VERB_ALONE_CH 4
#define IS_VERB_ALONE_CH(qq) (character_flags[(qq)&0xFF] & VERB_ALONE_CH)
#define SET_VERB_ALONE_CH(qq) character_flags[(qq)&0xFF] |= VERB_ALONE_CH
char *
find_steering_file(char *name, char *file_type)
{
	char *result, *pp_env_debug;
	char *pp_home, *pp_home_etc;

	if(file_exists(name, 1) || *name == '/') {
		result = name;
	} else if(file_exists(result = find_file(name, getenv(PPETCPATH), 1), 1)) {
		;
	} else {
		pp_home = getenv(PPHOME);
		if(pp_home == NULL) {
			error("cannot find file '%s'", name);
			EXIT(26);							/* EXIT */
		}
		pp_home_etc = (char*)malloc(strlen(pp_home) + strlen(SLASH_ETC) + 1);
		strcpy(pp_home_etc, pp_home);
		strcat(pp_home_etc, SLASH_ETC);
		if(!file_exists(result = find_file(name, pp_home_etc, 1), 1)) {
			error("cannot find file '%s'", name);
			EXIT(26);							/* EXIT */
		}
		free((void*)pp_home_etc);		
	}

	if( (pp_env_debug = getenv (PPENVDEBUG)) && pp_env_debug[0] != 0) {
		fprintf(stderr, "sieve: using %s %s\n", file_type, result);
	}

	return result;
}

/*
{\tt read_line} : Reads a line into a buffer, checking that the line
isn't too long and returning the number of characters read, i.e., the
number of characters stored in argument {\tt line} but excluding the
trailing null.
*/

int
read_line(char *line, int max, struct file_data *file_F)
{
	int whatgot;
	int i = 0;

	while(i < max && (whatgot = getc(file_F->fp)) != '\n' && whatgot != EOF) {
		line[i++] = whatgot;
	}

	if(i >= max) {
		error_top();
		FPRINTF(stderr, "line %d of %s too long\n",
			file_F->line_no, file_F->name);
		EXIT(4);
	}

	line[i] = '\0';

	return(i);
}

/*
{\tt read_steering_line} : Read a steering file line, possibly escaped
over several input lines.  The argument {\tt line_no} is incremented
for each line read.
*/

void
read_steering_line(char *line, struct file_data *file_F)
{
	int len_so_far = 0;
	int len_read = 0;
	do{
		(file_F->line_no) ++;
		len_read = read_line(line + len_so_far,
			MAX_LINE_LEN - len_so_far, file_F) - 1;
		len_so_far += len_read;
	} while( (len_read > 0) && (line[len_so_far] == '\\') );

	(void)strcpy(file_F->cur_line, line);

	if(debug & D_READ_STEER_LINE) {
		(void)printf("%s %d: %s\n", file_F->name,
			file_F->line_no, file_F->cur_line);
	}
}

void
read_keyword_file(char *name)
{
	char line[MAX_LINE_LEN+1];
	char * actname;

	actname = find_steering_file(name, "keyword file");

	if( (keyword_F.fp = fopen(actname, "r")) == NULL ) {
		unix_error("cannot open keyword file '%s'", actname);
		EXIT(25);							/* EXIT */
	}

	if(debug) message("Processing keyword file '%s'", actname);
	keyword_F.file_name = actname;
	keyword_F.line_no = 0;

	while( (!feof(keyword_F.fp)) && (!ferror(keyword_F.fp)) ) {
		char * def_kw;
		char * kind_str;
		int kind;
		char * code_kw_str;
		int code;
		char * macro;
		regex_t * tex_arg;
		char tex_arg_sense;

		read_steering_line(line, &keyword_F);

		if(limits.opt_list) {
			int len = strlen(line);
			if(len > limits.keyword_file)
				limits.keyword_file = len;
		}

		def_kw = skip_space(line);

		if(def_kw == NULL || def_kw[0] == '\0' || def_kw[0] == '#') {
			/* Comment line, ignore it */
			continue;						/* CONTINUE */
		}

		kind_str = split_at_space(def_kw);

		{	int len_m_1 = strlen(def_kw)-1;

			if(def_kw[len_m_1] == '"') def_kw[len_m_1] = '%';

			if(def_kw[0] != '%' || def_kw[len_m_1] != '%') {
				grumble1("missing '%%' on keyword", &keyword_F, true);
				continue;					/* CONTINUE */
			}
		}

		if(kind_str == NULL) {
			grumble1("no keyword kind", &keyword_F, true);
			continue;						/* CONTINUE */
		}

		code_kw_str = split_at_space(kind_str);

		if(code_kw_str == NULL) {
			grumble1("no code or second keyword", &keyword_F, true);
			continue;						/* CONTINUE */
		}

		macro = split_at_space(code_kw_str);

		if	(strcmp(kind_str, "simple") == 0) kind = KW_SIMPLE;
		else if	(strcmp(kind_str, "index") == 0) kind = KW_INDEX;
		else if	(strcmp(kind_str, "directive") == 0) kind = KW_DIRECTIVE;
		else if	(strcmp(kind_str, "startdirective") == 0) kind = KW_START_DIR;
		else if	(strcmp(kind_str, "sameas") == 0) kind = KW_SAMEAS;
		else if	(strcmp(kind_str, "verbalone") == 0) kind = KW_VERB_ALONE;
		else if	(strcmp(kind_str, "white") == 0) kind = KW_WHITE;
		else {
			grumble("unknown keyword kind: %s",
				kind_str, &keyword_F, true);
			continue;						/* CONTINUE */
		}

		if(kind == KW_SAMEAS) {
			if(macro == NULL || macro[0] == '\0') {
				/* OK */
			} else {
				grumble("unexpected text \"%s\" with sameas keyword", macro,
					&keyword_F, true);
				continue;					/* CONTINUE */
			}

			{	int len_m_1 = strlen(code_kw_str)-1;
	
				if(code_kw_str[len_m_1] == '"') code_kw_str[len_m_1] = '%';
	
				if(code_kw_str[0] != '%' || code_kw_str[len_m_1] !='%') {
					grumble1("missing '%%' on sameas keyword",
						&keyword_F, true);
					continue;				/* CONTINUE */
				}
			}

			add_new_keyword(strdup(def_kw), -1, KW_SAMEAS_UNKNOWN,
				strdup(code_kw_str), NULL, 0);
		} else {

			if(!get_char_unicode(code_kw_str, &code)) {
				grumble1("unreadable or out of range char code",
					&keyword_F, true);
				continue;					/* CONTINUE */
			}

			if(find_keyword(def_kw) != NOT_FOUND) {
				grumble1("duplicate keyword", &keyword_F, true);
				continue;					/* CONTINUE */
			}

			if((kind == KW_DIRECTIVE || kind == KW_START_DIR)
					&& code == -1) {
				grumble1("char code for directive is '-1'", &keyword_F, true);
				continue;					/* CONTINUE */
			}

			get_tex_arg(macro, &tex_arg, &tex_arg_sense);

			add_new_keyword(strdup(def_kw), code, kind,
				macro != NULL && macro[0] != '\0'
			?	strdup(macro)
			:	(char*)NULL,
				tex_arg,
				tex_arg_sense);
		}
	}

	keyword_F.file_name = 0;
	if(fclose(keyword_F.fp) != 0) {
		unix_error1("i/o error reported on close file operation");
		EXIT(8);							/* EXIT */
	};
}

void
conclude_keywordfile(void)
{
	int i;
	int dump_keywords = 0;
	int stop_prog = 0;
	qsort((char*)kwi.keyword,
			kwi.num_keywords,
			sizeof(struct keyword_information),
			compare_keyword_information);
	for(i=1; i<kwi.num_keywords; i++) {
		struct keyword_information *cur_ki = &kwi.keyword[i];

		switch(cur_ki->orig_kind) {
		case KW_SAMEAS :
		case KW_SAMEAS_UNKNOWN : {
				int copy_from_index = find_keyword(cur_ki->macro);

				if(copy_from_index == NOT_FOUND) {
					grumble("no keyword the same as '%s'",
						cur_ki->macro, &keyword_F, false);
					dump_keywords = 1;
				} else {
					struct keyword_information *copy_from
						= &kwi.keyword[copy_from_index];

					free(cur_ki->macro);

					cur_ki->orig_kind = KW_SAMEAS;
					cur_ki->act_kind = copy_from->orig_kind;
					cur_ki->ech = copy_from->ech;
					cur_ki->macro = copy_from->macro;

					if(cur_ki->act_kind == KW_SAMEAS ||
							cur_ki->act_kind ==
								KW_SAMEAS_UNKNOWN) {
						grumble("unresolved sameas for keyword '%s'",
							cur_ki->name, &keyword_F, false);
						dump_keywords = 1;
					}
				}
			}
			break;

		case KW_SIMPLE :
		case KW_INDEX :
		case KW_DIRECTIVE :
		case KW_START_DIR :
		case KW_VERB_ALONE :
		case KW_WHITE :
			if(cur_ki->ech != -1) {
				if(kwi.char_code[cur_ki->ech] == NULL)
					kwi.char_code[cur_ki->ech] = cur_ki;
				else {
					grumble("conflicting char codes for keyword '%s'",
						cur_ki->name, &keyword_F, false);
					FPRINTF(stderr,
						"\tchar code %d already has keyword '%s'\n",
						cur_ki->ech,
						kwi.char_code[cur_ki->ech]->name);
					dump_keywords = 1;
				}
			}

			break;

		case KW_NOT_SET :
			break;
		default:
			internal_error("unknown entry in keyword database", "");
			dump_keywords = 1;
			stop_prog = 1;
		}

		if(cur_ki->ech == -1 && cur_ki->uni == -1 && cur_ki->macro == NULL) {
			grumble1("macro required when char code is -1", &keyword_F, false);
			dump_keywords = 1;
		}
	}

	for(i=1; i<kwi.num_keywords; i++) {
		struct keyword_information *cur_ki = &kwi.keyword[i];

		switch(cur_ki->act_kind) {
		case KW_START_DIR:
		case KW_DIRECTIVE:
			if(cur_ki->ech != -1)
				SET_DIRECTIVE_CHAR(cur_ki->ech);
			else
				grumble("no extended char with directive keyword '%s'",
						cur_ki->name, &keyword_F, false);

			if(cur_ki->name[1] != '\0' && cur_ki->name[1] != '%')
				SET_SND_CHAR_DIR_KW(cur_ki->name[1]);
			break;

		case KW_VERB_ALONE:
			if(cur_ki->ech != -1)
				SET_VERB_ALONE_CH(cur_ki->ech);
			else
				grumble("no extended char with directive keyword '%s'",
						cur_ki->name, &keyword_F, false);
			break;

		default:
			break;
		}
	}

	if(dump_keywords || (debug & D_SHOW_KEYWORD_TABLE))
		show_keywords();

	if(stop_prog) EXIT(22);	
}
int
get_hol_kw(char *str,
	int * len,
	int warn,
	struct file_data *file_F)
{
	int kwlen = 0;
	int ch;
	int ans;

	char kw[MAX_KW_LEN+1];

	kw[kwlen++] = '%';
	while(			kwlen<=kwi.max_kw_len
			&&	(ch = str[kwlen]) != '\0'
			&&	ch != '%'
			&&	isascii(ch)
			&&	isgraph(ch)
	) {
		kw[kwlen++] = ch;
	}

	kw[kwlen] = '\0';

	if(ch != '%') {
		*len = 0;
		ans = NOT_FOUND;
		kw[MAX_KW_LEN / 4] = '\0';

		if(warn) {
			grumble("mal-formed keyword starting with %s", kw, file_F, true);
		}
	} else {
		kw[kwlen++] = '%';
		kw[kwlen] = '\0';
		if(kwlen>kwi.max_kw_len) {
			*len = 0;
			ans = NOT_FOUND;
			kw[MAX_KW_LEN / 4] = '\0';
		} else {
			int kwindex = find_keyword(kw);

			*len = kwlen;
			ans = kwindex;
		}

		if(ans<0 && warn) {
grumble("unknown keyword: %s", kw, file_F, true);
		}
	}

	if(debug & D_GET_KW) {
		(void)printf("get_hol_kw: index=%d  len=%d  anslen=%d  kw=\"%s\"\n",
			ans, kwlen, *len, kw);
	}


	return(ans);
}

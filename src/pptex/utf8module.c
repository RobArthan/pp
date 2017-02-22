#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <signal.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <regex.h>
#include <unistd.h>
#include "unicodepptab.h"
#include "ppunicodetab.h"
int unicodepp_error = 0;
int line;
char * program_name = "";
int debug = 0;
#define D_SHOW_KEYWORD_TABLE 2
#define D_GET_KW 128
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

		if(cur_ki->ech == -1 && cur_ki->macro == NULL) {
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

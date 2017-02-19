#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "unicodepptab.h"
#include "ppunicodetab.h"
#include "pputf8.h"
int unicodepp_error = 0;
int line;
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
		printf("%s", pp_to_unicode[(int)*cs++ & 0xff]);
	}
}
static bool do_keyword(unsigned u)
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
static void do_pp_to_unicode (void)
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

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
#include "utf8module.h"

#define PPHOME "PPHOME"
#define PPETCPATH "PPETCPATH"
#define PPENVDEBUG "PPENVDEBUG"
#define SLASH_ETC "/etc"

/*
================
String Utilities
================

 Return a pointer to the first non space like character in "str" */

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
----------
find_space
----------
Return a pointer to the first space like character in "str".
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

/*
-------------
string_n_copy
-------------
Copy a string of at most {\tt n} characters, but
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
--------------
split_at_space
--------------
Split the given string into two by overwriting
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
---------
str_match
---------
Compares the two strings.  If the first string is a prefix of
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

/*
========
findfile
========
*/

#define VoidStrcpy(a,b) { if(a != NULL) (void)strcpy(a, b); }
#define Strcpy(a,b) ((a != NULL) ? strcpy(a, b) : NULL)

extern struct passwd *getpwnam(const char *name);

/*
------------
tilde_expand
------------
Returns a string, an initial `~' followed
by a user name is replaced by that user's home directory and an initial
`~' followed by  `/' (or end of string) by the value of
the shell variable {\tt HOME}.  This approximates the C-shell
convention.
*/

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

/*
-----------
file_exists
-----------
Returns 0 if the file name does not exist or if
name is a NULL pointer, 1 otherwise.
The file is taken to exist if it exists (as a regular file or a link to same if is_reg is non-zero) and
the user has enough access rights to find that out using stat.
*/

int
file_exists(char *name, int is_reg)
{
	struct stat st;
	return((name != NULL) && !stat(name, &st) && (!is_reg ||S_ISREG(st.st_mode)));
}

/*
-----------
is_sym_link
-----------
Returns 0 if the file name does not refer to a symbolic link or if
name is a NULL pointer, 1 otherwise.
*/

int
is_sym_link(char *name)
{
	struct stat st;
	if(name == NULL || lstat(name, &st)) {
		return 0;
	}
	return S_ISLNK(st.st_mode);
}
/*
------
is_dir
------
Returns 0 if the file name does not refer to a directory or if
name is a NULL pointer, 1 otherwise.
*/
int
is_dir(char *name)
{
	struct stat st;
	if(name == NULL || lstat(name, &st)) {
		return 0;
	}
	return S_ISDIR(st.st_mode);
}
/*
---------------
split_file_name
---------------
split a file name into directory name and base name.
*/

void
split_file_name(char *name, char **dir, char **base)
{
	int name_len, dir_len;
	if (name == NULL) {
		*dir = NULL;
		*base = NULL;
		return;
	}
	name_len = strlen(name);
	for(dir_len = name_len - 1; dir_len >= 0; dir_len -= 1) {
		if(name[dir_len] == '/') {
			*dir = (char*) malloc(dir_len + 2);
			*base = (char*) malloc(name_len - dir_len);
			strncpy(*dir, name, dir_len);
			if(dir_len > 0) {
				(*dir)[dir_len] = 0;
			} else {
				strcpy(*dir, "/");
			}
			strcpy(*base, &name[dir_len+1]);
			return;
		}
	}
	*dir = (char*) malloc(1);
	(*dir)[0] = 0;
	*base = (char*) malloc(name_len + 1);
	strcpy(*base, name);
}
/*
---------
read_link
---------
like the system call readlink, but handling the memory allocation.
*/
char *
read_link(char *name)
{
	char *buf;
	int count, bufsiz;
	bufsiz = 20;
	buf = (char*) malloc(bufsiz);
	do {
		bufsiz *= 2;
		buf = (char*)realloc(buf, bufsiz);
		count = readlink(name, buf, bufsiz - 1);
		if(count < 0) {
			free(buf);
			return NULL;
		}
	} while(count == bufsiz - 1);
	buf[count] = 0;
	return buf;
}
/*
-------------
get_real_name
-------------
from a file name potentially containing symbolic links find the real name of the parent directory of the file;
if base_name is not NULL return the real file base name in it too.
Apparently there are portability problems with the MAXPATHLEN symbol (it can in principle be much too large to use as an array size or argument to malloc or it may not be defined).
The code below also tries hard to defend itself against the somewhat loosely specified behaviour when
the buffer is too small.
*/
#define MAX_LINKS 100
#ifdef MAXPATHLEN
#	if	MAX_PATH_LEN < 50000
#	define	MAX_FILE_NAME_LEN MAXPATHLEN
#	endif
#else
#	define	MAX_FILE_NAME_LEN 50000
#endif
char *
get_real_name (char * name)
{
	char *dir, *base, *cur_name, *res, buf[MAX_FILE_NAME_LEN+2];
	int orig_cwd;
	int loops;
	orig_cwd = open(".", 0, 0);
	if(orig_cwd < 0) {
		return NULL;
	}
	cur_name = (char*) malloc(strlen(name) + 1);
	strcpy(cur_name, name);
	for(loops = 0; loops < MAX_LINKS; loops += 1) {
		if(is_dir(cur_name)) {
			dir = cur_name;
			base  = (char*) malloc(1);
			*base = 0;
			if(chdir(dir)) {
				fchdir(orig_cwd);
				close(orig_cwd);
				free(dir);
				free(base);
				return NULL;
			}
			break;
		}
		split_file_name(cur_name, &dir, &base);
		free(cur_name);
		cur_name = NULL;
		if(dir == NULL) {
			return NULL;
		}
		if(*dir) {
			if(chdir(dir)) {
				fchdir(orig_cwd);
				close(orig_cwd);
				free(dir);
				free(base);
				return NULL;
			}
		}
		if(!is_sym_link(base)) {
			free(dir);
			dir = NULL;
			break;
		}
		cur_name = read_link(base);
		if(cur_name == NULL) {
			free(dir);
			free(base);
			return NULL;
		}
	}
	if(cur_name != NULL) {
		free(cur_name);
	}
	buf[MAX_FILE_NAME_LEN+1] = 0;
	if(	loops == MAX_LINKS
	||	getcwd(buf, MAX_FILE_NAME_LEN) == NULL
	||	strlen(buf) == MAX_FILE_NAME_LEN+1) {
		if(dir) {
			free(dir);
		}
		if(base) {
			free(base);
		}
		fchdir(orig_cwd);
		close(orig_cwd);
		return NULL;
	}
	res = (char*) malloc(strlen(buf) + strlen(base) + 2);
	strcpy(res, buf);
	if(strcmp(buf, "/") && *base) {
		strcat(res, "/");
	}
	strcat(res, base);
	fchdir(orig_cwd);
	close(orig_cwd);
	return res;
}

/*
---------
find_file
---------
Treats dirs as a list of directory names
separated by colons and attempts to find the file given by name in that
list of directories.  If a file name rather than a directory name is
encountered in dirs then the name of the directory containing that file is used.  A pointer to a string held containing the first such name for
which a file is found.  If no such file is found {\tt NULL} is returned.
All file names are expanded using the C-shell's tilde convention before
use and the expanded name is returned.
If is_reg is non-zero, require the found file to be a regular file (i.e., not a directory, but could be
*/

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

/*
================
Diagnostic Flags 
================

This is the full set of flags originally in sieve because some of
them are relevant to keyword file processing.
This arrangement to be slimmed down and made compatible with xpp
diagnostic flags in some way.
*/

int unicodepp_error = 0;
int line;
char * program_name = "";
int debug = 0;

/*
#define D_SHOW_SIEVE_TABLE 1
#define D_INIT_TABLES 4
#define D_READ_SOURCE_LINE 8
#define D_DECODE_DIR_LINE 16
#define D_ACTIONS 32
#define D_SHOW_FULL_SIEVE_TABLE 64
#define D_OPEN_OUTPUT 256
#define D_MAIN_CONVERT_CH 512
#define D_PROCESS_LINE 1024
#define D_EXPAND 2048
*/

#define FPRINTF (void)fprintf
#define PRINTF (void)printf
#define PUTC (void)putc
#define MAX_LINE_LEN 1024
#define NOT_FOUND (-1)
#define U_NOT_FOUND 0xFFFFFF

struct file_data dummy_F = {"dummy file", NULL, 0, 0, NULL, {0, 0, 0}};

/*
========================
Sizes of Data Areas Used
========================

The `{\tt-l}' option causes various numbers about sizes of data
structures to be printed.  The variable part of this information is
gathered here.  A structure is used just to reduce the number of global
names.  These values are printed by function $list_limits$.

Many of the limiting values are declared near the data structures
they refer to.  A few are declared here.
*/

/*
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
*/

#define MAX_KEYWORD_FILES 20

void
EXIT(int n)
{
  if(debug) FPRINTF(stderr, "%s: exiting with code %d\n", program_name, n);

  if(n != 0) n = 1;

  (void)exit(n);
}

/*
========================
Messages and Diagnostics
========================
*/

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
	if(debug) fflush(stdout);
}

void
message(char *fmt, char *msg)
{
	(void)printf(fmt, msg);
	(void)fputs("\n", stdout);
	if(debug) fflush(stdout);
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

/*
===========================================
Auxiliaries For Source File Line Processing
===========================================
-----------
copy_string
-----------
Copies the {\tt source} string into the {\tt dest}
string for up to {\tt max} characters.  Does not add a null character
after the copied characters if the length is exceeded.  Return the
number of characters copied.  This differs from the C library routines
{\tt strcpy} and {\tt strncpy} which return the address of the output
string.
*/

int
copy_string(char *source, char *dest, int max)
{
	int i = 0;

	if(source != NULL) {
		while((*(dest++) = *(source++)) != '\0' && i < max) {
			i++;
		}
	}

	return(i);
}


/*
=======================
Keyword File Processing
=======================
*/

bool utf8_stdin = False; /* this is set True by -u flag in sieve */

struct file_data keyword_F = 	{ "keyword file", 0, 0, 0 };

/*
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
*/

#define MAX_KEYWORDS 4000
#define MAX_KW_LEN 50

/*
------------
copy_keyword
------------
Copies the keyword {\tt kw} read from the input
string into the {\tt dest} string for up to {\tt max} characters.
Return the number of characters written to {\tt dest}.  The keyword is
{\tt kwlen} characters long, it starts and (probably) ends with
`{\tt\%}' characters which are not copied if {\tt suppress} is non zero.
*/

int
copy_keyword(
	char *kw,
	int kwlen,
	char *dest,
	int max,
	int suppress)
{
	int inp = 0;
	int outp = 0;

	while(*kw != '\0' && inp < kwlen && outp < max) {
		if(suppress && *kw == '%') {
			kw++;
		} else {
			*(dest++) = *(kw++);
			outp++;
		}
		inp++;
	}

	return(outp);
}

/*
---------------
add_new_keyword
---------------
This procedure adds a new entry into the keyword table.

*/

void
add_new_keyword(
	char *name,
	int ech,
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
		grumble1("keyword too long", &keyword_F, True);
	}

	if(len > kwi.max_kw_len) kwi.max_kw_len = len;

	ki = &kwi.keyword[kwi.num_keywords];

	if(kind == KW_SAMEAS_UNKNOWN) {
	  int len2 = strlen(macro);
	  orig_kind = KW_SAMEAS;
	  
	  if(len2 > MAX_KW_LEN) {
	    grumble1("sameas keyword too long", &keyword_F, True);
	  }
	  if(len2 > kwi.max_kw_len) kwi.max_kw_len = len2;
	};

	ki->name = name;
	ki->ech = ech;
	ki->uni = uni;
	ki->orig_kind = orig_kind;
	ki->act_kind = kind;
	ki->macro = macro;
	ki->tex_arg = tex_arg;
	ki->tex_arg_sense = tex_arg_sense;
	ki->seq = kwi.num_keywords++;
	
	if (debug & D_SHOW_KEYWORD_TABLE) {
	   PRINTF("add_new_keyword: %s ext: %d uni %x\n", name, ki->ech, uni);
	};
	
	if(kwi.num_keywords>1 && strcmp(kwi.keyword[kwi.num_keywords-1].name,
				name) < 0) {
		grumble1("keywords unsorted", &keyword_F, True);
	}
}


/*
---------------------------
compare_keyword_information
---------------------------
this function, given two references to keyword_information
   compares the keyword names
*/

int
compare_keyword_information(
	const void *vp1,
	const void *vp2)
{
	const struct keyword_information *kw1 = vp1;
	const struct keyword_information *kw2 = vp2;
	if (kw1->name == NULL || kw2->name == NULL) return -1;
	int res = strcmp(kw1->name, kw2->name);
	if (res == 0) return (kw1->seq - kw2->seq);
	return res;
}

/*
---------------------------
compare_keyword_information
---------------------------
this function, given two references to keyword_information
   compares the keyword names

int
compare_keyword_information2(
	const void *vp1,
	const void *vp2)
{
	const struct keyword_information *kw1 = vp1;
	const struct keyword_information *kw2 = vp2;
	FPRINTF(stdout, "compare_keyword_information2\n");
	int res = strcmp(kw1.name, kw2.name);
	FPRINTF(stdout, "compare_keyword_information2: %i\n", res);
	return res;
}
*/

/*
------------
find_keyword
------------
given a reference to a keyword this function finds the keyword informatino
   for that keyword, returning its index in array kwi.keyword
*/

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

/*
int
find_keyword(char *kw)
{
  int res = 0;
  struct keyword_information *ki;
  FPRINTF(stdout, "find_keyword\n");
  fflush(NULL);
  ki = bsearch(
	       kw, kwi.keyword,
	       kwi.num_keywords,
	       sizeof(struct keyword_information),
	       compare_keyword_information);
  if (ki == NULL) return NOT_FOUND;
  res = ki - kwi.keyword;
  FPRINTF(stdout, "find_keyword: ki=%x, res = %x\n", ki, res);
  fflush(NULL);
  return res;
}
*/

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
	PRINTF(" seq=%3x",		ki->seq);
	PRINTF(" ech=%3i",		ki->ech);
	PRINTF(" uni=%6x",		ki->uni);
	PRINTF("  ty=");
	show_kw_kind(ki->act_kind);
	if(ki->act_kind != ki->orig_kind) {
		PRINTF("(was=");
		show_kw_kind(ki->orig_kind);
		PUTC(')', stdout);
	}
	PRINTF("  name=(%2ld)",       	(long)strlen(ki->name));
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
	};
	if (debug) {printf("finished after %i\n", i); fflush(stdout);};
}

/*
---------------------------
compare_keyword_unicode
---------------------------
this function, given two references to keyword_information
   compares the unicode code points
*/

int
compare_keyword_unicode(
	const void *vp1,
	const void *vp2)
{
  struct keyword_information **kw1 = (struct keyword_information**)vp1;
  struct keyword_information **kw2 = (struct keyword_information**)vp2;
  if ((*kw1)->uni == (*kw2)->uni) return 0;
  else if ((*kw1)->uni < (*kw2)->uni) return -1;
  else return 1;
}

/*
---------------------------
compare_keyword_unicode2
---------------------------
this function, given two references to keyword_information
compares the unicode code points, and if same compares
sequence number.
*/

int
compare_keyword_unicode2(
	const void *vp1,
	const void *vp2)
{
  struct keyword_information **kw1 = (struct keyword_information**)vp1;
  struct keyword_information **kw2 = (struct keyword_information**)vp2;
  if ((*kw1)->uni < (*kw2)->uni) return -1;
  if ((*kw1)->uni > (*kw2)->uni) return 1;
  if ((*kw1)->seq < (*kw2)->seq) return -1;
  if ((*kw1)->seq > (*kw2)->seq) return 1;
  return 0;
}

void initialise_keyword_information(void) {
        int i;
	for(i=0; i<MAX_KEYWORDS; i++) {
		kwi.keyword[i].orig_kind =
		kwi.keyword[i].act_kind = KW_NOT_SET;
		kwi.unicode_code[i] = NULL;
	};

	for(i=0; i<256; i++)
		kwi.char_code[i] = NULL;

	/*	add_new_keyword("%%", NOT_FOUND, 37, KW_SIMPLE, "\\%", NULL, 0); */
	add_new_keyword("%%", NOT_FOUND, U_NOT_FOUND, KW_SIMPLE, "\\%", NULL, 0);

};

/*
----------------
get_char_unicode
----------------
Extract an ascii representation of a unicode code point from {\tt line},
if a code is obtained then return 1 and set {\tt value} to the code found.
If no code found then return 0 and set "value" to 0.

Unicode code points are represented as an ascii literal which is one of:
1. hex with a leading "x";
2. octal with a leading "0"
3. decimal numbers.
They must be in the range -1 to 10ffff\sb{16}.

The -1 is not a unicode code but is used in keyword files to designate "no unicode code".
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

	if(ch >= -1 && ch <= 0x10FFFF) {
		*value = ch;
		return(1);
	} else {
		*value = 0;
		return(0);
	}
}

/*
-------------------
percent_hex_to_unicode
-------------------
This procedure processes the hexadecimal literals permitted in percemts
representing unicode code points.
Only hex is permitted, and it must be prefixed by "#x" (not "0x").

A *unicode parameter is set to the length including percents if successful,
the return value is the unicode value.
*/

unicode
percent_hex_to_unicode(char *line, int *len)
{
	int ch = -1;		/* -1 ==> not a valid code */
	int scan_ans;
	scan_ans = sscanf(line, "%%#x%X%%%n", &ch, len);
	if(scan_ans != 1) ch = -1;
	if(ch >= 1 && ch <= 0x10FFFF) return(ch);
	*len = 0;
	return(0);
}

/*
-----------
get_tex_arg
-----------
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
	char escaped = False;
	int error_code;
	int cflags = REG_EXTENDED;
	while(*p) {
		if(escaped) {
			escaped = False;
		} else if (*p == '\\') {
			escaped = True;
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
				&keyword_F, True);
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
----------------
simple_read_line
----------------
Reads a line into a buffer, checking that the line
isn't too long and returning the number of characters read, i.e., the
number of characters stored in argument {\tt line} but excluding the
trailing null.

The line is the sequence of characters up to the next newline character,
which is read but not placed in the output string.
The maximum length is specified by the second parameter, and the program
will be terminated if it is exceeded.

*/

int
simple_read_line(char *line, int max_len, struct file_data *file_F)
{
	int whatgot;
	int i = 0;

	while(i < max_len && (whatgot = getc(file_F->fp)) != '\n' && whatgot != EOF) {
	  line[i++] = whatgot;
	}

	if(i >= max_len) {
		error_top();
		FPRINTF(stderr, "line %d of %s too long\n",
			file_F->line_no, file_F->name);
		EXIT(4);
	}
	line[i] = '\0';
	file_F->line_no++;
	return(i);
}


/*
------------------
read_steering_line
------------------
Read a steering file line, possibly escaped
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
		len_read = simple_read_line(line + len_so_far,
			MAX_LINE_LEN - len_so_far, file_F) - 1;
		len_so_far += len_read;
	} while( (len_read > 0) && (line[len_so_far] == '\\') );

	(void)strcpy(file_F->cur_line, line);

	if(debug & D_READ_STEER_LINE) {
		(void)printf("%s %d: %s\n", file_F->name,
			file_F->line_no, file_F->cur_line);
	}
}

int uni_to_pp_entry_cmp(const void *buf1, const void *buf2)
{
	const unicode_to_pp_entry *u1 = buf1, *u2 = buf2;
	return  u1->code_point - u2->code_point;
}

/*
---------
uni_to_pp
---------
converts a unicode code point to either an ascii character
(if < 128) or a ProofPower extended character (128-255) if possible.
Otherwise returns -1.
*/

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
-----------------
read_keyword_file
-----------------

Read a keyword file creating from it the keyword_information in kwi.
*/

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

	keyword_F.file_name = actname;
	keyword_F.line_no = 0;

	while( (!feof(keyword_F.fp)) && (!ferror(keyword_F.fp)) ) {
		char * def_kw;
		char * kind_str;
		int kind, icode /* , kwindex */;
		char * code_kw_str;
		unicode code;
		int ech;
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
				grumble1("missing '%%' on keyword", &keyword_F, True);
				continue;					/* CONTINUE */
			}
		}

		if(kind_str == NULL) {
			grumble1("no keyword kind", &keyword_F, True);
			continue;						/* CONTINUE */
		}

		code_kw_str = split_at_space(kind_str);

		if(code_kw_str == NULL) {
			grumble1("no code or second keyword", &keyword_F, True);
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
				kind_str, &keyword_F, True);
			continue;						/* CONTINUE */
		}

		if(kind == KW_SAMEAS) {
			if(macro == NULL || macro[0] == '\0') {
				/* OK */
			} else {
				grumble("unexpected text \"%s\" with sameas keyword", macro,
					&keyword_F, True);
				continue;					/* CONTINUE */
			}

			{	int len_m_1 = strlen(code_kw_str)-1;
	
				if(code_kw_str[len_m_1] == '"') code_kw_str[len_m_1] = '%';
	
				if(code_kw_str[0] != '%' || code_kw_str[len_m_1] !='%') {
					grumble1("missing '%%' on sameas keyword",
						&keyword_F, True);
					continue;				/* CONTINUE */
				}
			}

			add_new_keyword(strdup(def_kw), NOT_FOUND, U_NOT_FOUND, KW_SAMEAS_UNKNOWN,
				strdup(code_kw_str), NULL, 0);
		} else {

			if(!get_char_unicode(code_kw_str, &icode)) {
				grumble1("unreadable or out of range char code",
					&keyword_F, True);
				continue;					/* CONTINUE */
			}

			code = (icode < 0) ? U_NOT_FOUND : icode;

			ech = uni_to_pp(code);

			/* This code used to look up in the table to find out whether
			   keyword was already defined, but until table is sorted the lookup
			   will not work, so this check has been deferred.
			*/
			/*
			kwindex = find_keyword(def_kw);
			
			if(kwindex != NOT_FOUND) {
			  if (kind == KW_SIMPLE) {
			    struct keyword_information *ki = &kwi.keyword[kwindex];
			    if (ki->orig_kind == KW_SIMPLE){
			      if (ki->uni == U_NOT_FOUND){
				ki->uni = code;
				ki->ech = ech;
			      } else {
				if (ki->uni != code)
				  grumble1("clashing keyword definitions", &keyword_F, True);
			      };
			    } else {
			    grumble1("duplicate keyword", &keyword_F, True);
			    }
			  } else grumble1("duplicate keyword", &keyword_F, True);
			  continue;
			}
			*/
			
			if((kind == KW_DIRECTIVE || kind == KW_START_DIR)
					&& ech == -1) {
				grumble1("ascii/ext code for directive is '-1'", &keyword_F, True);
				continue;					/* CONTINUE */
			}

			get_tex_arg(macro, &tex_arg, &tex_arg_sense);

			add_new_keyword(strdup(def_kw), ech, code, kind,
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

/*
---------------------
conclude_keywordfile
---------------------
This procedure completes the keyword_information after all the keyword files
have been read.

First it sorts the table in alphabetic order of keyword, preserving the original
ordering where there are multiple entries for a sinle keyword.
Then it scans the table to eliminate multiple entries.
In a limited number of cases a second entry is permitted to override parts of the first,
and is then discarded.
in other cases the second entry is discarded without effect (apart from a warning or error message)
A second entry for a keyword will be discarded unless both it and the original have kind KW_SIMPLE.
It the second supplies a new unicode code point then this will override the first unless the first
is a code point associated with a ProofPower extended character (since that correspondence is
hard wired elsewhere and cannot be overridden by the keyword file).
If the second supplies a macro then it, and any parameter info, will replace the original.
After this scan no keyword will have multiple entries.

Now that the table is alphabetic and duplicate free the other indexes used to find information
in it are sorted.

It then looks through the table doing various checks or completions.
This includes:
1. Resolves 'sameas' keywords if possible, by copying the keyword information for
   the keyword referred to.
2. filling in the index by extended character code, rejecting multiple keywords
   for any single extended character.

*/

void
conclude_keywordfile(void)
{
  int i, j;
  int dump_keywords = 0;
  int stop_prog = 0;
  struct keyword_information *prev_ki = NULL;
  
  if(debug) fflush(NULL);
  
  /* first sort kwi.keyword into alphabetic order of keyword name (and sequence no.) */
  
  qsort((char*)kwi.keyword,
	kwi.num_keywords,
	sizeof(struct keyword_information),
	compare_keyword_information);
  
  /* Then scan keyword table combining multiple entries for a keyword into
     a single entry, where possible.

     There are two positions being tracked here.
     i and j are positions of source and destination during the copy.
     The keyword file is transcribed into itself compressing multiple entries
     for a single keyword into one entry.
  */
  
  j=0;
  prev_ki = NULL;
  for(i=1; i<kwi.num_keywords; i++) {
    struct keyword_information *cur_ki = &kwi.keyword[i];
    if (prev_ki != NULL && (strcmp(prev_ki->name, cur_ki->name) == 0)) {
      if (prev_ki->orig_kind != KW_SIMPLE || cur_ki->orig_kind != KW_SIMPLE)
	grumble("Multiple keyword file entries for keyword %s, not all SIMPLE\n",
		prev_ki->name, &keyword_F, False);
      else {
	if (prev_ki->ech != NOT_FOUND && cur_ki->uni != U_NOT_FOUND
	    && cur_ki->uni != prev_ki->uni)
	  grumble("Second keyword file entry for keyword %s, not permitted to change unicode for ext char\n",
		  prev_ki->name, &keyword_F, False);
	else {
	  if (cur_ki->uni != U_NOT_FOUND) {
	    prev_ki->uni = cur_ki->uni;
	    prev_ki->ech = cur_ki->ech;
	  }
	}
	if (cur_ki->macro != NULL){
	  prev_ki->macro = cur_ki->macro;
	  prev_ki->tex_arg = cur_ki->tex_arg;
	  prev_ki->tex_arg_sense = cur_ki->tex_arg_sense;
	}
	continue;
      }
    }
   if (++j < i) kwi.keyword[j] = kwi.keyword[i];
   prev_ki = &kwi.keyword[j];
  }
  kwi.num_keywords = j+1;
  
  /* Scan table to connect SAMEAS entries and do some checks */
  
  for(i=1; i<kwi.num_keywords; i++) {
    struct keyword_information *cur_ki = &kwi.keyword[i];
    
    switch(cur_ki->orig_kind) {
    case KW_SAMEAS :
    case KW_SAMEAS_UNKNOWN : {
      int copy_from_index = find_keyword(cur_ki->macro);
      
      if(copy_from_index == NOT_FOUND) {
	grumble("undeclared keyword '%s' referred to by sameas",
		cur_ki->macro, &keyword_F, False);
	dump_keywords = 1;
      } else {
	struct keyword_information *copy_from
	  = &kwi.keyword[copy_from_index];
	
	free(cur_ki->macro);
	
	cur_ki->orig_kind = KW_SAMEAS;
	cur_ki->act_kind = copy_from->orig_kind;
	cur_ki->ech = copy_from->ech;
	cur_ki->uni = copy_from->uni;
	cur_ki->macro = copy_from->macro;
	
	if(cur_ki->act_kind == KW_SAMEAS ||
	   cur_ki->act_kind ==
	   KW_SAMEAS_UNKNOWN) {
	  grumble("unresolved 'sameas' for keyword '%s' (keyword referred to is also 'sameas')",
		  cur_ki->name, &keyword_F, False);
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
	  /*	  FPRINTF(stderr,
		  "Ext code %03d already has keyword % 23s, now given keyword %s\n",
		  cur_ki->ech,
		  kwi.char_code[cur_ki->ech]->name,
		  cur_ki->name);
		  dump_keywords = 1;
	  */
	}
      }
      /*
      int kwipos = unicodekwi(cur_ki->uni);
      if(kwipos != NOT_FOUND){
	if(kwi.unicode_code[kwipos] == NULL)
	  kwi.char_code[cur_ki->ech] = cur_ki;
	else {
	  grumble("conflicting unicode codes for keyword '%s'",
		  cur_ki->name, &keyword_F, False);
	  FPRINTF(stderr,
		  "\tchar code %d already has keyword '%s'\n",
		  cur_ki->ech,
		  kwi.char_code[cur_ki->ech]->name);
	  dump_keywords = 1;
	}
      }
      */
      break;
      
    case KW_NOT_SET :
      break;
    default:
      internal_error("unknown entry in keyword database", "");
      dump_keywords = 1;
      stop_prog = 1;
    }
    
    if(cur_ki->ech == -1 && cur_ki->uni == -1 && cur_ki->macro == NULL) {
      grumble1("macro required when char code is -1", &keyword_F, False);
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
		cur_ki->name, &keyword_F, False);
      
      if(cur_ki->name[1] != '\0' && cur_ki->name[1] != '%')
	SET_SND_CHAR_DIR_KW(cur_ki->name[1]);
      break;
      
    case KW_VERB_ALONE:
      if(cur_ki->ech != -1)
	SET_VERB_ALONE_CH(cur_ki->ech);
      else
	grumble("no extended char with directive keyword '%s'",
		cur_ki->name, &keyword_F, False);
      break;
      
    default:
      break;
    }
  }

  /* fill in kwi.unicode_code table */
  
  for (i=0; i<kwi.num_keywords; i++)
    if (kwi.keyword[i].uni != U_NOT_FOUND) {
      kwi.unicode_code[kwi.num_unicodes] = &kwi.keyword[i];
      kwi.num_unicodes++;
    };
    
  /* sort kwi.num_unicode_code */

  qsort((char*)kwi.unicode_code,
	kwi.num_unicodes,
	sizeof(&kwi),
	compare_keyword_unicode2);

  /* Remove duplicate entries (keeping the first keyword with each unicode code) */

  j = 0;
  for(i=1; i<kwi.num_unicodes; i++) {  
    if (kwi.unicode_code[i]->uni == kwi.unicode_code[j]->uni) continue;
    if (++j < i) {
      kwi.unicode_code[j] = kwi.unicode_code[i];
    };
  };
  kwi.num_unicodes=++j;
  
  if(dump_keywords || (debug & D_SHOW_KEYWORD_TABLE))
    show_keywords();
    
  if(stop_prog) EXIT(22);	
}

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

void
read_keyword_files(char *keyword_files[]){
  int option;
  
  initialise_keyword_information();

  for(option=0; option<limits.num_keyword_files; option++) {
    if(keyword_files[option] != NULL)
      read_keyword_file(keyword_files[option]);
  };

  conclude_keywordfile();

  return;
};

/*
----------
get_hol_kw
----------
This function may be used to look up a named keyword returning the position
of the relevant entry in kwi.keyword, or -1 if not found.

It grumbles if the keyword is malformed or unknown.

*/

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
	while(			kwlen<=MAX_KW_LEN
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
			grumble("mal-formed keyword starting with %s", kw, file_F, True);
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
grumble("unknown keyword: %s", kw, file_F, True);
		}
	}

	if(debug & D_GET_KW) {
		(void)printf("get_hol_kw: index=%d  len=%d  anslen=%d  kw=\"%s\"\n",
			ans, kwlen, *len, kw);
	}


	return(ans);
}

/*
=========================
UNICODE and utf8 handling
=========================

-----------------------
Unicode <-> ext mapping
-----------------------

Convert a unicode code point to a 6-digit hexadecimal in percents */

char *unicode_to_hex(unicode code_point)
{
	static char buf[11];
	sprintf(buf, "%%#x%06X%%", code_point);
	return buf;
}

/*
===============================
Using Unicode <-> pp ext tables
===============================

These are the tables unicode_to_pp and pp_to_unicode,
included as unicodepptab.h and ppunicodetab.h

----------------------
unicode_to_pp_entry_cm
----------------------

Compare unicode code points in the unicode to pp table.
Used in binary search. 
*/

int unicode_to_pp_entry_cmp(const void *buf1, const void *buf2)
{
	const unicode_to_pp_entry *u1 = buf1, *u2 = buf2;
	return  u1->code_point - u2->code_point;
}

/* Translate a unicode code point to the corresponding pp ext char (if there is one),
otherwise, return 0 */

const char unicode_to_ext(unicode cp)
{	
	unicode_to_pp_entry key, *search_result;
	key.code_point = cp;
	search_result = bsearch(&key, unicode_to_pp,
		UNICODE_TO_PP_LEN, sizeof(unicode_to_pp_entry), unicode_to_pp_entry_cmp);
	return (search_result=NULL) ? (char) 0 : search_result -> pp_char;
}

/* Translate a unicode code point to pp ext char or else to hex in percents */

const char *unicode_to_ppk(unicode cp)
{
  static char s[2];
  s[0] = unicode_to_ext(cp);
  s[1]=0;
  return (s[0]) ? s : unicode_to_hex(cp);
}

/*
-------------------------------------
Translations involving named keywords
-------------------------------------
----------------
find_unicode_kwi
----------------

Given a unicode code point this function finds the keyword informatino
for that code point, returning its index in array kwi.unicode_code.
*/

int
find_unicode_kwi(unicode uni)
{
	int lower_end = 0;
	int top_end = kwi.num_unicodes - 1;

	while (lower_end <= top_end) {
		int middle = (lower_end + top_end) / 2;
		int posn = kwi.unicode_code[middle]->uni - uni;

		if(posn == 0) return(middle);

		if(posn < 0)	top_end = middle - 1;
		else		lower_end = middle + 1;
	}
	return(NOT_FOUND);
}


/* Compare unicode code points in the keyword_information table.
Used in binary search. */

int kwi_unicode_cmp(const void *buf1, const void *buf2)
{
	const struct keyword_information *u1 = buf1, *u2 = buf2;
	return  u1->uni - u2->uni;
}

/*
--------------
unicode_to_kwi
--------------
Find the keyword information for a unicode code point (if any).
*/

struct keyword_information *unicode_to_kwi(unicode cp)
{	
  struct keyword_information key, *keyr;
  struct keyword_information **search_result;
  /*  int i; */
  key.uni = cp;
  keyr = &key;
  search_result = bsearch(&keyr, kwi.unicode_code,
			  kwi.num_unicodes, sizeof(search_result), compare_keyword_unicode);
  if (search_result == NULL) return NULL;
  return *search_result;
}

/*
-------------
unicode_to_kw
-------------
Convert a unicode code point to a keyword in percents
(named if possible. otherwise hex).
*/

char *unicode_to_kw(unicode code_point)
{
  struct keyword_information *kwi = unicode_to_kwi(code_point);
  return (kwi == NULL) ? unicode_to_hex(code_point) : kwi->name;
}

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

char *unicode_to_aekw(unicode code_point){
  struct keyword_information *kwi;
  static char ascext[2];
  if (code_point <= 0x7F) {
    ascext[0] = (unsigned char) code_point;
    ascext[1] = 0;
    return ascext;
  };
  kwi = unicode_to_kwi(code_point);
  if (kwi == NULL) return unicode_to_hex(code_point);
  else if (kwi->uni != code_point) {
    error_top();
    FPRINTF(stderr,
	    "internal error unicode_to_aekw code mismatch, code_point=%06x, kwi->uni=%06x",
	    code_point, kwi->uni);
    EXIT(41);
    return "";}
  else if (kwi->ech>0) {
    ascext[0] = (unsigned char) kwi->ech;
    ascext[1] = 0;
    return ascext;
  }
  else return kwi->name;
}

/* 
--------------
unicode_to_kwa
--------------
Convert unicode code point to ascii string which is either a single character
(if < 128) a percent named keyword or a percent hex code.
*/ 

char *unicode_to_kwa(unicode code_point){
  static char ascii[2];
  if (code_point <= 0x7F) {
    ascii[0] = (unsigned char) code_point;
    ascii[1] = 0;
    return ascii;
  }
  else return unicode_to_kw (code_point);
}
 
/*
----------------
code_line_to_ext
----------------
This procedure takes a line of input which has been translated into unicode
code points into the ProofPower extended character set.
The source and destination are buffers in a file_data parameter.
*/

void code_line_to_ext(struct file_data *file_F){
  int op=0;
  unicode *codes;
  char *line, *r;
  codes = file_F->code_line;
  line = file_F->cur_line;
  while (*codes !=0 && op < MAX_LINE_LEN){
    r = unicode_to_aekw(*codes);
    while (*r !=0 && op < MAX_LINE_LEN) {
      *line = *r;
      line++;
      r++;
    };
    codes++;
  };
  *line = 0;
};

/*
------------------
code_line_to_ascii
------------------
This procedure takes a line of input which has been translated into unicode
code points into the ascii character set.
The source and destination are buffers in a file_data parameter.
*/

void code_line_to_ascii(struct file_data *file_F){
  int op=0;
  unicode *codes;
  char *line;
  codes = file_F->code_line;
  line = file_F->cur_line;
  while (*codes !=0 && op < MAX_LINE_LEN){
    const char *r;
    r = unicode_to_kwa(*codes);
    while (*r !=0 && op < MAX_LINE_LEN) {
      *line = *r;
      line++;
      r++;
    };
    codes++;
  };
  *line = 0;
};

/* This function is used to report an error in a utf8 input stream.
   It also skips to the next newline or to EOF.  */

unicode invalid_unicode(void)
{
	int whatgot;
	FPRINTF(stderr, "%s: line %d: invalid utf-8 input\n", program_name, line);
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


/*
------------------
extract_code_point
------------------

Read a single unicode code point from a buffer in utf8.
The parameters are the address of the buffer and a pointer to a displacement,
which will be updated to point after the unicode character provided that
there is valid utf8 encoded unicode character at that point.

The value returned is the unicode code point or else zero.
*/

 unicode extract_code_point(char *buff, int *pos){
   int r, l;
   int whatgot = buff[(*pos)++];
   
   r = whatgot & 0xff;

   if(r <= 0x7f) { return r; };
   l = 0;
   while(r & 0x80) {
     r = (r & 0x7f) << 1;
     l += 1;
   };
   if(l > 4) { message1("extract_code_point 3 l>4"); return invalid_unicode(); };
   r = r >> l;
   while(--l) {
     whatgot = buff[(*pos)++];
     if((whatgot & 0xc0) != 0x80) {
       return invalid_unicode();
     };
     r = (r << 6) | (whatgot & 0x3f);
   };
   return r;
 }

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
*/

int utf8_line_to_codes(char line[], unicode codes[]){
  int ip = 0;
  int op = 0;
  unicode code = 0;
  codes[op]=1;
  while(ip < MAX_LINE_LEN && line[ip] != 0){
    code = extract_code_point(line, &ip);
    if (code > 0) codes[op++] = code;
    else {return invalid_unicode();}
  };
  codes[op++]=0;
  return op;
};


/*
--------------------
read_utf8_as_unicode
--------------------
Read a line into file_F.cur_line, then transcribe
from utf8 to unicode code points.
*/

int read_utf8_as_unicode(struct file_data *file_F){
  int r;
  r = simple_read_line(file_F->cur_line, MAX_LINE_LEN, file_F);
  if (r){
    utf8_line_to_codes(file_F->cur_line, file_F->code_line);    
  };
  return r;
};

/*
----------------
read_line_as_ext
----------------
Reads a line into a the file cur_line buffer, and then,
if the file is flagged as utf8, converts from utf8 to
the ProofPower extended character encoding.

If the utf8 flag is set in the file_data, the line is read first as
utf8 characters into cur_line, then decoded into unicode code points 
into file_data.code_line and is then translated back
into cur_line using ProofPower extended character set where possible,
then named percent keywords, then hexadecimal percent keywords as a
last resort.

If the file is not in utf8, the line as read is returned, no translation
from keywords to ext chars is undertaken. 
*/

int read_line_as_ext(struct file_data *file_F){
  int r = True;
  if (file_F->utf8){
    if ((r = read_utf8_as_unicode(file_F))){code_line_to_ext(file_F);}
    else {return r;};    
  }
  else {r = simple_read_line(file_F->cur_line, MAX_LINE_LEN, file_F);};
  return r;
};


/*
----------------------
output_unicode_as_utf8
----------------------
(like do_keyword except that if you give it ascii it outputs it)
This procedure writes to a file a utf8 coded unicode code point,
returning the value True, unless it is greater than 0x10FFFF,
in which case it returns False without output.
*/ 

bool output_unicode_as_utf8(unicode u, FILE *file)
{
	if(u <= 0x7f) {
	  fputc(u, file);
	  return True;
	} else if (u <= 0x7ff) {
	  fputc(0xc0u | (u >> 6u), file);
	  fputc(0x80u | (u & 0x3fu), file);
		return True;
	} else if (u <= 0xffff) {
		fputc(0xe0u | (u >> 12u), file);
		fputc(0x80u | ((u & 0xfc0u) >> 6u), file);
		fputc(0x80u | (u & 0x3fu), file);
		return True;
	} else if (u <= 0x10ffffu) {
		fputc(0xf0u | (u >> 18u), file);
		fputc(0x80u | ((u & 0x3f000u) >> 12u), file);
		fputc(0x80u | ((u & 0xfc0u) >> 6u), file);
		fputc(0x80u | (u & 0x3fu), file);
		return True;
	} else {
		return False;
	}
}

/*
-----------------------
output_unicode_sequence
-----------------------
Outputs to a file in utf8 a zero terminated sequence of unicode code points.
*/

void output_unicode_sequence(unicode *line, FILE *file){
  unicode *p;
  p = line;
  while (*p != 0){
    output_unicode_as_utf8(*p, file);
    p++;
  };
  putc('\n', file);
}

/*
-------------------
named_kw_to_unicode
-------------------
Takes a string of characters beginning with a percent enclosed keyword
name and returns the unicode code point associated with that keyword
in the current keyword file(s), also setting a parameter to the length
of the keyword (inluding percents).
*/

unicode named_kw_to_unicode(char *line, int *len){
  unicode val;
  int kw_index;
  kw_index = get_hol_kw(line, len, False, &dummy_F);
  if (kw_index == NOT_FOUND){*len=0; return NOT_FOUND;}; 
  val = kwi.keyword[kw_index].uni;
  return val;
}

/*
-------------
kw_to_unicode
-------------
Takes a string of characters which is coded in the extended ascii,
admitting percent enclosed keyword names or hexadecimal unicode codes,
and sets a unicode parameter to the unicode code point corresponding
to a named percent keyword if that keyword appears enclosed in percents
at the beginning of the string, setting a parameter to the length of the
percent enclosed name.
*/

unicode kw_to_unicode(char *line, int *len){
  unicode val;
  val = percent_hex_to_unicode(line, len);
  if (*len>0) return val;
  val = named_kw_to_unicode(line, len);
  if (*len>0) return val;
  return U_NOT_FOUND;
}

/*
--------------
ext_to_unicode
--------------
*/

unicode ext_to_unicode(unsigned char ch){
  struct keyword_information *ki = kwi.char_code[ch];
  if (ki == NULL) {
    message1("unknown ext code in input file");
    return NOT_FOUND;
  }
  else {
    if (ki->uni == ch) (void)fputs("Warning: use of unassigned ext character code.\n", stderr);
    return ki->uni;
  };
};

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
  
unicode ext_or_kw_to_unicode(char *line, int *len){
  unicode val;
  *len = 0;
  if (line[0] != '%'){
    if (line[0] == 0) return U_NOT_FOUND; 
    *len = 1;
    if (line[0] & 0x80) return (ext_to_unicode(*line));
    else return line[0];
  };
  val = kw_to_unicode(line, len);
  if (*len == 0) *len = 1; /* a percent not followed by a keyword */
  return val;
}

/*
--------------------------
ext_seq_to_unicode
--------------------------
Takes a null terminated string of characters which are either ascii,
or ProofPower extended characters and converts them to a null terminated
array of unicode code points. 
*/

void ext_seq_to_unicode(char *line, unicode codes[]){
  int ip = 0, op = 0, len = 0;
  unicode res;
  while (line[ip] != 0){
    res = (line[ip] & 0x80) ? ext_to_unicode(line[ip]) : line[ip];
    if (res == U_NOT_FOUND){
	ip++;
      }
    else {
      codes[op] = res; 
      ip++;
      op++;}
  };
  codes[op] = 0;
}
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

void ext_kw_seq_to_unicode(char *line, unicode codes[]){
  int ip = 0, op = 0, len = 0;
  unicode res;
  while (line[ip] != 0){
    res = ext_or_kw_to_unicode(line+ip, &len);
    if (res == U_NOT_FOUND)
      while(len-- >0) {
	codes[op++] = line[ip++];
      }
    else {
      codes[op] = res; 
      ip += len;
      op++;}
  };
  codes[op] = 0;
}

/*
------------------
read_line_as_ascii
------------------
Reads a line into the file cur_line buffer, and then,
if the file is flagged as utf8, convert from utf8 to
ascii, using % keywords where necessary.

If the utf8 flag is set in the file_data, the line is read first as
utf8 characters into cur_line, then decoded into unicode code points 
into file_data.code_line and is then translated back
into cur_line using named percent keywords, then hexadecimal percent keywords as a
last resort.

If the file is not in utf8, it is read as ext and then converted to unicode
and finally translated to ascii. 
*/

int read_line_as_ascii(struct file_data *file_F){
  int r = True;
  if (file_F->utf8){
    if ((r = read_utf8_as_unicode(file_F))){
      code_line_to_ascii(file_F);}
    else {return r;};    
  }
  else {
    r = simple_read_line(file_F->cur_line, MAX_LINE_LEN, file_F);
    ext_kw_seq_to_unicode(file_F->cur_line, file_F->code_line);
    code_line_to_ascii(file_F);
  };
  return r;
};

/*
------------------
output_ext_as_utf8
------------------
*/

void output_ext_as_utf8(char *line, FILE *file_F){
  static unicode codes[MAX_LINE_LEN+1];
  ext_seq_to_unicode(line, codes);
  output_unicode_sequence(codes, file_F);
};

/*
---------------------
output_ext_kw_as_utf8
---------------------
*/

void output_ext_kw_as_utf8(char *line, FILE *file_F){
  static unicode codes[MAX_LINE_LEN+1];
  ext_kw_seq_to_unicode(line, codes);
  output_unicode_sequence(codes, file_F);
};

/*
---------------------------
transcribe_file_nkw_to_utf8
---------------------------
This procedure transcribes data from an input stream which is taken
to be in the ProofPower extended ascii character set to an output
stream which is unicode as utf8.

The input stream is to be supplied as a "file_data*", but the output
stream as FILE*.

This version will only translate ext codes, not keywords or literal code points.
*/

void
transcribe_file_nkw_to_utf8(struct file_data *input_F, FILE *output_F){
  int r;
  while (!feof(input_F->fp)) {
    r=read_line_as_ext(input_F);
    if(!(feof(input_F->fp) && r==0))
      output_ext_as_utf8(input_F->cur_line, output_F);
  };
  return;
}
/*
-----------------------
transcribe_file_to_utf8
-----------------------
This procedure transcribes data from an input stream which is taken
to be in the ProofPower extended ascii character set to an output
stream which is unicode as utf8.

The input stream is to be supplied as a "file_data*", but the output
stream as FILE*, and may contain named keywords or numeric code points
which will be transformed.
*/

void
transcribe_file_to_utf8(struct file_data *input_F, FILE *output_F){
  int r;
  while (!feof(input_F->fp)) {
    r=read_line_as_ext(input_F);
    if(!(feof(input_F->fp) && r==0)){
      output_ext_kw_as_utf8(input_F->cur_line, output_F);};
  };
  return;
}

/*
----------------------
transcribe_file_to_ext
----------------------
This procedure transcribes data from a utf8 encoded unicoden input stream,
 to an output stream using the ProofPower extended character set.

The input stream is to be supplied as a "file_data*", but the output
stream as FILE*.
*/

void
transcribe_file_to_ext(struct file_data *input_F, FILE *output_F){
  int r;
  while (!feof(input_F->fp)) {
    r=read_line_as_ext(input_F);
    if(!(feof(input_F->fp) && r==0)){
      FPRINTF(output_F, "%s\n", input_F->cur_line);};
    if (debug) fflush(NULL);
  };
  return;
}
/*
------------------------
transcribe_file_to_ascii
------------------------
This procedure transscribes data from an input stream to an output
stream which is in ascii, using percent keywords or hex codes for
non-ascii characters.

The input stream is to be supplied as a "file_data*", and may therefore
be either utf8 or ascii/ext but the output stream as FILE* and will be ascii.
*/

void
transcribe_file_to_ascii(struct file_data *input_F, FILE *output_F){
  int r;
  while (!feof(input_F->fp)) {
    r=read_line_as_ascii(input_F);
    if(!(feof(input_F->fp) && r==0)){
      FPRINTF(output_F, "%s\n", input_F->cur_line);};
  };
  return;
}

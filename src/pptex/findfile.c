/* From: imp096.doc   @(#) 94/04/06 1.3 imp096.doc

*/
#define FPRINTF (void)fprintf
#define PRINTF (void)printf
#define PUTC (void)putc
/*
*/
#include <pwd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/param.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <regex.h>
#include "utf8module.h"
#ifndef SIEVE_PROG
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
*/


#ifndef NO_FINDFILE_MAIN
char *coprlemma1_ff =
#ifdef VERSION
	VERSION
#else
	"XXX.YYYwZZZ"
#endif
     " Copyright Lemma 1 Ltd.";
extern char *find_file(char *name, char *dirs, int is_reg);
#include<stdio.h>
void	exit(int status);

int
main(int argc, char **argv)
{
	int ind;
	char *ans;
	char *name;
	char * program_name = argv[0];

	if(argc < 3) {
		FPRINTF(stderr,
			"usage: %s (name path ... | -r name ...)\n",
					program_name);
		FPRINTF(stderr, "%s version: %s\n", program_name, coprlemma1_ff);
		exit(2);
	}
	name = *(argv+1);
	if(!strcmp(name, "-r")) {
		char *real_name;
		for(ind = 2; ind < argc; ++ind) {
			name = tilde_expand(*(argv+ind));
			real_name = get_real_name(name);
			if(real_name) {
				if(file_exists(real_name, 0)) {
					(void)printf("%s\n", real_name);
				} else {
					(void)printf("%s\n", name);
					exit(1);
				}
			} else {
				(void)printf("%s\n", name);
				exit(1);
			}
			free(real_name);
			free(name);
		}
		exit(0);
	}
	if(!strcmp(name, "--")) {
		if(argc < 4) {
			FPRINTF(stderr,
			"usage: %s (name path ... | -r name ...)\n",
					program_name);
			FPRINTF(stderr, "%s version: %s\n", program_name, coprlemma1_ff);
			exit(2);
		}
		name = *(argv+2);
		ind = 3;
	} else {
		ind = 2;
	}
	for(ans = NULL; ind < argc && ans == NULL; ++ind) {
		ans = find_file(name, *(argv+ind), 1);
	}
	if(ans == NULL) ans = name;

	(void)printf("%s\n", ans);
	return ! file_exists(ans, 1);

}

#endif
#endif
/*
*/


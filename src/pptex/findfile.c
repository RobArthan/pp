/* Originally from: imp096.doc but now maintained as findfile.c,
with the main functionality shared with sieve pp_file_conv and xpp through
utf8module.c

Program findfile basically just calls the {\tt find_file} function (in utf8module).
For greater generality it allows more than one path argument and searches them
in turn until the file name is found.

A common idiom of use from within a shell script will be

\begin{verbatim}
        sed -f `findfile sedscript $PATH $0`
\end{verbatim}
*/

#define FPRINTF (void)fprintf
#define PRINTF (void)printf
#define PUTC (void)putc

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

/*
====
main
====
There are two usages for two somewhat separate functions:

With no options, the first command line argument is taken as the name of a file to be sought in the list
of search options given by the remaining arguments (of which there must be at least one),
the file name is printed on standard output (or just the original argument if not found) and
the result code is set to 0 if the resulting file exists.

With the ``{\tt -r}'' option, the remaining arguments are a list of file names and the output
is a list of lines each containing the result of recursively expanding any symbolic links in each file name.
If one of the resulting file names does not exist to
call {\tt stat} on it, then the unexpanded name is printed out and the program stops with result code set to 1.

A ``{\tt --}'' option may be supplied to indicate that the next argument (typically, ``{\tt -r}'') is to
be interpreted as a name not an option.

In the above, a file is taken to exist if it exists as a regular file (or a symbolic link to a regular
file) and the user has enough access
to read its file attributes and it is not a broken symbolic link.
*/

char *coprlemma1_ff =
#ifdef VERSION
	VERSION
#else
	"XXX.YYYwZZZ"
#endif
     " Copyright Lemma 1 Ltd.";

extern char *find_file(char *name, char *dirs, int is_reg);

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


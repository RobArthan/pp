#ifndef UTF8MODULE
#define UTF8MODULE

typedef int unicode;
typedef struct {
	unicode code_point;
	char pp_char;} unicode_to_pp_entry;
#define UNICODE_TO_PP_LEN 128
unicode_to_pp_entry unicode_to_pp [UNICODE_TO_PP_LEN];

/* String Utilities */
char * skip_space(char *str);
char * find_space(char *str);
void string_n_copy(char *dest, char *source, int n);
char * split_at_space(char *str);
int str_match(char *prefix, char *str);

/* find file */
char * tilde_expand(char *name);
int file_exists(char *name, int is_reg);
int is_sym_link(char *name);
int is_dir(char *name);
void split_file_name(char *name, char **dir, char **base);
char * read_link(char *name);
char * get_real_name (char * name);

void EXIT(int n);
void error_top(void);
void error1(char *msg);
void error(char *fmt, char *msg);
void internal_error(char *fmt, char *msg);
void print_unix_error1(int eno);
void unix_error1(char *msg);
void unix_error(char *fmt, char *msg);
void *malloc_and_check(unsigned size, int err);
int unicode_to_pp_entry_cmp(const void *buf1, const void *buf2);
const char *unicode_to_kw(unicode code_point);
const char *unicode2ppk(unicode cp);
unicode invalid_unicode(void);
unicode get_code_point(void);
const char unicode2pp(unicode cp);

void do_unicode_to_pp(void);
void do_pp_to_unicode(void);

#define MAX_KEYWORDS 4000
#define MAX_KW_LEN 50
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
	char *name;		/* The keyword */
	char *macro;		/* Equivalent macro, or NULL */
	regex_t *tex_arg;	/* R.E. defining the TeX argument of this keyword, if non-null */
	char tex_arg_sense;	/* How to interpret the R.E. */
#define KW_RE_MATCH 0		/* The argument must match the R.E. */
#define KW_RE_DELIMITER 1	/* The argument is delimited by something that matches the R.E. */
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
void add_new_keyword(
	char *name,
	unicode uni,
	int kind,
	char *macro,
	regex_t * tex_arg,
	char tex_arg_sense);
int find_keyword(char *kw);
void show_kw_kind(int kind);
void show_one_keyword(struct keyword_information *ki);
void show_one_indexed_keyword(int kwindex);
void show_keywords(void);
int compare_keyword_information(const void *vp1, const void *vp2);
void initialise_keyword_information(void);
char *find_steering_file(char *name, char *file_type);

#define MAX_LINE_LEN 1024
struct file_data{
	char *name;
	char *file_name;
	int line_no;
	int grumbles;
	FILE *fp;
	char cur_line[MAX_LINE_LEN+1];
};
extern struct file_data keyword_F;
int read_line(char *line, int max, struct file_data *file_F);
void read_keyword_file(char *name);
void conclude_keywordfile(void);

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

extern char *program_name;
extern int debug;

void
grumble1(char *msg,
	struct file_data *file_F,
	int show_line);

void
grumble(char *fmt,
	char *msg,
	struct file_data *file_F,
	int show_line);
void message1(char *msg);
void message(char *fmt, char *msg);
int get_hol_kw(char *str,
	int * len,
	int warn,
	struct file_data *file_F);
extern unsigned char character_flags[256];
typedef char bool;
enum {False = 0, True = 1};

#define bool short
#define true 1
#define false 0

#endif

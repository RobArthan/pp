#
# ucdnames.sh generates ucdnames.h from the the Unicode Character Database:
# http://www.unicode.org/Public/zipped/11.0.0/
# Uses an awk script to extract a list of codepoint/name pairs from
# from the file UnicodeData.txt
#
# Rob Arthan rda@lemma-one.com
# 4th February 2019
#
cat > ucdnames.h <<++++
/* **** **** **** **** **** **** **** **** **** **** **** **** ****
 * This file is generated from the Unicode Character Database:
 * http://www.unicode.org/Public/zipped/11.0.0/
 **** **** **** **** **** **** **** **** **** **** **** **** **** */
typedef struct {
	wchar_t	codepoint;
	char	*name;
} ucd_name;
static ucd_name ucd_names[]  = {
++++
awk -F ';' < UnicodeData.txt '
	BEGIN {
		started = 0
	}
	{
		if (started) {
			printf ",\n"
		}
		started = 1
		if( substr($2, 1, 1) != "<" || $11 == "" ) {
			printf "\t{0x%s,\t\"%s\"}", $1, $2
		} else {
			printf "\t{0x%s,\t\"%s %s\"}", $1, $2, $11
		}
	}
	END	{
		printf "\n"
	}
' >> ucdnames.h
cat >> ucdnames.h <<++++
};
++++

#
# ucdnames.sh generates ucdnames.h from the NamesList.txt supplied with
# the Unicode Character Database:
# http://www.unicode.org/Public/zipped/11.0.0/
#
cat > ucdnames.h <<++++
/* **** **** **** **** **** **** **** **** **** **** **** **** ****
 * This file is generated from the file NamesList.txt supplied with
 * the Unicode Character Database
 *
 * Rob Arthan rda@lemma-one.com
 * 4th February 2019
 **** **** **** **** **** **** **** **** **** **** **** **** **** */
typedef struct {
	wchar_t	code_point;
	char	*name;
} ucd_name;
static ucd_name ucd_names[]  = {
++++
sed -n -e '/^[0-9A-Faa-f]/p' <NamesList.txt | \
sed -e '{
	1,$s/\(.*\)	\(.*\)/	{0x\1,	"\2"},/
	$s/,$//
}' >> ucdnames.h
cat >> ucdnames.h <<++++
};
++++

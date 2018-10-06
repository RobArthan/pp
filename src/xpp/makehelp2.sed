#
# sed commands to generate help.h from help.c
#
1i\
/*\
 * Help include file for the ProofPower X/Motif Interface.\
 * This file is automatically created by makehelp.sh from help.txt.\
 * Do not edit.\
 * Copyright  (C) Lemma 1 Ltd. 2000-$YEAR\
 */
/^const/s/ =/;/
/^const/s/^/extern /p

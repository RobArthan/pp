ex <<\!
r ! nroff -ms help.txt 
1,/^\*/-1d
/^\*\* END/,$d
%s/ *$//
g/^\*/s/^* *//|s/.*/* &\
&/
v/^*/s/^/"/|s/$/\\n"/
g/^\*/s/^\* *//|s/ /_/g|s/^/;\
const String Help_/|s/$/ =/
1d
$s/$/;/
w help.h
q
!

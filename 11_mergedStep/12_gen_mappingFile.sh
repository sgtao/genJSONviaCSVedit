#!/bin/sh
# 12_gen_mappingFile.sh
#
head_str='split("\\n")| map(split(",")) | map(';
tail_str=')'
#
# main routine
#
echo $head_str;
#
jq -r . $1 | \
awk '/BEGIN/ { idx = 0 } { if ( (index($NF,"{") == 0 ) && (index($NF,"}") == 0) && (index($NF,"[") == 0 ) && (index($NF,"]") == 0 )) { if ( index($2,",") != 0) { printf "%s .[%s],\n",$1,idx; } else { printf "%s .[%s]\n",$1,idx; }; idx++;} else { print $0 } }'  | \
sed -e"s/\[\]/\[0\]/"
#
echo $tail_str
#
# EOF
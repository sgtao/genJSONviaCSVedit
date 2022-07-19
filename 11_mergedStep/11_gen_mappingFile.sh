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
gawk -f 11_gen_mappingFile.awk | \
sed -e"s/\[\]/\[0\]/"
#
echo $tail_str
#
# EOF
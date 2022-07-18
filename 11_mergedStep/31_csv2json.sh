#!/bin/sh
# 31_csv2json.sh
#
csv2json() {
  # arg[0] : mapping jq file
  # arg[1] : csv file
  jq -R -s -f $1 $2;
}
#
# main routine
csv2json $1 $2;
#
# EOF
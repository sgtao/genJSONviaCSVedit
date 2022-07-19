#!/bin/sh
# 11_jsonItem_to_csv.sh
#
# main routine
jq --raw-output -rf json2csv.jq $1
#
#

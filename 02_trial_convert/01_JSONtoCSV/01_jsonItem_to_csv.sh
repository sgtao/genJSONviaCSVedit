#!/bin/sh
# 01_jsonItem_to_csv.sh
# 
# 
convert_jsonItem2csv() {
  jsonfile=$1;
  jq -c -r "  def walk(k): k as $k | to_entries |  .[] |  {key: ($k + .key), value: .value} |  .key as $key | ( select(.value | type | .=="string" or .=="number") // (.value | walk($key + ".")) );  walk("") | [.key, .value] | @csv " $jsonfile
}
#
# main routine
# convert_jsonItem2csv $1;
  # jq --raw-output 'def walk(k): k as $k | to_entries |  .[] |  {key: ($k + .key), value: .value} |  .key as $key | ( select(.value | type | .=="string" or .=="number") // (.value | walk($key + ".")) );  walk("") | [.key, .value] | @csv ' $1
jq --raw-output -rf json2csv.jq $1

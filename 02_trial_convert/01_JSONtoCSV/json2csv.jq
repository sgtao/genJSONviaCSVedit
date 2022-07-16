def walk(k): 
  k as $k |  # 引数を$kで扱う
  to_entries | 
  .[] | 
  { key: ($k + .key), value: .value} | 
  .key as $key | 
  (select(.value | type | .== "string" or.== "number") // (
    .value | 
    walk($key + "."))
  ); 
walk("") | [.key, .value] | @csv
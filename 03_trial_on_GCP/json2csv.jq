def arr2obj(k): k as $k | 
    to_entries | .[0] | 
    {} as $array |
    .key as $key | .value as $value |
    ({ "_item": $value }) as $item | 
    { "_array" : $item } |  ( $array + . ) as $array |
    $array ;
def walk(k): k as $k | 
    to_entries | 
    .[] | 
    {key: ($k + .key), value: .value} | 
    .key as $key | 
    select( .value | type | .=="string" or .=="number" or .=="boolean" ) // (
        .value | 
        select( .value | type | .=="array" ) // (
            walk( arr2obj(".") ) | 
            walk($key + ".")
        )
    ) ; 
walk("") |
[ .key, .value ] | 
@csv
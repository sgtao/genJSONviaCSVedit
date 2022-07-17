def arr2obj(k): k as $k | 
    to_entries | .[0] | 
    {} as $array |
    .key as $key | .value as $value |
    ({ "_item": $value }) as $item | 
    { "_array" : $item } |  ( $array + . ) as $array |
    $array;
arr2obj(.)
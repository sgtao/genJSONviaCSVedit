def arr2obj(v): 
    to_entries | .[0] | 
    .key as $key | .value as $value |
    { key: "_arrayItem0", value: $value } |
    [.] |
    from_entries
    ; 
arr2obj("")
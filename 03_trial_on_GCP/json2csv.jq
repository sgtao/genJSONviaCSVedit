def walk(k): k as $k | 
        to_entries | 
        .[] | 
        {key: ($k + .key), value: .value} | 
        .key as $key | 
        ( select(.value | type | .=="string" or .=="number" or .=="boolean" ) // (
            .value | 
            walk($key + ".")
        ) ); 
walk("") |
[ .key, .value ] | 
@csv
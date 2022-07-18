def walk(k): k as $k
    | to_entries
    | .[]
    | { key: ($k + .key), value: .value}
    | .key as $key
    | if (.value | type | .== "array" ) then ( . 
        | .value 
        | .[]  
        | walk($key + "._arrayItem" + ".") 
    )
    else .
      | select(.value | type | .== "string" or .== "number" or .== "boolean") // (
            .value 
            | walk($key + ".")
      )
    end
    ;
walk("")
| [.key, .value] 
| @csv
def walk(k): k as $k
    | to_entries
    | .[]
    | { key: ($k + .key), value: .value}
    | .key as $key
    | if (.value | type | .== "array" ) then ( . 
        | .value 
        | to_entries
        | .[]
        | .key as $itemNo 
        | .value
        | if ( type | .== "string" or .== "number" or .== "boolean" ) then 
            { key: "\( $key )._arrayItem\( $itemNo )", value: . }
          else .
            | walk($key + "._arrayItem\( $itemNo )" + ".") 
          end
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
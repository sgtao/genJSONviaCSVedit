to_entries | .[] |
.key as $key | .value as $value |
( { "_item" : $value } ) as $items | 
{ "_array": $items }


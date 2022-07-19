/BEGIN/ { idx = 0 } 
{ if ( (index($NF,"{") == 0 ) && (index($NF,"}") == 0) && (index($NF,"[") == 0 ) && (index($NF,"]") == 0 )) { if ( index($2,",") != 0) { printf "%s .[%s],\n",$1,idx; } else { printf "%s .[%s]\n",$1,idx; }; idx++;} else { print $0 } }

#!/bin/bash
#-------------------------
#------ Bash loops  ------
#-------------------------
for i in "${ARRAY[@]}"; do
    echo -e "ELEM: $i"
    # Check if 
    if [[ "$i" == "str" ]] then
      echo -e "STR: $i"
    fi
    # Check if 
    if [[ "$i" == "str2" ]] then
      echo -e "STR2: $i"
    fi
done
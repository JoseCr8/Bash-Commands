#!/bin/bash
#------------------------------------------
#-------- Bash conditional commands -------
#------------------------------------------
# z option might not work depends on the version
if printf '%s\0' "${myarray[@]}" | grep -Fxqz -- 'myvalue'; then
    # ...
fi
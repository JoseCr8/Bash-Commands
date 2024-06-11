#!/bin/bash
#--------------------------------------
#-------- Bash logging commands -------
#--------------------------------------

# Colors
LBLUE='\033[1;34m' # Light Blue
RED='\033[0;31m' # Red
NC='\033[0m' # No Color

# For users
echo -e "${LBLUE}myscript-[INFO]:${NC} message"
printf "${LBLUE}myscript-[INFO]:${NC} message\n"


# sys log files

# syslog
logger -p syslog.info "message" ${PAYLOAD}
logger -p syslog.err "message" ${PAYLOAD}
logger -p syslog.debug "message" ${PAYLOAD}
logger -p syslog.warning "message" ${PAYLOAD}

	
# local(0-7?)
logger -p local5.info "message" ${PAYLOAD}
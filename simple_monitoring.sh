#!/bin/bash

# ports
ports="22 25 80"

# name of service
service="SSH SMTP WEB"

# mail to admin
mail="root@localhost"

NETSTAT="/bin/netstat"
MAIL="/bin/mail"
LOGGER="/usr/bin/logger"
ID="/usr/bin/id"

# counters

c=1
status=""
senmail=0

logtosyslog=0

LOG="/tmp/services.log.$$"

# log message

log () {
	echo "$@"
	echo "$@" >> $LOG
}

# log message

die() {
	echo "$@"
	exit 999
}

#Checking for root

is_root() {
	local id="$($ID -u)"
	[ "$id" -ne 0 ] && die "You must be root"
}

init_script(){
	[ ! -x $MAIL ] && die "$MAIL command not found."
	[ ! -x $NETSTAT ] && die "$NETSTAT command not found."
	[ ! -x $LOGGER ] && die "$LOGGER command not found."
	[ ! -x $ID ] && die "$ID command not found."
	is_root
	>$LOG
}

chk_services () {
	log "---------------------------------------------"
	log "Running service status @ $(hostname) [ $(date) ]"
	log "---------------------------------------------"

	RPORTS=$($NETSTAT -tulpn -A inet | grep -vE '^Active|Proto' | grep 'LISTEN' | awk '{ print $4}' | cut -d: -f2 | sed '/^$/d' | sort -u)
	for t in $ports
	do
	sname=$(echo $service | cut -d' ' -f$c)
		echo -en " $sname\t\t\t : "
		echo -en " $sname\t\t\t : " >> $LOG
		for r in $RPORTS
		do
			if [ "$r" == "$t" ]
			then
				status="YES"	
				sendmail=1
				break
			fi
		done
		echo -n "$status"
		echo ""
		echo -n "$status" >>$LOG
		echo "" >>$LOG
		# Log to a syslog /var/log/messages?
		# This is useful if you have a dedicated syslog server
		[ $logtosyslog -eq 1  ] && $LOGGER "$sname service running : $status"
 
		# Update counters for next round
		c=$( expr $c + 1 )
		status="NO"
	done
}

init_script
chk_services

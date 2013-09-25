#!/bin/bash

USER="root"
PASS="afrja12"
HOST="localhost"

RESTART="service mysqld restart"
MADMIN="$(which mysqladmin)"

$MADMIN -h $HOST -u $USER -p$PASS ping 2>/dev/null 1>/dev/null

if [ $? -ne 0 ]; then
	echo "Error MySQL Server not running"
	$RESTART
	r=$(ps cax | grep -c 'mysqld$')
	if [ $r -eq 1 ]; then
	echo "MySQL restart success"
	else
	echo "Failed to restart MySQL"
	fi
else echo "It's OK, MySQL running"
 	
fi

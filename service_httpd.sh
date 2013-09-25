#!/bin/bash

RESTART="service httpd restart"

PGREP="/usr/bin/pgrep"
HTTPD="httpd"

$PGREP {httpd}

if [ $? -ne 0 ]
then
	echo "Service httpd restart"
        $RESTART
	else 
	echo "HTTPD is running"
fi

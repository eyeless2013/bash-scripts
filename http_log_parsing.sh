#!/bin/bash

FILE="/var/log/nginx/access.log"

if [ ! -f $FILE ]
	then
	echo "Check your path to $FILE"
	exit 1
	else
	echo "Let's start parsing"
fi

echo "This is simple "

#!/bin/bash

GREP="$(which grep)"
AWK="$(which awk)"
ID="$(which id)"
LOG="/root/nopass"

#if [ ("$ID" -u) -ne 0 ]
# then
#	echo "Man, you must be a root! Bye!"
#	exit 1
#fi

echo "______________________________________"
echo "Host: $(hostname), Run date: $(date)" >> $LOG
echo "______________________________________"

USERS="$(cut -d: -f 1 /etc/passwd)"

echo "Searching for null passwords account"
echo " "

for u in $USERS
do
	passwd -S $u | $GREP -Ew "NP" >/dev/null
	if [ $? -eq 0 ]
	then
	echo "$u" 
	fi
done

#echo "See your $LOG file"

exit 0

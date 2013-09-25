#!/bin/bash

echo "Hello, this script is back-up mysql databases with mysqldump"
echo " "

USER="root"
PASS="afrja12"
HOST="localhost"


MYSQL="$(which mysql)"
MYSQLDUMP="$(which mysqldump)"
GZIP="$(which gzip)"

#DEST="/backup/mysql"

DATE="$(date +"%d-%m-%Y"+"%T")"

DBS=""
#EXCEPT="information_schema perfomance_schema"

echo "Enter destination directory for back-up:"
read DEST
echo " "

if [ ! -d $DEST ]
then
        mkdir -p $DEST
fi


echo "List of Databases"
echo " "
DBS="$($MYSQL -u $USER -p$PASS -Bse 'show databases')"
echo $DBS

for db in $DBS
do
#	skipdb=-1
#	if [ $EXCEPT != "" ];
#	then
#	for i in $EXCEPT
#	do
#		[ "$db" == "$i" ] && skipdb=1 || :
#	done
#	fi
#	
#	if [ "$skipdb" == "-1" ]
#	then
	FILE="$DEST/$db.$DATE.gz"
        $MYSQLDUMP -u $USER -p$PASS --lock-all-tables $db | $GZIP -5 > $FILE
#	fi
done

echo "Complete"
exit 0

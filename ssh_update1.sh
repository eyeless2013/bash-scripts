#!bin/bash

hosts=(
	"ssh root@192.168.1.112 yum update -y"
	"ssh root@192.168.1.111 yum update -y"
	)

for h in "${hosts[@]}"
do
	$h
done

#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Usage:sh $0 [today|yesterday|days|logfile]"
	exit 1
fi

sh gen.sh $1

mysql -u nova -p'!QAZ3edc%TGB' -h mysql_slave ruooglenova < member.sql |grep -v "count"

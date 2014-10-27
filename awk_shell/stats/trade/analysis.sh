#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Usage:sh $0 [today|yesterday|days|logfile]"
	exit 1
fi

sh gen_success.sh $1
sh gen_failure.sh $1

mysql -u nova -p'!QAZ3edc%TGB' -h mysql_slave ruooglenova < trade_success.sql |grep -v "sand" >result_success.csv
mysql -u nova -p'!QAZ3edc%TGB' -h mysql_slave ruooglenova < trade_failure.sql |grep -v "sand" >result_failure.csv

echo "Success Trade:"
cat result_success.csv
echo "Failed Trade:"
cat result_failure.csv

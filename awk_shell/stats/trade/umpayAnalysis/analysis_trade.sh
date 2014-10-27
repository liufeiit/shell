#!/bin/bash

if [ $# -eq 0 ]; then
	sh gen_success.sh
	sh gen_failure.sh
	mysql -u nova -p'!QAZ3edc%TGB' -h mysql_slave ruooglenova < trade_today.sql 
	echo "All Done."
	exit 0
fi

if [ $1 -eq -1 ]; then
	sh gen_success.sh -1
	sh gen_failure.sh -1
	mysql -u nova -p'!QAZ3edc%TGB' -h mysql_slave ruooglenova < trade_yesterday.sql
	echo "All Done."
	exit 0
fi


echo "Will Generate 100 days ago data"
sh gen_success.sh $1
sh gen_failure.sh $1
mysql -u nova -p'!QAZ3edc%TGB' -h mysql_slave ruooglenova < trade_success.sql |grep -v "sand" > result_success.csv
mysql -u nova -p'!QAZ3edc%TGB' -h mysql_slave ruooglenova < trade_failure.sql |grep -v "sand" > result_failure.csv
echo "All Done."
exit 0


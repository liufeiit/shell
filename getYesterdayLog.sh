#!/bin/bash

cd ~/inbox/user_access

targetDir=/var/log/nova/

rsync -av app01:$targetDir/* original_log_from_servers/app01/
rsync -av app02:$targetDir/* original_log_from_servers/app02/
rsync -av app03:$targetDir/* original_log_from_servers/app03/

echo "Copy Finished..."

#sort local files
if [ $# -eq 0 ]; then
	yesterday=$(date -d yesterday +%Y-%m-%d)
	today=$(date +%Y-%m-%d)
else

	if [ $# -eq 1 ]; then
		echo "Usage:$0 or Usage:2013-11-11 2013-11-12"
		exit 1;
	else
		yesterday=$1;
		today=$2;
	fi
fi
if [ -x "$yesterday.log" ]; then  
rm $yesterday.log
fi  


if [ "$yesterday"x = "2013-11-28"x ]; then
	sort original_log_from_servers/app01/$yesterday.log original_log_from_servers/ruoogle03/$yesterday.log original_log_from_servers/ruoogle03/$yesterday.log original_log_from_servers/ruoogle04/$yesterday.log original_log_from_servers/app02/$yesterday.log original_log_from_servers/app03/$yesterday.log >$yesterday.log
else
	sort original_log_from_servers/app01/$yesterday.log original_log_from_servers/app02/$yesterday.log original_log_from_servers/app03/$yesterday.log >$yesterday.log
fi

sed -i '1i  timestamp,userId,actionType,actionName,appType,accessIP,gender,inDateTime,outDateTime,usedTime,errorCode,vesion,servername' $yesterday.log

echo "Sort Finished... Generating reports..."

./runStatistics.sh $yesterday.log $today.log $yesterday

echo "Report generated...All done..."

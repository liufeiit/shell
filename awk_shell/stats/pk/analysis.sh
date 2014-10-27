#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Usage:sh $0 [today|yesterday|2014-10-10|days]"
	exit 1
fi

DIRPATH="../../user_access"
if [ $1 = "today" ];then
        DATE=`date +%Y-%m-%d`
        FILENAME=$DATE.log
elif [ $1 = "yesterday" ]; then

        DATE=`date -d "yesterday"  +%Y-%m-%d`
        FILENAME=$DATE.log
elif [ `echo $1|cut -c1-5` = "2014-" ]; then
        FILENAME=$1
else
        DATE=`date -d "$1 days"  +%Y-%m-%d`
        FILENAME=$DATE.log
fi

FILENAME=$DIRPATH/$FILENAME

awk -F "," '{
	if($4=="/user/chooseopponent"){
		choose++
	};
	if($4=="/user/acceptchallenge"){
		accept++
	};
	if($4=="/user/rejectchallenge"){
		reject++
}}END{
	print "choose accpet reject timeout";
	print choose, accept, reject, choose-accept-reject
}' $FILENAME


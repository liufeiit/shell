#!/bin/bash
#
# 用来分析缘分问题每天的回答人数,最高的回答次数,超过不能回答的报错人数
#
if [ $# -eq 0 ];then
	echo "Usage:sh $0 filename|today|yesterday|days"
	exit 1
fi

DIRPATH="../../user_access"
DATE=""
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
echo $FILENAME

awk -v date="$DATE" 'BEGIN{
	FS=",";
	moreUser=0;
	allmatched=0;
	errorLimit=0;
}
{
	if(match($4, "likeminded_matched") && $11==1000){
		allmatched++;
		aswu[$2]++;
		if(aswu[$2]>moreUser){
			moreUser=aswu[$2];
		}
	}
	if($11==-13008){
		errorLimit++;
	}
}
END{
	OFS=",";
	print date,allmatched,moreUser,errorLimit
}' $FILENAME


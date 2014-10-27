#!/bin/bash
#
# 用来分析女用户选择聊天频道的习惯
#
if [ $# -eq 0 ];then
	echo "Usage:sh $0 logFileName"
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
echo $FILENAME
awk -F"," '{if(match($4,"matchselect")){print $0}}' $FILENAME |awk -F "queue_channel=" '{print $2}' |awk -F "&" '{

		if($1==""){
			version170++
		}else{
			channel[$1]++;
			total++
		}
	}END{
		for(id in channel){
			printf("%d %d %d%% \n", id, channel[id],channel[id]/total*100)
		};
		printf("And there are %d times come from version 1.7.0\n",version170)
	}'

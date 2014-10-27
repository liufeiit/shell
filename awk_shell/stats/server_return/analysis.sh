#/bin/bash

if [ $# -eq 0 ];then
        echo "Usage:sh $0 [logFileName|today|yesterday|days]"
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

awk -F "," '{
	code[$11]++;
}END{
	for(c in code){
		print c, code[c]
	}
}' $FILENAME |sort -n -r -k2

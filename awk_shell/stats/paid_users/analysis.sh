#!/bin/bash

USERID_FILE=$2
USERID_STRING=`cat $USERID_FILE |xargs`

# 输入参数是从今天为止往前推的天数 

cp $USERID_FILE $USERID_FILE.bak
for i in $( seq $1 -1 1 ); do
	date=`date -d "-$i days" +%Y-%m-%d`	
	echo $date ..........
	result_date=`
	# 先统计用户的调用次数
	awk -F"," -v id_string="$USERID_STRING" 'BEGIN{
        	split(id_string, userid_array, " ")
	}{
        	user_calls_array[$2]++
	}END{
        	for (userid in userid_array){
			if(userid_array[userid] != "userid"){
               			printf("%d_%d\n", userid_array[userid], user_calls_array[userid_array[userid]])
			}
        	}
	}' ../../user_access/$date.log |xargs` 

	awk -F"," -v call_times="$result_date" -v date="$date" 'BEGIN{
		split(call_times,temp_result_array," ");
		for(temp in temp_result_array){
			split(temp_result_array[temp], user_times, "_");
			user[user_times[1]]=user_times[2]
		}
	}{
		if(NR==1){
			printf("%s,%s \n", $0, date)
		}else{
			printf("%s,%s \n", $0, user[$1])			
		}
	}' $USERID_FILE > tmp.tmp
	cp tmp.tmp $USERID_FILE
done

rm tmp.tmp

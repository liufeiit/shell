#!/bin/bash

rm question_3.result

today=$(date "+%Y-%m-%d")
i=0
while [ $i -le $1 ];do
date=$(date -d "$date -$i day" "+%Y-%m-%d")
awk -v day="$date" '
BEGIN{FS=","}
{
        if((match($4, "login")) || (match($4, "register"))){
                if($11 == 1000) {
                     users[$2]++;
                     if(user_last_time[$2] == 0) {
                        open_times[day]++;
                     } else if(($1 - user_last_time[$2]) > 60000) {
                        open_times[day]++;
                     }
                     user_last_time[$2]=$1;
                }
        }       
}
END{
        OFS=","
        for(u in users) {
            count++;
        }
        for(d in open_times) {

                print d, (open_times[d] / (count + 1.0))
        }
}
' /data/backup/user_access/${date}.log >> question_3.result
        i=$((i+1))
done

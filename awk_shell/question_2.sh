#!/bin/sh

rm question2.result

date=$(date -d "2014-$1" "+%Y-%m-%d")
today=$(date "+%Y-%m-%d")

i=0
echo "date, IOS, Android" >> question2.result

awk -v day="$date" '
BEGIN{FS=","}
{
        if($4=="/user/presentgift"){
                if($11 == 1000){
                        split($13, params, "&")

                        for(p in params) {

                                for(p1 in params){
                                        if(match(params[p1], "amount")) {
                                                split(params[p1], cv, "=");
                                                count = cv[2];
                                        }

                                 }

                                if(match(params[p], "gift_id")) {
                                        split(params[p], pv, "=");
                                        if($5==36272630) {
                                                if(pv[2]==1){IOS_Charm[day] += (count * 2)};
                                                if(pv[2]==2){IOS_Charm[day] += (count * 5)};
                                                if(pv[2]==3){IOS_Charm[day] += (count * 10)};
                                                if(pv[2]==4){IOS_Charm[day] += (count * 50)};
                                                if(pv[2]==5){IOS_Charm[day] += (count * 100)};
                                                if(pv[2]==6){IOS_Charm[day] += (count * 600)};
                                                if(pv[2]==7){IOS_Charm[day] += (count * 1500)};
                                                if(pv[2]==8){IOS_Charm[day] += (count * 3000)};
                                                if(pv[2]==9){IOS_Charm[day] += (count * 15000)};
                                                if(pv[2]==10){IOS_Charm[day] += (count * 60000)};
                                                if(pv[2]==11){IOS_Charm[day] += (count * 150000)};
                                                if(pv[2]==12){IOS_Charm[day] += (count * 300000)};
                                                if(pv[2]==15){IOS_Charm[day] += (count * 600)};
                                                if(pv[2]==16){IOS_Charm[day] += (count * 600)};
                                        }
					else if($5==30362726){
                                                if(pv[2]==1){Android_Charm[day] += (count * 2)};
                                                if(pv[2]==2){Android_Charm[day] += (count * 5)};
                                                if(pv[2]==3){Android_Charm[day] += (count * 10)};
                                                if(pv[2]==4){Android_Charm[day] += (count * 50)};
                                                if(pv[2]==5){Android_Charm[day] += (count * 100)};
                                                if(pv[2]==6){Android_Charm[day] += (count * 600)};
                                                if(pv[2]==7){Android_Charm[day] += (count * 1500)};
                                                if(pv[2]==8){Android_Charm[day] += (count * 3000)};
                                                if(pv[2]==9){Android_Charm[day] += (count * 15000)};
                                                if(pv[2]==10){Android_Charm[day] += (count * 60000)};
                                                if(pv[2]==11){Android_Charm[day] += (count * 150000)};
                                                if(pv[2]==12){Android_Charm[day] += (count * 300000)};
                                                if(pv[2]==15){Android_Charm[day] += (count * 600)};
                                                if(pv[2]==16){Android_Charm[day] += (count * 600)};
                                        }

                                }

                        }
                }
        }
}
END{
        OFS=","
        for(d in IOS_Charm) {
                print d, IOS_Charm[d], Android_Charm[d]
        }
}
' /data/backup/user_access/${date}.log >> question2.result



while [ "$date" != "$today" ];do
	date=$(date -d "$date +1 day" "+%Y-%m-%d")        
	
        awk -v day="$date" '
BEGIN{FS=","}
{
        if($4=="/user/presentgift"){
                if($11 == 1000){
                        split($13, params, "&")

                        for(p in params) {

                                for(p1 in params){
                                        if(match(params[p1], "amount")) {
                                                split(params[p1], cv, "=");
                                                count = cv[2];
                                        }

                                 }

                                if(match(params[p], "gift_id")) {
                                        split(params[p], pv, "=");
                                        if($5==36272630) {
                                                if(pv[2]==1){IOS_Charm[day] += (count * 2)};
                                                if(pv[2]==2){IOS_Charm[day] += (count * 5)};
                                                if(pv[2]==3){IOS_Charm[day] += (count * 10)};
                                                if(pv[2]==4){IOS_Charm[day] += (count * 50)};
                                                if(pv[2]==5){IOS_Charm[day] += (count * 100)};
                                                if(pv[2]==6){IOS_Charm[day] += (count * 600)};
                                                if(pv[2]==7){IOS_Charm[day] += (count * 1500)};
                                                if(pv[2]==8){IOS_Charm[day] += (count * 3000)};
                                                if(pv[2]==9){IOS_Charm[day] += (count * 15000)};
                                                if(pv[2]==10){IOS_Charm[day] += (count * 60000)};
                                                if(pv[2]==11){IOS_Charm[day] += (count * 150000)};
                                                if(pv[2]==12){IOS_Charm[day] += (count * 300000)};
                                                if(pv[2]==15){IOS_Charm[day] += (count * 600)};
                                                if(pv[2]==16){IOS_Charm[day] += (count * 600)};
                                        }
                                        else if($5==30362726){
                                                if(pv[2]==1){Android_Charm[day] += (count * 2)};
                                                if(pv[2]==2){Android_Charm[day] += (count * 5)};
                                                if(pv[2]==3){Android_Charm[day] += (count * 10)};
                                                if(pv[2]==4){Android_Charm[day] += (count * 50)};
                                                if(pv[2]==5){Android_Charm[day] += (count * 100)};
                                                if(pv[2]==6){Android_Charm[day] += (count * 600)};
                                                if(pv[2]==7){Android_Charm[day] += (count * 1500)};
                                                if(pv[2]==8){Android_Charm[day] += (count * 3000)};
                                                if(pv[2]==9){Android_Charm[day] += (count * 15000)};
                                                if(pv[2]==10){Android_Charm[day] += (count * 60000)};
                                                if(pv[2]==11){Android_Charm[day] += (count * 150000)};
                                                if(pv[2]==12){Android_Charm[day] += (count * 300000)};
                                                if(pv[2]==15){Android_Charm[day] += (count * 600)};
                                                if(pv[2]==16){Android_Charm[day] += (count * 600)};
                                        }
                                        
                                }

                        }
                }
        }       
}
END{
        OFS=","
        for(d in IOS_Charm) {
                print d, IOS_Charm[d], Android_Charm[d]
        }
}
' /data/backup/user_access/${date}.log >> question2.result
        i=$((i+1))
done


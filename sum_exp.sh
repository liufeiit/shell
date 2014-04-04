#!/bin/bash

cd ~/inbox/user_exp/

targetDir=~/var/log/nova/exp

rsync -av app01:$targetDir/* original_log/app01/exp/
rsync -av app02:$targetDir/* original_log/app02/exp/
rsync -av app03:$targetDir/* original_log/app03/exp/

echo "Copy Gold Log From app01, app02, app03 success..."

yesterday=$(date -d yesterday +%Y-%m-%d)

app01_exp_log_file=/data/inbox/user_exp/original_log/app01/exp/$yesterday-exp.log
app02_exp_log_file=/data/inbox/user_exp/original_log/app02/exp/$yesterday-exp.log
app03_exp_log_file=/data/inbox/user_exp/original_log/app03/exp/$yesterday-exp.log
echo $app01_exp_log_file
echo $app02_exp_log_file
echo $app03_exp_log_file

sort $app01_exp_log_file $app02_exp_log_file $app03_exp_log_file > $yesterday-exp.txt

#awk 'NR==FNR{a[i]=$0;i++}NR>FNR{print a[j]"\n"$0;j++}' $app01_exp_log_file $app02_exp_log_file $app03_exp_log_file > $yesterday-exp.txt

sed -i '1i  timestamp, time, userId, amount, servername' $yesterday-exp.txt

echo "All done..."

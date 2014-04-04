#!/bin/bash

cd ~/inbox/user_glod/

targetDir=~/var/log/nova/gold

rsync -av app01:$targetDir/* original_log/app01/gold/
rsync -av app02:$targetDir/* original_log/app02/gold/
rsync -av app03:$targetDir/* original_log/app03/gold/

echo "Copy Gold Log From app01, app02, app03 success..."

yesterday=$(date -d yesterday +%Y-%m-%d)

app01_gold_log_file=/data/inbox/user_glod/original_log/app01/gold/$yesterday-gold.log
app02_gold_log_file=/data/inbox/user_glod/original_log/app02/gold/$yesterday-gold.log
app03_gold_log_file=/data/inbox/user_glod/original_log/app03/gold/$yesterday-gold.log
echo $app01_gold_log_file
echo $app02_gold_log_file
echo $app03_gold_log_file

sort $app01_gold_log_file $app02_gold_log_file $app03_gold_log_file > $yesterday-gold.txt

#awk 'NR==FNR{a[i]=$0;i++}NR>FNR{print a[j]"\n"$0;j++}' $app01_gold_log_file $app02_gold_log_file $app03_gold_log_file > $yesterday-gold.txt

sed -i '1i  timestamp, time, userId, amount, servername' $yesterday-gold.txt

echo "All done..."

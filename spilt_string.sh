#!/bin/sh

cat "/home/lf/error/memory.csv" | while read line
do
	echo echo $line | awk '{ print $4; }' $line
done

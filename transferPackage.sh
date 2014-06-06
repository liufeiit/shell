#!/bin/bash

CODE_HOME=/home/ubuntu/inbox/package_home

echo "copying 01...."
rsync -a8P --delete $CODE_HOME/* app01:~/inbox/package_home/
echo "copying 02...."
rsync -a8P --delete $CODE_HOME/* app02:~/inbox/package_home/
echo "copying 03..."
rsync -a8P --delete $CODE_HOME/* app03:~/inbox/package_home/

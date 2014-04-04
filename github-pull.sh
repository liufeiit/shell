#!/bin/bash

cd /home/lf/workspace/Web_Nova/
git stash -a
echo "git stash -a >> success!!!"
git checkout master
echo "git checkout master >> success!!!"
git pull origin master
echo "git pull origin master >> success!!!"
git push origin master
echo "git push origin master >> success!!!"

git log

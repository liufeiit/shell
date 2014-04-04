#!/bin/bash

cd /home/lf/workspace/Web_Nova
git stash -a
echo "git stash -a >>> success!!!"
git checkout development
echo "git checkout development >>> success!!!"
git pull origin development
echo "git pull origin development >>> success!!!"
git push origin development
echo "git push origin development >>> success!!!"

git log

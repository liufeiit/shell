#!/bin/sh
echo "start jboss"
cd $JBOSS_HOME/bin/
nohup sh standalone.sh > nohup.out 2>&1 &

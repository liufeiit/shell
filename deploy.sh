#!/bin/bash

cd ~/workspace/Web_Nova/Analytics/
mvn install
cp ~/workspace/Web_Nova/Analytics/Analytics-Web/target/Analytics-Web.war ~/dev/jboss-as-web-7.0.2.Final/standalone/deployments/
#nohup sh standalone.sh > nohup.out 2>&1 &
sh /home/lf/dev/jboss-as-web-7.0.2.Final/bin/standalone.sh


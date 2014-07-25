#!/bin/sh
sudo service udev restart
cd /home/lf/android/adt-bundle-linux-x86_64-20140624/sdk/platform-tools
sudo ./adb kill-server
sudo ./adb start-server
sudo ./adb devices
echo "ok.."

#!/bin/sh
 
# Shut down WNDRMAC router running OpenWrt safely to protect usb hard disks
# Save this script as /etc/hotplug.d/button/buttons
# Usage: press any front button for more than 2 seconds to shutdown the router
 
#!/bin/sh
 
if [ "$BUTTON" = "BTN_2" ] || [ "$BUTTON" = "wps" ] ; then
    if [ "$ACTION" = "pressed" ] ; then
        echo `date +%s` > /tmp/halt_button
    elif [ "$ACTION" = "released" ] ; then
        now=$(date +%s)
        pressed=`cat /tmp/halt_button`
        delay=$((now-pressed))
        if [ $delay -gt 2 ] ; then
            logger "WiFi or WPS button pressed and held more than 2 seconds, halt."
            /etc/init.d/nfsd stop
            /etc/init.d/samba stop
            /etc/init.d/minidlna stop
            /etc/init.d/aria2 stop
            /etc/init.d/transmission stop
            /etc/init.d/dropbear stop
            umount /dev/sda1
            umount /dev/sda2
            umount /dev/sda3
            block umount
            echo "0" > /sys/devices/platform/wndr3700-led-usb/leds/wndr3700:green:usb/brightness
            halt
        fi
    fi
fi

#!/system/bin/sh
echo "stop dhcp service"
setprop ctl.stop dhcpd_softap
echo "wlan0 to down"
ifconfig wlan0 down
sleep 3
echo "stop hostap service"
setprop ctl.stop hostapd_bin
sleep 3
#echo "rmmod driver"
#rmmod wl12xx_sdio

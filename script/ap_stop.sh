#!/system/bin/sh
echo "stop dhcp service"
setprop ctl.stop dhcpd_softap

sleep 3

echo "wlan1 to down"
ifconfig wlan1 down

sleep 3

echo "stop hostap service"
setprop ctl.stop hostapd_bin

#echo "rmmod driver"
#rmmod wl12xx_sdio

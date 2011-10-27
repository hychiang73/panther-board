#!/system/bin/sh
echo "insmod driver"
insmod /system/lib/modules/wl12xx_sdio.ko

echo "set country code from .config"
iw reg set `busybox grep country_code= /data/misc/wifi/hostapd.conf | busybox sed "s:country_code=::"`

echo "delet wlan0"
iw wlan0 del

echo "get phy to interfer wlan1"
iw `ls /sys/class/ieee80211/` interface add wlan1 type managed

echo "get register of hw"
iw reg get

echo "start hostapd service"
setprop ctl.start hostapd_bin
sleep 3

echo "start interface wlan1"
setprop ctl.start ifcfg_softap
sleep 3

echo "start dhcp service daemon"
setprop ctl.start dhcpd_softap

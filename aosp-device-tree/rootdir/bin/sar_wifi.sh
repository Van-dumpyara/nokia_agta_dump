#!/vendor/bin/sh

LOG_TAG="sar_wifi.sh"

function exe_log()
{
	local cmd="$@"
	local emsg="$(eval $cmd 2>&1)"

	log -p d -t "$LOG_TAG" "$cmd ecode=$? $emsg"
}

function gro_switch()
{
	exe_log "echo $1 > /sys/module/seth/parameters/gro_enable"
}

function sar_wifi_on() {
    setprop persist.vendor.sar_wifi.done false
	exe_log "iwnpi wlan0 set_sar_power sar_wifi_on"

    /vendor/bin/iwnpi wlan0 set_sar_power 2 1 4
    /vendor/bin/iwnpi wlan0 set_sar_power 2 1 5
    /vendor/bin/iwnpi wlan0 set_sar_power 2 1 6

    setprop persist.vendor.sar_wifi.done true
}

function sar_wifi_on_fcc() {
    setprop persist.vendor.sar_wifi.done false

	exe_log "iwnpi wlan0 set_sar_power sar_wifi_on_fcc"
    /vendor/bin/iwnpi wlan0 set_sar_power 2 2 0
    /vendor/bin/iwnpi wlan0 set_sar_power 2 2 1
    /vendor/bin/iwnpi wlan0 set_sar_power 2 10 4
    /vendor/bin/iwnpi wlan0 set_sar_power 2 10 5
    /vendor/bin/iwnpi wlan0 set_sar_power 2 10 6

    setprop persist.vendor.sar_wifi.done true
}

function sar_wifi_off() {
    setprop persist.vendor.sar_wifi.done false
	exe_log "iwnpi wlan0 set_sar_power 0 127 7"
    /vendor/bin/iwnpi wlan0 set_sar_power 0 127 7
    setprop persist.vendor.sar_wifi.done true
}



if [ "$1" = "on" ]; then
	sar_wifi_on;
elif [ "$1" = "off" ]; then
	sar_wifi_off;
elif [ "$1" = "fcc" ]; then
	sar_wifi_on_fcc
fi

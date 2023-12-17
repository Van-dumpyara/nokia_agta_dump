#!/vendor/bin/sh

LOG_TAG="doubletp.sh"

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

function doubletp_on() {
	exe_log "echo 1 > /sys/touchscreen/gesture_enable"
    echo 1 > /sys/touchscreen/gesture_enable
}

function doubletp_off() {
	exe_log "echo 0 > /sys/touchscreen/gesture_enable"
    echo 0 > /sys/touchscreen/gesture_enable
}



if [ "$1" = "on" ]; then
	doubletp_on;
elif [ "$1" = "off" ]; then
	doubletp_off;
fi

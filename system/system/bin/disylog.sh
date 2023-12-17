#!/system/bin/sh
sleep 30
YLOG=`pm list package | grep com.sprd.logmanager | cut -d: -f2`

if [ "$YLOG" == "com.sprd.logmanager" ]; then
    log -p d -t "disylog" "Ylog app exist!!!"
else
    log -p d -t "disylog" "Ylog app not exist!!!"
    stop ylog
    rm /data/ylog/* -rf
    start ylog
    log -p d -t "disylog" "/data/ylog removed and reset config!"
fi

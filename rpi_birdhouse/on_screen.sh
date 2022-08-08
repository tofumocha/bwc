#!/bin/sh
CAM_CONFIG_FILE="/data/etc/motioneye/Camera-1.conf"
CAM_NAME='YOUR_CAMERA_NAME'
if [ -f $CAM_CONFIG_FILE ]; then
    CAM_NAME=`grep text_left $CAM_CONFIG_FILE | cut -f2 -d' '`
fi
TEMP=`vcgencmd measure_temp | cut -f2 -d'='`
curl "http://localhost:7999/1/config/set?text_left=$CAM_NAME\%20$TEMP"
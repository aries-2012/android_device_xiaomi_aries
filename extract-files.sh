#!/bin/sh

VENDOR=xiaomi
DEVICE=aries

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

for FILE in `cat proprietary-blobs.txt | grep -v ^# | grep -v ^$ `; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    cp ~/wenjian/opt/msm-aosp_part/miui_39.0/system/$FILE $BASE/$FILE
done

./setup-makefiles.sh

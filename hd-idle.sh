#!/bin/bash

if [ ! "$UID" = "0" ]
then
  echo
  echo "Must be executed as root user!"
  echo
  exit 1
fi

PID_FILE="/var/run/hd-idle.pid"
# replace YOUR_UUID with the UUID of the partition of the HD that you want
# to spin down after eg 600 seconds
# NB: you can list multiple HDs
PARAMS="-a /dev/disk/by-uuid/YOUR_UUID -i 600"

if [ "$1" = "start" ]
then
  /usr/sbin/hd-idle $PARAMS &
  CUR_PID=$!
  echo "$CUR_PID" > $PID_FILE
elif [ "$1" = "stop" ]
then
  kill `(cat $PID_FILE)`
  rm $PID_FILE
else
  echo
  echo "usage: ${0##*/} {start|stop}"
  echo
  exit 0
fi


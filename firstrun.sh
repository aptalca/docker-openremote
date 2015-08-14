#!/bin/bash

if [ ! -d "/config/OpenRemote-Controller-2.1.0" ]; then
  echo "First install detected, setting up the controller"
  unzip -u /root/OR.zip -d /config/
else
  echo "Using existing controller"
fi

echo "Setting permissions"
chown -R nobody:users /config
chmod -R g+rw /config
cd /config/OpenRemote-Controller-2.1.0/bin
chmod +x openremote.sh
/sbin/setuser nobody sh ./openremote.sh start

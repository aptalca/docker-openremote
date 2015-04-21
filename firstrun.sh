#!/bin/bash

unzip -u /root/OR.zip -d /config/
cd /config/OpenRemote-Controller-2.1.0/bin
chmod +x openremote.sh
./openremote.sh start

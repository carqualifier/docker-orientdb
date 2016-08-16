#!/bin/ash

touch /data/status/orient.ready
chmod 775 /data/status/orient.ready

tail -f /dev/null
#/opt/monit/bin/monit -I

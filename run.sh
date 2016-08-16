#!/bin/ash

touch /data/status/orient.ready
chmod 775 /data/status/orient.ready

/opt/monit/bin/monit -I

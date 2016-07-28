#!/bin/bash

touch /data/status/orient.ready
chmod 775 /data/status/orient.ready

/usr/bin/monit -I

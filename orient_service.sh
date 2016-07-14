#!/bin/bash

case $1 in
  start)
     /orientdb/bin/dserver.sh &
     echo $! > /var/run/start_orient.pid ;
     ;;
   stop)
     /orientdb/bin/shutdown.sh
     rm /var/run/start_orient.pid
     ;;
   *)
     echo "usage: orient_service.sh {start|stop}" ;;
esac
exit 0

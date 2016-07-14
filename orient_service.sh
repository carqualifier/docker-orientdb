#!/bin/bash

case $1 in
  start)
     /orientdb/bin/dserver.sh &
     ;;
   stop)
     /orientdb/bin/shutdown.sh
     ;;
   *)
     echo "usage: orient_service.sh {start|stop}" ;;
esac
exit 0

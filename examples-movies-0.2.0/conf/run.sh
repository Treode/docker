#!/bin/bash
service nginx start
H=0x`hostname -i | sed -e 's/\./ /g' |xargs printf '%02X'`
CELL=$H
HAIL=""
SOLO="-solo"
IP=`hostname -i`

while getopts "c:r:m" opt; do
   case "$opt" in
   c)   CELL=${OPTARG}
        ;;
   r)   HAIL=${OPTARG}
        SOLO=""
        ;;
   m)   SOLO=""
        ;;
   esac
done

echo "Initializing movies - HOST ${H} (${IP}) - CELL ${CELL}"
java -jar /var/lib/treode/lib/movies-server-0.2.0.jar init -host=${H} -cell=${CELL} /var/lib/treode/db/store.3kv

echo "starting movies."
if [ "X${HAIL}X" != "XX" ]; then
   echo "HAILING -> ${HAIL}"
fi

java -jar /var/lib/treode/lib/movies-server-0.2.0.jar serve ${SOLO} ${HAIL} /var/lib/treode/db/store.3kv  > /var/lib/treode/logs/server.log 2>&1 &

/bin/bash


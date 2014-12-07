#!/bin/bash
service nginx start
H=`hostname -i | sed -e 's/\./ /g' |xargs printf '%02X'`
echo "Initialize movies $H"
java -jar /var/lib/treode/lib/movies-server-0.2.0.jar init -host=0x$H -cell=0x$H /var/lib/treode/db/store.3kv
echo "starting movies."

java -jar /var/lib/treode/lib/movies-server-0.2.0.jar serve -solo /var/lib/treode/db/store.3kv  > /var/lib/treode/logs/server.log 2>&1 &

/bin/bash


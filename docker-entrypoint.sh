#!/bin/bash
exec "$@" &
sleep 3
echo "-----start db-----"
/docker-entrypoint-initdb.d/init/init-db.sh
tail -f /dev/null


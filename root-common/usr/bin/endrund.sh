#!/bin/sh

sleep 5

DB_PASSWORD=''
DB_ROOT_PASSWORD=''
sleep 5
exec ${MYSQL_PREFIX}/libexec/mysqld --defaults-file=$MYSQL_DEFAULTS_FILE "$@" 2>&1

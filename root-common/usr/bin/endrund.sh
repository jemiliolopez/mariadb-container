#!/bin/sh

sleep 5

unset DB_PASSWORD DB_ROOT_PASSWORD

exec ${MYSQL_PREFIX}/libexec/mysqld --defaults-file=$MYSQL_DEFAULTS_FILE "$@" 2>&1

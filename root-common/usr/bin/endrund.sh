#!/bin/bash --posix

# sleep 5

# unset DB_PASSWORD DB_ROOT_PASSWORD

# DB_PASSWORD=''
# DB_ROOT_PASSWORD=''
# sleep 5
# BASH_ENV=/etc/environment


exec ${MYSQL_PREFIX}/libexec/mysqld --defaults-file=$MYSQL_DEFAULTS_FILE "$@" 2>&1

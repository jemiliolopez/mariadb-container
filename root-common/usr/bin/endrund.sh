#!/bin/bash

slepp 5

exec ${MYSQL_PREFIX}/libexec/mysqld --defaults-file=$MYSQL_DEFAULTS_FILE "$@" 2>&1

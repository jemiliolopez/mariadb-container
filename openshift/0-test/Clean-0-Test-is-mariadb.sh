#!/bin/bash

oc process -f ./../build/0-Test-is-mariadb.json --param-file Env-0-Test-is-mariadb.params | oc delete -f -

# oc set env dc/is-0-mariadb-10-3 MYSQL_ROOT_PASSWORD-

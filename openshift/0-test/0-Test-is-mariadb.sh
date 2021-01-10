#!/bin/bash

oc process -f ./../build/0-Test-is-mariadb.json --param-file Env-0-Test-mariadb.params | oc apply -f -
   
# oc rollout status dc/${APP_NAME}

# oc set env  dc/${APP_NAME} MYSQL_USER- MYSQL_PASSWORD- MYSQL_DATABASE- MYSQL_ROOT_PASSWORD-


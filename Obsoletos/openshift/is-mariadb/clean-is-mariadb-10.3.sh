#!/bin/bash

## oc new-project imagenes-wordpress  --description="Crea las imagenes de mysql8 y wp" --display-name="Imagenes-Wordpress"

## ssh-keygen -f /home/origin/.ssh/id_rsa -b 2048 -t rsa -q -N '' -m pem -C 'ctrl.srv.lab'
## oc secrets new-sshauth github-secret-pc --ssh-privatekey='/home/emilio/.ssh/id_rsa'

## use oc create secret github-secret-jemiliolopez

## oc secrets link builder github-secret-pc



## ssh-keygen -f /home/origin/.ssh/id_rsa -b 2048 -t rsa -q -N '' -m pem -C 'ctrl.srv.lab'
## oc create secret github-secret-jemiliolopez --ssh-privatekey='/home/emilio/.ssh/id_rsa'
## oc secrets link builder github-secret-jemiliolopez



# oc apply -f wp-builds/PVs/os-nfs-wpp-pv08.json -f wp-builds/PVs/os-nfs-masterp-pv07.json -f wp-builds/PVs/os-nfs-slave1-pv06.json -f wp-builds/PVs/os-nfs-slave2-pv05.json

# sleep 5

# oc apply -f wp-builds/PVs/os-nfs-wpp-pv08.json -f wp-builds/PVs/os-nfs-masterp-pv07.json -f wp-builds/PVs/os-nfs-slave1-pv06.json -f wp-builds/PVs/os-nfs-slave2-pv05.json && sleep 10 && \

. ./Env-is-mariadb-10.3.sh


oc process -f ./../build/is-mariadb-10.3.json \
   -p PROJECT_NAME="${PROJECT_NAME}" \
   -p APP_NAME="${APP_NAME}" \
   -p STRATEGY_TYPE="${STRATEGY_TYPE}" \
   -p SOURCE_REPOSITORY_MYSQL_URL="${SOURCE_REPOSITORY_MYSQL_URL}" \
   -p SOURCE_REPOSITORY_MYSQL_TAG="${SOURCE_REPOSITORY_MYSQL_TAG}" \
    | oc delete -f -


   

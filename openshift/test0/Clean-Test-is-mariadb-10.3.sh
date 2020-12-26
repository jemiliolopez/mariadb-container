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

. ./Env-mariadb-10.3.sh


oc process -f ./../build/Test-is-mariadb-10.3.json \
   -p PROJECT_NAME="$PROJECT_NAME" \
   -p APP_NAME="$APP_NAME" \
   -p MYSQL_USER="$MYSQL_USER" \
   -p MYSQL_PASSWORD="$MYSQL_PASSWORD" \
   -p MYSQL_DATABASE="$MYSQL_DATABASE" \
   -p MYSQL_ROOT_PASSWORD="$MYSQL_ROOT_PASSWORD" \
    | oc delete -f -


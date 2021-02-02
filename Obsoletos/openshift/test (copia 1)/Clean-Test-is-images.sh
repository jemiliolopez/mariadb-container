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

. ./EnvTestImages.sh

oc process -f ./../build/Test-is-wp.json \
   -p WP_INSTALL_VERSION="$WP_INSTALL_VERSION" \
   -p PROJECT_NAME="$PROJECT_NAME" \
   -p APP_NAME="$APP_NAME" \
   -p IMAGE_NAME="$IMAGE_NAME" \
    | oc delete  -n imagenes-wordpress -f -


   

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


oc process -f ./../build/2-Test-is-mariadb103.json --param-file Env-2-Test-mariadb.params | oc apply -f -
   

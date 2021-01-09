#!/bin/bash


oc process  -f ./../build/is-0-mariadb-10.3.json --param-file Env-is-0-mariadb-10.3.params | oc apply -f -


   

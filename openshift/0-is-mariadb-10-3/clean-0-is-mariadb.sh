#!/bin/bash

oc process -f ./../build/0-is-mariadb.json --param-file Env0-is-mariadb.params | oc delete -f -
 

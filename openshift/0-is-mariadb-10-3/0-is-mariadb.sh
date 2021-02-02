#!/bin/bash

oc process  -f ./../build/0-is-mariadb.json --param-file Env-0-is-mariadb.params | oc apply -f -


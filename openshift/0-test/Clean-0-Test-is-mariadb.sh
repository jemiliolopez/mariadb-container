#!/bin/bash

oc process -f ./../build/0-Test-is-mariadb.json --param-file Env-0-Test-is-mariadb.params | oc delete -f -

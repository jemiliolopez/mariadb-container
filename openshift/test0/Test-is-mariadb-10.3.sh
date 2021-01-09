oc process -f ./../build/Test-is-mariadb-10.3.json --param-file Env-mariadb-10.3.params | oc apply -f -
   
# oc rollout status dc/${APP_NAME}

# oc set env  dc/${APP_NAME} MYSQL_USER- MYSQL_PASSWORD- MYSQL_DATABASE- MYSQL_ROOT_PASSWORD-


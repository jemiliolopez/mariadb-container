#!/bin/sh

# set -x
set -o errexit
set  -o pipefail
set -o nounset

iniciar_entorno () {


    export PROJECT_NAME="imagenes-wordpress"
    export APP_NAME="is-mariadb-10-3"
    export MYSQL_USER="user" 
    export MYSQL_PASSWORD="paso" 
    export MYSQL_DATABASE="db" 
    export MYSQL_ROOT_PASSWORD=""
    export ROOT_PASSWORD="passroot"

}
   

iniciar_entorno


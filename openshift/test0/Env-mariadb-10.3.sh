#!/bin/sh

# set -x
set -o errexit
set  -o pipefail
set -o nounset

iniciar_entorno () {


    export PROJECT_NAME="imagenes-wordpress"
    export APP_NAME="is-0-mariadb-10-3"
    export MYSQL_USER="user" 
    export MYSQL_PASSWORD="passuser" 
    export MYSQL_DATABASE="db" 
    export MYSQL_ROOT_PASSWORD="passroot" 


}
   

iniciar_entorno


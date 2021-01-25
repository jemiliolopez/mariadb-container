#!/bin/sh

# set -x
set -o errexit
set  -o pipefail
set -o nounset

iniciar_entorno () {


    export PROJECT_NAME="imagenes-wordpress"
    export APP_NAME="is-1-mariadb-10.3"
    # export DOCKER_REGISTER="docker-registry.default.svc:5000"
    export STRATEGY_TYPE="Source"
    export SOURCE_IMAGE_STREAM="is-0-mariadb-10.3:latest"
    export SSH_GITHUB="github-secret-jemiliolopez"
    export SOURCE_REPOSITORY_MYSQL_URL="git@github.com:jemiliolopez/mariadb-container.git"
    export SOURCE_REPOSITORY_MYSQL_TAG="main"
    export MYSQL_USER="user" 
    export MYSQL_PASSWORD="passuser" 
    export MYSQL_DATABASE="db" 
    export MYSQL_ROOT_PASSWORD="passroot" 


}
   

iniciar_entorno

. ./Test-is-mariadb-10.3.sh

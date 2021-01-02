#!/bin/bash

entorno() {
    export PROJECT_NAME="imagenes-wordpress"
    export APP_NAME="is-mariadb-10-3"
    export STRATEGY_TYPE="Docker"
    export SSH_PRIVATE_KEY="$(cat '/home/emilio/.ssh/id_rsa' | base64)"
    export SOURCE_REPOSITORY_MYSQL_URL="git@github.com:jemiliolopez/mariadb-container.git"
    export SOURCE_REPOSITORY_MYSQL_TAG="dev"
    ## export DOCKER_REGISTER= "docker-registry.default.svc:5000"
    export MYSQL_USER="user" 
    export MYSQL_PASSWORD="passuser" 
    export MYSQL_DATABASE="db"
    export MYSQL_ROOT_PASSWORD="passroot" 
}

entorno


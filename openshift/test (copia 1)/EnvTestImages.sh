#!/bin/sh

# set -x
set -o errexit
set  -o pipefail
set -o nounset

iniciar_entorno () {

    # export WP_INSTALL_VERSION=$(curl -s "https://api.wordpress.org/core/version-check/1.7/" | jq -r '[.offers[]|select(.response=="upgrade")][0].version')
    export WP_INSTALL_VERSION=5.6
    export PROJECT_NAME=imagenes-wordpress
    export APP_NAME=is-mysql8
    export IMAGE_NAME=imagenes-wordpress/is-0-mysql8

}


iniciar_entorno


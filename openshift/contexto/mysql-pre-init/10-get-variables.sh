get-variables() {
    export MYSQL_ROOT_PASSWORD="$(cat '/tmp/mysql/shared/secrets/mysql-root-password')"
    export MYSQL_USER="$(cat '/tmp/mysql/shared/cfmap/mysql-user')"
    export MYSQL_PASSWORD="$(cat '/tmp/mysql/shared/secrets/mysql-password')"
    export MYSQL_DATABASE="$(cat '/tmp/mysql/shared/cfmap/mysql-database')"
    rm -fR  '/tmp/mysql/shared'
}

if ! [ -v MYSQL_RUNNING_AS_SLAVE ]; then
    get-variables
fi



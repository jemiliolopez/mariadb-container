add_root_pass() {
    if [ -v MYSQL_ROOT_PASSWORD ]; then
mysql $mysql_flags <<EOSQL
      UPDATE mysql.user SET Password=PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE User='root';
      GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;
      FLUSH PRIVILEGES;
EOSQL
    fi
}

if ! [ -v MYSQL_RUNNING_AS_SLAVE ] ; then
    add_root_pass
    export MYSQL_PWD=${MYSQL_ROOT_PASSWORD}
fi

unset -f add_root_pass

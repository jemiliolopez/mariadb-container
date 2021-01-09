FROM wordpress-imagenes/is-1-mariadb-10-3
MAINTAINER Samy <samyunodos@gmail.com>

COPY ./openshift/Final_Docker/entrypoint.sh /bin

RUN bash -c "unset MYSQL_ROOT_PASSWORD"


# ENTRYPOINT [ "run-mysqld" ]

CMD ["run-mysqld"]
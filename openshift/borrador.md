# Eliminar variables de entorno

    1.- ~~En "/var/home/emilio/00Dev/mariadb-container/root-common/usr/libexec/container-setup" (que se ejecuta como root) añadimos las variables de entorno "ENV" y "BASH_ENV" que indican al comando sh (de bash antigüo) y bash el archivo a leer al inicio.~~ Vamos a crear estas variables en "mariadb-container/10.3/Dockerfile"  Este archivo será /etc/environment.
    
    ``` 
    ENV ENV='/etc/environment' \
        BASH_ENV='/etc/environment'
    
    
    ```
    2.- En "/etc/environment":
    
    ``` 
   echo "unset MYSQL_PASSWORD" >> '/etc/environment'
   echo "unset MYSQL_ROOT_PASSWORD" >> '/etc/environment'
   echo "unset MYSQL_USER" >> '/etc/environment'
   echo "unset MYSQL_DATABASE" >> '/etc/environment'
   echo "export ENV='/etc/environment'" >> '/etc/environment'
   echo "export BASH_ENV='/etc/environment'" >>  '/etc/environment'
    ```

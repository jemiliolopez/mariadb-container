# Fork sclorg/mariadb-container

## Fork desde github


1. Lo primero es hacer un “ fork ” del repositorio “sclorg/mariadb-conatainer ”. Para ello vamos a los repositorios originales en sclorg. Basta con pulsar fork.
 
2. Luego clonamos nuestro fork en nuestra workstation:

```
$ git clone --recursivegit@github.com:jemiliolopez/mariadb-container.git


```
3. Una vez clonado, vamos al repositorio y comprobamos el origin:

```
$ git remote -v cd mariadb-container/
$ git remote -v
origin	git@github.com:jemiliolopez/mariadb-container.git (fetch)
origin	git@github.com:jemiliolopez/mariadb-container.git (push)
```

o bien:


```
$ git remote show origin
load pubkey "/home/emilio/.ssh/2341ED68_rsa": invalid format
sign_and_send_pubkey: signing failed for RSA "(none)" from agent: agent refused operation
* remoto origin
  URL  para obtener: git@github.com:jemiliolopez/mariadb-container.git
  URL para publicar: git@github.com:jemiliolopez/mariadb-container.git
  Rama HEAD: master
  Ramas remotas:
    master                  rastreada
    revert-14-test-image-id rastreada
    test-pr                 rastreada
  Rama local configurada para 'git pull':
    master fusiona con remoto master
  Referencia local configurada para 'git push':
    master publica a master (actualizado)
    
  ```
   
4. A partir de aquí, tenemos  los repositorios remotos sclorg y jemiliolopez de mariadb-container y el repositorio local en nuestro pc. Para tener actualizado el fork (jemiliolopez) con el remoto (sclorg) lo haremos a traves de nuestra rama local, como expondremos a continuación ( añadiendo el remoto upstream pero sólo para pull). Siempre la rama master de nuestro fork será un espejo de la rama master del original (sclorg).

Así, que para actualizar los dos remotos lo haremos mediante el local. Para ello debemos añadir el remoto "upstream" al repositorio local y posteriormente deshabilitar el push en dicho remoto.

    
  * 1. Añadimos el remoto "upstream":
    ```
        $ git remote add upstream git@github.com:sclorg/mariadb-container.git
        $ git remote -v
        origin	git@github.com:jemiliolopez/mariadb-container.git (fetch)
        origin	git@github.com:jemiliolopez/mariadb-container.git (push)
        upstream	git@github.com:sclorg/mariadb-container.git (fetch)
        upstream	git@github.com:sclorg/mariadb-container.git (push)
    ```
  * 2. Deshabilitamos el push del "upstream":
    ```
        $ git remote set-url --push upstream DISABLE
        $ git remote -v
        origin	git@github.com:jemiliolopez/mariadb-container.git (fetch)
        origin	git@github.com:jemiliolopez/mariadb-container.git (push)
        upstream	git@github.com:sclorg/mariadb-container.git (fetch)
        upstream	DISABLE (push)
     ```
  * 3. Actualizamos la rama master local mediante upstream con el repositorio sclorg.
      ```
        $ git pull --rebase=merges  upstream master
        load pubkey "/home/emilio/.ssh/2341ED68_rsa": invalid format
        sign_and_send_pubkey: signing failed for RSA "(none)" from agent: agent refused operation
        Desde github.com:sclorg/mariadb-container
        * branch            master     -> FETCH_HEAD
        Ya está actualizado.
        La rama actual master está actualizada.
        ```
  * 4. Luego actualizamos el remoto (fork) en el caso de que hubiese cambios:
       ```
        $ git add --all
        $ git commit -m "Actualización upstream"
        $ git push origin master
      ```
        Mediante este workround podemos tener siempre actualizada la rama master del fork con el original a través del local.
        
  * 5. Para actualizar la rama main si hubo cambios en la master:
  
       ```
        $ git checkout main
        $ git pull --rebase=merges  origin master
       
        ```
  * 6. Para actualizar la rama main si hubo cambios en la rama dev:
  
       ```
        $ git checkout main
        $ git pull --rebase=merges  origin dev
       
        ```
        
## Estructura del repositorio.
    
    Bien, ya hemos visto en el aparatado anterior que la rama master del repositorio estará siempre sincronizada con la rama master del original y será su lazo de unión.
    
    Vamos a crear una rama "main", que será la rama principal del proyecto.
    
    ```
    $ git checkout -b main
    Cambiado a nueva rama 'main'

    ```
    Estas dos ramas son las fundamentales, podemos cambiar en github-settings que la rama por defecto sea la main.
    
    Todas las demas ramas que se crean seran temporales y para trabajar con el repositorio. Como anotaciones "dev" para las ramas de trabajo y con el comando:
    
     
     ```
     $ git tag -a v0 -m "Comentario"
     
     
     ```
    En caso de crear una rama sería:
    
     ```
     $ git checkout v0 -b <nueva rama>
     
     
     ```
     
## Encabezamiento de commits.

Para que los commit sean más completos y apoyarlos en los issuess:

-. Los issues los nombramos con dos numeros + "_" + descripción corta:
     
       
     ```
        04_Fix Domcumento
     ```
-. Los commits si son consecuencia de la issues comenzará tambien por ese encabezado.

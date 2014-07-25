
# Build mod_auth_openidc rpm on Docker container

## Requirements

* [Docker](http://www.docker.com/)


## How to build rpm

1. Clone this project on Docker host server
    ```bash
    $ git clone https://github.com/wadahiro/mod_auth_openidc_rpmbuild_container.git
    ```

2. Build docker container
    ```
    $ cd mod_auth_openidc_rpmbuild_container
    $ sudo docker build -t <USERNAME>/mod_auth_openidc_rpmbuild_container .
    ```

3. Start docker container
    ```bash
    $ sudo docker run --rm -v $PWD:/shared:rw -it <CONTAINER_ID> /bin/bash
    ```

4. Check the rpm file and copy to host server
    ```bash
    $ ls /opt/rpmbuild/rpm/RPMS/*
    /opt/rpmbuild/rpm/RPMS/noarch:
    total 104
    drwxr-xr-x 1 root root     76 Jul 25 19:22 .
    drwxr-xr-x 1 root root     24 Jul 25 19:22 ..
    -rw-r--r-- 1 root root 106120 Jul 25 19:22 jansson-devel-doc-2.6-4.el6.noarch.rpm

    /opt/rpmbuild/rpm/RPMS/x86_64:
    total 296
    drwxr-xr-x 1 root root    202 Jul 25 20:21 .
    drwxr-xr-x 1 root root     24 Jul 25 19:22 ..
    -rw-r--r-- 1 root root  71957 Jul 25 19:22 jansson-2.6-4.el6.x86_64.rpm
    -rw-r--r-- 1 root root   7382 Jul 25 19:22 jansson-devel-2.6-4.el6.x86_64.rpm
    -rw-r--r-- 1 root root 217432 Jul 25 20:21 mod_auth_openidc-1.5.2-1.el6.x86_64.rpm
    
    $ cp /opt/rpmbuild/rpm/RPMS/x86_64/*.rpm /shared
    ```

Enjoy!

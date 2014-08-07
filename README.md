
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
    bash-4.1# ls -al /opt/rpmbuild/rpm/RPMS/x86_64/                                        
    total 216
    drwxr-xr-x 1 root root     78 Aug 12 03:31 .
    drwxr-xr-x 1 root root     12 Aug 12 03:31 ..
    -rw-r--r-- 1 root root 217435 Aug 12 03:31 mod_auth_openidc-1.5.2-1.el6.x86_64.rpm
    
    $ cp /opt/rpmbuild/rpm/RPMS/x86_64/*.rpm /shared
    ```

Enjoy!

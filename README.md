
# Build mod_auth_openidc rpm on Docker container

## Requirements

* [Docker](http://www.docker.com/)


## How to build rpm

1. Clone this project on Docker host server

   ```bash
    $ git clone https://github.com/wadahiro/mod_auth_openidc_rpmbuild_container.git
    ```

2. Build docker image

    ```
    $ cd mod_auth_openidc_rpmbuild_container
    $ sudo docker build -t <USERNAME>/mod_auth_openidc_rpmbuild .
    ```

3. Start docker container

    ```bash
    $ sudo docker run --rm -v $PWD:/shared:rw -it <IMAGE_ID> /bin/bash
    ```

4. Check the rpm file and copy to host server

    ```bash
    bash-4.1# ls -al /opt/rpmbuild/rpm/RPMS/x86_64/
    total 260
    drwxr-xr-x 2 root root   4096 Nov  6 09:08 .
    drwxr-xr-x 3 root root   4096 Nov  6 09:08 ..
    -rw-r--r-- 1 root root 255986 Nov  6 09:08 mod_auth_openidc-1.7.0-1.el6.x86_64.rpm

    $ cp /opt/rpmbuild/rpm/RPMS/x86_64/*.rpm /shared
    ```

Enjoy!

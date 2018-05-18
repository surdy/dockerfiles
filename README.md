# Dockerfiles

Collection of Dockerfiles for my personal docker images

### dcos-bootstrap

Used to generate DC/OS installation files. Replacement for using a bootstrap node to do the same 

Usage:
 
    `docker run --privileged  -v $PWD:/bootstrap dcos-bootstrap`  # uses https://downloads.dcos.io/dcos/stable/dcos_generate_config.sh

    `docker run --privileged  -v $PWD:/bootstrap dcos-bootstrap https://downloads.dcos.io/dcos/stable/1.11.2/dcos_generate_config.sh`

    `docker run --privileged  -e DCOS_INSTALLER_URL='https://downloads.dcos.io/dcos/stable/1.11.2/dcos_generate_config.sh' -v $PWD:/bootstrap dcos-bootstrap`

Expects `genconf/config.yaml` and `genconf/ip-detect` to be present in the working directory

# docker-noflo-runtime-js



## Build
    cd ~; rm -rf docker-noflo-runtime-js; git clone https://github.com/sejnub/docker-noflo-runtime-js.git
    cd ~/docker-noflo-runtime-js; docker build --build-arg HB_FLOWHUB_USERID=$HB_FLOWHUB_USERID --build-arg HB_NOFLO_RUNTIME_IP=$HB_NOFLO_RUNTIME_IP -t sejnub/noflo-runtime-js .

Another option would be to provide the secret to the run via "--env-file /usr/local/etc/hb-credentials.env". Then the configuration of the noflo runtime must be part of the CMD in the Dockerfile und not part of the RUN.

## Run
    docker run -it --name nojs -p 3569:3569 sejnub/noflo-runtime-js /bin/bash


## Links
https://docs.flowhub.io/getting-started-node/

# docker-noflo-runtime-js



## Build
    cd ~; rm -rf docker-noflo-runtime-js; git clone https://github.com/sejnub/docker-noflo-runtime-js.git
    cd ~/docker-noflo-runtime-js; docker build --build-arg HB_FLOWHUB_USERID=??????????? -t sejnub/docker-noflo-runtime-js .

## Run
    docker run -it --name nojs sejnub/noflo-runtime-js /bin/bash


## Links
https://docs.flowhub.io/getting-started-node/

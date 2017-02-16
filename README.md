# docker-noflo-runtime-js (WIP)
This is WIP and not usable by others just now.



## Build
    echo $HB_FLOWHUB_USERID
    echo $HB_NOFLO_RUNTIME_HOST

    cd ~; rm -rf docker-noflo-runtime-js; git clone https://github.com/sejnub/docker-noflo-runtime-js.git
    cd ~/docker-noflo-runtime-js; docker build --build-arg HB_FLOWHUB_USERID=$HB_FLOWHUB_USERID --build-arg HB_NOFLO_RUNTIME_HOST=$HB_NOFLO_RUNTIME_HOST -t sejnub/noflo-runtime-js .
    
    eof


## Run
    docker rm -f nojs; docker run -it --name nojs -p 3569:3569 sejnub/noflo-runtime-js /bin/bash
    
    eof

The specified port on the host $HB_NOFLO_RUNTIME_HOST must be accesible from the internet.


## Links
https://docs.flowhub.io/getting-started-node/

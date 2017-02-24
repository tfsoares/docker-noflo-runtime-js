# docker-noflo-runtime-js (WIP)
This is work in progress and not usable by others just now. But plan is to improve it until it's of use for others.
Also there shall be a version for X86 in Addition to the current ARM version.



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

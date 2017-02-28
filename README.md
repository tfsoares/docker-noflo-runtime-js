# docker-noflo-runtime-js
There shall be an additional version for X86 in addition to the current ARM (Raspberry Pi) version.


## Status and rights
Seems to be working. 
Totally free to use by everyone.


## Tags
  * **``rpi-latest``**  Latest version for Raspberry Pi


## Clean up before build
    docker rm $(docker ps -a -f status=exited -q)
    docker rmi $(docker images -f dangling=true -q)
    docker volume rm $(docker volume ls -f dangling=true -q)

    eof
    

## Build
    
    cd ~; rm -rf docker-noflo-runtime-js; git clone https://github.com/sejnub/docker-noflo-runtime-js.git
    cd ~/docker-noflo-runtime-js; docker build --no-cache=false -t sejnub/noflo-runtime-js:rpi-latest .
    
    eof


## Push images to https://hub.docker.com

If you are not sejnub you have to retag the images to your username at dockerhub and use those new tags. The following commands use the authors tags.

Log into dockerhub and push the images with
    
    docker login
    docker push sejnub/noflo-runtime-js:rpi-latest


## Create env-file
You have to create an env-file `/usr/local/etc/sejnub-credentials.env` with the following content

    # noflo-runtime-js
    SEJNUB_FLOWHUB_USERID=<your-user-id-that-you-got-from-flowhub>
    SEJNUB_NOFLO_RUNTIME_HOST=<ip-or-hostname-which-can-be-used-to-access-the-runtime>


## Run interactively

After having created the env-file you can run the container with

    docker rm -f nojs; docker run -it --env-file /usr/local/etc/sejnub-credentials.env -e "label=rpi-11:47" -e "secret-string" --name nojs -p 3569:3569 sejnub/noflo-runtime-js:rpi-latest /bin/bash
    
    eof


## Run for production

    docker rm -f nojs; docker run -d --env-file /usr/local/etc/sejnub-credentials.env -e "label=rpi-11:47" -e "secret-string" --name nojs -p 3569:3569 sejnub/noflo-runtime-js:rpi-latest 
    
    
    eof

The specified port on the host $SEJNUB_NOFLO_RUNTIME_HOST must be accesible from the internet.


## Links
https://docs.flowhub.io/getting-started-node/




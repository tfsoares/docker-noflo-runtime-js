# docker-noflo-runtime-js
This is the source to build a docker container for [noflo-nodejs](https://github.com/noflo/noflo-nodejs).
There shall be an additional version for X86 in addition to the current ARM (Raspberry Pi) version.

## Very short: How do I use it?
Install docker engine on a Raspberry Pi and then run 
    
    docker run -d -e "FLOWHUB_USERID=<user-id>" -e "NOFLO_RUNTIME_HOST=<host>" -e "NOFLO_RUNTIME_SECRET=<secret>" -e "NOFLO_RUNTIME_LABEL=<label>" --name nojs -p 3569:3569 tfsoares/noflo-runtime-js:latest 
    
and now the longer version:


## Status and rights
Seems to be working. 
Totally free to use by everyone.


## Tags
  * **``latest``**  Latest version


## Clean up before build
    docker rm $(docker ps -a -f status=exited -q)
    docker rmi $(docker images -f dangling=true -q)
    docker volume rm $(docker volume ls -f dangling=true -q)
    

## Build
    
    cd ~; rm -rf docker-noflo-runtime-js; git clone https://github.com/sejnub/docker-noflo-runtime-js.git
    cd ~/docker-noflo-runtime-js; docker build --no-cache=false -t tfsoares/noflo-runtime-js:latest .


## Push images to https://hub.docker.com

If you are not sejnub you have to retag the images to your username at dockerhub and use those new tags. The following commands use the authors tags.

Log into dockerhub and push the images with
    
    docker login
    docker push tfsoares/noflo-runtime-js:latest


## Create env-file (optional)
You have to create an env-file `/usr/local/etc/sejnub-credentials.env` with the following content

    # noflo-runtime-js
    FLOWHUB_USERID=<your-user-id-that-you-got-from-flowhub>
    NOFLO_RUNTIME_HOST=<ip-or-hostname-which-can-be-used-to-access-the-runtime>
    NOFLO_RUNTIME_SECRET=<freely-choosable-secret-string>
    NOFLO_RUNTIME_LABEL=<freely-choosable-label>


## Run interactively

Depending on if you created the env-file you run one of the following commands

    docker rm -f nojs; docker run -it -e "FLOWHUB_USERID=<user-id>" -e "NOFLO_RUNTIME_HOST=<host>" -e "NOFLO_RUNTIME_SECRET=<secret>" -e "NOFLO_RUNTIME_LABEL=<label>" --name nojs -p 3569:3569 tfsoares/noflo-runtime-js:latest /bin/bash
    docker rm -f nojs; docker run -it --env-file /usr/local/etc/sejnub-credentials.env --name nojs -p 3569:3569 tfsoares/noflo-runtime-js:latest /bin/bash


## Run for production

Depending on if you created the env-file you run one of the following commands

    docker rm -f nojs; docker run -d -e "FLOWHUB_USERID=<user-id>" -e "NOFLO_RUNTIME_HOST=<host>" -e "NOFLO_RUNTIME_SECRET=<secret>" -e "NOFLO_RUNTIME_LABEL=<label>" --name nojs -p 3569:3569 sejnub/noflo-runtime-js:latest 
    docker rm -f nojs; docker run -d --env-file /usr/local/etc/sejnub-credentials.env --name nojs -p 3569:3569 tfsoares/noflo-runtime-js:latest

or you can also use a mix like e.g.

    docker rm -f nojs; docker run -d --env-file /usr/local/etc/sejnub-credentials.env -e "NOFLO_RUNTIME_LABEL=<label>" --name nojs -p 3569:3569 tfsoares/noflo-runtime-js:latest



The specified port on the host $NOFLO_RUNTIME_HOST must be accesible from the browser.


## Links
https://docs.flowhub.io/getting-started-node/


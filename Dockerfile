FROM hypriot/rpi-node:latest

# https://docs.flowhub.io/getting-started-node/

# Prepare a Node.js project
RUN mkdir noflo-example      && \
    cd noflo-example         && \
    npm init --yes           
    
# Install NoFlo itself     
RUN npm install noflo --save 
    
# Install a few components (there are many more)     
RUN npm install noflo-filesystem --save && \
    npm install noflo-core       --save && \  
    npm install noflo-mqtt       --save   

# Install the runtime
RUN npm install noflo-nodejs --save

# Configure local runtime
ARG HB_FLOWHUB_USERID
ARG HB_NOFLO_RUNTIME_HOST
RUN node node_modules/.bin/noflo-nodejs-init --user $HB_FLOWHUB_USERID --host $HB_NOFLO_RUNTIME_HOST --port 3569 --label "Local NoFlo Test"

# Start the runtime
CMD node node_modules/.bin/noflo-nodejs --capture-output=true

# TODO: The runtime does register at app.flowhub.io but it is registered 
#       with the local ip of the container 172.17,... and so the flowhub-app can't reach the runtime. Why is this?

EXPOSE 3569

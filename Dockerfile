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
    npm install noflo-amqp       --save && \  
    npm install noflo-packets    --save && \  
    npm install noflo-mqtt       --save   

# Install the runtime
RUN npm install noflo-nodejs --save

# Configure local runtime
ARG HB_FLOWHUB_USERID
ARG HB_NOFLO_RUNTIME_HOST
ENV ENV_HOST=$HB_NOFLO_RUNTIME_HOST

RUN node node_modules/.bin/noflo-nodejs-init --user $HB_FLOWHUB_USERID --host $HB_NOFLO_RUNTIME_HOST --port 3569 --label "noflojs runtime on raspi"

# Start the runtime
# Usage: node_modules/.bin/noflo-nodejs [options]
# 
# Options:
#   --graph             Path to a graph file to start
#   --capture-output    Catch writes to stdout and send to the FBP protocol client  [boolean] [default: false]
#   --catch-exceptions  Catch exceptions and report to the FBP protocol client  [boolean] [default: true]
#   --debug             Start the runtime in debug mode  [boolean] [default: false]
#   --verbose           Log in verbose format  [boolean] [default: false]
#   --cache             Enable component cache  [boolean] [default: false]
#   --batch             Exit when the graph finished  [default: false]
#   --trace             Record flowtrace. If batch is enabled, will  [default: false]
#   --ide               Url where the noflo-ui runs.
#   --uuid              Runtime UUID
#   --host              Hostname or IP for the runtime. Use "autodetect" or "autodetect(<iface>)" for dynamic detection.  [default: "autodetect"]
#   --port              Port for the runtime.  [number] [default: 3569]
#   --secret            Secret string to be used for the connection.
#   --permissions       Permissions  [default: "protocol:component,protocol:runtime,protocol:graph,protocol:network,component:getsource,component:setsource"]
#   --register          Register the runtime with Flowhub  [boolean] [default: true]
#   --0.7.2             V  [boolean]
#   -h, --help          Show help  [boolean]
CMD node node_modules/.bin/noflo-nodejs --host $ENV_HOST --capture-output=true


# TODO: The runtime does register at app.flowhub.io but it is registered 
#       with the local ip of the container 172.17,... and so the flowhub-app can't reach the runtime. Why is this?

EXPOSE 3569

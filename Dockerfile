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
    npm install noflo-core --save   

# Install the runtime
RUN npm install noflo-nodejs --save

# Configure local runtime
RUN node node_modules/.bin/noflo-nodejs-init --user $HB_FLOWHUB_USERID --host localhost --port 3569 --label "Local NoFlo Test"

# Start the runtime
CMD node node_modules/.bin/noflo-nodejs --capture-output=true



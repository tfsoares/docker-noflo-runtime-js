# Configure local runtime
# Usage: node_modules/.bin/noflo-nodejs-init [options]
# 
# Options:
#   --user         Unique Identifier for the runtime owner.  [default: "fe5e8086-0299-4b9a-8166-ea62e75e694a"]
#   --host         Hostname or IP for the runtime. Use "autodetect" or "autodetect(<iface>)" for dynamic detection.  [default: "home.bunjes.net"]
#   --port         Port for the runtime.  [number] [default: 3569]
#   --label        Human-readable label for the runtime.  [default: "Raspi Runtime 2"]
#   --secret       Secret string to be used for the connection.  [default: ",i0xJfVE"]
#   --id           Unique Identifier for the runtime instance.  [default: "7fc432e9-a77a-45fe-a2c4-adf8ad777d49"]
#   --permissions  Permissions  [default: "protocol:component,protocol:runtime,protocol:graph,protocol:network,component:getsource,component:setsource"]
#   --0.7.2        V  [boolean]
#   -h, --help     Show help  [boolean]

node node_modules/.bin/noflo-nodejs-init --user $SEJNUB_FLOWHUB_USERID --host $SEJNUB_NOFLO_RUNTIME_HOST --port 3569 --label $label


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

node node_modules/.bin/noflo-nodejs --host $SEJNUB_NOFLO_RUNTIME_HOST --capture-output=true


# TODO: It seems that I have to set the host again in the next CMD. Why is this? 
#       I did set it with "noflo-nodejs-init --host" so why set it again with "noflo-nodejs --host "?
#       If I don't set it again here the runtime does register at app.flowhub.io but it is registered 
#       with the local ip of the container 172.17,... and so the flowhub-app can't reach the runtime. 
#
#       But even if I set it heree again the registration vanishes from app.flowhub.io after the first
#       use and I can't find a way to use it in a github synced project.

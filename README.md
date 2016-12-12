#Kubernetes Config Map File test.

This is a simple test to see how ConfigFiles work in Kubernetes

# How to demonstrtate

run `./run_example.sh` will push a first config map (as a file), followed by an
NGINX node that pulls in the main index file from the config map contents. The
Grep is used to show only what is changing. It will connect to the container every
5 seconds and print out the line we expect to change. The script will exit and delete the
resources after 120 seconds.

The script will push a second script (config_change) to the background. This second script will push a change to the config map contents (the contents of the index file) after 10 seconds.

The goal of this is to demonstrate :

- How to put a file in a config map
- How to map the config map file to the container.
- The impact of a config map change on a running container.
- How long it takes for the change to propagate.

# Additional information

Additional information on Config Maps can be found in :
http://kubernetes.io/docs/user-guide/configmap/

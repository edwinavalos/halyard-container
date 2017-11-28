# halyard-container

A simple halyard container that contains both the CLI and the daemon. The daemon and CLI are contained in /opt/halyard/bin.

You can do a few different things with this container, like run it in daemon mode in a k8s cluster to have a persistent halyard daemon, and then use the container to talk to the remote container via hal cli flags. More to come documentation wise.

#!/bin/bash

# Make the directories, fix permissions

sudo mkdir -p /opt/garrysmod && chown 1000:1000 /opt/garrysmod

# Get the requisites

# ** This is where you would put requisites such as addons to download automatically before running the container, such as cloning a repository into garrysmod/garrysmod/addons etc.

docker run -d -it --name gmod -v /opt/garrysmod:/opt/garrysmod -p 27015:27015/udp +maxplayers 8 +map gm_flatgrass

# If you choose to enable RCON, be sure to have it specifically set for your internal IP if you don't want it exposed. It is unethical to port forward 27015/tcp to the public. Add -p <local ip address>:27015/tcp to your parameter.
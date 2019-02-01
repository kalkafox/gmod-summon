# gmod-summon

This is an edit from kalka/gmod to implement gmod into the image itself rather than having the container download it instead.

---

Garry's Mod image. What it says on the can.

This integrates with the base image kalka/steamcmd.

This ships with CS:S for your convenience. A version without CS:S can be used with the tag: `kalka/gmod:no-css`

## Quick-start

`docker run --rm -it kalka/gmod:no-css`

If you want something simple with no parameters.

## Running the container

`sudo mkdir -p /opt/garrysmod && sudo chown 1000:1000 /opt/garrysmod`

Run it just like with any Garry's Mod instance:

`docker run --rm -it -v /opt/garrysmod:/opt/garrysmod -p 27015:27015/udp kalka/gmod +maxplayers 8 +gamemode sandbox +map gm_flatgrass`

`-it` is required for interactive mode unless you really want to have a bad time trying to kill the script.

To daemonize:

`docker run -d -v /opt/garrysmod:/opt/garrysmod -p 27015:27015/udp kalka/gmod +maxplayers 8 +gamemode sandbox +map gm_flatgrass`

Do `docker ps` to see it running. To attach to it, do `docker attach gmod`. You will attach to the console.

You can choose to add `-p 27015:27015/tcp` to the command line, keep in mind though that this will expose the RCON instance in SRCDS publicly. It is best to use an internal IP for rcon if you have an internal network, like so: `-p 10.x.x.x:27015:27015/tcp`

## Automated run

Take the base `run.sh` and change it how you will. The reason why this is not on the docker entrypoint is to allow users who pull the image from DockerHub to edit the sh file with ease. All the documentation is on the file.


## Refs

This project also has the ability to use an environment variable to force an update if your gameserver requires an update or needs to validate gameserver files. Append `-e update=true` to your script and SteamCMD will run.

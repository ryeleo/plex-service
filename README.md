# plex-service

Plex Media Server service for R2D2 environment.

## Overview of Docker Compose 

I simply followed the docker-hub documentation for the [plexinc/pms-docker docker image](https://hub.docker.com/r/plexinc/pms-docker/).
See docker-compose.yml for more details.


### Host network on Windows?

I tried using the super simple `host` network solution at first, but it turns out that Windows doesn't suppport `host` network. 
So I went with the slightely more complicated `bridge` solution, which works well!

> The host networking driver only works on Linux hosts, and is not supported on Docker Desktop for Mac, Docker Desktop for Windows, or Docker EE for Windows Server.

From Docker Docs ["Use host networking"](https://docs.docker.com/network/host/) article.

## Windows Startup 

It is simple to set up a start-up task so that the service will run on start-up. 
First, we need a file that windows cmder knows how to execute: a batch (.bat) file works for me!

See `run-plex.bat`.

I followed [a simple guide](https://www.computerhope.com/issues/ch000322.htm) for building a start-up task that runs run-plex.bat!

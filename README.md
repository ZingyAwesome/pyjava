# ptero-pyjava
A docker image for Pterodactyl Panel, supporting Python 3.8 and Java 11 JRE. This was primarily made for ARM64 support as Pterodactyl does not have any images that support ARM64.


You can either pull the ARM64 build from the Docker hub: https://hub.docker.com/r/zincxx/pyjava or build it yourself for other platforms.
To build this docker image, download the Dockerfile and entrypoint script to a directory. Then you can run `docker build .` to build it.

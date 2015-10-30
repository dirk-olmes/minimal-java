# Minimal Java Docker image

This is a minimal Docker image based on the [busybox image](https://hub.docker.com/_/busybox/) that hosts the latest available Oracle JDK 8. 

The main intent of this image is to be as small as possible, i.e. add only what's absolutely required to run the JDK. That is basically `libgcc` which is taken directly from an ubuntu package.

## Building
The wget command that comes as part of the JDK does not support https. So it is not possible to download the JDK while building the image so you'll have to do this step before. Put the jdk `.tar.gz` it in the directory that contains the Dockerfile. 

To build the image, just run `make`.

## Running
To run the image, type `make run`

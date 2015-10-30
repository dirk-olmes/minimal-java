# Minimal Java Docker image

This is a minimal Docker image based on the [busybox image](https://hub.docker.com/_/busybox/) that hosts the latest available Oracle JDK 8. 

The main intent of this image is to be as small as possible, i.e. add only what's absolutely required to run the JDK. That is basically `libgcc` which is taken directly from an ubuntu package.

## Building
To keep the image as small as possible, the filesystem is built into the `rootfs` folder before invoking `docker build`.

To build the image, just run `make`.

## Running
To run the image, type `make run`

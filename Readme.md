# Minimal Java Docker image

This is a minimal Docker image based on the [busybox image](https://hub.docker.com/_/busybox/) that hosts the latest available Oracle JDK 8. 

The main intent of this image is to be as small as possible, i.e. add only what's absolutely required to run the JDK. 

This repository has two branches that use different approaches to build the image:
* The _build-from-dockerfile_ branch uses the common approach to build an image by putting all the necessary steps into Dockerfile.
* The _bulid-from-shell_ branch prepares the filesystem that is copied into the image before invoking `docker build`. The Dockerfile is merely a COPY operation.

The results are quite remarkable:

REPOSITORY          | TAG        | VIRTUAL SIZE
--------------------|------------|-------------
codedo/minimal-java | dockerfile | 552 MB
codedo/minimal-java | shell      | 370.6 MB

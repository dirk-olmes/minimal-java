FROM busybox:ubuntu
MAINTAINER dirk.olmes@codedo.de

COPY rootfs /

# fix the permissions in /tmp and ownership of the jdk
RUN chmod 1777 /tmp 

ENV PATH=/opt/jdk1.8.0_66/bin

# run as non-root user
USER java

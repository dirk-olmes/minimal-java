FROM busybox:ubuntu
MAINTAINER dirk.olmes@codedo.de

RUN  mkdir /opt
COPY jdk-8u66-linux-x64.tar.gz /tmp/
RUN  cd /opt && \
     tar xzf /tmp/jdk-8u66-linux-x64.tar.gz && \
     rm /tmp/jdk-8u66-linux-x64.tar.gz

RUN  wget -O /tmp/libgcc1_4.9.1-0ubuntu1_amd64.deb http://launchpadlibrarian.net/180165770/libgcc1_4.9.1-0ubuntu1_amd64.deb && \
	 ar vx /tmp/libgcc1_4.9.1-0ubuntu1_amd64.deb && \
     tar xJf data.tar.xz && \
     cp lib/x86_64-linux-gnu/libgcc_s.so.1 /lib && \
     rm -rf /tmp/*

# fix the permissions in /tmp
RUN chmod 1777 /tmp

ENV PATH=/opt/jdk1.8.0_66/bin

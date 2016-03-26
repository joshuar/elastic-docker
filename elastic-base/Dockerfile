FROM fedora:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"
LABEL license="Apache 2.0"

# Install necessary programs
RUN dnf -q -y install tar gpg

# Download and install gosu
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64.asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

ENTRYPOINT ["/usr/bin/env"]
CMD ["bash"]

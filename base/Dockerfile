FROM fedora:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"
LABEL license="Apache 2.0"

ARG GOSU_VERSION

# Install necessary programs
RUN dnf -q -y install tar gpg hostname

# Download and install gosu
RUN gpg --quiet --batch --yes --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -s -o /usr/local/bin/gosu -SL https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64 \
    && curl -s -o /usr/local/bin/gosu.asc -SL https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64.asc \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

ENTRYPOINT ["/usr/bin/env"]
CMD ["bash"]

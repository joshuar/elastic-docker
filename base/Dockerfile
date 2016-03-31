FROM fedora:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"
LABEL license="Apache 2.0"

# Install necessary programs
RUN dnf -q -y install tar gpg hostname
RUN dnf -q -y upgrade

# Download and install gosu
RUN gpg --quiet --batch --yes --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -q -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64" \
    && curl -q -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64.asc" \
    && gpg --quiet ---batch --yes --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

ENTRYPOINT ["/usr/bin/env"]
CMD ["bash"]

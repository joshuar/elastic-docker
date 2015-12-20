FROM fedora:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"
LABEL license="Apache 2.0"

# Download and install Oracle Server JRE
COPY install-server-jre.sh /
RUN dnf -q -y --nogpgcheck install tar && dnf -q clean all && \
    bash /install-server-jre.sh && rm -f /install-server-jre.sh && \
    rm -f /install-server-jre.sh

# Download and install gosu
RUN curl -s -L -o /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.6/gosu-amd64" && \
    chmod +x /usr/local/bin/gosu

ENTRYPOINT ["/usr/bin/env"]
CMD ["bash"]

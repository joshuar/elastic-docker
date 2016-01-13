FROM fedora:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"
LABEL license="Apache 2.0"

# Install necessary programs
RUN dnf -q -y install tar

# Download and install gosu
RUN curl -s -L -o /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.6/gosu-amd64" && \
    chmod +x /usr/local/bin/gosu

ENTRYPOINT ["/usr/bin/env"]
CMD ["bash"]

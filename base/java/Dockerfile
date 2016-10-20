FROM joshuar/gosu:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"
LABEL license="Apache 2.0"

# Download and install Oracle Server JRE
COPY install-server-jre.sh /
RUN bash /install-server-jre.sh && rm -f /install-server-jre.sh && \
    rm -f /install-server-jre.sh

ENTRYPOINT ["/usr/bin/env"]
CMD ["bash"]

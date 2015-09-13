FROM fedora:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"

RUN dnf -q -y --nogpgcheck install tar && dnf -q clean all

COPY install-server-jre.sh /
RUN bash /install-server-jre.sh && rm -f /install-server-jre.sh

ENTRYPOINT [ "/usr/bin/env", "bash" ]

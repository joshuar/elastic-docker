FROM fedora:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"

COPY curator.repo /etc/yum.repos.d/

RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch && \
    dnf -y install python-setuptools python-elasticsearch-curator

RUN useradd -U -d /home/curator -s /usr/bin/bash curator

USER curator

ENTRYPOINT [ "/usr/bin/bash" ]

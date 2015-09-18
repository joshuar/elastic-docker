FROM fedora:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"

RUN dnf -q -y --nogpgcheck install tar && dnf -q -y clean all

ENV KIBANA_VERSION=4.1.2

RUN mkdir -p /opt/kibana
RUN curl -s https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION-linux-x64.tar.gz \
    | tar -C /opt/kibana --strip-components=1 -xzf -

# ADD conf/kibana.yml /opt/kibana/config/kibana.yml

RUN dnf -q -y erase tar

RUN useradd -U -d /opt/kibana -M -s /usr/bin/bash kibana
RUN chown -R kibana:kibana /opt/kibana

USER kibana

ENTRYPOINT ["/opt/kibana/bin/kibana"]

EXPOSE "5601/tcp"

FROM centos:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"

RUN yum -q -y --nogpgcheck install tar && yum -q -y clean all

ENV KIBANA_VERSION=4.1.0

RUN mkdir -p /opt/kibana
RUN curl -s https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION-linux-x64.tar.gz \
    | tar -C /opt/kibana --strip-components=1 -xzf -

# ADD conf/kibana.yml /opt/kibana/config/kibana.yml

RUN useradd -U -d /opt/kibana -s /usr/bin/bash kibana
RUN chown -R kibana:kibana /opt/kibana

USER kibana

ENTRYPOINT ["/opt/kibana/bin/kibana"]

EXPOSE ["5601/tcp"]

FROM fedora:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"

ENV ES_VERSION 1.7.1
ENV ES_URL https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz

RUN dnf -q -y --nogpgcheck install tar && dnf -q clean all

COPY install-server-jre.sh /
RUN bash /install-server-jre.sh && rm -f /install-server-jre.sh

RUN curl -s -L -o - $ES_URL | tar -xz -C /opt \
    && ln -s /opt/elasticsearch-$ES_VERSION /opt/elasticsearch \
    && mkdir /opt/elasticsearch/{data,logs,plugins}

RUN dnf -q -y erase tar

COPY elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml
COPY logging.yml /opt/elasticsearch/config/logging.yml

RUN useradd -U -d /opt/elasticsearch -M -s /usr/bin/bash elasticsearch
RUN chown -R elasticsearch:elasticsearch /opt/elasticsearch-$ES_VERSION

VOLUME ["/opt/elasticsearch/data","/opt/elasticsearch/config","/opt/elasticsearch/logs","/opt/elasticsearch/plugins"]
EXPOSE "9200/tcp" "9300/tcp"

USER elasticsearch

ENTRYPOINT ["/opt/elasticsearch/bin/elasticsearch"]

FROM centos:latest

ENV ES_VERSION 1.6.0
ENV ES_URL https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz

RUN yum -q -y --nogpgcheck install tar && yum -q clean all

COPY install-oracle-jdk.sh /
RUN /install-oracle-jdk.sh && rm -f /install-oracle-jdk.sh

RUN curl -s -L -o - $ES_URL | tar -xz -C /opt \
    && ln -s /opt/elasticsearch-$ES_VERSION /opt/elasticsearch \
    && mkdir /opt/elasticsearch/{data,logs,plugins}

COPY elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml
COPY logging.yml /opt/elasticsearch/config/logging.yml

RUN useradd -U -d /opt/elasticsearch -s /usr/bin/bash elasticsearch
RUN chown -R elasticsearch:elasticsearch /opt/elasticsearch-$ES_VERSION

VOLUME ["/opt/elasticsearch/data","/opt/elasticsearch/config","/opt/elasticsearch/logs","/opt/elasticsearch/plugins"]
EXPOSE 9200 9300

USER elasticsearch

CMD /opt/elasticsearch/bin/elasticsearch

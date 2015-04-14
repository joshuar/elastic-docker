FROM centos:latest

RUN yum -q -y --nogpgcheck install tar && yum -q -y clean all

ENV KIBANA_VERSION=4.0.2

RUN mkdir -p /opt/kibana
RUN curl -s https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION-linux-x64.tar.gz \
    | tar -C /opt/kibana --strip-components=1 -xzf -

ADD conf/kibana.yml /opt/kibana/config/kibana.yml

EXPOSE 5601

CMD /opt/kibana/bin/kibana

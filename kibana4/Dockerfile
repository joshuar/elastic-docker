FROM centos

RUN yum -y -q --nogpgcheck update && yum -y -q clean all
RUN yum -y -q --nogpgcheck install tar && yum -y -q clean all

ENV KIBANA_VERSION=4.0.0

RUN mkdir -p /opt/kibana
RUN curl -s https://download.elasticsearch.org/kibana/kibana/kibana-$KIBANA_VERSION-linux-x64.tar.gz \
    | tar -C /opt/kibana --strip-components=1 -xzf -

ADD conf/kibana.yml /opt/kibana/config/kibana.yml

EXPOSE 5601

CMD /opt/kibana/bin/kibana

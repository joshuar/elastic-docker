FROM centos:latest

ENV LS_VERSION 1.5.0
ENV LS_URL https://download.elastic.co/logstash/logstash/logstash-$LS_VERSION.tar.gz

RUN yum -q -y --nogpgcheck install tar && yum -q clean all

COPY install-oracle-jdk.sh /
RUN /install-oracle-jdk.sh && rm -f /install-oracle-jdk.sh

RUN curl -s -L -o - $LS_URL | tar -xz -C /opt \
    && ln -s /opt/logstash-$LS_VERSION /opt/logstash
RUN mkdir -p /etc/logstash/conf.d
RUN mkdir -p /var/log/logstash

RUN useradd -U -d /opt/logstash -s /usr/bin/bash logstash
RUN chown -R logtash:logstash /opt/logstash-$LS_VERSION /etc/logstash /var/log/logstash


VOLUME ["/etc/logstash","/var/log/logtash"]

USER logstash

CMD /opt/logstash/bin/logstash

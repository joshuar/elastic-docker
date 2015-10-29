FROM fedora:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"

ENV LS_VERSION 2.0.0
ENV LS_URL https://download.elastic.co/logstash/logstash/logstash-$LS_VERSION.tar.gz

RUN dnf -q -y --nogpgcheck install tar && dnf -q clean all

COPY install-server-jre.sh /
RUN bash /install-server-jre.sh && rm -f /install-server-jre.sh

RUN curl -s -L -o - $LS_URL | tar -xz -C /opt \
    && ln -s /opt/logstash-$LS_VERSION /opt/logstash
RUN mkdir -p /etc/logstash/conf.d
RUN mkdir -p /var/log/logstash

RUN useradd -U -d /opt/logstash -M -s /usr/bin/bash logstash
RUN chown -R logstash:logstash /opt/logstash-$LS_VERSION /etc/logstash /var/log/logstash

VOLUME ["/etc/logstash","/var/log/logtash"]

USER logstash

ENTRYPOINT ["/opt/logstash/bin/logstash"]

FROM joshuar/elastic-base:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"

# Environment variables for:
# - Elasticsearch version
# - Elasticsearch download URL
# - User to run Elasticsearch as inside the container
# - UID to use for Elasticsearch user
ARG ES_VERSION
ENV ES_URL https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/rpm/elasticsearch/$ES_VERSION/elasticsearch-$ES_VERSION.rpm
ENV ES_USER elasticsearch
ENV ES_UID 900
ENV ES_HOME /usr/share/elasticsearch
ENV ES_CONF_DIR /etc/elasticsearch
ENV ES_DATA_DIR /var/lib/elasticsearch
ENV ES_LOG_DIR /var/log/elasticsearch
ENV ES_PID_DIR /var/run/elasticsearch

# Set up some custom labels for:
# - Elasticsearch version
# - Dockerfile license
LABEL version=$ES_VERSION \
      license="Apache 2.0"

# Install Java
RUN dnf -q -y install java-1.8.0-openjdk-headless java-1.8.0-openjdk-devel

# Download and install Elasticsearch into /opt/elasticsearch
RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch && \
    dnf -q -y install $ES_URL

# Install the commercial plugins.  These still need a license, which can be loaded
# after starting the container.
RUN $ES_HOME/bin/plugin install --batch license && \
    $ES_HOME/bin/plugin install --batch marvel-agent && \
    $ES_HOME/bin/plugin install --batch watcher && \
    $ES_HOME/bin/plugin install --batch shield && \
    $ES_HOME/bin/plugin install --batch graph

RUN old_es_user=$(id -u elasticsearch); \
    usermod -u $ES_UID $ES_USER; \
    find / -xdev -user $old_es_user -exec chown -h $ES_USER {} +

# Performance Tweaks
RUN echo "$ES_USER - nofile 65535" >> /etc/security/limits.conf && \
    echo "$ES_USER - memlock unlimited" >> /etc/security/limits.conf && \
    echo vm.max_map_count=262144 > /etc/sysctl.d/max_map_count.conf
ENV MAX_OPEN_FILES=65535
ENV MAX_LOCKED_MEMORY=unlimited
ENV MAX_MAP_COUNT=262144

# Volumes to mount on host
VOLUME $ES_DATA_DIR $ES_CONF_DIR $ES_LOG_DIR
WORKDIR $ES_HOME

# Install entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set up entrypoint, forwarded ports and default command
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE "9200/tcp" "9300/tcp"
CMD ["elasticsearch"]

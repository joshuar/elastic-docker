FROM joshuar/elastic-base:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"

# Environment variables for:
# - Elasticsearch version
# - Elasticsearch download URL
# - User to run Elasticsearch as inside the container
# - UID to use for Elasticsearch user
ENV ES_VERSION 2.1.1
ENV ES_URL https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/$ES_VERSION/elasticsearch-$ES_VERSION.tar.gz
ENV ES_USER elasticsearch
ENV ES_UID 900

# Set up some custom labels for:
# - Elasticsearch version
# - Dockerfile license
LABEL version=$ES_VERSION \
      license="Apache 2.0"

# Install Java
RUN dnf -q -y install java-1.8.0-openjdk-headless java-1.8.0-openjdk-devel

# Download and install Elasticsearch into /opt/elasticsearch
RUN mkdir /opt/elasticsearch && \
    curl -s -L -o - $ES_URL | tar -C /opt/elasticsearch --strip-components=1 --owner=root --group=root -xzf - && \
    dnf -q -y erase tar && \
    mkdir /opt/elasticsearch/{data,logs,plugins}

# Copy over default Elasticsearch general/logging configuration files
COPY elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml
COPY logging.yml /opt/elasticsearch/config/logging.yml

# Create the Elasticsearch user
RUN useradd -r -u $ES_UID -d /opt/elasticsearch -s /usr/bin/bash $ES_USER && \
    chown -R $ES_USER:root /opt/elasticsearch/{data,logs,plugins,config} && \
    chmod u+rwx /opt/elasticsearch/{data,logs,plugins,config}

# Install the commercial plugins.  These still need a license, which can be loaded
# after starting the container.
RUN /opt/elasticsearch/bin/plugin install license && \
    /opt/elasticsearch/bin/plugin install marvel-agent && \
    /opt/elasticsearch/bin/plugin install watcher && \
    /opt/elasticsearch/bin/plugin install shield

# Volumes to mount on host
VOLUME ["/opt/elasticsearch/data","/opt/elasticsearch/config","/opt/elasticsearch/logs"]
WORKDIR [ "/opt/elasticsearch" ]

# Install entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set up entrypoint, forwarded ports and default command
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE "9200/tcp" "9300/tcp"
CMD ["elasticsearch"]

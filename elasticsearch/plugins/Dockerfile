ARG ES_VERSION

FROM joshuar/elasticsearch:$ES_VERSION

# Install the commercial plugins.  These still need a license, which can be loaded
# after starting the container.
RUN /opt/elasticsearch/bin/plugin install license && \
    /opt/elasticsearch/bin/plugin install marvel-agent && \
    /opt/elasticsearch/bin/plugin install watcher && \
    /opt/elasticsearch/bin/plugin install shield

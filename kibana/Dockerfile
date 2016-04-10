FROM joshuar/elastic-base:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"

# Environment variables for:
# - Kibana version
# - Kibana download URL
# - User to run Kibana as inside the container
# - UID to use for Kibana user
ARG KB_VERSION
ENV KB_URL https://download.elastic.co/kibana/kibana/kibana-$KB_VERSION-linux-x64.tar.gz
ENV KB_USER kibana
ENV KB_UID 900

# Set up some custom labels for:
# - Kibana version
# - Dockerfile license
LABEL version=$KB_VERSION \
      license="Apache 2.0"

# Download and install Kibana
RUN mkdir -p /opt/kibana && \
    curl -s -L $KB_URL | tar -C /opt/kibana --strip-components=1 -xzf - && \
    dnf -q -y erase tar

# Create Kibana user
RUN useradd -r -u $KB_UID -d /opt/kibana -s /usr/bin/bash $KB_USER

# Install plugins
RUN /opt/kibana/bin/kibana plugin --install elasticsearch/marvel/latest && \
    /opt/kibana/bin/kibana plugin --install elasticsearch/graph/latest && \
    /opt/kibana/bin/kibana plugin --install elastic/sense && \
    /opt/kibana/bin/kibana plugin --install kibana/timelion && \
    /opt/kibana/bin/kibana plugin -i tagcloud -u https://github.com/stormpython/tagcloud/archive/master.zip && \
    /opt/kibana/bin/kibana plugin -i heatmap -u https://github.com/stormpython/heatmap/archive/master.zip && \
    /opt/kibana/bin/kibana plugin -i vectormap -u https://github.com/stormpython/vectormap/archive/master.zip

# Copy over default Kibana configuration file
COPY kibana.yml /opt/kibana/config/kibana.yml

# Fix permissions
RUN chown -R kibana:kibana /opt/kibana

# Set working directory
VOLUME [ "/opt/kibana/config" ]
WORKDIR [ "/opt/kibana" ]

# Install entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set up entrypoint, forwarded ports and default command
ENTRYPOINT [ "/entrypoint.sh" ]
EXPOSE "5601/tcp"
CMD [ "kibana" ]

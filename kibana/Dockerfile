FROM fedora:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"

# Environment variables for:
# - Kibana version
# - Kibana download URL
# - User to run Kibana as inside the container
# - UID to use for Kibana user
ENV KB_VERSION 4.3.0
ENV KB_URL https://download.elasticsearch.org/kibana/kibana/kibana-$KB_VERSION-linux-x64.tar.gz
ENV KB_USER kibana
ENV KB_UID 900
ENV GOSU_URL https://github.com/tianon/gosu/releases/download/1.6/gosu-amd64

# Set up some custom labels for:
# - Kibana version
# - Dockerfile license
LABEL version=$KB_VERSION \
      license="Apache 2.0"

# Download and install Kibana
RUN dnf -q -y --nogpgcheck install tar && dnf -q -y clean all && \
    mkdir -p /opt/kibana && \
    curl -s $KB_URL | tar -C /opt/kibana --strip-components=1 -xzf - && \
    dnf -q -y erase tar

# Download and install gosu
RUN curl -s -L -o /usr/local/bin/gosu $GOSU_URL && \
    chmod +x /usr/local/bin/gosu

# Create Kibana user
RUN useradd -r -u $KB_UID -d /opt/kibana -s /usr/bin/bash $KB_USER

# Install Marvel plugin
RUN /opt/kibana/bin/kibana plugin --install elasticsearch/marvel/latest

# Install Sense plugin
RUN /opt/kibana/bin/kibana plugin --install elastic/sense

# Install Timelion plugin
RUN /opt/kibana/bin/kibana plugin --install kibana/timelion

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

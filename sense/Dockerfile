FROM joshuar/elastic-base:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"

# Environment variables for:
# - Kibana version
# - Kibana download URL
# - User to run Kibana as inside the container
# - UID to use for Kibana user
ARG KB_VERSION
ENV KB_URL https://download.elastic.co/kibana/kibana/kibana-$KB_VERSION-1.x86_64.rpm
ENV KB_USER kibana
ENV KB_UID 900
ENV KB_HOME /opt/kibana


# Set up some custom labels for:
# - Kibana version
# - Dockerfile license
LABEL version=$KB_VERSION \
      license="Apache 2.0"

# Download and install Kibana
RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch && \
    dnf -q -y install $KB_URL

# Install plugins
RUN $KB_HOME/bin/kibana plugin --install elastic/sense

COPY kibana.yml $KB_HOME/config/kibana.yml

RUN old_kb_user=$(id -u kibana); \
    usermod -u $KB_UID $KB_USER && \
    dnf -q -y install findutils && \
    find / -xdev -user $old_kb_user -exec chown -h $KB_USER {} + && \
    dnf -q -y remove findutils && \
    chown -R $KB_USER $KB_HOME/optimize

# Set working directory
VOLUME ["$KB_HOME/config"]
WORKDIR [$KB_HOME ]

# Install entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set up entrypoint, forwarded ports and default command
ENTRYPOINT [ "/entrypoint.sh" ]
EXPOSE "5601/tcp"
CMD [ "kibana" ]

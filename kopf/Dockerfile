FROM joshuar/elastic-base:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"

# Set up some custom labels for:
# - Kibana version
# - Dockerfile license
LABEL version=$KOPF_VERSION \
      license="Apache 2.0"

# Environment variables for:
# - Kibana version
# - Kibana download URL
# - User to run Kibana as inside the container
# - UID to use for Kibana user
ARG KOPF_VERSION
ENV KOPF_URL https://github.com/lmenezes/elasticsearch-kopf/archive/v$KOPF_VERSION.tar.gz
ENV KOPF_HOME /opt/kopf

# Install Nginx
RUN dnf -y install nginx
COPY nginx-kopf.conf /etc/nginx/nginx.conf
RUN chown nginx /etc/nginx/nginx.conf

# Install Kopf
RUN mkdir /opt/kopf && curl -s -L $KOPF_URL | tar xz -C $KOPF_HOME --strip-components=1 && \
    chown -R nginx $KOPF_HOME

# Install entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set working directory
VOLUME ["/var/log/nginx"]

# Set up entrypoint, forwarded ports and default command
ENTRYPOINT [ "/entrypoint.sh" ]
EXPOSE "8080/tcp"
CMD [ "kopf" ]

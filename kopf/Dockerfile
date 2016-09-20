FROM node

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


# Create a Kopf user
RUN adduser --disabled-password --gecos "Kopf User" kopf

WORKDIR /home/kopf

# Install grunt
RUN npm install -g grunt

USER kopf

# Install Kopf
RUN curl -s -L $KOPF_URL | tar xz -C /home/kopf --strip-components=1 && \
    npm install

# Set up entrypoint, forwarded ports and default command
EXPOSE "9000/tcp"
ENTRYPOINT [ "grunt" ]
CMD [ "server" ]

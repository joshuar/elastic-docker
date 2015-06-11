FROM ubuntu:latest

MAINTAINER Joshua Rich "joshua.rich@gmail.com"

# Tell debconf to run in non-interactive mode
ENV DEBIAN_FRONTEND noninteractive

# Update package lists
RUN apt-get -y update

# Install curl, needed to install JRE
RUN apt-get -y install curl

# Install Java Server JRE
COPY install-server-jre.sh /
RUN bash /install-server-jre.sh && rm -f /install-server-jre.sh

# Install BubbleUPnP Server
RUN apt-get -y install python-software-properties \
    && add-apt-repository ppa:bubbleguuum/bubbleupnpserver \
    && apt-get -y install bubbleupnpserver

COPY bubbleupnpserver /etc/default/bubbleupnpserver

# Create a user to run BubbleUPnP Server
RUN adduser --disabled-password --gecos "BubbleUPnP" bubbleupnp

USER bubbleupnp

# Start BubbleUPnP Server
ENTRYPOINT ["start",  "bubbleupnpserver"]

# Expose the BubbleUPnP Server port
EXPOSE ["58050/tcp","58051/tcp","1900/udp"]

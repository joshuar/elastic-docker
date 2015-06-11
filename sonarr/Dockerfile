FROM ubuntu

MAINTAINER Joshua Rich <joshua.rich@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC
RUN echo "deb http://apt.sonarr.tv/ master main" | tee /etc/apt/sources.list.d/sonarr.list
RUN sed -i -e 's|archive.ubuntu.com|au.archive.ubuntu.com|g' /etc/apt/sources.list

RUN apt-get update && apt-get -y install nzbdrone mediainfo
RUN apt-get clean

RUN groupadd sonarr
RUN useradd -g sonarr -d /home/sonarr -m -s /bin/bash sonarr

USER sonarr
EXPOSE 8989
CMD mono /opt/NzbDrone/NzbDrone.exe -nobrowser

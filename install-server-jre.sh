#!/usr/bin/env bash

dlurl=$(curl -s -o - "http://www.oracle.com/technetwork/java/javase/downloads/index.html" \
               | tr ' ' '\n' | grep "/technetwork/java/javase/downloads/server-jre8" | head -n 1 \
               | cut -d\" -f 2 | sed -e 's/^/http:\/\/www.oracle.com/')
deburl=$(curl -s -o - ${dlurl} | grep "Linux x64" | grep ".tar.gz" | cut -d\" -f 12 | grep -v demos | head -n 1)
debfile=${deburl##*/}

mkdir -p /usr/lib/jre \
    && curl -s -L -o - --header 'Cookie: oraclelicense=a' "${deburl}" \
        | tar -xz -C /usr/lib/jre --strip-components=1 \
    && update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jre/bin/java" 1

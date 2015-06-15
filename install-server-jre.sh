#!/usr/bin/env bash

dlurl=$(curl -s -o - "http://www.oracle.com/technetwork/java/javase/downloads/index.html" \
               | tr ' ' '\n' | grep "/technetwork/java/javase/downloads/server-jre8" | head -n 1 \
               | cut -d\" -f 2 | sed -e 's/^/http:\/\/www.oracle.com/')
fileurl=$(curl -s -o - ${dlurl} | grep "Linux x64" | grep ".tar.gz" | cut -d\" -f 12 | grep -v demos | head -n 1)

mkdir -p /usr/lib/jre \
    && curl -s -L -o - --header 'Cookie: oraclelicense=a' "${fileurl}" \
        | tar -xz -C /usr/lib/jre --strip-components=1
if [[ -x $(type -P update-alternatives) ]]; then
    update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jre/bin/java" 1
else
    ln -s /usr/lib/jre/bin/java /usr/bin/java
fi

exit 0

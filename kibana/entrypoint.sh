#!/usr/bin/env bash
set -e

if [ "$1" = 'kibana' ]; then
    chown -R "${KB_USER}":root "${KB_HOME}/config"
    exec /usr/local/bin/gosu "${KB_USER}" "${KB_HOME}/bin/kibana"
fi

exec /usr/local/bin/gosu "${KB_USER}" "$@"

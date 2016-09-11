#!/usr/bin/env bash
set -e

if [ "$1" = 'kibana' ]; then
    exec /usr/local/bin/gosu kibana "${KB_HOME}/bin/kibana"
fi

exec /usr/local/bin/gosu root "$@"

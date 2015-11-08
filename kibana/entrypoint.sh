#!/usr/bin/env bash
set -e

if [ "$1" = 'kibana' ]; then
    chown -R $KB_USER:root /opt/kibana/config
    exec /usr/local/bin/gosu $KB_USER /opt/kibana/bin/kibana
fi

exec "$@"

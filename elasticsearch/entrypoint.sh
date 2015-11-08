#!/usr/bin/env bash
set -e

if [ "$1" = 'elasticsearch' ]; then
    chown -R $ES_USER:root /opt/elasticsearch/{config,data,plugins,logs}
    exec /usr/local/bin/gosu $ES_USER /opt/elasticsearch/bin/elasticsearch
fi

exec "$@"

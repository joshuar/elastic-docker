#!/usr/bin/env bash
set -e

if [[ "$1" = 'elasticsearch' ]]; then
    shift
	chown -R elasticsearch:elasticsearch ${ES_DATA_DIR}
    exec /usr/local/bin/gosu elasticsearch \
	 ${ES_HOME}/bin/elasticsearch \
	 -Ebootstrap.seccomp=false \
	 -Epath.logs="${ES_LOG_DIR}" \
	 -Epath.data="${ES_DATA_DIR}" \
	 -Epath.conf="${ES_CONF_DIR}"
fi

exec /usr/local/bin/gosu root "$@"

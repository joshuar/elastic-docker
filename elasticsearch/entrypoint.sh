#!/usr/bin/env bash
set -e

if [[ "$1" = 'elasticsearch' ]]; then
    shift
    exec /usr/local/bin/gosu elasticsearch \
	 /usr/share/elasticsearch/bin/elasticsearch \
	 -Des.pidfile="${ES_PID_DIR}/elasticsearch.pid" \
	 -Des.default.path.home="${ES_HOME}" \
	 -Des.default.path.logs="${ES_LOG_DIR}" \
	 -Des.default.path.data="${ES_DATA_DIR}" \
	 -Des.default.path.conf="${ES_CONF_DIR}" \
	 "$@"
fi

exec /usr/local/bin/gosu root "$@"

#!/usr/bin/env bash
set -e

if [[ "$1" = 'elasticsearch' ]]; then
    shift
    exec /usr/local/bin/gosu elasticsearch \
	 ${ES_HOME}/bin/elasticsearch \
	 -Des.bootstrap.seccomp=false \
	 -Des.default.path.home="${ES_HOME}" \
	 -Des.default.path.logs="${ES_LOG_DIR}" \
	 -Des.default.path.data="${ES_DATA_DIR}" \
	 -Des.default.path.conf="${ES_CONF_DIR}"
fi

exec /usr/local/bin/gosu root "$@"

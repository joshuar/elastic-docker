#!/usr/bin/env bash
set -e

if [[ "$1" = 'elasticsearch' ]]; then
    shift
    exec /usr/local/bin/gosu elasticsearch \
	 ${ES_HOME}/bin/elasticsearch \
	 -Ebootstrap.seccomp=false
fi

exec /usr/local/bin/gosu root "$@"

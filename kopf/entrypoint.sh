#!/usr/bin/env bash
set -e

if [ "$1" = 'kopf' ]; then
    KOPF_REFRESH_RATE="${KOPF_REFRESH_RATE:-5000}"
    KOPF_THEME="${KOPF_THEME:-dark}"
    KOPF_WITH_CREDENTIALS="${KOPF_WITH_CREDENTIALS:-false}"

    cat <<EOF > ${KOPF_HOME}/_site/kopf_external_settings.json
{
    "elasticsearch_root_path": "",
    "with_credentials": ${KOPF_WITH_CREDENTIALS},
    "theme": "${KOPF_THEME}",
    "refresh_rate": ${KOPF_REFRESH_RATE}
}
EOF
    exec /usr/local/bin/gosu nginx nginx -c /etc/nginx/nginx.conf
fi

exec "$@"

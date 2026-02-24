#!/usr/bin/env bash
set -ex -o pipefail

if [[ -z "${START_COMMAND}" ]]; then
    if command -v forever >/dev/null 2>&1; then
        forever start --id 'vulnogram' --spinSleepTime 5000 --minUptime 2000 app.js
        forever list
    else
        exec node app.js
    fi
else
    exec /bin/bash -c "${START_COMMAND}"
fi

#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o nounset
set -o pipefail
#set -o verbose

exec ${CATALINA_HOME}/bin/catalina.sh "$@"

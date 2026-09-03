#!/usr/bin/env bash
set -euo pipefail
: "${BASE_URL:?set BASE_URL}"
curl --fail --retry 5 --retry-all-errors "$BASE_URL/healthz"

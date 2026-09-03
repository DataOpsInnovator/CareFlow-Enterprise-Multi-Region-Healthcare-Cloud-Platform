#!/usr/bin/env bash
set -euo pipefail
for c in helm/*; do [ -f "$c/Chart.yaml" ] && helm lint "$c"; done

#!/usr/bin/env bash
set -euo pipefail
checkov -d terraform --config-file security/checkov/.checkov.yaml
trivy config --exit-code 1 --severity HIGH,CRITICAL terraform kubernetes helm

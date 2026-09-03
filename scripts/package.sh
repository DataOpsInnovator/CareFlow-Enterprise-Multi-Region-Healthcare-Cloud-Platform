#!/usr/bin/env bash
set -euo pipefail
name="careflow-final-enterprise-platform"
cd "$(dirname "$0")/.."
zip -qr "../${name}.zip" . -x '*.git*' '.terraform/*' '*.tfstate*' '.env'

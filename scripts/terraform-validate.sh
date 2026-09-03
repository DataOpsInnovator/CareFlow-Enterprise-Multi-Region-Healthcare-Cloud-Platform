#!/usr/bin/env bash
set -euo pipefail
for d in terraform/live/primary terraform/live/secondary bootstrap/state; do
  terraform -chdir="$d" init -backend=false >/dev/null
  terraform -chdir="$d" validate
done

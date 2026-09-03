#!/usr/bin/env bash
set -euo pipefail

echo "This command is intentionally explicit."
echo "Review AWS resources, confirm the environment, and then run:"
echo "terraform -chdir=terraform/live/dev destroy"

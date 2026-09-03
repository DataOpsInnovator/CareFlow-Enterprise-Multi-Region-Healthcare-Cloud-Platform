#!/usr/bin/env bash
set -euo pipefail

echo "Checking required tools..."
command -v terraform >/dev/null || { echo "terraform is required"; exit 1; }
command -v python3 >/dev/null || { echo "python3 is required"; exit 1; }

echo "Terraform format check..."
terraform fmt -check -recursive terraform

echo "Terraform syntax validation..."
terraform -chdir=terraform/live/dev init -backend=false
terraform -chdir=terraform/live/dev validate

echo "Application tests..."
python3 -m pytest -q tests/app tests/policies

echo "Validation complete."

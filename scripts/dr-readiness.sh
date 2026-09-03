#!/usr/bin/env bash
set -euo pipefail
: "${PRIMARY_REGION:=us-east-1}"; : "${SECONDARY_REGION:=us-west-2}"
echo "Checking region identity and required AWS access"
aws sts get-caller-identity >/dev/null
aws eks list-clusters --region "$PRIMARY_REGION" >/dev/null
aws eks list-clusters --region "$SECONDARY_REGION" >/dev/null
echo "DR readiness API checks passed; destructive failover requires approved runbook execution."

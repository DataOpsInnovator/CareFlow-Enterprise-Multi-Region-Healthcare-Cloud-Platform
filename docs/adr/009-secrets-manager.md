# ADR AWS Secrets Manager

## Decision
AWS Secrets Manager.

## Context
Portfolio workloads need managed secret lifecycle without operating Vault initially.

## Alternatives
Vault; Kubernetes Secrets

## Rationale
Managed AWS integration and lower operational burden.

## Consequences
Less flexible than Vault for some enterprise patterns.

## Revisit trigger
If multi-cloud/advanced secret workflows become requirements.

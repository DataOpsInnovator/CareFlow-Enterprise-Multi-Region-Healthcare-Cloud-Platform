# ADR GitHub OIDC

## Decision
GitHub OIDC.

## Context
Long-lived cloud credentials should be avoided.

## Alternatives
Static IAM keys

## Rationale
Short-lived federated credentials reduce credential exposure.

## Consequences
Requires trust-policy design.

## Revisit trigger
If enterprise identity mandates another broker.

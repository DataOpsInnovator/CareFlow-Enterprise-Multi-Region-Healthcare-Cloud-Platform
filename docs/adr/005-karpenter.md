# ADR Karpenter for application capacity

## Decision
Karpenter for application capacity.

## Context
Workload capacity is variable and node pools should be consolidated.

## Alternatives
Fixed node groups; Cluster Autoscaler

## Rationale
Dynamic provisioning and consolidation.

## Consequences
Additional platform complexity.

## Revisit trigger
If workload becomes highly static.

# ADR EKS over ECS

## Decision
EKS over ECS.

## Context
Kubernetes-native platform capabilities are central to the portfolio.

## Alternatives
ECS; EKS

## Rationale
EKS aligns with workload isolation, NetworkPolicy, Helm, Argo CD, and existing experience.

## Consequences
Higher operational burden.

## Revisit trigger
If workload becomes a single simple service.

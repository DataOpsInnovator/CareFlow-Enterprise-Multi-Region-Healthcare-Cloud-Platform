# ADR Loki/Grafana for portfolio logs

## Decision
Loki/Grafana for portfolio logs.

## Context
Kubernetes log exploration should remain lightweight.

## Alternatives
ELK; managed analytics

## Rationale
Lower footprint and integrates with existing dashboards.

## Consequences
Different query/storage characteristics than ELK.

## Revisit trigger
If enterprise log analytics integration becomes required.

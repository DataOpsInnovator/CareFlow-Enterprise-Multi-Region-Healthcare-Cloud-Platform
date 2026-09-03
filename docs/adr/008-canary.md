# ADR Canary progressive delivery

## Decision
Canary progressive delivery.

## Context
Risk should be limited before full promotion.

## Alternatives
Blue/green; rolling

## Rationale
Lower duplicate capacity and strong telemetry-driven rollback.

## Consequences
More orchestration than basic rolling.

## Revisit trigger
If instantaneous environment switching is required.

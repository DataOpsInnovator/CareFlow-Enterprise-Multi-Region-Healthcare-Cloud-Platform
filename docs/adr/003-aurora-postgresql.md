# ADR Aurora PostgreSQL for transactional metadata

## Decision
Aurora PostgreSQL for transactional metadata.

## Context
Clinical integration metadata has relational consistency requirements.

## Alternatives
DynamoDB; RDS PostgreSQL

## Rationale
Relational constraints and SQL are useful for workflow state.

## Consequences
Database operations and cost.

## Revisit trigger
If access patterns become key-value only.

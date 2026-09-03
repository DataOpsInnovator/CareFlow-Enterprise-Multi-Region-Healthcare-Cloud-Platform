# ADR Terraform owns AWS; Argo owns app state

## Decision
Terraform owns AWS; Argo owns app state.

## Context
Overlapping controllers create drift and conflicts.

## Alternatives
Terraform manages all; Argo manages all

## Rationale
Clear ownership boundaries.

## Consequences
Requires discipline around interfaces.

## Revisit trigger
If platform standard changes.

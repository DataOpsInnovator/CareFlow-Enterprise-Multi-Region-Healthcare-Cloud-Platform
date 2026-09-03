# ADR Warm standby regional recovery

## Decision
Warm standby regional recovery.

## Context
Active/active increases state and operational complexity.

## Alternatives
Backup/restore; pilot light; active/active

## Rationale
Warm standby demonstrates regional continuity at lower portfolio cost.

## Consequences
Failover is slower than active/active.

## Revisit trigger
If RTO requires near-zero regional transition.

# Disaster Recovery

## Strategy

Warm standby.

## Runbook

1. Detect sustained regional customer-impacting failure.
2. Incident Commander evaluates evidence.
3. Freeze routine production changes.
4. Validate secondary infrastructure and data state.
5. Scale secondary workloads.
6. Activate required consumers.
7. Promote/recover database state as applicable.
8. Change Route 53 traffic.
9. Run synthetic patient/API and clinical-event transactions.
10. Monitor recovery.
11. Restore/rebuild primary.
12. Return traffic only after validation and authorization.

## Objectives

Portfolio targets:

- RTO <= 60 minutes
- RPO <= 15 minutes

These are design objectives and must be validated experimentally.

## Abort conditions

- Secondary data state cannot be validated
- Security controls are degraded
- Synthetic validation fails
- Recovery action would increase data corruption risk

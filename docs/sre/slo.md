# SLOs

These are portfolio design objectives.

## API availability

Target: 99.9% monthly successful requests.

SLI = successful eligible requests / total eligible requests.

## API latency

Target: 99% of eligible requests complete under 500 ms.

## Event processing

Target: 99% of events complete within 60 seconds under normal test workload.

## Error budget

A 99.9% monthly objective permits approximately 43.2 minutes of unavailability
per 30-day month.

## Alerting

Use fast-burn and slow-burn error-budget alerts. Tune exact thresholds from
observed workload rather than copying universal values.

## Incident severity

- SEV1: broad patient-facing outage or uncontrolled data integrity risk
- SEV2: significant degradation with workaround
- SEV3: limited service impact
- SEV4: non-customer-impacting defect

Every alert should link to a runbook and dashboard.

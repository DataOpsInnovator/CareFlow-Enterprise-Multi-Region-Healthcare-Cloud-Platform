# ADR No service mesh initially

## Decision
No service mesh initially.

## Context
Initial requirements do not justify mesh overhead.

## Alternatives
Istio; Linkerd

## Rationale
NetworkPolicy, ingress TLS, identity and OpenTelemetry are sufficient.

## Consequences
Advanced mTLS/traffic capabilities deferred.

## Revisit trigger
If service-to-service identity/traffic needs increase.

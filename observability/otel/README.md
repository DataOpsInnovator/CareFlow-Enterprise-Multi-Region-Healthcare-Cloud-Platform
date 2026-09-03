# OpenTelemetry

Instrument API and worker services with OpenTelemetry where the SDK and
collector are introduced.

Required propagation:

trace_id
span_id
service.name
deployment.environment
request/event identifier (non-sensitive only)

Never put PHI, credentials, tokens, or raw patient content into telemetry.

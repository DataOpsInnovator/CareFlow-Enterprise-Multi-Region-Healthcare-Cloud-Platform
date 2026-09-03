# Architecture Overview

## Business capability

CareFlow provides synthetic clinical-event integration and patient-access APIs
with regional continuity and standardized application delivery.

## Primary flow

Internet client -> Route 53 -> CloudFront -> WAF -> ALB -> EKS -> API

Clinical events:

API/integration service -> EventBridge -> SQS -> worker -> Aurora/S3

## Regional model

The primary region runs the full portfolio workload. The secondary region is a
warm standby. Data replication/recovery mechanisms are selected according to
the authoritative state and acceptable RPO.

## Failure domains

1. Internet/edge
2. Availability Zone
3. Kubernetes cluster
4. Application
5. Database
6. Queue/eventing
7. AWS region
8. CI/CD control plane

## Trust boundaries

- Internet: untrusted
- Edge: WAF/TLS/rate controls
- Workload: private EKS namespaces
- Data: isolated subnets and KMS
- Administration: short-lived identities and explicit approvals

## Design principles

- Minimize sensitive data
- Assume at-least-once event delivery
- Make consumers idempotent
- Prefer asynchronous integration for non-interactive workflows
- Make desired state declarative
- Separate infrastructure and workload ownership
- Automate validation, not authorization
- Fail closed when evidence or authorization is insufficient

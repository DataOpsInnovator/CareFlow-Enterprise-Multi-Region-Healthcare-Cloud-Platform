# Healthcare Control Mapping

This is an architectural alignment exercise, not a certification.

| Control area | Reference implementation |
|---|---|
| Access control | IAM least privilege, workload identity |
| Encryption | KMS, TLS |
| PHI minimization | Synthetic data only |
| Audit | CloudTrail, Kubernetes audit |
| Integrity | Signed immutable artifacts |
| Availability | Multi-AZ + warm standby |
| Backup | Encrypted backups and restore testing |
| Retention | Explicit lifecycle policies |
| Incident response | Alerts and runbooks |
| Vendor considerations | AWS service eligibility/contractual review required before real PHI |

Formal HIPAA/HITRUST compliance would additionally require organizational risk
analysis, policies, procedures, workforce controls, contractual requirements,
evidence, validation, legal/privacy review, and formal assessment.

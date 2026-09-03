# Production readiness gates

1. **Identity:** SSO/MFA, break-glass controls, OIDC CI/CD and least-privilege workload roles verified.
2. **Network:** private cluster API, egress controls, VPC flow logs, WAF/edge controls and DNS ownership reviewed.
3. **Data:** KMS encryption, backups, PITR, object versioning/lock where required, retention and deletion policies reviewed.
4. **Supply chain:** immutable images, SBOM, vulnerability gates, signature/attestation verification and protected branches enabled.
5. **Kubernetes:** Pod Security, resource limits, PDBs, default-deny network policy, autoscaling and disruption testing verified.
6. **SRE:** SLOs, burn-rate alerts, dashboards, synthetic checks and on-call routing validated.
7. **DR:** RTO/RPO approved, backup restoration proven, regional failover and failback exercised with evidence.
8. **FinOps:** budgets, anomaly detection, mandatory tags and rightsizing cadence active.
9. **Compliance:** controls mapped to organizational requirements; evidence retained under the approved evidence system.
10. **Ownership:** service owner, platform owner, security owner and incident commander rotations documented.

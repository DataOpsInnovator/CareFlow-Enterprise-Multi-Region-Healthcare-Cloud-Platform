# LinkedIn Portfolio Assets

CareFlow is presented on LinkedIn as a **production-oriented portfolio project**. The repository itself remains the source of truth for technical claims.

## Recommended Featured sequence

1. **Architecture visual** — export `diagrams/architecture-overview.mmd` as a 1920×1080 PNG.
2. **GitHub repository** — link directly to this repository.
3. **Project announcement** — publish a concise post explaining the engineering problem, architecture, security, SRE, DR and FinOps capabilities.

## Asset naming

Use these names when maintaining exported visuals:

- `architecture-overview.png`
- `request-event-flow.png`
- `deployment-flow.png`
- `DR-flow.png`

## Claim boundary

LinkedIn copy should use **production-oriented**, **enterprise-style**, or **portfolio-grade** language. Do not describe CareFlow as a HIPAA/HITRUST-certified system, a live healthcare production environment, or a system processing real PHI. The repository uses synthetic healthcare data.

## Technical themes to highlight

- AWS multi-region / multi-AZ architecture
- Amazon EKS + Kubernetes + Karpenter
- Terraform / Infrastructure as Code
- Argo CD / GitOps
- GitHub Actions + OIDC
- Trivy / Checkov / SBOM / Cosign
- Kyverno / NetworkPolicy / KMS / IAM boundaries
- Aurora PostgreSQL / S3 / EventBridge / SQS + DLQ
- OpenTelemetry / Prometheus / SLOs / burn-rate alerts
- Warm-standby disaster recovery
- Backup/restore and failover/failback testing
- FinOps tagging, budgets and cost controls

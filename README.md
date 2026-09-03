# CareFlow — Enterprise Healthcare Cloud Platform

[![CI](https://github.com/DataOpsInnovator/careflow-enterprise-platform/actions/workflows/validate.yml/badge.svg)](https://github.com/DataOpsInnovator/careflow-enterprise-platform/actions/workflows/validate.yml)
[![Security Gates](https://github.com/DataOpsInnovator/careflow-enterprise-platform/actions/workflows/security-gates.yaml/badge.svg)](https://github.com/DataOpsInnovator/careflow-enterprise-platform/actions/workflows/security-gates.yaml)
[![Terraform](https://img.shields.io/badge/IaC-Terraform-7B42BC?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/Cloud-AWS-232F3E?logo=amazonaws&logoColor=white)](https://aws.amazon.com/)
[![Kubernetes](https://img.shields.io/badge/Runtime-Kubernetes-326CE5?logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![GitOps](https://img.shields.io/badge/GitOps-Argo%20CD-EF7B4D)](https://argo-cd.readthedocs.io/)
[![Security](https://img.shields.io/badge/Security-Kyverno-7B61FF)](https://kyverno.io/)

> **Portfolio project:** a production-oriented, multi-region AWS platform for a synthetic healthcare workload. It demonstrates enterprise Platform Engineering practices across infrastructure, Kubernetes, GitOps, DevSecOps, SRE, disaster recovery, observability, and FinOps.

**Important:** this repository contains synthetic data only. It is **not** a claim of HIPAA certification, HITRUST certification, or operation of a real healthcare production environment. Environment-specific deployment, security validation, compliance approval, performance testing, and operational sign-off are still required before any real-world use.

---

## Why this project exists

CareFlow is designed as a portfolio-grade **platform engineering case study**, not a collection of disconnected Terraform and Kubernetes examples.

The design goal is to show how an engineering team can establish reusable platform primitives and operational guardrails for a regulated workload:

- infrastructure is declared with Terraform;
- workloads are delivered through GitOps;
- CI/CD uses short-lived AWS credentials through OIDC;
- images are scanned, signed, and attested;
- Kubernetes admission controls enforce baseline security;
- network policy follows a default-deny posture;
- reliability is expressed through SLOs, burn-rate alerts, and error-budget thinking;
- backup, restore, failover, and failback are treated as testable operational capabilities;
- cost ownership is visible through tagging, budgets, and FinOps controls.

---

## Architecture at a glance

```text
                         GitHub
                           |
                    OIDC / short-lived IAM
                           |
              +------------+-------------+
              | CI / Security / SBOM     |
              | Trivy / Checkov / Cosign |
              +------------+-------------+
                           |
                     Amazon ECR
                           |
                      Argo CD / GitOps
                           |
              +------------+-------------+
              |                          |
       Primary AWS Region        Secondary AWS Region
              |                          |
       +------+-------+            +-----+--------+
       | Private EKS  |            | Private EKS  |
       | Karpenter    |            | Karpenter    |
       +------+-------+            +-----+--------+
              |                          |
       +------+------+            +------+------+
       | Services    |            | Warm standby |
       | API/Worker  |            | services     |
       +------+------+            +------+------+
              |                          |
       +------+--------------------------+------+
       | Aurora | S3 | SQS | EventBridge | KMS |
       +---------------------------------------+
                           |
                  Observability / SRE
             OTel / Prometheus / Alerts / SLOs
```

See [`docs/architecture/overview.md`](docs/architecture/overview.md), [`docs/architecture/production.md`](docs/architecture/production.md), and [`docs/architecture/disaster-recovery.md`](docs/architecture/disaster-recovery.md) for the detailed design.

---

## Engineering capabilities demonstrated

| Domain | Implementation | Portfolio signal |
|---|---|---|
| Cloud | AWS multi-region / multi-AZ design | Enterprise cloud architecture |
| IaC | Terraform modules + regional live stacks | Repeatable infrastructure |
| Kubernetes | EKS, Karpenter, Pod Security, NetworkPolicy | Production cluster engineering |
| GitOps | Argo CD applications + ApplicationSet | Declarative delivery |
| CI/CD | GitHub Actions + OIDC | Secure software delivery |
| Supply chain | Trivy, Checkov, SBOM, Cosign, attestations | Software supply-chain security |
| Policy | Kyverno | Admission-time guardrails |
| Data | Aurora PostgreSQL, S3 | Managed persistence |
| Eventing | SQS + DLQ + EventBridge | Decoupled integration |
| Security | KMS, IAM boundaries, default deny | Defense in depth |
| Observability | OpenTelemetry + Prometheus-compatible rules | Operability |
| SRE | SLOs, burn-rate alerts, error budgets | Reliability engineering |
| DR | Backup/restore + regional failover/failback | Resilience engineering |
| FinOps | Tags, budgets, anomaly/rightsizing process | Cost accountability |
| Governance | ADRs, control mapping, evidence model | Enterprise engineering discipline |

---

## Repository structure

```text
.
├── .github/                    # CI/CD, security automation, Dependabot, templates
├── argocd/                     # GitOps projects, Applications and ApplicationSets
├── benchmarks/                 # Load/performance assets and result location
├── bootstrap/                  # AWS account / remote-state bootstrap boundary
├── demo/                       # Portfolio demo walkthrough
├── diagrams/                   # Architecture diagram guidance/assets
├── docs/
│   ├── adr/                    # Architecture Decision Records
│   ├── architecture/          # System and deployment architecture
│   ├── compliance/             # Control mapping
│   ├── cost/                   # FinOps operating model
│   ├── evidence/               # Evidence collection model
│   ├── github/                 # Portfolio presentation guidance
│   ├── operations/             # Deployment contracts/readiness gates
│   ├── runbooks/               # Incident, restore, failover procedures
│   ├── security/               # Security model
│   ├── sre/                    # SLO/error-budget design
│   └── threat-model/           # Threat analysis
├── helm/                       # Workload Helm charts
├── kubernetes/                 # Cluster policies/platform manifests
├── observability/              # OTel, alerts, SLOs and dashboards
├── platform/                   # Platform catalog/templates/scorecards
├── scripts/                    # Local validation and operational helpers
├── security/                   # Policy-as-code and scanner configuration
├── services/                   # Synthetic healthcare services
├── synthetic-data/             # Non-production FHIR-style fixtures
├── terraform/
│   ├── live/                   # Environment/regional entry points
│   └── modules/                # Reusable infrastructure modules
├── tests/                      # Unit, policy, integration, load, resilience and DR tests
├── CODEOWNERS
├── CONTRIBUTING.md
├── SECURITY.md
├── VALIDATION.md
└── Makefile
```

---

## Local quick start

### Prerequisites

- Terraform >= 1.9
- AWS CLI v2
- kubectl
- Helm 3
- Docker / BuildKit
- Python 3.12+
- jq and yq
- Trivy
- Checkov
- Cosign

Then:

```bash
cp .env.example .env
make validate
make test
```

For AWS deployment, follow the contracts in:

1. [`docs/operations/required-inputs.md`](docs/operations/required-inputs.md)
2. [`docs/operations/deployment-contract.md`](docs/operations/deployment-contract.md)
3. [`docs/operations/production-readiness.md`](docs/operations/production-readiness.md)

Do not put credentials in `.env`, Terraform variables, or the repository. Use your organization's approved secret-management and identity workflow.

---

## GitHub Actions

The repository separates validation, infrastructure planning, security gates, container supply-chain operations, and DR readiness into independent workflows.

- **Validate:** Terraform formatting/validation, Helm checks, Python tests.
- **Terraform plan:** regional infrastructure validation boundary for pull requests.
- **Security gates:** filesystem scanning and Terraform policy checks with hard failure on configured findings.
- **Build/sign/attest:** container build, SBOM generation, ECR publication, Cosign signing and attestation.
- **DR test:** scheduled/manual operational readiness check using an approved AWS role.
- **Teardown:** explicit manual destruction workflow with a confirmation gate.

For a public portfolio, replace `REPLACE_WITH_GITHUB_ORG` in badges and `CODEOWNERS`, then configure GitHub Environments and AWS OIDC trust before enabling AWS-backed workflows.

---

## Security model

The platform follows defense in depth:

1. **Identity:** GitHub OIDC and short-lived AWS credentials.
2. **Supply chain:** vulnerability scanning, SBOM, signing and provenance/attestation.
3. **Admission:** Kyverno security baseline and signed-image policy.
4. **Runtime:** restricted Pod Security posture and non-root workloads.
5. **Network:** default-deny policies with explicit service communication.
6. **Data:** KMS-backed encryption and managed persistence controls.
7. **Operations:** audit/evidence expectations and documented runbooks.

See [`SECURITY.md`](SECURITY.md) and [`docs/security/security-model.md`](docs/security/security-model.md).

---

## Reliability and disaster recovery

The reference architecture separates **application availability** from **regional recovery**. The repository documents the intended recovery model, backup/restore process, failover/failback procedures, and validation expectations.

The portfolio should emphasize the engineering principle:

> **A DR architecture is not complete until restore and failover are executable and tested.**

See [`docs/runbooks/backup-restore.md`](docs/runbooks/backup-restore.md), [`docs/runbooks/regional-failover.md`](docs/runbooks/regional-failover.md), and [`tests/resilience/`](tests/resilience/).

---

## Portfolio walkthrough

Start with [`docs/github/presentation.md`](docs/github/presentation.md). It provides a suggested interview/demo sequence:

**Architecture → IaC → Kubernetes → GitOps → Security → Observability → SRE → DR → FinOps → Trade-offs**

Recommended demo path:

```text
1. Show the architecture and trust boundaries
2. Walk through Terraform live stacks and reusable modules
3. Show EKS/Karpenter and Kubernetes security controls
4. Show the Argo CD deployment model
5. Demonstrate CI security gates and image provenance
6. Explain SLOs and burn-rate alerts
7. Walk through restore/failover runbooks
8. Close with FinOps and architectural trade-offs
```

---

## Production claim boundary

This is a **production-oriented portfolio implementation**, not evidence that a live production environment has been operated or certified.

Before a real deployment, the owning organization must complete at minimum:

- AWS Organizations/account/security baseline setup
- environment-specific IAM/OIDC trust
- remote state provisioning and access controls
- DNS/global traffic-management configuration
- secrets and certificate integration
- deployment validation in the target AWS Organization
- security and compliance assessment
- load/performance testing
- backup restore testing
- regional failover/failback testing
- monitoring/alert validation
- operational ownership and on-call readiness

See [`VALIDATION.md`](VALIDATION.md) for the repository-level validation performed during packaging.

---

## License and portfolio use

This repository is intended as a professional portfolio and technical case study. Review the license and third-party dependency terms before reusing components in a commercial system.

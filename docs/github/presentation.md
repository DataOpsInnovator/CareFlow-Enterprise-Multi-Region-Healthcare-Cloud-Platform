# GitHub Portfolio Presentation Guide

## Positioning

Use this repository as a **Senior/Staff-level Platform Engineering case study**. The strongest narrative is not the number of technologies used; it is how the platform turns enterprise requirements into reusable engineering controls.

### Suggested headline

> **CareFlow — Enterprise Multi-Region Healthcare Cloud Platform on AWS**

### Suggested one-line portfolio description

> Production-oriented AWS platform engineering case study using Terraform, EKS, Karpenter, Argo CD, GitOps, DevSecOps, SRE, DR, observability and FinOps around a synthetic healthcare workload.

## Interview walkthrough

### 1. Start with requirements

Explain the assumed requirements:

- multi-AZ application availability;
- regional recovery capability;
- least-privilege identity;
- auditable delivery;
- controlled software supply chain;
- observable workloads;
- measurable reliability;
- cost ownership.

### 2. Explain the architecture

Use `docs/architecture/overview.md` and `docs/architecture/production.md`.

Focus on boundaries, blast radius, trust zones and failure modes.

### 3. Show infrastructure as code

Walk through `terraform/live/` and `terraform/modules/`.

Explain the separation between reusable modules and environment-specific composition.

### 4. Show the Kubernetes platform

Walk through:

- EKS;
- Karpenter;
- Pod Security;
- resource quotas;
- NetworkPolicies;
- Kyverno.

The key message is that the cluster is a **platform**, not just a place to run containers.

### 5. Show GitOps

Use `argocd/` to explain how desired state is represented, reviewed and reconciled.

### 6. Show software supply-chain security

Use `.github/workflows/security-gates.yaml` and `.github/workflows/container.yml` to explain scanning, SBOM, signing and attestation.

### 7. Show SRE

Use `docs/sre/slo.md` and `observability/` to explain SLOs, burn-rate alerts and error budgets.

### 8. Show DR

Use the backup/restore and regional failover runbooks. Explain the difference between:

- backup availability;
- restore capability;
- application recovery;
- regional failover;
- validated recovery.

### 9. Close with trade-offs

Use the ADRs to demonstrate that architectural decisions were deliberate. Good interview topics include EKS vs ECS, warm standby vs active-active, Aurora, SQS/EventBridge, Karpenter, no service mesh, and Terraform/Argo CD ownership boundaries.

## What not to claim

Do not claim:

- HIPAA certification;
- production operation of a real healthcare system;
- tested RTO/RPO values unless you actually run the tests;
- successful AWS deployment unless you actually deploy it;
- compliance approval based solely on repository artifacts.

Accuracy makes the portfolio stronger, not weaker.

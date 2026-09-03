# Contributing

Thank you for contributing to CareFlow.

This repository is a portfolio-grade platform engineering case study. Changes should preserve the repository's focus on secure, repeatable, observable and operable infrastructure.

## Development workflow

1. Create a focused branch from `main`.
2. Make the smallest coherent change.
3. Update documentation/ADR material when architecture or operational behavior changes.
4. Run local validation:

```bash
make validate
make test
```

5. Review security-sensitive changes against `SECURITY.md`.
6. Open a pull request using the repository template.

## Pull request expectations

A PR should explain:

- **What changed?**
- **Why is the change needed?**
- **What are the operational/security implications?**
- **How was it tested?**
- **Does it change RTO/RPO, SLOs, cost, or compliance assumptions?**
- **Are new secrets, permissions, network paths, or external dependencies introduced?**

## Infrastructure changes

For Terraform changes:

- avoid committing state or generated credentials;
- keep environment-specific values in approved configuration/secrets systems;
- update module documentation when inputs/outputs change;
- include a plan/validation result in the PR where appropriate;
- consider rollback and blast radius before approval.

## Kubernetes changes

For workload/platform changes:

- preserve non-root and least-privilege defaults;
- define resource requests/limits for production workloads;
- use explicit NetworkPolicies for new communication paths;
- do not bypass admission policies without documented justification;
- update Helm/Argo CD definitions consistently.

## Security-sensitive changes

Do not disclose vulnerabilities in public issues. Follow `SECURITY.md` for private reporting.

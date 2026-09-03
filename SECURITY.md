# Security Policy

## Scope

CareFlow is a public portfolio repository. It contains synthetic healthcare data and production-oriented infrastructure patterns.

Do **not** submit real patient information, credentials, API tokens, private keys, certificates, or other sensitive data in issues or pull requests.

## Reporting a vulnerability

Please report suspected vulnerabilities privately through GitHub Security Advisories for this repository:

`https://github.com/REPLACE_WITH_GITHUB_ORG/careflow-enterprise-platform/security/advisories/new`

If private reporting is not available in your fork, contact the repository owner through the contact mechanism associated with the GitHub profile.

### Include

- affected component/path;
- vulnerability description;
- reproducible steps or proof of concept where safe;
- security impact;
- suggested mitigation, if known.

Do not publicly disclose an unpatched vulnerability.

## Secret handling

The repository intentionally ignores `.env`, Terraform state, private keys and non-example Terraform variable files. Use GitHub Actions OIDC and your organization's secret-management controls rather than long-lived cloud credentials.

## Security baseline

Security-sensitive changes should preserve:

- least privilege;
- non-root workloads;
- dropped Linux capabilities;
- read-only filesystems where feasible;
- default-deny networking;
- image provenance verification;
- vulnerability scanning;
- encryption at rest and in transit;
- auditable deployment paths.

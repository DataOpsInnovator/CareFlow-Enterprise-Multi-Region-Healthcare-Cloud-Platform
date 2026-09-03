# Public GitHub Repository Checklist

Before making a fork or organization repository public:

- [ ] Replace `REPLACE_WITH_GITHUB_ORG` in public-facing badges/templates/links.
- [ ] Confirm no real credentials, tokens, private keys, PHI, or proprietary material exists.
- [ ] Run `make validate` and `make test`.
- [ ] Run Trivy and Checkov locally/through CI.
- [ ] Review `.gitignore` and Git history for accidental secrets.
- [ ] Configure branch protection for `main`.
- [ ] Require pull requests and successful status checks.
- [ ] Enable Dependabot security updates.
- [ ] Enable secret scanning/push protection where available.
- [ ] Configure CODEOWNERS with real maintainers.
- [ ] Configure AWS OIDC roles only after repository trust conditions are reviewed.
- [ ] Configure GitHub Environments for deployment/DR workflows.
- [ ] Keep production credentials out of GitHub repository variables unless approved by the owning organization.
- [ ] Review third-party GitHub Actions and pin them to reviewed commit SHAs for a high-assurance enterprise environment.

# Required enterprise inputs

Replace every `REPLACE_WITH_*` token before deployment. At minimum provide AWS account IDs, organization ID, primary/secondary regions, remote-state bucket/table, Git repository URL, GitHub organization/repository, CI/CD IAM roles, ECR registry, Karpenter node role, DNS/global routing design, certificate ARNs, alert destinations, approved Cosign/Sigstore trust identity, enterprise tagging values and operational owners.

Run `grep -R "REPLACE_WITH_" -n . --exclude-dir=.git` as a deployment gate.

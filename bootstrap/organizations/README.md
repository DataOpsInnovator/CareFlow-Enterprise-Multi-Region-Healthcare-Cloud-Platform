# AWS Organizations integration boundary

The portfolio repo intentionally does not create an entire enterprise landing zone. In a real organization, deploy the workload into approved workload accounts and integrate with centralized **log archive, security/audit, networking, identity, DNS, backup and CI/CD** services. Required controls include organization CloudTrail, GuardDuty, Security Hub, AWS Config, centralized IAM Identity Center, SCPs, delegated security administration and break-glass access.

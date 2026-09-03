# Deployment contract

A deployment is permitted only through an approved identity and CI/CD path. Human long-lived AWS keys are prohibited. Terraform plan is peer reviewed; production apply uses protected environments and separation of duties. Argo CD owns in-cluster application state. Terraform owns AWS infrastructure and cluster bootstrap. Secrets are references to AWS Secrets Manager or another approved secret store, never plaintext Git values.

Before production sign-off: zero unresolved critical vulnerabilities, policy scans pass, restore test passes, failover/failback exercise passes, SLO telemetry is visible, paging is tested, cost alarms are active, and runbooks have named owners.

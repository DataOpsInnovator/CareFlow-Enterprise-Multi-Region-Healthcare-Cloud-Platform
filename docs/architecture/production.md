# Production architecture

Traffic enters through an enterprise-approved global DNS/edge layer, then reaches the active primary region. The application tier runs on a private EKS cluster across three AZs. Stateful data uses Aurora PostgreSQL and S3; asynchronous clinical events use EventBridge and SQS with DLQs. The secondary region is a warm standby with independent network and cluster capacity. Data replication/failover technology must be selected and tested for the target RTO/RPO; this repository does not pretend that merely deploying two regions provides DR.

Security boundaries are identity-first: GitHub Actions uses OIDC, workloads use EKS Pod Identity/approved IAM roles, Kubernetes admission controls enforce runtime standards, and encryption keys are customer-managed. Central AWS security services belong in the organization security account.

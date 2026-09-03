# Portfolio Safety

This repository is intentionally conservative for a personal AWS account.

Never deploy the enterprise reference architecture unchanged. Review:

- regional footprint
- NAT count
- database size
- log retention
- cross-region replication
- KMS usage
- data transfer
- EKS node capacity

Run the smallest configuration needed for the demonstration and destroy it
afterward.

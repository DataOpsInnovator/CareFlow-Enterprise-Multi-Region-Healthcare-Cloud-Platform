# Resilience Experiments

| Experiment | Hypothesis | Scope | Abort | Success |
|---|---|---|---|---|
| Pod termination | Replica recovers service | Test namespace | SLO degradation | Replacement healthy |
| Node loss | Karpenter reschedules workload | Test node | Broad scheduling failure | Workload restored |
| Dependency latency | Bounded retries prevent cascade | Synthetic dependency | Error storm | Controlled degradation |
| DB failover | API reconnects | Staging | Data integrity concern | SLO restored |
| Queue delay | Backlog drains | Synthetic queue | Downstream overload | Backlog returns to baseline |
| Secret rotation | New secret is consumed | Staging | Auth failure | Service healthy |
| DNS failure | Recovery path works | Synthetic domain | Unexpected public traffic | Correct route |
| Regional failover | Secondary serves workload | Controlled environment | Data validation failure | RTO/RPO met |

Use AWS Fault Injection Service only after deterministic recovery tests work.
